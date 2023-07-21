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

### Step 4 - Choose Database and synchronization configuration
It is the condition will appear :
- Using database outside container 
While choose this condition, open docker-compose.yaml file. Comment block of `mysqldb` container with add `#` on left.

- Using database with container in this docker-compose.yaml file
This docker-compose.yaml will be create 1 container as mysql database with name `mysqldb`. That container mounting this directory on host server.
````
mysql
├── conf
├── data
└── dbinitial
````
`conf` contains all file of mysql configuration.
`dbinitial` contains .sql file that will be running while `mysqldb` container created. Please open existing .sql file and synchronization this line below.
````
CREATE Database IF NOT EXISTS lineblocs;
USE lineblocs;

GRANT ALL ON `lineblocs`.* TO 'root_lineblocs'@'%';
````

````
CREATE Database IF NOT EXISTS opensips;
USE opensips;
GRANT ALL ON `opensips`.* TO 'root_lineblocs'@'%';
````

To get most update DB, please visit this link https://github.com/Lineblocs/helm-chart/tree/main/database

`data` contains data of mysql application. 

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