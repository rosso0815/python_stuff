"""Tbd"""

from behave import given, then, when


@given("we have behave installed")
def step_impl1(context):
    pass


@when("we implement a test")
def step_impl2(context):
    assert True is not False


@then("behave will test it for us!")
def step_impl3(context):
    assert context.failed is False
