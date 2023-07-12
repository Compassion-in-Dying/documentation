# Overview

**Vision:** To be the gold standard so that other public and private sector organisations can integrate or refer to our service rather than creating their own, allowing as many citizens as possible the opportunity to record their wishes.

**Goal:** To build a technical architecture that enables white labelling/integration of CID partners and scalability.

## What is Open Source white labelling?

A white labelled product is one that organisations can reuse whilst applying their own branding to.

In the context of the CID My Decisions journey, we offer several ways for third parties to achieve this, as they will likely need to integrate CIDs document creation with their own technical set up, and be able to apply their own branding to both the front end and the document that the service produces that captures the users decisions.

The product has been built using several layers with well defined interfaces, so if the web front end or the user storage system the CID website uses are incompatible with third parties' technical approach, they can also choose to only take on a portion of the solution.


## The current hosted solution

The current hosted solution, runs on AWS (Amazon Web Services) and is made up of 8 distintly deployable elements, 4 which make up the core service, 2 which support ancillary tasks such as sending emails and account cleanup and 2 which support customer support operations.

### Core elements

- **[Core infrastructure](https://www.github.com/Compassion-in-Dying/core_infrastructure)** - This is the baseline infrastructure repository that is used across all of the services. This repository sets up the networking, database and authentication providers used by the other elements of the service

- **[Authentication](https://www.github.com/Compassion-in-Dying/choices_auth)** - This is an authentication API that wraps the AWS cognito API to support the credentials login, password and email reset flows that are part of the hosted service.

- **[API](https://www.github.com/Compassion-in-Dying/choices_api)** - This is the primary API that the front-end application uses save/retrieve user responses and generate PDF's. This communicates directly with the database setup in the core infrastructure repository above.

- **[Front End](https://www.github.com/Compassion-in-Dying/choices_frontend)** - This is the frontend of the service, it defines the user journey, forms and styling. The API is agnositic the order the data is recieved in. So the front-end has complete control over this

### Ancillary elements

- **[Email Task](https://www.github.com/Compassion-in-Dying/email_task)** - This is a task that can be run on a periodic basis that queries the database for accounts that are are the correct points in the workflow to recieve an e-mail.

- **[Account Cleanup task](https://www.github.com/Compassion-in-Dying/account_deletion_task)** - This is a task that can be run on a periodic basis that queries the database for accounts that are are considered unused and cleans them up.

### Support elements

- **[Admin API](https://www.github.com/Compassion-in-Dying/admin_portal_api)** - An API that supports the admin portal executing various tasks that are required to support the service.

- **[Admin Front End](https://www.github.com/Compassion-in-Dying/admin_portal)** - A simple front end dashboard that supports various customer support queries and actions 

For a more detailed explination and overview [see the architecture documentation](https://github.com/Compassion-in-Dying/documentation/tree/main/architecture)

# Approach to different sized partners with differing levels of technical maturity

From conversations with CID staff and potential partners themselves, it's apparent that the audience covers a range of technical abilitieand industries, at differing levels of maturity. To that end, we've developed the solution with four levels of ability in mind:

* **Small partners with limited availability of technical maturity** - Will want to avoid technical involvement and will be content with aesthetic customisation options.

* **Intermediate partners with some available technical maturity** - Want more control over the journey than small partners, but don't want to get involved with data storage.

* ***Large partners with a high level of available technical maturity** - Want full control, and are willing to write the question pages themselves and post the answers to the documen production service in the format we require.

* **Partners with a high level of available technical maturiy and bespoke requirements** - Want some of the functionality above, but in a bespoke configuration that only they are likely to ever need. In this case there is the option to allow a third party access to the Compassion in Dying code repository, to allow them to take the elements they need and compile their own solution.

## Technical approach

We have taken a layered approach that allows different sized partners to choose which layers to use depending on their desired solution and
technical capabilities. There are 3 layers:

1.  [Service Layer](https://www.github.com/Compassion-in-Dying/choices_api) - A simple API that save user responses and generates the documents, this layer encompasses the database and PDF generation.

2.  [Authentication](https://www.github.com/Compassion-in-Dying/auth_api) - An authentication layer that abstracts the details of the authentication flows from the front-end, primarily due to the credentials login requirement for the hsoted CID service. If it is the case that the partner wishes to use their own authentication pattern or a default OIDC / OAuth2 federated identity service such as Facebook, Google, Auth0, Ping etc. Then this layer is not necessary. However a different provider setting will be required. For more information on this see the dedicated Authentication section. 

3.  [User interface](https://www.github.com/Compassion-in-Dying/choices_frontend) - The front end that the users interact with.


