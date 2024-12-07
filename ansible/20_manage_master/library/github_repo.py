from ansible.module_utils.basic import *


def run_module():
    module = AnsibleModule(
        argument_spec=dict(
            state=dict(default='present', choices=['present', 'absent']),
            name=dict(required=True),
            filename=dict(required=True),
            enabled=dict(required=True, type='bool'),
            something=dict(aliases=['whatever'])
        )
    )
    response = {"hello": "world"}
    module.exit_json(changed=False, meta=response)


def main():
    run_module()


if __name__ == '__main__':
    main()
