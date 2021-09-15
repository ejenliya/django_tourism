from django.urls import path
from .views import *

urlpatterns = [
    path('', index, name='main_page'),
    path('index/', index,name='main_page'),

    path('registration/', registration, name='registration'),
    path('logout/', logout, name='logout'),
    path('login/', login, name='login'),

    path('recrut_driver/<str:username>/', recrut_driver, name='recrut_driver'),
    path('get_list/<str:username>/', get_list, name='get_list'),
    path('create_excursion/<str:username>/', create_excursion, name='create_excursion'),
    path('take_gid/<str:username>/', take_gid, name='take_gid'),
    path('update_salary/<str:username>/', update_salary, name='update_salary'),
    path('remove_staff/<str:username>/', remove_staff, name='remove_staff'),
    path('get_staff_list/<str:username>/', get_staff_list, name='get_staff_list'),
    path('recruit_staff/<str:username>/', recruit_staff, name='recruit_staff'),
    path('update_excursion_price/<str:username>/', update_excursion_price, name='update_excursion_price'),
    path('add_sight/<str:username>/', add_sight, name='add_service'),
    path('create_way/<str:username>/', create_way, name='create_way'),
    path('order_excursion/<str:username>/', order_excursion, name='order_excursion'),
    path('get_excursions_list/<str:username>/', get_excursion_list, name='order_excursion'),
    path('add_transcending_work/<str:username>/', add_transcending, name='add_transcending'),
    
    path('client/<str:username>/', client, name='client'),
    path('manager/<str:username>/', manager, name='manager'),
    path('director/<str:username>/', director, name='director'),
    path('gid/<str:username>/', gid, name='gid'),

    path('recrut_driver_api/', RecrutDriver.as_view(), name='recrut_driver_api'),
    path('user_insert_api/', InsertUser.as_view(), name='user_insert_api'),
    path('create_way_api/', CreateWay.as_view(), name='create_way_api'),
    path('price_update_api/', UpdatePrice.as_view(), name='price_update_api'),
    path('staff_funcs_api/', StaffAPI.as_view(), name='staff_funcs_api'),
    path('sight_create_api/', CreateSight.as_view(), name='sight_create_api'),
    path('excursion_api/', ExcursionAPI.as_view(), name='excursion_api'),
]
