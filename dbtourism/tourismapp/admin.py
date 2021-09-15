from django.contrib import admin
from .models import *
# Register your models here.


class ClientAdmin(admin.ModelAdmin):
    list_display = ('full_name', 'date_of_registration')


class KlientRaspisanieAdmin(admin.ModelAdmin):
    list_display = ('id_client', 'id_excursion', 'date')


class RouteAdmin(admin.ModelAdmin):
    list_display = ('route_name', 'location_on_the_route', 'next_attraction')


class StaffExcursionAdmin(admin.ModelAdmin):
    list_display = ('id_staff', 'id_excursion')


class TranscendingWorkAdmin(admin.ModelAdmin):
    list_display = ('past_position', 'kind_of_activity', 'organization')


class AttractionAdmin(admin.ModelAdmin):
    list_display = ('name_of_attraction',)
    search_fields = ('name_of_attraction',)


class ExcursionAdmin(admin.ModelAdmin):
    list_display = ( 'price', 'start_of_route', 'number_of_seats')


class TimetableAdmin(admin.ModelAdmin):
    list_display = ('day_of_the_week', 'start_time', 'end_time')
    list_display_links = ('day_of_the_week', 'start_time', 'end_time')
    search_fields = ('day_of_the_week',)
    list_filter = ('day_of_the_week',)


class TypesOfTransportAdmin(admin.ModelAdmin):
    list_display = ('name_of_transport',)
    list_display_links = ('name_of_transport',)


class StaffAdmin(admin.ModelAdmin):
    list_display = ('full_name', 'dolzhnost', 'date_of_birth')
    list_display_links = ('full_name', 'dolzhnost', 'date_of_birth')
    search_fields = ('full_name', 'dolzhnost',)


admin.site.register(Client, ClientAdmin)
admin.site.register(KlientRaspisanie, KlientRaspisanieAdmin)
admin.site.register(Route, RouteAdmin)
admin.site.register(Staff, StaffAdmin)
admin.site.register(StaffExcursion, StaffExcursionAdmin)
admin.site.register(TranscendingWork, TranscendingWorkAdmin)
admin.site.register(Attraction, AttractionAdmin)
admin.site.register(Excursion, ExcursionAdmin)
admin.site.register(Timetable, TimetableAdmin)
admin.site.register(TypesOfTransport, TypesOfTransportAdmin)
