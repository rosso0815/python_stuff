#! /usr/bin/env python3
""" test """


import oop.person as pe


def test_handle_cars():
    """
    Test Cars and Person
    """
    user = pe.User(FirstName="Andreas", LastName="Pfister")
    pe.checkUser(user)
    #  pe.checkUser("", "")

    #  person_1 = Person(name="hans1")
    #  person_1.say_hello()
    #
    #  person_1.say_hello()
    #
    #  person_1.say_hello()
    #  assert person_1.say_hello() == "Guten Tag hans1"
    #
    #  person_1.say_hello()
    #
    #  person_1.say_hello()
    #  person_2 = Person(name="hans2")
    #  person_2.say_hello()
    #
    #  assert person_2.say_hello() == "Guten Tag hans2"
    #  car_vw = Car(brand="vw", speed=120, driver=person_1)
    #  print("car_vw: %s", car_vw)
    #  assert car_vw.get_half_drive() == 60
    #  print("driver1 hello =", car_vw.driver_say_hello())
    #  car_vw.__driver = person_2
    #  print("driver2 hello =", car_vw.driver_say_hello())
