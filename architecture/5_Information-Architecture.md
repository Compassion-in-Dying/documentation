# Information Architecture

## Logical Data model

![Logical Data Model](images/Logical-Data-Model.png)

The above logical data model consists of the following entities

| Entity | Scope | Repository | Description |
|:-------|:-----|:----|:------------|
| User Journey | Transactional | Choices DB | Contains a foreign key to the User ID provided by the authorisation token and the form answers presented by the front end. The Response field is build by unioning incoming response data with the previously stored response JSON document  |
| User Communication | Transaction | Choices DB | Records the emails and communications that are sent to the user as part of the scheduled email task.

in addtion to the data model also contians a set of views which provide collections of entities (typically User Journeys) which can be used to send notifications/nudges to the user.

| View | Description |
|:------|:-----------|
| DoYouStillNeedAnAccount | Selects users that haven't updated their account in over 8 months and haven't downloaded a form and haven't already recieved a `Do You Still need an account` e-mail. |
| HelpPrompt | Selects users that have created their account over 8 weeks ago and haven't downloaded a form and haven't already recieved a `Help Prompt` e-mail. |
| ProvideFeedback | Selects users that have created their account within the last 3 days ago and haven't already recieved a `Provide Feedback` e-mail.|
| HaveYouSignedYourForm | Selects users that have updated their account last week and haven't already recieved a `Have You Signed Your Form` e-mail.|
| FinalReminder | Selects users that haven't updated their account within the last 8.5 months and have already recieved a `Do you still need an account` e-mail, but not a `Final Reminder` email.|
| HaveYouSharedWithYourGP | Selects users that have updated their account 2 months ago and haven't already recieved a `Have You Shared with Your GP` e-mail.|
| TimeToReview | Selects users that haven't updated their account in 2 years and haven't already recieved a `TimeToReview` e-mail.|
| PrintAndShare | Selects users that have created their account within the last 10 mins and haven't already recieved a `Print and share` e-mail.|

## Data repositories 

| Name | Technologies | Description|
|:----|:------------|:-----------|
| Transactional | AWS RDS - MySQL | |

## Physical Data Architecture

![Physical Data Model](images/Physical-Data-Model.png)


## API Document Model

The sections below document the object model that is used to populate the PDF. The fields can be supplied in any order, optional fields will be omitted from the CV generation. There is no required validation API side, thus if you omit a required field it will simply not show in the PDF. 

> Note: No API side vlaidation is normally a security hole when individual fields are written to the database. However because we are added the values by union merging them in to a JSON document no input dependant SQL statements are executed.

### Base document model

The following tables list the expected types of attibutes and their respective types. Both the Advance Decision and Advance Statement 

| Property Name | Type | Additional Detail |
|:--------------|:-----|:------------------|
| FirstName | String | First name of the person effected by this decision |
| LastName | String | Last name of the person effected by this decision |
| Country | String | Country of the person effected by this decision. There are implications for advance decisions made in scotland that the user needs to be made aware of. |
| Address1 | String | First line of the address of the person effected by this decision |
| Address2 | String (optional) | Second line of the address of the person effected by this decision |
| Town | String | Postal town of the person effected by this decision |
| County | String (optional) | County of the person effected by this decision |
| Postcode | String | Postcode of the person effected by this decision |
| DOB | DateTime | Date of birth of the person effected by this decision, this should be presented in ISO 8601 format |
| DistinguishingFeatures | String (optional) | Any distinguishing features of the person effected by this decision | 
| HealthCareNoType | Enumeration (String) | NHS or CHI, If the users health care number not a NHS number then this should be set to CHI else NHS |  
| HealthCareNo | String or Number | Healthcare number of the person effected by this decision |
| UserKnowsHealthCareNo | Boolean | This should be set dependant whether the user has `correctly` populated their health car number |
| GPSurgeryName | String | GP Surgery name of the person effected by this decision |
| GPAddress1 | String | First line of the address of the GP Surgery of person effected by this decision |
| GPAddress2 | String  | Second line of the address of the GP Surgery of person effected by this decision |
| GPTown | String | Town of the GP Surgery of person effected by this decision  |
| GPCounty | String (optional) | County of the GP Surgery of person effected by this decision
| GPPostcode | String | Postcode of the GP Surgery of person effected by this decision
| Attorneys | AttorneyDetail array | See. attorney detail table for attributes. But this contains the details of the users attorney if they have signed an Lasting Power of Attorney | 

**Attorney Detail model**

| Property Name | Type | Additional Detail |
|:--------------|:-----|:------------------|
| Name | String | Name of the attorney |
| Email | String | Email of the attorney |
| Phone | String | Phone number of the attorney |


### Advance decision document model

| Property Name | Type | Additional Detail |
|:--------------|:-----|:------------------|
| IncludeDementia | Boolean | |
| IncludeBrainInjury | Boolean | |
| IncludeNervousSystem | Boolean | |
| IncludeTerminalIllness | Boolean | |
| CustomRefusalOfTreatment | String (optional) | |
| ConfirmationOfStatement | Boolean | |
| IncludePainRelief | Boolean | |
| ReasonForMakingAD | String  | |

### Advance statement document model

| Property Name | Type | Additional Detail |
|:--------------|:-----|:------------------|
| ImportantInYourLife | String (optional) | |
| ImportantToIdentity | String (optional) | |
| DislikedThings | String (optional) | |
| ImportantToKnow | String (optional) | |
| FoodNeeds | String (optional) | |
| WhereCaredFor | String (optional) | |
| ExistingConditions | String (optional) | |
| OtherImportantHealthIssues | String (optional) | |
| PreferNotToHappen | String (optional) | | 
