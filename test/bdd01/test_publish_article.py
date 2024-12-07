# content of test_publish_article.py

from pytest_bdd import given, scenario, then, when


@scenario("publish_article.feature", "Publishing the article")
def test_publish():
    print("test_publish")


@given("I'm an author user")
def author_user():
    print("author_user")


@given("I have an article")
def article():
    print("article")


@when("I go to the article page")
def go_to_article():
    print("go_to_article")


@when("I press the publish button")
def publish_article():
    print("publish_article")


@then("I should not see the error message")
def no_error_message():
    pass


@then("the article should be published")
def article_is_published():
    pass
