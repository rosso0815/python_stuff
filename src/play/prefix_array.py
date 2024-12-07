"""test again a array with prefix"""

# import os

# well done on comment

a_prefix = ["test01", "test02"]

a_tests = [{"name": "test01"}, {"name": "test02container"}]

for e in a_tests:
    print(f"e: {e}")
    for key in e:
        print(f"key: {key} value: {e[key]}")
        if key == "name":
            print("found name")
            # if e[key] in a_prefix:
            #    print("found prefix")
            for i in a_prefix:
                print(f"i: {i}")
                print(f"key.value: {e[key]}")
                if e[key].startswith(i):
                    print("found valid prefix")
