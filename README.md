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

### Step 3 - Choose Database and synchronization configuration
It is the condition will appear :
- Using database outside container 
Default condition is database on eksternal container. On this condition, just make sure to have correct value on .env at CONFIG_DB_ROOT_PASSWORD, CONFIG_DB_PASSWORD, CONFIG_DB_USER, CONFIG_DB_NAME, CONFIG_DB_OPENSIPS_DATABASE

- Using database with container in this docker-compose.yaml file
To using this condition, add ` --profile include_mysql` after `docker-compose`. So command become `docker-compose --profile include_mysql up -d`, `docker-compose --profile include_mysql stop`, etc.  
This docker-compose.yaml will be create 1 container as mysql database with name `mysqldb` and all others container. That mysql container mounting this directory on host server.
````
mysql
├── conf
├── data
└── dbinitial
````
`conf` contains all file of mysql configuration.
`dbinitial` contains .sql file that will be running while `mysqldb` container created. 

To get most update DB, please visit this link https://github.com/Lineblocs/helm-chart/tree/main/database

`data` contains data of mysql application. 

### Step 4 - Re-check DNS configuration

Make sure you have dns configuration mapping to your ip server. List of domain :
- {{DEPLOYMENT_DOMAIN}}
- app.{{DEPLOYMENT_DOMAIN}}
- call-route-editor.{{DEPLOYMENT_DOMAIN}}
- editor.{{DEPLOYMENT_DOMAIN}}
- internals.{{DEPLOYMENT_DOMAIN}}
- dbeditor.{{DEPLOYMENT_DOMAIN}}

### Step 5 - Running docker container

```shell
$ docker-compose up -d
```
or 
```shell
$ docker-compose  --profile include_mysql up -d
```

Make sure using docker compose version 2.


Tips : 
- Use `screen` for running `docker-compose up -d`
