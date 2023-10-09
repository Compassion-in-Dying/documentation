# Styling the frontend
## Table of contents
- [Setting up a dev environment](#setting-up-a-dev-environment)
   - [Create an env file](#create-an-env-file)
   - [Install the packages and start the service](#install-the-packages-and-start-the-service)
- [Theme configuration](#theme-configuration)
   - [Theme directory and structure](#theme-directory-and-structure)
- [Images](#images)
   - [Logo](#logo)
   - [Icons](#icons)
- [Fonts](#fonts)
   - [Configuring fonts](#configuring-fonts)
   - [Using different fonts for header and body text](#using-different-fonts-for-header-and-body-text)
   - [Using system fonts](#using-system-fonts)
- [Colours](#colours)
   - [Accessibility](#accessibility)
   - [Editing colours](#editing-colours)
- [Menus](#menus)
   - [Configuring menus](#configuring-menus)
- [Metadata](#metadata)
## Setting up a dev environment
To be able to visualise the changes you make to the theme there are a few steps that you need to take before you start:

- Read our documentation on [setting up a development environment](https://github.com/Compassion-in-Dying/choices_frontend/blob/master/README.md)
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
2. [Fonts](#fonts) - using locally hosted font files (recommended) or system fonts.
3. [Colours](#colours) - all the main colours used in this service are editable to match with your brand/identity
4. [Menus](#menus) - header and footer menus are editable via a single configuration file.
5. [Site metadata](#metadata) can be adapted to include your brand or service name.

### Theme directory and structure
All theme configuration is stored in one directory and spans three files and one directory. Examples of each file and its formatting can be found in the `public/theme` directory and can be used as a starting point for your service.
```md
public/theme
├── font.config.js
├── fonts
│   ├── geograph-bold-italic.woff2
│   ├── geograph-bold.woff2
│   ├── geograph-regular-italic.woff2
│   ├── geograph-regular.woff2
├── images
│   ├── apple-touch-icon.png
│   ├── favicon-16x16.png
│   ├── favicon-32x32.png
│   ├── favicon.ico
│   └── logo.svg
├── theme.config.js
└── theme.scss
```
## Images
### Logo
- File type - .svg (recommended), .jpg, .png, .webp
- Size - max-height 70px, max-width 300px
- File location - `public/theme/images`
- Settings location`public/theme/theme.config.js`.
- Width and height - numeric value only e.g. `140` not ~~140px~~
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
### Icons
Four icons are required to populate the site. It is important that these are provided to avoid 404 errors that will impact performance. Naming conventions are fixed and must be followed. No configuration is necessary.

**Files required:**
- apple-touch-icon.png (180px x 180px)
- favicon.ico (64px x 64px)
- favicon-16x16.png (16px x 16px)
- favicon-32x32.png (32px x 32px)

All of these files are saved to `public/theme/images` directory replacing the existing ones with your own brands icons. There are a many 'free to use' favicon generators available, should you need help with generating these image sizes.

## Fonts
**N.B. The theme does not make allowance for loading fonts from other sites, such as Adobe or Google. Although, this is possible it is beyond the scope of these instructions. Best practice dictates that these fonts should be downloaded and included in the sites assets. The theme will automatically optimize your fonts (including custom fonts) and remove external network requests for improved privacy and performance.**

Loading and using custom fonts with the theme requires three steps:
1. Upload the fonts and all the variations you want to use to the `public/theme/fonts` directory
2. Configure the fonts for use in `public/theme/font.config.js`
3. Reference the fonts for use in `public/theme/theme.scss`

By default, the theme only makes use of two font weights (400, 700) and two font styles (normal, italic). The theme allows for two font families, one for the body text and one for headings. However, it is recommended to keep font files to a minimum and only including the fonts and variations that are absolutely necessary. The example configuration below is an example of an optimised font set up.


### Configuring fonts
Once the font files have been added to `/public/theme/fonts` directory you are ready to configure the fonts for use in your theme. There is a complete working example included in `/public/theme/font.config.js`.

1. The export name must be unique (use the font name for ease of reference)
2. The `variable` value is important and will be used to reference the font later on for use in the theme. Use [CSS custom property](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties) syntax to name your variable property.
3. Create an object for each variant in the font-family that you wish to use in the theme:
   - path: relative to the theme directory
   - weight: the font weight of the variant `400` or `700`
   - style: `normal` or `italic`
4. Use the variable created in step 2 to populate the relevant SASS variable in `public/theme/theme.scss` (see below)
```scss
/* /public/theme/theme.scss */
$govuk-font-family: var(--font-geograph);
$govuk-font-family-headings: var(--font-geograph);
```
#### Example of `font.config.js` file
```js
/* /public/theme/font.config.js */
import localFont from "next/font/local";

export const geograph = localFont({
    variable: '--font-geograph',
    src: [
        {
            path: '/fonts/geograph-regular.woff2',
            weight: '400',
            style: 'normal',
        },
        {
            path: '/fonts/geograph-regular-italic.woff2',
            weight: '400',
            style: 'italic',
        },
        {
            path: '/fonts/geograph-medium.woff2',
            weight: '700',
            style: 'normal',
        },
        {
            path: '/fonts/geograph-medium-italic.woff2',
            weight: '700',
            style: 'italic',
        }
    ],
})
```
### Using different fonts for header and body text
To configure an additional font to differentiate between body and header text:
1. Create a second exportable object as per the `geograph` example above.
2. Give the new object a unique name i.e. `roboto` and a unique variable name i.e. `--font-roboto`
3. Populate the object (see above)
4. Use the additional variable in the SASS stylesheet (see below)
```scss
$govuk-font-family: var(--font-roboto);
$govuk-font-family-headings: var(--font-geograph);
```
### Using system fonts
If you intend or prefer to use system fonts only and don't want to include custom fonts:
1. Delete the contents of `font.config.js` but leave the file in place. This is important for the site to function.
2. Enter the values of the system fonts against the relevant SASS variable in `/public/theme/theme.scss` (see below)
```scss
/*FONTS*/
$govuk-font-family: HelveticaNeue,Helvetica,Arial,sans-serif;
$govuk-font-family-headings: HelveticaNeue,Helvetica,Arial,sans-serif;
```
## Colours
### Accessibility
The theme utilises the [GOV.UK Design System](https://design-system.service.gov.uk/) to ensure that all aspect of the users journey meet accessibility standards. Before you apply colours to your theme it is recommended to check the colour contrast using [WebAIM's contrast checker](https://webaim.org/resources/contrastchecker/).

### Editing colours
There are 33 colour variables that can changed to match your brand, each are grouped to make editing easier. Each  variable will accept any [CSS colour value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value).

**N.B. Do not rename or delete any of the variable names as this will result in errors that will prevent the site from building**
```scss
/*FONTS*/
$govuk-font-family: var(--font-geograph);
$govuk-font-family-headings: var(--font-geograph);

/*COLOURS*/
$govuk-brand-colour: #00403a;
$govuk-canvas-background-colour: #f3f2f1;
$govuk-body-background-colour: #FFFFFF;
$govuk-text-colour: #0b0c0c;
$govuk-secondary-text-colour: #505a5f;
$govuk-border-colour: #00403a;

/*LINKS*/
$govuk-link-colour: #00403a;
$govuk-hover-colour: black;
$govuk-link-visited-colour: #00403a;
$govuk-link-hover-colour: black;
$govuk-link-active-colour: #32723c;

/*BUTTONS*/
$govuk-button-background-colour: #32723c;
$govuk-button-text-colour: white;

/*HEADER*/
$govuk-header-background:  #00403a;
$govuk-header-text-colour: white;
$govuk-header-link-active: #71d76d;
$govuk-header-nav-item-border-color: #71d76d;
$govuk-header-border-color: white;
$govuk-header-border-width: 0px;

/*FOCUS STATE*/
$govuk-focus-text-colour: black;
$govuk-focus-colour: #fd0;

/*FORMS*/
$govuk-error-colour: #d4351c;
$govuk-success-colour: #32723c;
$govuk-input-border-colour: $govuk-text-colour;

/*MISC*/
$govuk-details-summary-title-colour: #32723c;

/*BANNERS and CALLOUTS*/
$govuk-inset-text-border-colour: #71d76d;
$govuk-warning-callout-colour: #FF611A;
$govuk-notification-banner-border: $govuk-brand-colour;

/*DASHBOARD*/
$govuk-summary-card-title-background: $govuk-canvas-background-colour;
$govuk-tag-green: #00703c;
$govuk-tag-yellow: #ffdd00;
$govuk-tag-grey: #505a5f;
$govuk-tag-blue: #1d70b8;
```
## Menus
There are three menus that can be configured:
1. **Standard menu** - this appears in the header of the site and is only visible when users have not logged in to the service.
2. **Protected menu** - this menu replaces the standard menu once a user has authenticated to the service. It should contain a link to the users dashboard.
3. **Footer menu** - always available to the user and should contain links to policies relating to your brand.
### Configuring menus
All three menus are configured in exactly the same way:
1. **Content** - the text that appears in the link
2. **Link** - URL of the link destination
3. **Title** - longer text description of the links purpose for screen readers and assistive technologies. Not normally visible to the use.

A complete working example of this configuration can be found in `/public/theme/theme.config.js`
```js
footerMenu: [
    {
        content: 'Help and support',
        link: 'https://example.com/help-and-support',
        title: 'Get help and support with this service'
    },
    {
        content: 'Terms of use',
        link: 'https://example.com/terms-of-use',
        title: 'Terms of use',
    }
  ]
```
## Metadata
A brand or service name can be added to the end of all page titles on the site. The configuration for the `pageTitlePostfix` can be found in `/public/theme/theme.config.js` (see the example below).
```js
const theme = {
   pageTitlePostfix: "Compassion in Dying",
   logo: {
      src: "/theme/images/logo.svg",
      height: 70,
      width: 140,
      alt: "Compassion in dying logo."
   },
...
```
