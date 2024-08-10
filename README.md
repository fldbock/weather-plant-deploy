# Weather Plants Deployment Repo
## Deploy to Kubernetes using Helm
### local

Make sure minikube and kubectl are installed on your machine. Go to a subfolder of *environments/* and execute:

    minikube start
    task install

The output of your last command will show you how access the application.

### prod (EKS)

Add your aws credentials to *.envrc* file:

    export AWS_ACCESS_KEY_ID=""
    export AWS_SECRET_ACCESS_KEY=""

Go to *environments/prod/terraform* and execute:

    terraform apply
    task install

The first command will spin up an EKS cluster and the prerequisite infrastructure. Don't forget to delete this infrastructure afterwards because it's expensive.

    terraform apply
## Querying The API Examples

Read list of plants:

    curl http://localhost:8080/plants

Create a new plant:

    curl -X POST -d "name=Plant1&lat=15.15&long=16.16" http://localhost:8080/plants

Update the plant with id 1:

    curl -X PUT -d "name=Plant2&lat=50.00&long=60.00" http://localhost:8080/plants/1

Remove plant with id 1:

    curl -X DELETE http://localhost:8080/plants/1

Get the temperature and relative humidity for the plant with id 1 at datetime 2024-04-15T02:00:

    curl http://localhost:8080/plants/1/weather?datetime=2024-04-15T02:00


