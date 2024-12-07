#!/usr/bin/env python

from ansible.module_utils.basic import *

# from jinja2 import Environment

HTML = """
<html>
<head>
<title>{{ title }}</title>
</head>
<body>
Hello.
</body>
</html>
"""


def print_html_doc():
    print("@@@ print_html_doc")
    # print Environment().from_string(HTML).render(title='Hellow Gist from GutHub')


def run_module():
    module = AnsibleModule(
        argument_spec = dict(
            state     = dict(default='present', choices=['present', 'absent']),
            name      = dict(required=True),
            filename  = dict(required=True),
            enabled   = dict(required=True, type='bool'),
            something = dict(aliases=['whatever'])
        )
    )
    print_html_doc()
    response = {"hello": "world"}
    module.exit_json(changed=False, meta=response)


def main():
    run_module()


if __name__ == '__main__':
    main()
