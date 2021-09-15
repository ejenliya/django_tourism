# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models
from datetime import datetime


class Client(models.Model):
    # Field name made lowercase.
    contact_details = models.CharField(
        db_column='Contact_details', max_length=60)
    # Field name made lowercase.
    full_name = models.CharField(db_column='Full_name', max_length=60)
    # Field name made lowercase.
    date_of_registration = models.DateField(db_column='Date_of_registration')
    # Field name made lowercase.
    id_client = models.AutoField(db_column='ID_Client', primary_key=True)
    login = models.TextField('login', unique=True, null=False, blank=False)
    passw = models.TextField('password', unique=True, null=False, blank=False)

    class Meta:
        managed = False
        db_table = 'Client'
        verbose_name = 'Client'
        verbose_name_plural = "Client's"

    def __str__(self):
        return self.full_name


class KlientRaspisanie(models.Model):
    # Field name made lowercase.
    id_client = models.OneToOneField(
        'Client', models.DO_NOTHING, db_column='ID_Client', primary_key=True)
    # Field name made lowercase.
    id_excursion = models.ForeignKey(
        'Excursion', models.DO_NOTHING, db_column='ID_excursion')
    date = models.DateField(db_column='Date')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Klient_Raspisanie'
        unique_together = (('id_client', 'id_excursion', 'date'),)
        verbose_name = 'KlientRaspisanie'
        verbose_name_plural = "KlientRaspisanie"

    def __str__(self):
        return str(self.id_excursion)  + ' - ' +  str(self.date)


