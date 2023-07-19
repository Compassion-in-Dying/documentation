# Hosting

## Hosting the service in an AWS account 

Each component of the service is deployed via terraform. Each service has instructions in each README on how to deploy the service to AWS either using GitHub Actions or locally using terraform: 

* [Core infrastructure](https://github.com/Compassion-in-Dying/core_infrastructure)
* [Frontend](https://github.com/Compassion-in-Dying/choices_frontend)
* [Authentication Layer](https://github.com/Compassion-in-Dying/choices_auth)
* [API / Database Layer](https://github.com/Compassion-in-Dying/choices_api)

How each component is related and connected can be discovered can be seen in the [Logical Architecture Diagram](https://github.com/Compassion-in-Dying/documentation/blob/main/architecture/3_Logical-Architecture.md)

Each repository has a set of GitHub workflows, which take care of orchestrating the deployment. These workflows depend on having some GitHub environments setup. Each repository needs to have a `dev` and `production` environment created with the following secrets setup

```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

For more information on getting these keys [see the Managing access keys for IAM users AWS documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html) 

## Using Docker

Each repository in this services has a README file that defines how to deploy the component either locally or as part of a build using terraform. However it is also possible to directly build the docker image from the `Dockerfile` in each of the projects (that is for the projects where there is a Dockerfile). 

For a full walkthough of docker and containers see [the docker getting started documentation](https://docs.docker.com/get-started/)

### Building and publishing the docker image

To build a docker image, the following commands should be run in the same folder that the `Dockerfile` you wish to build. Once in the folder you can run 

    docker build -t {tag_name} .

where `{tag_name}` is the tag that you want attach to the built image. Once the image has been built you can now publish the image and the associated tags to any container repository. 

* [Docker hub](https://hub.docker.com/)
* [AWS ECR](https://aws.amazon.com/ecr/)
* [Azure Container Registry](https://azure.microsoft.com/en-gb/products/container-registry)

The published images can then be consumed in any service that supports running docker containers, for example, 

* [AWS ECS](https://aws.amazon.com/ecs/)
* [AWS EKS](https://aws.amazon.com/eks/)
* [Azure AKS](https://learn.microsoft.com/en-us/azure/aks/intro-kubernetes)
* [Azure Container Instances](https://learn.microsoft.com/en-us/azure/container-instances/)

### Running the docker image

To run a docker container we need to do 2 things: 

* Create a file with the appropriate environment variables to pass the connection strings and envrionment details to the container
* Expose the appropriate ports for the container on the host and run the container

#### Creating an environment variable file

To create an environment variable file, discover what environment variables are required for the components, these are documented in the README file for the associated component. Once you know the environment variables and values you can create the file by running 

    touch env.list

and then 

    open env.list

and cut and paste the environment variables and values into that file an save. 

#### Running the container and exposing the ports 

To run the docker continer we can simply run the following command (assumes `env.list` is in the same directory as the command that is running)

    docker run -d -p {host-port}:{container-port} -env-file env.list {tag-name}

so to run a container from the `choices_api:latest` tag and expost the container port `7126` to `8000` we can run: 

    docker run -d -p 8000:7126 -env-file env.list choices_api:latest
