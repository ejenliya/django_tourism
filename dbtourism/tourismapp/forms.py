from django import forms
from .models import *

class ClientForm(forms.Form):
    contact_details = forms.CharField(label='Контактная информация', max_length=60, widget=forms.TextInput(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    full_name = forms.CharField(label='ФИО', max_length=60, widget=forms.TextInput(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    login = forms.CharField(label='Логин', max_length=60, widget=forms.TextInput(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    passw = forms.CharField(label='Пароль', max_length=60, widget=forms.TextInput(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))

class TranscendingWorkForm(forms.Form):
    hired = forms.DateField(label='Дата принятия на работу', widget=forms.DateInput(attrs={'required': True, 'class': 'form-control datetimepicker-input', 'data-target': '#datetimepicker1', 'style': 'width:30%;'}))
    quited = forms.DateField(label='Дата увольнения с прошлого места работы', widget=forms.DateInput(attrs={'required': True, 'class': 'form-control datetimepicker-input', 'data-target': '#datetimepicker2', 'style': 'width:30%;'}))
    past_position = forms.CharField(label='Прошлая должность', max_length=90, widget=forms.TextInput(attrs={'required': True, 'class': 'form-control', 'style': 'width:30%;'}))
    kind_of_activity = forms.CharField(label='Вид занятости', max_length=90, widget=forms.TextInput(attrs={'required': True, 'class': 'form-control', 'style': 'width:30%;'}))
    grounds_for_dismissal = forms.CharField(label='Основания для увольнения', max_length=90, widget=forms.TextInput(attrs={'required': True, 'class': 'form-control', 'style': 'width:30%;'}))
    organization = forms.CharField(label='Название организации', max_length=90, widget=forms.TextInput(attrs={'required': True, 'class': 'form-control', 'style': 'width:30%;'}))
class StaffForm(forms.Form):
    full_name = forms.CharField(label='ФИО', max_length=90, widget=forms.TextInput(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    dolzhnost = forms.ModelChoiceField(label='Должность', queryset=Staff.objects.all().values_list('dolzhnost').distinct('dolzhnost'), widget=forms.Select(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    salary = forms.CharField(label='Зарплата', max_length=60, widget=forms.TextInput(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    date_of_birth = forms.DateField(label='Дата рождения', widget=forms.DateInput(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    passport_data = forms.CharField(label='Номер паспорта', max_length=60, widget=forms.TextInput(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    work_status = forms.CharField(label='Рабочий статус', max_length=24, widget=forms.TextInput(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    the_foremost_place_of_work = forms.ModelChoiceField(label='Прошлое место работы', queryset=TranscendingWork.objects.all(), widget=forms.Select(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
class ExcursionForm(forms.Form):
    price = forms.CharField(label='Цена', widget=forms.TextInput(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    start_of_route = forms.ModelChoiceField(label='Начало маршрута', queryset=Route.objects.all(), widget=forms.Select(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    number_of_seats = forms.IntegerField(label='Кол-во мест', min_value=1, widget=forms.NumberInput(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))

class UpdateSalaryForm(forms.Form):
    new_salary = forms.IntegerField(label='Новая зарплата',  widget=forms.NumberInput(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    staff = forms.ModelChoiceField(label='Сотрудник', queryset=Staff.objects.all(),widget=forms.Select( attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))

class UpdateExcursionPrcie(forms.Form):
    new_price = forms.IntegerField(label='Новая цена',  widget=forms.NumberInput(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    excursion = forms.ModelChoiceField(label='Экскурсия', queryset=Excursion.objects.all(),widget=forms.Select( attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))

class AddSightForm(forms.Form):
    name_of_attraction = forms.CharField(label='Название достопримечательности', max_length=160, widget=forms.TextInput(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    description_of_attraction = forms.CharField(label='Описание достопримечатиельности', max_length=200, widget=forms.TextInput(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))

class RecruitDriverForm(forms.Form):
    id_staff = forms.ModelChoiceField(label='Водитель', queryset=Staff.objects.filter(dolzhnost='Водитель'), widget=forms.Select(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    id_excursion = forms.ModelChoiceField(label='Экскурсия', widget=forms.Select( attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}),queryset=KlientRaspisanie.objects.all().distinct('id_excursion'))

class CreateWayForm(forms.Form):
    route_name = forms.CharField(label='Название маршрута', max_length=160, widget=forms.TextInput(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    next_attraction =  forms.ModelChoiceField(label='Следующая локация', widget=forms.Select(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}),queryset=Route.objects.all())
    transition_time_in_minutes = forms.IntegerField(label='Время переезда',  widget=forms.NumberInput(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    transport_delivered_to_the_sights = forms.ModelChoiceField(label='Вид транспорта', widget=forms.Select(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}),queryset=TypesOfTransport.objects.all() )

class RemoveStaffForm(forms.Form):
    full_name = forms.ModelChoiceField(label='Сотрудниик', widget=forms.Select(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}),queryset=Staff.objects.all())

class GetListForm(forms.Form):
    start_date = forms.DateField(label='Начальная дата', widget=forms.DateInput(attrs={'required': False, 'class': 'form-control datetimepicker-input', 'data-target': '#datetimepicker1', 'style': 'width:30%;'}))
    end_date = forms.DateField(label='Дата конца', widget=forms.DateInput(attrs={'required': False, 'class': 'form-control datetimepicker-input', 'data-target': '#datetimepicker2', 'style': 'width:30%;'}))

class OrderExcursion(forms.Form):
    id_excursion = forms.ModelChoiceField(label='Экскурсия', queryset=Excursion.objects.all(), widget=forms.Select(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    date = forms.DateField(label='Дата', widget=forms.DateInput(attrs={'required': False, 'class': 'form-control datetimepicker-input', 'data-target': '#datetimepicker1', 'style': 'width:30%;'}))
    # Test = forms.ModelChoiceField(label='Test', widget=forms.Select(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))

class OrderGid(forms.Form):
    id_staff = forms.ModelChoiceField(label='Экскурсовод', queryset=Staff.objects.filter(dolzhnost='Экскурсовод'), widget=forms.Select(attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}))
    id_excursion = forms.ModelChoiceField(label='Экскурсия', widget=forms.Select( attrs={'required': False, 'class': 'form-control', 'style': 'width:30%;'}),queryset=Excursion.objects.all())

