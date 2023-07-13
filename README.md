# Deploy Lineblocs with Docker compose

Example of use:

### Step 1 - Clone repositories

```shell
$ git clone https://github.com/Lineblocs/docker-deployment.git
```
```shell
$ cd docker-deployment
```

### Step 2 - Create .env

Create .env file. Use .env.example to reference

```shell
$ cp .env.example .env
```
Change variable in .env file.  Fill LETSENCRYPT_EMAIL, DEPLOYMENT_DOMAIN, CONFIG_DB_HOST, etc

### Step 3 - Re-check DNS configuration

Make sure you have dns configuration mapping to your ip server. List of domain :
- {{DEPLOYMENT_DOMAIN}}
- app.{{DEPLOYMENT_DOMAIN}}
- call-route-editor.{{DEPLOYMENT_DOMAIN}}
- editor.{{DEPLOYMENT_DOMAIN}}
- internals.{{DEPLOYMENT_DOMAIN}}
- dbeditor.{{DEPLOYMENT_DOMAIN}}

### Step 4 - Running docker container

```shell
$ docker-compose up -d
```
Make sure using docker compose version 2.


Tips : 
- Use `screen` for running `docker-compose up -d`