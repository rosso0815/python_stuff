
build:
	@echo start && \
		cd devint/pisa && \
		rm devint-pisa-1.0.0.tar.gz && \
		ansible-galaxy collection build && \
		ansible-galaxy collection install devint-pisa-1.0.0.tar.gz && \
		ansible-galaxy collection list && \
		cd - && \
		cd play_dev_int && \
		ansible-playbook -v playbook.yml

