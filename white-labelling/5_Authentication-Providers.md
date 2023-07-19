# Authentication

Authentication is a core part of the application and as such there needs to be some level of consistency between the front-end and API's to authenticate and authorise the users. To this end we need to customise both the front-end and backend to support the same identity provider mechanism. 

> Note: It is worth noting that services like AWS cognito or Azure Active Directory, do support federated providers so it is possible to support many providers with one configuration. However the requirement for the hosted service to support a credential flow means that we don't directly support federated identities in the hosted version. 

## Example: Using google auth instead of cognito

To support google authentication, we need to make 2 sets of changes

* Update the front-end to use the Google provider
* Update the API to use google as the JWT bearer authenticator.

### Updating the front-end 

The front-end authentication is controlled by [NextAuth](https://next-auth.js.org/) and it supports [many different providers directly](https://next-auth.js.org/providers/)

To change the authentication provider in the front-end we need to update the [`api/auth/[...nextauth].tsx`](https://github.com/Compassion-in-Dying/choices_frontend/blob/c48d5216a00530d120e491e0893dcbae6ddc045e/src/pages/api/auth/%5B...nextauth%5D.tsx#L129) file to add the `Google provider` according to the following instructions [here.](https://next-auth.js.org/providers/google)

### Updating the back-end

The API relies on authenticating users via JWT Bearer tokens. This is configured using the standard .NET core JWT library which is configured as part of the [API Startup](https://github.com/Compassion-in-Dying/choices_api/blob/3e5ce75a1cc58ceb6fc445b43f080e636ab52d33/src/api/Choices.API/Program.cs#L38) 

To achieve this we can add the following nuget package: 

    Hellang.Authentication.JwtBearer.Google 

and then update the referenced line above to be 

```
    services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
        .AddJwtBearer(jwt => jwt.UseGoogle(clientId: "<client-id-from-Google-API-console>"));
```

where the `client-id` comes from the Google API console. Once this is complete we should be able to authenticate the front-end requests against the API.
