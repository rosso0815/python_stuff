#! /usr/bin/env python3

import ansible_runner

r = ansible_runner.run(private_data_dir="tmp", playbook="test.yml")
print(f"status: {r.status}, rc: {r.rc}")
# successful: 0
# for each_host_event in r.events:
#     print(f'event: {each_host_event["event"]}')
# print("Final status:")
# print(f'stats: {r.stats}')
