# Styling the frontend
## Before you start
Theming this service requires you to be able to visualise the changes that you make and catch any errors along the way before you commit your changes to a production environment. There are a few steps that you need to take before you start creating your theme:

- Read our documentation on [setting up a development environment]()
- [Create an `.env.local` ](#create-an-env-file)file in the root of your local repository to store the `env variables` that you will need to connect to other aspects of this service.
- [Install the packages](#install-the-packages-and-start-the-service) required to start your local development environment

### Create an env file
- Create a new file in the root of your local project and name it `.env.local`. 
- Copy the content below and paste it into the file.
```dotenv
NODE_TLS_REJECT_UNAUTHORIZED=0
NEXT_PUBLIC_GOOGLE_TAG_MANAGER_ID=GTM-XXXXXXX
NEXTAUTH_URL=http://localhost:3000
NEXTAUTH_SECRET=hash_secrect
CHOICES_API_URL=https://api.example.com
AUTH_API_URL=https://auth.example.com
OAUTH_ISSUER=https://example.amazoncognito.com
OAUTH_CLIENT_ID=issued_by_your_auth_service
OAUTH_CLIENT_SECRET=issued_by_your_auth_service
```
### Install the packages and start the service
From your command line prompt:

- Make sure that you are in the root of your project if not run `cd ~/my_local_project_directory`
- Run `yarn` or `npm install`
- Once the package installation has completed run `yarn dev` or `npm start`
- A local instance of the service should now be available in your browser window at http://localhost:3000
## Theme configuration
There are five options to brand the front end of this service for use with your own platform or website.
1. [Images](#images) - .webp, .jpg, .svg (recommended), .png files accepted.
2. [Fonts](#fonts) - using locally hosted font files (recommended) or via Googles fonts
3. [Colours](#colours) - all the main colours used in this service are editable to match with your brand/identity
4. [Menus](#menus) - header and footer menus are editable via a single configuration file.
5. [Site metadata](#metadata) can be adapted to include your brand or service name.

### Theme directory
All theme configuration is stored in one directory and spans three files and one directory. Examples of each file and its formatting can be found in the `public/examples` directory.
```md
public/theme
├── font.config.js
├── images
│   ├── apple-touch-icon.png
│   ├── favicon-16x16.png
│   ├── favicon-32x32.png
│   ├── favicon.ico
│   └── logo.svg
├── theme.config.js
└── theme.scss

```
### Images

### Fonts

### Colours
```scss
/*FORMS*/
$govuk-error-colour: #d91c90;
$govuk-success-colour:#69a853;
$govuk-input-border-colour: $govuk-text-colour;

$govuk-summary-title-colour: #006ea1;
$govuk-border-colour: #fbad18;

$govuk-inset-text-border-colour: #fbad18;
$govuk-notification-banner-border: $govuk-brand-colour;
/*LINKS*/
$govuk-link-colour: #006ea1;
$govuk-hover-colour: #141760;
$govuk-link-visited-colour: #141760;
$govuk-link-hover-colour: #141760;
$govuk-link-active-colour: #141760;

/*BUTTONS*/
$govuk-button-background-colour: #007ab2;
$govuk-button-text-colour: white;

/*HEADER*/
$govuk-header-background:  white;
$govuk-header-text-colour: #141760;
$govuk-header-nav-item-border-color: #141760;

$govuk-header-border-color: #d91c90;
$govuk-header-border-width: 3px;
$govuk-header-link-active: #1d8feb;
$govuk-header-link-hover: black;
$govuk-header-nav-item-border-color: #2e3133;
$govuk-header-link-underline-thickness: 3px;
```
### Menus

### Metadata
