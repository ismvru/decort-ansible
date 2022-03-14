FROM python:3-alpine as kerberos-builder
RUN apk --no-cache add gcc musl-dev libffi-dev krb5-dev
WORKDIR /wheel
COPY req.txt /wheel
RUN sed -i '/kerberos\|cffi/!d' /wheel/req.txt \
    && pip wheel --prefer-binary -r /wheel/req.txt

FROM python:3-alpine
RUN mkdir /etc/ansible
WORKDIR /wheel
COPY --from=kerberos-builder /wheel/*.whl /wheel/
COPY ansible.cfg /etc/ansible
COPY req.txt /
RUN pip --no-cache-dir install *.whl \
    && pip --no-cache-dir install -r /req.txt \
    && apk --no-cache add sshpass openssh-client bash git \
    && git clone https://github.com/rudecs/decort-ansible.git /decort-ansible \
    && mkdir -p /usr/share/ansible/plugins/modules /usr/share/ansible/plugins/module_utils \
    && mv /decort-ansible/library/*.py /usr/share/ansible/plugins/modules/ \
    && mv /decort-ansible/module_utils/decort_utils.py /usr/share/ansible/plugins/module_utils \
    && rm -rf /decort-ansible
WORKDIR /ansible
CMD ["ansible-playbook", "--version"]