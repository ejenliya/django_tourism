from .models import *
from rest_framework import serializers


class StaffSerializer(serializers.Serializer):
    class Meta:
        model = Staff
        fields = (
            'full_name',
            'dolzhnost',
            'employment_date',
            'date_of_dismissal',
            'salary',
            'id_number',
            'date_of_birth',
            'passport_data',
            'work_status',
            'the_foremost_place_of_work',
        )

class ExcursionSerializer(serializers.Serializer):
    class Meta:
        model = Excursion
        fields = (
            'price',
            'start_of_route',
            'number_of_seats',
        )

class  ServiceSerializer(serializers.Serializer):
    class Meta:
        model = ''
        fields = ('')

class  TicketSerializer(serializers.Serializer):
    class Meta:
        model = KlientRaspisanie
        fields = (
            'id_client',
            'id_excursion',
            'date',
        )
