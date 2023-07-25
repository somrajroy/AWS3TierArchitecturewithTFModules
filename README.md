#### Setting up a Three-tier Architecture in AWS using Terraform using official AWS Terraform modules (LAMP stack). 
##### Introduction

Welcome to my blog post where I will be sharing my experience of creating a Three-tier architecture in AWS using Terraform and the LAMP stack. All using offcial AWS Terraform modules.  In this post, I will walk you through the steps I followed to set up the architecture and provide insights into the process. The project aimed to create a scalable, secure, and high-performing web application environment. <br/>
##### Project Overview

A Three-tier architecture is a widely adopted approach for building scalable web applications. It separates the application into three layers: presentation, application logic, and database. In our implementation, we utilized AWS services to create these layers and ensure scalability and high availability. <br/>

The Three-tier architecture consists of a Web tier, an Application tier, and a Database tier. The Web tier handles client requests and forwards them to the Application tier. The Application tier processes the requests and retrieves or updates data from the Database tier. We used Terraform and AWS to deploy and manage this architecture. <br/>

To build our three-tier architecture, we leveraged various AWS services. These included the use of official AWS Terraform modules for VPC (Virtual Private Cloud), RDS (Relational Database Service), security groups, and more. By utilizing these services, we were able to establish a secure and reliable infrastructure for our application.

##### Project Setup and Requirements
Before getting started, I needed to have the following prerequisites in place: 

- AWS account with necessary permissions <br/>
- Terraform installed on local machine <br/>
- AWS CLI configured with appropriate credentials <br/>

##### Architecture Design

Web Tier <br/>
The Web tier is responsible for handling client traffic. We deployed Amazon EC2 servers in a private subnet to host the web servers. It was accessible through an Application Load Balancer (ALB). <br/>

Application Tier <br/>
The Application tier consists of one or more EC2 instances deployed in a private subnet. We installed the necessary application components (e.g., PHP) on these instances.<br/>

Database Tier <br/>
The Database tier used Amazon RDS for MySQL. It was deployed in a private subnet to ensure security. <br/>

Terraform Configuration <br/>

