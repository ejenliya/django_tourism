from django.http import Http404
from django.http import HttpRequest
from django.http import HttpResponse
from django.http import HttpResponseBadRequest
from django.http import JsonResponse
from django.shortcuts import render, redirect

from .psycopg_model import *
from .forms import *
from .models import *
from .serializers import *
from django.core import serializers
from rest_framework.response import Response
from rest_framework.views import APIView

import json
import requests
from datetime import datetime
# Create your views here.

role = ''

#MAIN PAGE
def index(request):
    data = Timetable.objects.all().values('day_of_the_week', 'start_time', 'end_time', 'excursion_numbers__price', 'excursion_numbers__start_of_route__route_name')
    if request.method == 'POST':
        form = GetListForm(request.POST)
        if form.is_valid():
            print('VALID')
            data = Timetable.objects.filter(start_time__range=(form.cleaned_data['start_date'], form.cleaned_data['end_date'])).values()
            print(data.query)
        else:
            print(form)
    context = {
        'data':data,
        'form': GetListForm 
    }
    return render(request, 'tourism/index.html', context=context)

session_variables = []

#REG PAGES
def registration(request):
    shutdown_session(request)
    if request.method == 'POST':
        form = ClientForm(request.POST)
        if form.is_valid():
            client_ = Client(
                contact_details=form.cleaned_data['contact_details'],
                full_name=form.cleaned_data['full_name'],
                login=form.cleaned_data['login'],
                passw=form.cleaned_data['passw'],
                date_of_registration=datetime.today().strftime('%Y-%m-%d')
            )
            client_.save()
            request.session['username'] = request.POST['login']
            request.session['password'] = request.POST['passw']
            username = request.POST['login']
            password = request.POST['passw']
            try:
                query = f"""SELECT "ID_Client" FROM "Client" WHERE login = '{username}' AND passw = '{password}' ;"""
                print(query)
                request.session['login'] = execute_select_query('tourism_guest', 'guest', query,f_all=False)[0]
                print(request.session['login'])
                if request.session['login'] > 0:
                    request.session['username'] = username
                    role = 'tourism_client:client'
                    return redirect(client, username=request.session['username'])
            except Exception as e:
                print(e)
                return render(request, 'tourism/registration.html')
    context = {
        "form": ClientForm
    } 
    return render(request, 'tourism/registration.html', context=context)

def shutdown_session(request):
    request.session.clear()

def login(request):
    global role

    if 'login'  in request.session.keys() and 'username' in request.session.keys():
        print(request.session.items())
        if request.session['login'] == 'staff':
            role = 'tourism_staff:staff'
            return redirect(manager, username=request.session['username'])
        elif request.session['login'] == 'gid':
            role = 'tourism_staff:staff'
            return redirect(gid, username=request.session['username'])
        elif request.session['login'] == 'manager':
            role = 'tourism_staff:staff'
            return redirect(manager, username=request.session['username'])
        elif request.session['login'] == 'director':
            role = 'tourism_director:director'
            return redirect(director, username=request.session['username'])
        elif request.session['login']:
            role = 'tourism_client:client'
            return redirect(client, username=request.session['username'])
    if request.method == 'POST':
        request.session['username'] = request.POST['username']
        request.session['password'] = request.POST['password']
        username = request.POST['username']
        password = request.POST['password']
        try:
            query = f"""SELECT role_user FROM "Staff" WHERE login = '{username}' AND passw = '{password}' ;"""
            request.session['login'] = execute_select_query('tourism_guest', 'guest', query,f_all=False)[0].replace('\n','')
            print(request.session['login'])
            if request.session['login'] == 'manager':
                role = 'tourism_staff:staff'
                return redirect(manager, username=request.session['username'])
            elif request.session['login'] == 'gid':
                role = 'tourism_staff:staff'
                return redirect(gid, username=request.session['username'])
            elif request.session['login'] == 'director':
                role = 'tourism_director:director'
                print(request.session['username'])
                return redirect(director, username=request.session['username'])
            elif request.session['login']:
                role = 'tourism_client:client'
                return redirect(client, username=request.session['username'])
        except Exception as e:
            print(e)
            try:
                query = f"""SELECT "ID_Client" FROM "Client" WHERE login = '{username}' AND passw = '{password}' ;"""
                print(query)
                request.session['login'] = execute_select_query('tourism_guest', 'guest', query,f_all=False)[0]
                print(request.session['login'])
                if request.session['login'] > 0:
                    request.session['username'] = username
                    role = 'tourism_client:client'
                    return redirect(client, username=request.session['username'])
            except Exception as e:
                print(e)
                return render(request, 'tourism/login.html')

    return render(request, 'tourism/login.html')

