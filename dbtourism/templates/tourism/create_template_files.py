
content = """
    {% extends 'basics.html' %}

    {% block style %}
    <link rel = "stylesheet" href = "{{ url_for('static',filename='css/Delete_Service.css') }}">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    {% endblock %}
{% block title %}Statistics{% endblock title %}
{% block main_content %}
    <div class = "intro">
        <h1>Посмотреть стоимость</h1>
<div class = "container">
    <form method="post">
        <div class = "dws-input">
        <input type = "text" name = "name" placeholder = "Название услуги:">
        </div>
        <button class = "dws-submit2" type = "submit" name = "submit" value = "Report">Обновить список услуг</button>
        <br />
        <br />
        <br />
        <a class = "restore" href = "/client/{{username}}">Назад</a>
    </form>
</div>
</div>    
{% endblock main_content %}
"""

names = [
    'index.html',
    'registration.html',
    'logout.html',
    'recrut_driver.html',
    'get_list.html',
    'create_excursion.html',
    'take_gid.html',
    'update_salary.html',
    'remove_staff.html',
    'get_staff_list.html',
    'recruit_staff.html',
    'update_excursion_price.html',
    'add_service.html',
    'create_way.html',
    'order_excursion.html',
    'gid.html',
    'client.html',
    'manager.html',
    'director.html',
    'gid.html',
]

for name in names:
    with open(name, 'w') as f:
        f.writelines(content)