class Route(models.Model):
    # Field name made lowercase.
    id_route = models.AutoField(db_column='ID_Route', primary_key=True)
    # Field name made lowercase.
    route_name = models.CharField(db_column='Route_name', max_length=160)
    location_on_the_route = models.ForeignKey(
        'Attraction', models.DO_NOTHING, db_column='location_on_the_route')
    # Field name made lowercase.
    next_attraction = models.ForeignKey(
        'self', models.DO_NOTHING, db_column='next_Attraction', blank=True, null=True)
    # Field name made lowercase. Field renamed to remove unsuitable characters.
    transition_time_in_minutes = models.IntegerField(
        db_column='Transition time in minutes', blank=True, null=True)
    # Field renamed to remove unsuitable characters.
    transport_delivered_to_the_sights = models.ForeignKey(
        'TypesOfTransport', models.DO_NOTHING, db_column='transport delivered to the sights', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Route'
        verbose_name = 'Route'
        verbose_name_plural = 'Routes'

    def __str__(self):
        return str(self.route_name) + ' - ' + str(self.location_on_the_route)


class Staff(models.Model):
    id_staff = models.AutoField(db_column='ID_Staff', primary_key=True)
    # Field name made lowercase.
    # Field name made lowercase.
    full_name = models.CharField(db_column='Full_name', max_length=90)
    # Field name made lowercase.
    dolzhnost = models.CharField(db_column='Dolzhnost', max_length=40)
    employment_date = models.DateField(
        default=datetime.today().strftime('%Y-%m-%d'))
    date_of_dismissal = models.DateField(blank=True, null=True)
    salary = models.TextField()  # This field type is a guess.
    # Field name made lowercase.
    id_number = models.IntegerField(db_column='ID_number')
    # Field name made lowercase.
    date_of_birth = models.DateField(db_column='Date_of_Birth')
    passport_data = models.CharField(max_length=60)
    # Field name made lowercase.
    work_status = models.CharField(db_column='Work_status', max_length=24)
    # Field name made lowercase. Field renamed to remove unsuitable characters.
    the_foremost_place_of_work = models.ForeignKey(
        'TranscendingWork', models.DO_NOTHING, db_column='The foremost place of work', blank=True, null=True)
    login = models.TextField('login', unique=True, null=False, blank=False)
    passw = models.TextField('password', unique=True, null=False, blank=False)
    role_user = models.CharField(
        'role_user',  null=False, blank=False, max_length=30)

    class Meta:
        managed = False
        db_table = 'Staff'
        verbose_name = 'Staff'
        verbose_name_plural = 'Staff'

    def __str__(self):
        return self.full_name + ' ' + self.dolzhnost


class StaffExcursion(models.Model):
    # Field name made lowercase.
    id_staff = models.OneToOneField(
        Staff, models.DO_NOTHING, db_column='ID_Staff', primary_key=True)
    # Field name made lowercase.
    id_excursion = models.ForeignKey(
        'Excursion', models.DO_NOTHING, db_column='ID_excursion')

    class Meta:
        managed = False
        db_table = 'Staff_excursion'
        unique_together = (('id_staff', 'id_excursion'),)
        verbose_name = 'StaffExcursion'
        verbose_name_plural = "StaffExcursion's"

    def __str__(self):
        return str(self.id_staff) + ' :: ' + str(self.id_excursion)


class TranscendingWork(models.Model):
    hired = models.DateTimeField()
    quit = models.DateTimeField()
    # Field name made lowercase. Field renamed to remove unsuitable characters.
    id_transcending_work = models.AutoField(
        db_column='ID_Transcending work', primary_key=True)
    # Field name made lowercase. Field renamed to remove unsuitable characters.
    past_position = models.CharField(db_column='Past position', max_length=48)
    # Field name made lowercase. Field renamed to remove unsuitable characters.
    kind_of_activity = models.CharField(
        db_column='Kind of activity', max_length=80)
    # Field name made lowercase. Field renamed to remove unsuitable characters.
    grounds_for_dismissal = models.CharField(
        db_column='Grounds for dismissal', max_length=200)
    organization = models.CharField(max_length=80)

    class Meta:
        managed = False
        db_table = 'Transcending work'
        verbose_name = 'TranscendingWork'
        verbose_name_plural = "TranscendingWork's"

    def __str__(self):
        return self.organization + ' - ' + self.past_position


class Attraction(models.Model):
    name_of_attraction = models.CharField(max_length=160)
    # Field name made lowercase.
    id_attraction = models.AutoField(
        db_column='ID_attraction', primary_key=True)
    # Field name made lowercase.
    description_of_attraction = models.CharField(
        db_column='Description_of_Attraction', max_length=200)

    class Meta:
        managed = False
        db_table = 'attraction'
        verbose_name = 'Attraction'
        verbose_name_plural = "Attraction's"

    def __str__(self):
        return self.name_of_attraction


class Excursion(models.Model):
    # Field name made lowercase.
    id_excursion = models.AutoField(verbose_name='Номер экускурсии', db_column='ID_excursion', primary_key=True)
    # Field name made lowercase. This field type is a guess.
    price = models.TextField(db_column='Price')
    start_of_route = models.ForeignKey(
        Route, models.DO_NOTHING, db_column='start_of_route')
    # Field renamed to remove unsuitable characters.
    number_of_seats = models.IntegerField(db_column='number of seats')

    class Meta:
        managed = False
        db_table = 'excursion'
        verbose_name = 'Excursion'
        verbose_name_plural = "Excursion's"

    def __str__(self):
        return str(self.start_of_route)


class Timetable(models.Model):
    day_of_the_week = models.CharField(max_length=30)
    start_time = models.DateTimeField()
    # Field name made lowercase.
    end_time = models.DateTimeField(db_column='End_time')
    # Field name made lowercase.
    id_timetable = models.AutoField(db_column='ID_timetable', primary_key=True)
    excursion_numbers = models.ForeignKey(
        Excursion, models.DO_NOTHING, db_column='excursion_numbers')

    class Meta:
        managed = False
        db_table = 'timetable'
        verbose_name = 'Timetable'
        verbose_name_plural = 'Timetables'

    def __str__(self):
        return self.day_of_the_week


class TypesOfTransport(models.Model):
    name_of_transport = models.CharField(max_length=160)
    # Field name made lowercase.
    id_transport = models.AutoField(db_column='ID_transport', primary_key=True)

    class Meta:
        managed = False
        db_table = 'types of transport'
        verbose_name = 'TypesOfTransport'
        verbose_name_plural = 'TypesOfTransport'

    def __str__(self):
        return self.name_of_transport