def logout(request):
    request.session.clear()
    return redirect(login)

#STAFF PAGES
def client(request, username):
    if 'username' not in request.session or request.session['username'] != username:
        return render(request, 'tourism/login.html')
    client_data = Client.objects.get(login=username)
    context = {
        'username': username,
        'position': 'клиент',
        'client': client_data
    } 
    return render(request, 'tourism/client.html', context=context)

def gid(request, username):
    if 'username' not in request.session or request.session['username'] != username:
        return render(request, 'tourism/login.html')
    gid = Staff.objects.get(login=username)
    context = {
        'username': username,
        'position': 'Гид',
        'staff': gid
    } 
    return render(request, 'tourism/gid.html', context=context)

def manager(request, username):
    if 'username' not in request.session or request.session['username'] != username:
        return render(request, 'tourism/login.html')
    manager = Staff.objects.get(login=username)
    context = {
        'username': username,
        'position': 'Мээнеджер',
        'staff': manager
    } 
    return render(request, 'tourism/manager.html', context=context)



def director(request, username):
    if 'username' not in request.session or request.session['username'] != username:
        return render(request, 'tourism/login.html')
    director = Staff.objects.get(login=username)
    context = {
        'username': username,
        'position': 'Директор',
        'staff': director
    } 
    return render(request, 'tourism/director.html', context=context)

#MANAGER
def recrut_driver(request, username):
    if 'username' not in request.session or request.session['username'] != username:
        return render(request, 'tourism/login.html')
    context = {
        'form': RecruitDriverForm
    } 
    if request.method == 'POST':
        form = RecruitDriverForm(request.POST)
        if form.is_valid():
            staff_excursion = StaffExcursion(
                id_staff=form.cleaned_data['id_staff'],
                id_excursion=form.cleaned_data['id_excursion']
            )
            staff_excursion.save()
            
    
    return render(request, 'tourism/recrut_driver.html', context=context)

def get_list(request, username):
    if 'username' not in request.session or request.session['username'] != username:
        return render(request, 'tourism/login.html')
    data = Timetable.objects.all().values('day_of_the_week', 'start_time', 'end_time', 'excursion_numbers__price', 'excursion_numbers__start_of_route__route_name')
    if request.method == 'POST':
        form = GetListForm(request.POST)
        if form.is_valid():
            print('VALID')
            data = Timetable.objects.filter(start_time__range=(form.cleaned_data['start_date'], form.cleaned_data['end_date'])).values()
            print(data.query)
        else:
            print(form)
    context = {
        'data':data,
        'form': GetListForm 
    }
    return render(request, 'tourism/get_list.html', context=context)

def create_excursion(request, username):
    if 'username' not in request.session or request.session['username'] != username:
        return render(request, 'tourism/login.html')
    if request.method == 'POST':
        form = ExcursionForm(request.POST)
        if form.is_valid():
            excursion    = Excursion(
                price=form.cleaned_data['price'],
                start_of_route=form.cleaned_data['start_of_route'],
                number_of_seats=form.cleaned_data['number_of_seats']
            )
            excursion.save()
    context = {
        'form': ExcursionForm
    } 
    return render(request, 'tourism/create_excursion.html', context=context)

def take_gid(request, username):
    if 'username' not in request.session or request.session['username'] != username:
        return render(request, 'tourism/login.html')
    if request.method == 'POST':
        form = OrderGid(request.POST)
        if form.is_valid():
            StaffExcursion.objects.filter(id_excursion=form.cleaned_data['id_excursion']).update(id_staff=form.cleaned_data['id_staff'])
    context = {
        'form': OrderGid
    } 
    return render(request, 'tourism/take_gid.html', context=context)

def add_transcending(request, username):
    if 'username' not in request.session or request.session['username'] != username:
        return render(request, 'tourism/login.html')
    if request.method == 'POST':
        form = TranscendingWorkForm(request.POST)
        if form.is_valid():
            if form.is_valid():
                transwork = TranscendingWork(
                    hired=form.cleaned_data['hired'],
                    quited=form.cleaned_data['quited'],
                    past_position=form.cleaned_data['past_position'],
                    kind_of_activity=form.cleaned_data['kind_of_activity'],
                    grounds_for_dismissal=form.cleaned_data['grounds_for_dismissal'],
                    organization=form.cleaned_data['organization']
                )
                transwork.save()
    context = {
        'form': TranscendingWorkForm
    } 
    return render(request, 'tourism/add_transcending.html', context=context)

