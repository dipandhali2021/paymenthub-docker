# Payment Hub Operations Web UI

This repository facilitates the setup of Docker containers required to build and develop the **Payment Hub Operations Web UI**. The services included in this setup are:

1. **Keycloak** – For user authentication and authorization management.
2. **jBPM** – A business process management tool, enabling maker-checker workflows.
3. **Prometheus** – For collecting and scraping metrics from Keycloak.
4. **Grafana** – Provides visual dashboards to monitor and manage Keycloak user activities.

## Prerequisites

Ensure the following are installed and running on your system:
- [Docker](https://www.docker.com/)

## Setup Guide

Follow these steps to set up and run the services:

1. **Clone the repository:**
```bash
git clone https://github.com/dipandhali2021/paymenthub-docker.git
```
2. **Navigate to the project directory:**
```bash
cd paymenthub-docker
```
3. **Start the services using Docker Compose:**
```bash
docker-compose up
```
> Ensure Docker is up and running before executing the above command.

4. **Initial Setup for jBPM and Grafana:**

- Once the services are running, perform basic setup for jBPM and Grafana as outlined below.
- Keycloak and Prometheus do not require additional setup.


## Default Credentials
Use the following default credentials to access the services:
| Service    | Username | Password |
| -------- | ------- | -------  |
| jBPM  | wbadmin  |wbadmin|
| Keycloak | admin    |    admin      |
| Grafana    | admin    |   admin       |


## Service URLs
Once the services are running, access them at the following URLs:


1. **Keycloak**: [http://localhost:8080](http://localhost:8080) 
2. **jBPM**: [http://localhost:8180/business-central](http://localhost:8180/business-central) 
3. **Prometheus**: [http://localhost:9090](http://localhost:9090) 
4. **Grafana**: [http://localhost:3000](http://localhost:3000)


## jBPM Setup
1. Open a browser and navigate to http://localhost:8180/business-central/.
2. Log in with the default credentials (`wbadmin` / `wbadmin`).
3. Go to Design → MySpace → Import Project.
4. In the repository URL field, enter:
`https://github.com/dipandhali2021/user-management.git`
5. Select PaymentHubEE and click OK.
6. Click Deploy to complete the setup.


### CORS Configuration in jBPM
To enable CORS (Cross-Origin Resource Sharing) for jBPM's REST API access:

1. **Access the running jBPM container:**

```bash
docker exec -it jbpm-server /bin/bash
```

2. **Navigate to the directory where the `jbpm-cors.sh` script is located:**

```bash
cd /opt/jboss
```

3. **Verify the presence of the script:**
```bash
ls -l
```

4. **If the script is not executable, change its permissions:**
```bash
chmod +x jbpm-cors.sh
```

5. **Run the script to configure CORS:**
```bash
./jbpm-cors.sh
```
6. Once the script completes, CORS will be configured for jBPM.

## Grafana Setup

### Adding Prometheus Data Source
1. Open Grafana in a browser: http://localhost:3000
2. Log in with the default credentials (`admin` / `admin`).
3. In the left-hand menu, click Toggle Menu → Administration → Data Sources.
4. Click Add data source and select Prometheus.
5. Set the URL for Prometheus:
```bash
http://<your-machine-ip>:9090
```

6. Scroll down and click Save & Test.
If any issues arise, restart the Grafana container in Docker.

### Importing Grafana Dashboard
1. In the repository, navigate to the `grafana-dashboard` directory and copy the contents of the JSON file.
2. In Grafana, click Toggle Menu → Dashboards → New → Import.
3. Paste the copied JSON content into the `Import via panel` JSON section.
4. Click Prometheus in the third option to select it as the data source.
5. Grafana dashboard will now display the Keycloak metrics.


