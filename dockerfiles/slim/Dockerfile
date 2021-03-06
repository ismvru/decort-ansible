FROM python:3-slim as kerberos-builder
RUN apt-get -y update \
    && apt-get --no-install-recommends -y install gcc libkrb5-dev \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /wheel
COPY req.txt /wheel
RUN sed -i '/kerberos/!d' /wheel/req.txt \
    && pip wheel --prefer-binary -r /wheel/req.txt

FROM python:3-slim
RUN mkdir /etc/ansible
WORKDIR /wheel
COPY --from=kerberos-builder /wheel/*.whl /wheel/
COPY ansible.cfg /etc/ansible
COPY req.txt /
RUN pip --no-cache-dir install *.whl \
    && pip --no-cache-dir install -r /req.txt \
    && apt-get -y update \
    && apt-get --no-install-recommends -y install git sshpass ssh \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/* \
    && git clone https://github.com/rudecs/decort-ansible.git /decort-ansible \
    && mkdir -p /usr/share/ansible/plugins/modules /usr/share/ansible/plugins/module_utils \
    && mv /decort-ansible/library/*.py /usr/share/ansible/plugins/modules/ \
    && mv /decort-ansible/module_utils/decort_utils.py /usr/share/ansible/plugins/module_utils \
    && rm -rf /decort-ansible
WORKDIR /ansible
CMD ["ansible-playbook", "--version"]