#DIRECTOR
def update_salary(request, username):
    if 'username' not in request.session or request.session['username'] != username:
        return render(request, 'tourism/login.html')
    if request.method == 'POST':
        form = UpdateSalaryForm(request.POST)
        if form.is_valid():
            Staff.objects.filter(pk=form.cleaned_data['staff']).update(salary=form.cleaned_data['new_salary'])
    context = {
        'form': UpdateSalaryForm
    } 
    return render(request, 'tourism/update_salary.html', context=context)

def remove_staff(request, username):
    if 'username' not in request.session or request.session['username'] != username:
        return render(request, 'tourism/login.html')
    if request.method == 'POST':
        form = RemoveStaffForm(request.POST)
        if form.is_valid():
            Staff.objects.get(pk=form.cleaned_data['full_name']).delete()
    context = {
        'form' :RemoveStaffForm
    } 
    return render(request, 'tourism/remove_staff.html', context=context)


def get_staff_list(request, username):
    if 'username' not in request.session or request.session['username'] != username:
        return render(request, 'tourism/login.html')
    context = {
        'staff': Staff.objects.filter(work_status='Работает')
    } 
    return render(request, 'tourism/get_staff_list.html', context=context)

def recruit_staff(request, username):
    if 'username' not in request.session or request.session['username'] != username:
        return render(request, 'tourism/login.html')
    if request.method == 'POST':
        form = StaffForm(request.POST)
        if form.is_valid():
            staff = Staff(
                full_name=form.cleaned_data['full_name'],
                dolzhnost=form.cleaned_data['dolzhnost'],
                salary=form.cleaned_data['salary'],
                date_of_birth=form.cleaned_data['date_of_birth'],
                passport_data=form.cleaned_data['passport_data'],
                work_status=form.cleaned_data['work_status'],
                the_foremost_place_of_work=form.cleaned_data['the_foremost_place_of_work']
            )
            staff.save()
    context = {
        'form' :StaffForm
    } 
    return render(request, 'tourism/recruit_staff.html', context=context)

def update_excursion_price(request, username):
    if 'username' not in request.session or request.session['username'] != username:
        return render(request, 'tourism/login.html')
    if request.method == 'POST':
        form = UpdateExcursionPrcie(request.POST)
        if form.is_valid():
            Excursion.objects.filter(
                id_excursion=form.cleaned_data['excursion'].id_excursion
            ).update(
                price=form.cleaned_data['new_price']
            )
    context = {
        'form': UpdateExcursionPrcie
    } 
    return render(request, 'tourism/update_excursion_price.html', context=context)

def add_sight(request, username):
    if 'username' not in request.session or request.session['username'] != username:
        return render(request, 'tourism/login.html')
    if request.method == 'POST':
        form = AddSightForm(request.POST)

        if form.is_valid():
            attraction = Attraction(
                name_of_attraction=form.cleaned_data['name_of_attraction'],
                description_of_attraction=form.cleaned_data['description_of_attraction']
            )
            attraction.save()
    context = {
        "form":AddSightForm
    } 
    return render(request, 'tourism/add_sight.html', context=context)

#GID
def create_way(request, username):
    if 'username' not in request.session or request.session['username'] != username:
        return render(request, 'tourism/login.html')
    if request.method == 'POST':
        form = CreateWayForm(request.POST)
        if form.is_valid():
            Route.objects.create(
                route_name=form.cleaned_data['route_name'],
                location_on_the_route=form.cleaned_data['location_on_the_route'],
                next_attraction=form.cleaned_data['next_attraction'].id_route,
                transition_time_in_minutes=form.cleaned_data['transition_time_in_minutes'],
                transport_delivered_to_the_sights=form.cleaned_data['transport_delivered_to_the_sights'].id_transport,
            ).save()
    context = {
        'form': CreateWayForm
    } 
    return render(request, 'tourism/create_way.html', context=context)

