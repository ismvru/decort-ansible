# Ansible runner in Docker for Digital Energy Cloud Solutions

Docker container with ansible and ansible module [rudecs/decort-ansible](https://github.com/rudecs/decort-ansible)

## Build

```bash
Docker build .
```

## Usage

```bash
docker run -it --rm \
-e DECORT_OAUTH2_URL=https://some.decort.sso.url \
-e DECORT_APP_ID=SomeDecortAppId \
-e DECORT_APP_SECRET=SomeDecortAppSecret \
-v $PWD:/ansible \
DOCKER_IMAGE_ID ansible-playbook test-playbook.yml
```