Our Terraform configuration was organized into different modules for VPC, EC2, ALB, RDS, and security groups. We used official AWS Terraform modules to simplify the setup. <br/>
[Modularization in Terraform](https://developer.hashicorp.com/terraform/tutorials/modules/module) : This project is fully based on turn-key modules. The best part is that it can also be used to create opinionated modules very easily.Terraform modules are very useful, but they must add value. The value in a module, its opinions. If a module isn’t opinionated, then it isn’t adding value. Valuable modules are the ones that enforce policies and provide reusable building blocks. Customers should decide how things should be done and create a module to implement their own preferred approach. This project can serve as guide for the same.


##### Terraform
Terraform played a crucial role in the setup of the architecture. With Terraform's declarative syntax, we were able to define our infrastructure as code. We created configuration files that specified the desired state of our AWS resources, including VPC, RDS database, security groups, and more. Terraform then took care of provisioning and managing these resources in a repeatable and consistent manner. The Terraform modules are elaborated below.

 - terraform-aws-modules/vpc/aws : The terraform-aws-modules/vpc/aws module is designed to create a Virtual Private Cloud (VPC) in AWS. A VPC is a logically isolated section of the AWS cloud where you can launch resources, such as Amazon EC2 instances and RDS databases. This module abstracts the complexities of creating a VPC and provides a simple, reusable configuration. It provides a set of configurable options for creating a VPC, including the number of subnets, the IP address range, and the availability zones. The module also creates the necessary resources for the VPC, such as internet gateways, route tables, and security groups.
   - Features
     - Creation of public and private subnets across multiple Availability Zones (AZs).
     - Default configuration for internet and NAT gateways to enable public and private network access.
     - Customizable CIDR blocks for VPC and subnets.
     - Built-in tagging for resources to improve organization and management.
   - Advantages
     - Turn-key solution: The module simplifies the creation of a VPC by providing a pre-configured setup. Users can easily customize it based on their   
       requirements.
     - Reusability: Since the module is parameterized and allows for variable customization, you can use it across multiple projects without having to rewrite the  
       VPC setup code.
    - Disadvantages
     - Limited flexibility: While the module provides a lot of convenience, it might not cover every possible use case. Advanced users might find themselves 
       needing to customize it extensively.  


##### Deployment Process
1. We started by initializing the Terraform configuration and validating it.<br/>
2. We used `terraform apply` to create the resources based on our configuration. <br/>
3. Once deployed, we accessed the application through the ALB's DNS name. <br/>

##### Security Considerations

Security was a crucial aspect of our setup. We implemented the following security measures: <br/>

- Limited access to the Web tier via security groups and an ALB. <br/>
- Restricted direct access to the Application and Database tiers by placing them in private subnets. <br/>
- Used network ACLs to control traffic at the subnet level. <br/>
- Configured IAM roles and policies for EC2 instances to access other AWS services securely. <br/>

##### Best Practices
Here are some practices I followed during the project that could be helpful:

 - Terraform modules registry: The project leverages the [Official Terraform module registry](https://registry.terraform.io/) to find and apply pre-built modules to provide a turn-key solutions. Other than 
   this we can also use modules from the Terraform community.
 - Modules : A Terraform module is a way of creating a template of a cloud pattern, parameterizing, and reusing it.This project is built on modules to increase code 
   reusability and decrease code redundancy. Modules breaks down complex configurations into smaller configs for reusability and maintainability. It 
   streamlines the provisioning and management of infrastructure, resulting in more efficient and dependable operations.
 - Leverage Official Open Source Modules : We fully leveraged open source modules provided freely by Hashicorp. This helps the team to scale faster as every developer   
   is likely to be familiar with an open source module (unlike bespoke modules) resulting new staff enrolment to be quicker. Another big advantage is that development team 
   now can easily create opinionated modules from these open source modules which can serve a specific purpose (instead of starting from scratch). If they think these open 
   source modules to be too broad they can create in-house opinionated modules for specific use case to make them simpler to use and maintain.
 - Don’t Repeat Yourself (DRY) : One of the principles of software engineering is DRY (don’t repeat yourself). The same applies to IaC. In this project we applied 
   Modularization (official Terraform modules) to achieve DRY state.  
 - Variable : Used variables to customize infrastructure and avoid hardcoding values in the configuration file.
 - Remote state storage: The Terraform state files are stored in a remote location (AWS S3) to enable collaboration and ensure consistency.
 - This project uses proper naming conventions for resources to avoid naming conflicts.
 - Use version controls Git as single source of truth. We have stored Terraform configurations in a version control system (Github) to track changes and collaborate with 
   others.
 - Leverage terraform.tfvars files : We put everything that’s not a secret in tfvars files for all inputs and then put them in source control (Github). 

##### Conclusion

Setting up a Three-tier architecture in AWS using Terraform & LAMP stack was an insightful & rewarding experience.  The combination of these technologies allowed us to achieve scalability, security, and reliability for our web application. It allowed us to gain a deeper understanding of AWS services and infrastructure as code practices. I hope this blog post inspires others to explore this architecture and its benefits.

#### Appendix/References

Below are some additional resources and references for further learning: <br/>

1. [Install LAMP on Amazon Linux 2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html)<br/>
2. [Install LAMP on Amazon Linux 2023](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2023.html) <br/>
3. [Opinionated Terraform Best Practices and Anti-Patterns](https://www.hashicorp.com/resources/opinionated-terraform-best-practices-and-anti-patterns)<br/>
4. [Terraform Modules on AWS](https://www.hashicorp.com/blog/terraform-modules-on-aws)<br/>
5. [Terraform: Beyond the Basics with AWS](https://aws.amazon.com/blogs/apn/terraform-beyond-the-basics-with-aws/)<br/>