#CLIENT
def order_excursion(request, username):
    if 'username' not in request.session or request.session['username'] != username:
        return render(request, 'tourism/login.html')
    if request.method == 'POST':
        form = ExcursionForm(request.POST)
        if form.is_valid():
            excursion = Excursion(
                price=form.cleaned_data['price'],
                start_of_route=form.cleaned_data['start_of_route'],
                number_of_seats=form.cleaned_data['number_of_seats']
            )
            excursion.save()
    context = {
        'form': OrderExcursion
    }
    return render(request, 'tourism/order_excursion.html', context=context)

def get_excursion_list(request, username):
    if 'username' not in request.session or request.session['username'] != username:
        return render(request, 'tourism/login.html')
    client_id = Client.objects.get(login=username).id_client
    query = KlientRaspisanie.objects.filter(id_client=client_id).values('id_excursion__number_of_seats', 'id_client__full_name', 'id_excursion__price', 'date')
    context = {
        'excursions': query
    } 
    return render(request, 'tourism/get_excursions_list.html', context=context)

class RecrutDriver(APIView):

    def post(self, request):
        form = RecruitDriverForm(request.POST)
        if form.is_valid():
            staff_excursion = StaffExcursion(
                id_staff=form.cleaned_data['id_staff'],
                id_excursion=form.cleaned_data['id_excursion']
            )
            staff_excursion.save()
            return Response({'status': 'success'})
        return Response({'status': False})

class InsertUser(APIView):

    def post(self, request):
        form = ClientForm(request.POST)

        if form.is_valid():
            client = Client(
                contact_details=form.cleaned_data['contact_details'],
                full_name=form.cleaned_data['full_name'],
                date_of_registration=datetime.today().strftime('%Y-%m-%d')
            )
            client.save()
            return Response({'status': 'success'})
        return Response({'status': False})

class CreateWay(APIView):

    def post(self, request):
        form = CreateWayForm(request.POST)
        if form.is_valid():
            Route.objects.create(
                route_name=form.cleaned_data['route_name'],
                location_on_the_route=form.cleaned_data['location_on_the_route'],
                next_attraction=form.cleaned_data['next_attraction'].id_route,
                transition_time_in_minutes=form.cleaned_data['transition_time_in_minutes'],
                transport_delivered_to_the_sights=form.cleaned_data['transport_delivered_to_the_sights'].id_transport,
            ).save()
            return Response({'data': 'success'})
        return Response({'data': False})

class UpdatePrice(APIView):

    def post(self, request):
        form = AddSightForm(request.POST)

        if form.is_valid():
            Excursion.objects.filter(
                id_excursion=form.cleaned_data['excursion'].id_excursion
            ).update(
                price=form.cleaned_data['new_price']
            ).save()
            return Response({'status': 'success'})
        return Response({'status': False})


class StaffAPI(APIView):

    def get(self, request):
        staff_id = request.GET['staff_id']
        staff = Staff.objects.get(pk=staff_id)
        return Response({'data': staff})

    def post(self, request):
        form = StaffForm(request.POST)
        if form.is_valid():
            staff = Staff(
                full_name=form.cleaned_data['full_name'],
                dolzhnost=form.cleaned_data['dolzhnost'],
                salary=form.cleaned_data['salary'],
                date_of_birth=form.cleaned_data['date_of_birth'],
                passport_data=form.cleaned_data['passport_data'],
                work_status=form.cleaned_data['work_status'],
                the_foremost_place_of_work=form.cleaned_data['the_foremost_place_of_work']
            )
            staff.save()
            return Response({'status': 'success'})
        return Response({'status': False})


class CreateSight(APIView):

    def post(self, request):
        form = AddSightForm(request.POST)

        if form.is_valid():
            attraction = Attraction(
                name_of_attraction=form.cleaned_data['name_of_attraction'],
                description_of_attraction=form.cleaned_data['description_of_attraction']
            )
            attraction.save()
            return Response({'status': 'success'})
        return Response({'status': False})

class ExcursionAPI(APIView):

    def get(self, request):
        excursion_id = request.GET['id_excursion']
        excursion = Excursion.objects.get(pk=excursion_id)
        return Response({'data': excursion})

    def post(self, request):
        form = ExcursionForm(request.POST)
        if form.is_valid():
            excursion = Excursion(
                price=form.cleaned_data['price'],
                start_of_route=form.cleaned_data['start_of_route'],
                number_of_seats=form.cleaned_data['number_of_seats']
            )
            excursion.save()
            return Response({'status': 'success'})
        return Response({'status': False})
