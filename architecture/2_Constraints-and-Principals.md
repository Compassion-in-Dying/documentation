# Constraints, Principals and Decisions

## Principals

### Architectural principals

| Id         |  Principal                  | Rationale |
|:----------:|:----------------------------|:----------|
| **ARCH-1** | Appropriate tools and technologies - Use appropriate tools and technologies to create and operate a good service in a cost effective way - for example, by automating things where possible. |
| **ARCH-2** | Meets user needs - Understand your users and their needs. Develop knowledge of your users and what that means for your technology project or programme. |
| **ARCH-3** | Information assets are owned - All information assets have an agreed owner who understands and accepts the personal and business data loss risks. |
| **ARCH-4** | Auto-scale by Design - The system has been designed to scale with demand up and down. Lower environments are scaled down to "off" over night. |
| **ARCH-5** | Semantic integrity - the meaning of a piece of data remains the same through-out the data lifecycle across the design. |
| **ARCH-6** | Make things accessible and inclusive - Make sure your technology, infrastructure and systems are accessible and inclusive for all users. |
| **ARCH-7** | Be open and use open source - Publish your code and use open source software to improve transparency, flexibility and accountability. |
| **ARCH-8** | Make use of open standards - Build technology that uses open standards to ensure your technology works and communicates with other technology, and can easily be upgraded and expanded. |
| **ARCH-9** | Use cloud first - Consider using public cloud solutions first and prefer SaaS over PaaS over IaaS. |
| **ARCH-10** | Secure by design - Keep systems and data safe with the appropriate level of security. |
| **ARCH-12** | Make privacy integral - Make sure users rights are protected by integrating privacy as an essential part of your system. |
| **ARCH-13** | Share, reuse and collaborate - Avoid duplicating effort and unnecessary costs by collaborating across government and sharing and reusing technology, data, and services. |
| **ARCH-14** | Integrate and adapt technology - Your technology should work with existing technologies, processes and infrastructure in your organisation, and adapt to future demands. |
| **ARCH-15** | Make better use of data - Use data more effectively by improving your technology, infrastructure and processes. |
| **ARCH-16** | Meets the GDS Service Standard - If you’re building a service as part of your technology project or programme you will also need to meet the Service Standard. |
| **ARCH-17** | Infrastructure as Code - Build, Deployment, Infrastructure & Networking should utilise scripted automation for Infrastructure as Code and CI, CT, CD. |


### API principals

| Id   | Principal |Rationale|
|:-----:|:---------|:---------|
| **API-1** | Built on open standards and open data |
| **API-2** | No journey specific logic in the API |
| **API-3** | Robustness and performance as a feature. | 
| **API-4** | Secure by default. |
| **API-5** | Each API context should be individually deployable and scalable | 
| **API-6** | Documented using an Open documentation system, Open API for example. |


## Constraints

| Id        | Constraint |
|:---------:|:-----------|
| **CONS-1** | Deployed to AWS.
| **CONS-2** | Technology selection should be in-line with the ability to recruit these skills in the desired locales |
| **CONS-3** | Must be in-line with the [Government Technology Code of practice](https://www.gov.uk/government/publications/technology-code-of-practice/technology-code-of-practice) |
| **CONS-4** | Must support a spectrum of white-labelling solutions |
