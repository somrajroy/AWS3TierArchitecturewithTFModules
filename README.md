#### #Opensource Project to set up a Three-tier Architecture in AWS using Terraform & official AWS modules. 
##### Introduction

In this #opensource project we will be sharing the experience of creating a Three-tier architecture in AWS using Terraform ([LAMP stack](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html)). All AWS Infrastructure implementation was done using offcial AWS Terraform modules.  The project aimed to create a scalable, secure, and high-performing web application environment. <br/>
For Terraform users, the [Terraform Registry enables](https://registry.terraform.io/) the distribution of Terraform modules, which are reusable configurations. The Terraform Registry acts as a centralized repository for module sharing, making modules easier to discover and reuse. This project utilizes the offical Terraform modules<br/>

##### Overall learnings
- Terraform Automation: Experience the efficiency of infrastructure-as-code using Terraform. Rapidly deploy the complex Cloud architecture ease.<br/>
- Terraform structure and naming conventions & variable declarations <br/>
- Modular Flexibility: Discover the versatility of official AWS Terraform modules, enabling seamless customization and easy integration with specific needs.<br/>
- Clean code and reusable code in Terraform. Leveraged [official Terraform Modules](https://www.hashicorp.com/blog/terraform-modules-on-aws) instead of reinventing the wheel <br/>
- [Terraform remote state using AWS S3](https://developer.hashicorp.com/terraform/language/settings/backends/s3) and [state locking using Dynamodb](https://developer.hashicorp.com/terraform/language/settings/backends/configuration). To ensure the reliability and consistency of AWS infrastructure :- have implemented state storage in AWS S3 and DynamoDB. This provides with a secure and scalable mechanism for storing and retrieving critical state information.<br/>
- Terraform best Practices<br/>

##### Project Overview

A Three-tier architecture is a widely adopted approach for building scalable web applications. It separates the application into three layers: presentation, application logic, and database. In this project, we utilized AWS services to create these layers and ensure scalability and high availability. <br/>

To build our three-tier architecture, we leveraged various AWS services. These included the use of [official AWS Terraform modules](https://www.hashicorp.com/blog/terraform-modules-on-aws) for VPC (Virtual Private Cloud), ALB, ASG, RDS , security groups, and more. There are quite a few benefits & advantages to refer and use official Terraform modules (or open source modules). The value (benefits/advantages) can be passed on to customers & project teams. Some of them are :<br/>
    - **Rapid Deployment and Scalability** : The well-documented modules abstracts away all the complexity of setting AWS resources - customers can experience a  
      seamless and swift setup for their AWS architectures. The modules provide a standardized foundation, streamlining the deployment process and reducing the chances of 
      errors or inconsistencies.<br/>
    - **Modular approach & best practices for AWS Architecture** : By utilizing official AWS Terraform modules - the architecture benefits from tested and well-maintained 
       code that follows AWS best practices. These modules also allow different teams to work independently on specific parts of the system without interfering with each 
       other. <br/>
    - **Scalability & Learnings for the teams** : Modules in [official Terraform registry](https://registry.terraform.io/) are great since developers and customers 
       can now draw from the knowledge of the community that has already developed battle-tested modules. Moreover,  the “HashiCorp Verified Modules” means they are vetted 
       and actively maintained and gives extra confidence. These modules can also be easily extended & opinionated to build in-house modules (instead of starting from 
       scratch).Lastly, people from non-development background can also learn & work easily.<br/>
    - **Automation-first mindset**: By following a turn-key approach & leveraging pre-built official modules organizations can prioritze automating tasks wherever possible 
        thereby increasing efficiency throughout. These modules are designed to be used out of the box, with minimal configuration needed to match specific use case. 
        (where-ever required customers can easily create in-house modules because the official modules provide a very convenient starting point).<br/>
    - **Security-First approach/mindset**: By leveraging the official AWS Terraform modules, customers benefit from industry-standard security practices which AWS 
        recommends. <br/>
    - **Simplicity & consitency**: The official Terraform modules provide a significant level of convenience, pre-configuration & and consistent patterns for 
        infrastructure provisioning which helps accelerate the development and deployment process. <br/>
    -  **Cost optimization & benefits which can be passed to customers** : AWS Terraform modules are designed to leverage AWS services in an optimized manner.  Official 
        Terraform AWS modules helps reduce efforts and costs of implementation which can be passed to customers. Official modules are widely used and well-maintained, 
        they are tested and validated for functionality and compatibility, saving development costs and avoiding potential issues down the line. All these beneits can be 
        passed to customers<br/>
    
##### Project Setup and Requirements
- AWS account with necessary permissions <br/>
- [Terraform installed on local machine](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) <br/>
- [AWS CLI configured with appropriate credentials](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) <br/>
- Create a bucket in AWS S3 pass it to parameter `bucket` in file `backend.tf` <br/>
- Create a `Dynamodb` table with default values and `Partition key` as `LockID` and pass the table name to parameter `dynamodb_table` in file `backend.tf`<br/>
- Download/Clone the source code and run 'terraform init/p;an/validate/apply'

##### Architecture Diagram
Below is the sample architecture diagram.

![image](https://github.com/somrajroy/AWS3TierArchitecturewithTFModules/assets/92582005/e331b49b-5e6f-48ae-8fb2-a76a02adb450)
<br/>

##### Architecture Design

**Web Tier** <br/>
The Web tier is responsible for handling client traffic. We deployed Amazon EC2 servers in a private subnet to host the web servers. It was accessible through an Application Load Balancer (ALB). <br/>

**Application Tier** <br/>
The Application tier consists of one or more EC2 instances deployed in a private subnet. We installed the necessary application components (e.g., PHP) on these instances.<br/>

**Database Tier** <br/>
The Database tier used Amazon RDS for MySQL. It was deployed in a private subnet to ensure security. <br/>

**Terraform Configuration** <br/>

The Terraform configuration was organized into different modules for VPC, EC2, ALB, RDS, and security groups. [Official AWS Terraform modules are used](https://www.hashicorp.com/blog/terraform-modules-on-aws) to create the entire infrastructure. <br/><br/>
[Modularization](https://developer.hashicorp.com/terraform/tutorials/modules/module) : This project is fully based on near turn-key modules. The best part is that it can also be used to [create opinionated modules very easily because these modules gives a very convinient starting point](https://www.hashicorp.com/resources/opinionated-terraform-best-practices-and-anti-patterns). Valuable modules are the ones that are configurable and provide reusable building blocks. Customers should decide how things should be done and create a module to implement their own preferred approach. This project can serve as guide for the same.<br/>

With Terraform's declarative syntax, we were able to define our infrastructure as code. We created configuration files that specified the desired state of our AWS resources, including VPC, RDS database, security groups, and more. Terraform then took care of provisioning and managing these resources in a repeatable and consistent manner. The Terraform modules are elaborated below with benefits.

 - **terraform-aws-modules/vpc/aws** : The terraform-aws-modules/vpc/aws module is designed to create a Virtual Private Cloud (VPC) in AWS. A VPC is a logically isolated section of the AWS cloud where you can launch resources, such as Amazon EC2 instances and RDS databases. This module abstracts the complexities of creating a VPC and provides a simple, reusable configuration. It provides a set of configurable options for creating a VPC, including the number of subnets, the IP address range, and the availability zones. The module also creates the necessary resources for the VPC, such as internet gateways, route tables, and security groups.
   - **Features**
     - Creation of public and private subnets across multiple Availability Zones (AZs).
     - Default configuration for internet and NAT gateways to enable public and private network access.
     - Customizable CIDR blocks for VPC and subnets.
     - Built-in tagging for resources to improve organization and management.
   - **Advantages**
     - Turn-key solution: The module simplifies the creation of a VPC by providing a pre-configured setup. Users can easily customize it based on their   
       requirements.
     - Reusability: Since the module is parameterized and allows for variable customization, you can use it across multiple projects without having to rewrite 
       the VPC setup code.
    - **Disadvantages**
     - Limited flexibility: While the module provides a lot of convenience, it might not cover every possible use case. Advanced users might find themselves 
       needing to customize it extensively. But this gets offset as developers can download and create in-house module for specific use case.
    - **Learning**
      - Understanding of AWS VPC architecture and subnets.
      - Familiarity with networking concepts like CIDR blocks, routing, and gateways.
      - Module Creation: By studying the terraform-aws-modules/vpc/aws module, one can learn how to create your own Terraform modules. This can be 
        valuable when one needs to abstract and reuse common infrastructure patterns in own projects.
      - Module Composition: The module can serve as an example of how to compose multiple Terraform modules together to create a complete infrastructure setup. 
        Understanding module composition can help build complex infrastructure setups with ease.
      - Best Practices: By examining the module's code and documentation, one can learn about best practices for provisioning VPCs on AWS using Terraform. This 
        includes considerations such as naming conventions, security configurations, and modularization techniques.
      - In summary The terraform-aws-modules/vpc/aws module is a turn-key solution for provisioning VPCs on AWS using Terraform. It offers simplicity, 
        consistency, and customizability, but may have some limitations in terms of flexibility and reliance on external maintenance. Studying this module can 
        provide valuable insights into module creation, composition, and best practices for infrastructure provisioning on AWS.
      
       
  - Module **terraform-aws-modules/rds/aws** : The terraform-aws-modules/rds/aws module simplifies the creation of Amazon RDS (Relational Database Service) instances 
    in AWS. The module allows you to configure essential RDS elements, including database type, size, storage, and backup settings.

     - **Advantages**
     - Turn-key solution: The module abstracts the complexities of setting up an RDS instance, making it easy for customers to deploy and manage databases.
     - Consistency: Using this module ensures that RDS instances are consistently deployed across different environments.
     - Simplified RDS setup: The module handles the complexity of creating an RDS instance, including the configuration of necessary resources such as security  
       groups and subnet groups.
      - Modularity: The module follows a modular approach, allowing developers to reuse and customize specific components of the RDS setup according to specific
        requirements.
     - Standardization: The module adheres to best practices and provides a standardized configuration for creating RDS instances, ensuring consistency across 
       different projects and environments.
     - Cost optimization: The module includes options to configure auto-scaling, backup retention, and other cost-saving features, enabling clients to optimize 
       RDS expenses.
     - Security and Compliance: The module includes features such as security group configurations and subnet groups, helping customers to implement security and 
       compliance measures for RDS instances.
    - **Disadvantages**
     - Limited customization: While the module covers common RDS use cases, it might not cater to highly specialized database configurations.
     - Cost implications: Managed services like RDS come with additional costs compared to self-hosted databases on EC2 instances.

    - **Learning**
      - Module Composition: By studying the structure of the terraform-aws-modules/rds/aws module, one can learn how to compose different Terraform modules 
        together to create a complete RDS infrastructure setup. This understanding can be applied to building more complex infrastructure configurations.
      - Understanding of database concepts like instance size, storage, and backups.
      - Understanding of RDS features, such as multi-AZ deployments and parameter groups.
      - Best Practices: The module can serve as a reference for implementing best practices when provisioning RDS instances on AWS. By examining the module's 
        code and documentation, one can learn about security configurations, parameter groups, backup strategies, and other recommended practices for managing 
        RDS instances.
     
    - Module **terraform-aws-modules/security-group/aws** : The terraform-aws-modules/security-group/aws module simplifies the creation and management of AWS 
      Security Groups. It provides a variety of features and options for configuring security group rules, allowing to define ingress and egress traffic 
      permissions for AWS Infra resources.
    - **Features**
      - Flexible Rule Configuration: The module supports various ways to configure ingress and egress rules, including specifying individual ports, port ranges, 
        CIDR blocks, security group IDs, and more. This flexibility allows to define custom security group rules tailored to specific needs and use case(s).
      - Named Groups of Rules: The module includes pre-defined named groups of rules for common scenarios, such as SSH, HTTP (port 80), MySQL, and more. These 
        named groups provide a convenient way to quickly set up commonly used security group rules.

##### Deployment Process
1. Once deployed, we accessed the application through the ALB's DNS name. <br/>
2. To access the admin page we navigated to < < ALB DNS > >/phpinfo.php

##### Best Practices
Other than what mentioned earlier - below are some practices followed during the project :

 - Terraform modules registry: The project leverages the [Official Terraform module registry](https://registry.terraform.io/) to find and apply pre-built modules to 
   provide a turn-key solutions. Other than this we can also use modules from the Terraform community. Open-source modules saves time, improves security, and give greater 
   confidence in project infrastructure. Importantly these reusable modules encourage best practices
 - [Modules](https://developer.hashicorp.com/terraform/language/modules/develop#standard-module-structure) : A Terraform module is a way of creating a template of a cloud 
   pattern, parameterizing, and reusing it.This project is built on modules to increase code 
   reusability and decrease code redundancy. Modules breaks down complex configurations into smaller configs for reusability and maintainability. It 
   streamlines the provisioning and management of infrastructure, resulting in more efficient and dependable operations.
 - Leverage Official Open Source Modules : We fully leveraged open source modules provided freely by Hashicorp. This helps the team to scale faster as every developer   
   is likely to be familiar with an open source module (unlike bespoke modules) resulting new staff enrolment to be quicker. Another big advantage is that development team 
   now can easily create opinionated modules from these open source modules which can serve a specific purpose (instead of starting from scratch). If they think these open 
   source modules to be too broad they can create in-house opinionated modules for specific use case. Open-source modules are highly configurable & easy to make more 
   configurable.
 - Don’t Repeat Yourself (DRY) : One of the principles of software engineering is DRY (don’t repeat yourself). The same applies to IaC. In this project we 
   applied Modularization (official Terraform modules) to achieve DRY state.  
 - Remote state storage: The Terraform state files are stored in a remote location (AWS S3) to enable collaboration and ensure consistency.
 - This project uses proper naming conventions for resources to avoid naming conflicts.
 - Use version controls Git as single source of truth. We have stored Terraform configurations in a version control system (Github) to track changes and collaborate with 
   others.
 - Leverage variables.tf & terraform.tfvars files : Used variables to customize infrastructure and avoid hardcoding values in the configuration file. The naming 
   conventions were also consistent as official terraform modules were used. Variable.tf and terraform.tfvars files are excellent for externalizing 
   configurations and passing values so they can be easily deployed across multiple environments. Everything that’s not a secret was put in tfvars files for all 
   inputs and then put them in source control (Github). <br/>

##### Conclusion

Setting up a Three-tier architecture in AWS using Terraform & LAMP stack was an insightful & rewarding experience.  The combination of these technologies allowed us to achieve scalability, security, and reliability for our web application. It allowed us to gain a deeper understanding of AWS services and infrastructure as code practices. I hope this blog post inspires others to explore this architecture and its benefits.

#### Appendix/References

Below are some additional resources and references for further learning: <br/>

1. [Opinionated Terraform Best Practices and Anti-Patterns](https://www.hashicorp.com/resources/opinionated-terraform-best-practices-and-anti-patterns)<br/>
2. [Terraform Modules on AWS](https://www.hashicorp.com/blog/terraform-modules-on-aws)<br/>
3. [Terraform: Beyond the Basics with AWS](https://aws.amazon.com/blogs/apn/terraform-beyond-the-basics-with-aws/)<br/>
4. [Module Creation - Recommended Pattern](https://developer.hashicorp.com/terraform/tutorials/modules/pattern-module-creation)<br/>
5. [Best practices for using Terraform - from Google](https://cloud.google.com/docs/terraform/best-practices-for-terraform)<br/>
6. [Terraform best Practices - Anton Babenko](https://www.terraform-best-practices.com/)<br/>
