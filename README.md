# Ansible runner in Docker for Digital Energy Cloud Solutions

[![Build Status](https://ci.ismv.ru/api/badges/IsaevTech/decort-ansible/status.svg)](https://ci.ismv.ru/IsaevTech/decort-ansible)

Docker container with ansible and ansible module [rudecs/decort-ansible](https://github.com/rudecs/decort-ansible)

## Tags

- `repo.ismv.ru/decort-ansible:latest` - latest build based on `python:3-slim`
- `repo.ismv.ru/decort-ansible:VERSION` - build with VERSION (see tags) based on `python:3-slim`
- `repo.ismv.ru/decort-ansible:latest-alpine` - latest build based on `python:3-alpine`
- `repo.ismv.ru/decort-ansible:VERSION-alpine` - build with VERSION (see tags) based on `python:3-alpine`, started from `0.0.6`

## Dockerfiles

[dockerfiles/alpine/Dockerfile](dockerfiles/alpine/Dockerfile) - Build image based on `python:3-alpine`
[dockerfiles/slim/Dockerfile](dockerfiles/slim/Dockerfile) - Build image based on `python:3-slim` (Debian)

## Build

```bash
# Alpine image
docker build -f dockerfiles/alpine/Dockerfile .

# Debian image
docker build -f dockerfiles/slim/Dockerfile .
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
