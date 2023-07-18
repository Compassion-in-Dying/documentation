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

## Building and Deploying

### Building the docker image

### Running the docker image

#### Dependencies and Environment Variables

