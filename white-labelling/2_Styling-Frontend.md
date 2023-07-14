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
All theme configuration is stored in one directory and spans three files and one directory. Examples of each file and its formatting can be found in the `public/theme` directory and can be used as a starting point for your service.
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
#### Logo
- File type - .svg (recommended), .jpg, .png, .webp
- Size - max-height 70px, max-width 300px
- Location - `public/theme/images`
- Settings location`public/theme/theme.config.js`.
- width and height - numeric value only e.g. `140` not ~~140px~~
- Image src - relative file path e.g. `/theme/images/logo.svg`
- Alt text - essential for accessibility

**Example configuration**
```js
logo: {
        src: "/theme/images/logo.svg",
        height: 70,
        width: 140,
        alt: "Compassion in dying logo."
    }
```

### Fonts

### Colours
```scss
/*FONTS*/
$govuk-font-family: var(--font-geograph);
$govuk-font-family-headings: var(--font-geograph);

/*COLOURS*/
$govuk-brand-colour: $cid-dark-green;
$govuk-canvas-background-colour: #f3f2f1;
$govuk-body-background-colour: #FFFFFF;
$govuk-text-colour: #0b0c0c;
$govuk-secondary-text-colour: #505a5f;
$govuk-border-colour: $cid-dark-green;

/*LINKS*/
$govuk-link-colour: $cid-dark-green;
$govuk-hover-colour: black;
$govuk-link-visited-colour: $cid-dark-green;
$govuk-link-hover-colour: black;
$govuk-link-active-colour: $cid-mid-green;

/*BUTTONS*/
$govuk-button-background-colour: $cid-mid-green;
$govuk-button-text-colour: white;

/*HEADER*/
$govuk-header-background:  $cid-dark-green;
$govuk-header-text-colour: white;
$govuk-header-link-active: $cid-bright-green;
$govuk-header-nav-item-border-color: $cid-bright-green;
$govuk-header-border-color: white;
$govuk-header-border-width: 0px;

/*FOCUS STATE*/
$govuk-focus-text-colour: black;
$govuk-focus-colour: #fd0;

/*FORMS*/
$govuk-error-colour: #d4351c;
$govuk-success-colour: $cid-mid-green;
$govuk-input-border-colour: $govuk-text-colour;

/*MISC*/
$govuk-details-summary-title-colour: $cid-mid-green;

/*BANNERS and CALLOUTS*/
$govuk-inset-text-border-colour: $cid-bright-green;
$govuk-warning-callout-colour: #FF611A;
$govuk-notification-banner-border: $govuk-brand-colour;

/*DASHBOARD*/
$govuk-summary-card-title-background: $govuk-canvas-background-colour;
$govuk-tag-green: #00703c;
$govuk-tag-yellow: #ffdd00;
$govuk-tag-grey: #505a5f;
$govuk-tag-blue: #1d70b8;
```
### Menus

### Metadata
