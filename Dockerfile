FROM python:3-slim
COPY Dockerfile req.txt /
RUN apt-get -y update \
&& apt-get --no-install-recommends -y install python3-kerberos git \
&& apt-get clean all \
&& rm -rf /var/lib/apt/lists/* \
&& pip --no-cache-dir install -r /req.txt
RUN git clone https://github.com/rudecs/decort-ansible.git /decort-ansible \
&& mkdir -p /usr/share/ansible/plugins/modules /usr/share/ansible/plugins/module_utils \
&& mv /decort-ansible/library/*.py /usr/share/ansible/plugins/modules/ \
&& mv /decort-ansible/module_utils/decort_utils.py /usr/share/ansible/plugins/module_utils \
&& rm -rf /decort-ansible
WORKDIR /ansible
# ansible-config dump | grep DEFAULT_MODULE_PATH
CMD ["ansible-playbook"]