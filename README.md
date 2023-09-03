### #Opensource Project to set up a Three-tier Architecture in AWS using Terraform & official AWS modules. 
### _Introduction & Purpose_

In this advanced Terraform `#opensource` project we will go through the experience of creating a `Complex Three-tier Cloud architecture (AWS) using Terraform` ([LAMP stack](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html)) and best practices to follow in any Terraform project. All AWS Infrastructure implementation was done using offcial AWS Terraform modules.  The project aimed to create a scalable, secure, and high-performing web application environment with real-world best practices & realistic patterns. <br/><br/>

This blog post is intended to help people at all levels and roles. I have applied many of these techniques/strategies in real-time projects & have witnessed first-hand the positive impact they can have on project outcomes. The is a `comprehensive & prescriptive guide` to effectively using Terraform to create a complex Cloud Architectures. Everything is `#opensource` so feel free to leverage. `It is written to help people at all levels and roles, from junior developers to CxOs`, to learn about best practices and ways to effectively use Terraform/IaC in a Digital Transformation journey. By offering advanced content while also catering to newcomers, this blog caters to a wide range of audiences. `There are lot of curated free resources mentioned. The inclusion of these resources can greatly enhance the learning experience for everyone.`<br/>

  * This blog would serve as a valuable resource/guide for `architects and project managers` looking to impress existing customers with their knowledge of IaC, automation-first and
    security-first approaches. They can leverage the blog insights to supercharge their projects and client engagements. <br/>
  * The objective insights and real-world best practices mentioned in the blog can also be put in proposals/RFP's. `The automation-first, security-first approach will elevate 
     the proposals` and create a positive enviornment. <br/>
  * `For developers, it's playground` — a chance to the download code, experiment, and master Terraform. Explore the free, top-quality resources in the `Appendix/References section`, 
     including expert YouTube courses.<br/>

To summarize - this blog is a prescriptive guidance for anyone working (or going to start working) in Terraform projects & wants efficient infrastructure management. <br/>

### _Overall learnings_
-  `Strategy/Techniques/guidelines` and best practices which can be followed in a Terraform/IaC projects.
- `Terraform Automation, efficient resource management & predictable infrastructure`: Experience the efficiency of infrastructure-as-code using Terraform. 
   Rapidly deploy the complex Cloud architectures with ease. One of the key benefits of Terraform is its idempotency, which ensures that infrastructure 
   deployments are consistent, predictable, and efficient. This also reduces operational risk, making it an ideal choice for production environments.<br/>
- `Infrastructure as Code (IaC)`: Leveraging Terraform, we treat infrastructure as code. This means that changes to infrastructure are versioned, tested, 
   and deployed in a controlled and predictable manner, mirroring best practices from the world of software development.  Idempotency is a core principle of 
   IaC. It allows developers to declare the desired infrastructure state in code and Terraform ensures that it converges to that state, regardless of the current 
   state of the resources.<br/>
- `Modular Flexibility`: Understand the efficiency & productivity of Terraform modules, enabling seamless customization and easy integration with 
  specific needs. The DRY and KISS principles incorporated in the official AWS Terraform modules contribute to modular design and consistent approach. With 
  reusable building blocks, development teams can create complex cloud infrastructures while maintaining a clean, uncluttered codebase.<br/>
- `Handling sensitive data in Terraform modules like secret key, access key and passwords` : I have shared one of the best ways to handle secrets by leveraging `.gitignore`<br/> 
- [Terraform remote state using AWS S3](https://developer.hashicorp.com/terraform/language/settings/backends/s3) and [state locking using Dynamodb](https://developer.hashicorp.com/terraform/language/settings/backends/configuration). To ensure the reliability and consistency of AWS infrastructure :- have implemented state storage in AWS S3 and DynamoDB. This provides with a secure and scalable mechanism for storing and retrieving critical state information.<br/>
- `DRY and KISS principles of software development` : The official AWS Terraform modules in the Terraform Registry adhere to the DRY principle, promoting code 
   reusability and minimizing duplication enabling development teams to avoid repetition and consolidate their infrastructure codebase efficiently. When the 
   codebase is DRY then its easier to maintain and scale. The modules also adhere to KISS principles (systems work best if they are kept simple rather than 
   complicated). Simplicity and elegance are core of the official AWS Terraform modules.  The modules encapsulate complex AWS resource configurations into 
   easy-to-use interfaces, where users only need to provide a few inputs to create or manage an AWS resource. These principles (DRY & KISS) are widely used in 
   the software development and are effective in improving code quality and reducing errors.  <br/>
- `Terraform best Practices, software development best practices` : The official AWS Terraform modules are developed and maintained by the AWS 
   team, ensuring that they follow best practices and are regularly updated to incorporate new features and improvements. By leveraging these modules, everyone 
   can benefit from the  expertise of the AWS team and the wider Terraform community. The approach can help deliver high-quality solutions to customers that are 
   easy to maintain and scale over time. <br/>
- `Standardization` : The official AWS Terraform modules follow standardized practices and conventions, ensuring that infrastructure deployments adhere to 
   best practices and are consistent with industry standards. All AWS-recommended configurations & good practices are inherited. This standardization ensures 
   that infrastructure follows AWS-recommended guidelines.<br/>
-  `Immutable & mutable Infrastructure`: [Terraform is considered as an immutable infrastructure as code technology](https://www.hashicorp.com/resources/what-is-mutable-vs-immutable-infrastructure). For those who are unaware, immutable infrastructure is the concept of never performing updates in place. An immutable infrastructure never changes after its deployment. If an update occurs, it takes place by tearing down the old infrastructure (such as a server). It's the idea that once an infrastructure component is provisioned, it remains unchanged throughout its lifecycle. Any updates or changes result in the creation of a completely new instance. This approach can help to improve security, reliability, and cost-efficiency and is considered a key driver of stability and resilience in cloud environments. By contrast, with mutable infrastructure, existing resources are allowed to persist through inplace updates or patches instead of resources being deleted and re-created. It is an approach to infrastructure management where infrastructure resources can be modified after they have been created. This approach can be more flexible, but it can also be more difficult to manage and secure.<br/>

### _Project Overview_

A Three-tier architecture is a widely adopted approach for building scalable web applications. It separates the application into three layers: presentation, application logic, and database. In this project, we utilized AWS services to create these layers and ensure scalability and high availability. <br/>

To build our three-tier architecture, we leveraged various AWS services. These included the use of [official AWS Terraform modules](https://www.hashicorp.com/blog/terraform-modules-on-aws) for VPC (Virtual Private Cloud), ALB, ASG, RDS , security groups, and more. There are quite a few benefits & advantages to refer and use official Terraform modules (or open source modules). The value (benefits/advantages) can be passed on to customers & project teams. Some of them are :<br/>
    - `Rapid Deployment and Scalability` : The well-documented modules abstracts away all the complexity of setting AWS resources - customers can experience a  
      seamless and swift setup for their AWS architectures. The modules provide a standardized foundation, streamlining the deployment process and reducing the 
      chances of errors or inconsistencies.<br/>
    - `Modular approach & best practices for AWS Architecture` : By utilizing official AWS Terraform modules - the architecture benefits from tested and well- 
       maintained code that follows AWS best practices. These modules also allow different teams to work independently on specific parts of the system without   
       interfering with each other. We have the benefit of using battle-tested, production-hardened code without having to write it ourselves (we can modify it 
       as required to build in-house modules very easily).<br/>
    - `Scalability & Learnings for the teams` : Modules in [official Terraform registry](https://registry.terraform.io/) are great since developers and customers 
       can now draw from the knowledge of the community that has already developed battle-tested modules. Moreover,  the “HashiCorp Verified Modules” means they 
       are vetted and actively maintained and gives extra confidence. These modules can also be easily extended & opinionated to build in-house modules (instead 
       of starting from scratch).Lastly, people from non-development background can also learn & work easily. They don’t need to know how a module works (or 
       complex programming) to be able to use a module; they just have to know how to set inputs and outputs. <br/>
    - `Automation-first mindset`: By following a turn-key approach & leveraging pre-built official modules organizations can prioritze automating tasks wherever 
       possible thereby increasing efficiency throughout. These modules are designed to be used out of the box, with minimal configuration needed to match 
       specific use case. (where-ever required customers can easily create in-house modules because the official modules provide a very convenient starting 
       point). This automation-first approach improves efficiency and accelerates the deployment process and enables customers to provision and manage 
       infrastructure resources in a consistent and repeatable manner. These modules & their associated practices embody the essential principles of automation-first mindset (efficiency, speed, consistency, scalability and reliability).<br/>
    - `Security-First approach/mindset`: By leveraging the official AWS Terraform modules, customers benefit from industry-standard security practices which AWS 
        recommends. The official AWS Terraform modules are designed with security/compliance in mind, providing a foundation that incorporates security best 
        practices. This ensures that the infrastructure is secure from the ground up, reducing the risk of security vulnerabilities or breaches. Additionally, 
        referencing/using the official modules ensures that developers are using the most up-to-date security features and configurations.<br/>
    - `Simplicity & consitency`: The official Terraform modules provide a significant level of convenience, pre-configuration & and consistent patterns for 
        infrastructure provisioning which helps accelerate the development and deployment process. <br/>
    - `Documentation and versioning` : these remote modules are very well documented and versioned. Anyone new can easily scale up & be productive at the 
       earliest.<br/>
    -  `Cost optimization & benefits which can be passed to customers` : AWS Terraform modules are designed to leverage AWS services in an optimized manner.
        Official Terraform AWS modules helps reduce efforts and costs of implementation which can be passed to customers. We can save a lot of time by using 
        these open source modules instead of writing comparable code ourselves; all it takes is learning how to use the module interface. Official modules are 
        widely used and well-maintained, they are tested and validated for functionality and compatibility, saving development costs and avoiding potential 
        issues down the line. All these benefits can be passed to customers.<br/>
    - `Community Validation & support` : The official modules have undergone extensive review and testing by the Terraform community benefiting from the 
       collective expertise. This community-driven validation helps to identify and address potential issues, ensuring that the modules are reliable, well- 
       documented, and follow programming/software development best practices. <br/>
    -  `Maintenance and Continuous Improvement`: Official modules are well-maintained and updated by the creators/experts incorporating new features & standards. 
        This ensures that customers gets benefited & stays up-to-date with the latest AWS features, industry standards, best practices and enhancements.<br/>
    
### _Project Setup and Prerequisites_
- AWS account with necessary permissions <br/>
- [Terraform installed on local machine](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) <br/>
- [AWS CLI configured with appropriate credentials](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) <br/>
- Create a bucket in AWS S3 pass it to parameter `bucket` in file `backend.tf` <br/>
- Create a `Dynamodb` table with default values and `Partition key` as `LockID` and pass the table name to parameter `dynamodb_table` in file `backend.tf`<br/>
- Please verify and update the AMI id in `terraform.tfvars` file. AWS changes the value frequently. So please go to EC2 console and check the AMI for `Amazon Linux 2` for 
  the region you choose and update the value. In demo the region is `us-west-2` and the AMI is for `Amazon Linux 2` as of today.<br/>
- Download/Clone the source code and run 'terraform init/plan/validate/apply'

### _Architecture Diagram_
Below is the sample architecture diagram.

![image](https://github.com/somrajroy/AWS3TierArchitecturewithTFModules/assets/92582005/e331b49b-5e6f-48ae-8fb2-a76a02adb450)
<br/>

**Terraform Configuration** <br/>

The Terraform configuration was organized into different modules for VPC, EC2, ALB, RDS, and security groups. [Official AWS Terraform modules are used](https://www.hashicorp.com/blog/terraform-modules-on-aws) to create the entire infrastructure. <br/><br/>
[Modularization](https://developer.hashicorp.com/terraform/tutorials/modules/module) : This project is fully based on near turn-key modules. The best part is that it can also be used to [create opinionated modules very easily because these modules gives a very convinient starting point](https://www.hashicorp.com/resources/opinionated-terraform-best-practices-and-anti-patterns). Valuable modules are the ones that are configurable and provide reusable building blocks. Customers should decide how things should be done and create a module to implement their own preferred approach. This project can serve as guide for the same.<br/>

One last point - The modules used in the code are owned by AWS so I have `version-locked` them to ensure compatibility when the code is run.  In most cases developers will download the module for reusability across multiple project(s) <br/>

**Handling sensitive data in Terraform modules** <br/><br/>
It is never a good practice to store sensitive information, such as access keys and passwords, in Terraform configuration files, where they could easily be exposed and shared into different configuration plans than they were intended for. Instead, a good practice is to create a file named `secrets.tfvars` to hold sensitive data, and place it in the root module folder in the top-level directory. This file should never be tracked in Git. Put the `secrets.tfvars` in `.gitignore` file. Declare two variables `secret_key` and `access_key` in variables.tf file and then assign `secret_key` and `access_key` values in `secrets.tfvars` file. Once done then run the commands `terraform plan -var-file="secrets.tfvars" -var-file="terraform.tfvars"` and `terraform apply -var-file="secrets.tfvars" -var-file="terraform.tfvars" -auto-approve`.<br/>

![image](https://github.com/somrajroy/AWS3TierArchitecturewithTFModules/assets/92582005/08c74328-9086-48fe-b358-8c7f510a7396) <br/>
![image](https://github.com/somrajroy/AWS3TierArchitecturewithTFModules/assets/92582005/c4b2781f-1ca5-4328-b061-5c22542f12dc) <br/>


**Module Documentation**: The official Terraform modules have been developed and tested by experts, which ensures that they follow all the best practices and are secure by design. By leveraging these modules, we can ensure that our Cloud Infrastructure is efficient, reliable & secure from the ground up. This approach aligns with an automation-first and security-first mindset as mentioned above, and helps deliver high-quality solutions to customers. The modules used are available at the links below. You can also get the entire code in Github mentioned in the links. <br/> <br/>
 - Module `terraform-aws-modules/vpc/aws` : The [terraform-aws-modules/vpc/aws module](https://registry.terraform.io/modules/terraform-aws- 
   modules/vpc/aws/latest) is designed to create a Virtual Private Cloud (VPC) in AWS. This module abstracts the complexities of creating a VPC and provides a 
   simple, reusable configuration. It provides a set of configurable options for creating a VPC, including the number of subnets, the IP address range, and the 
   availability zones. The module also creates the necessary resources for the VPC, such as internet gateways, route tables, and security groups.

- Module `terraform-aws-modules/rds/aws` : [The RDS module simplifies](https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/latest) the creation 
  of Amazon RDS (Relational Database Service) instances in AWS. The module allows us to configure essential RDS elements, including database type, size, 
  storage, and backup settings.
     
 - Module `terraform-aws-modules/security-group/aws` : [This Security Group module](https://registry.terraform.io/modules/terraform-aws-modules/security- 
   group/aws/latest) simplifies the creation and management of AWS Security Groups. It provides a variety of features and options for configuring security group 
   rules, allowing to define ingress and egress traffic permissions for AWS Infra resources.
   
 - Module `terraform-aws-modules/alb/aws` : [This module creates the AWS Application Load Balancer](https://registry.terraform.io/modules/terraform-aws- 
   modules/alb/aws/latest) Terraform configuration.

 - Module `terraform-aws-modules/autoscaling/aws` : [This Terraform module creates Auto Scaling resources on AWS](https://registry.terraform.io/modules/terraform-aws-modules/autoscaling/aws/latest)

### _Deployment Process_
1. Once deployed, we accessed the application through the ALB's DNS name. <br/>
2. To access the admin page we navigated to < < ALB DNS > >/phpinfo.php

### _Best Practices_
Other than what mentioned earlier - below are some practices followed during the project :

 - [Modularization to reduce technical debt](https://developer.hashicorp.com/terraform/language/modules/develop#standard-module-structure) : The code is clean 
   and concise because we leveraged modules. In real-world you should download the modules and customize it and use it as per needs. A Terraform module 
   is a way of creating a template of a cloud pattern, parameterizing, and reusing it. They are useful tools for promoting software abstraction and code reuse. 
   Input variables (or Terraform variables, or just variables) are user-supplied values that parametrize Terraform modules without altering the source code. This 
   project is built on modules to increase code reusability and decrease code redundancy. Modules breaks down complex configurations into smaller configs for 
   reusability and maintainability. It streamlines the provisioning and management of infrastructure, resulting in more efficient and dependable operations. 
   Using Terraform modules reduces technical debt significantly. By using Terraform modules, one can create reusable, modular code that can be easily shared and 
   maintained across the organization. This helps reduce the amount of technical debt that accumulates over time, since we can avoid duplicating code and 
   creating custom solutions for every project. Overall, by leveraging Terraform modules, one can create high-quality infrastructure code that is easy to 
   maintain and scale over time. <br/>
 - `Remote state storage`: The Terraform state files are stored in a remote location (AWS S3) to enable collaboration and ensure consistency.
 - `Use version controls Git as single source of truth`. <br/>
 - `Leverage variables.tf & terraform.tfvars files` : Used variables to customize infrastructure & avoid hardcoding values in the configuration file. These files 
    are excellent for externalizing configurations and passing values so they can be easily deployed across multiple environments. 

### _Guidelines/strategies/approaches while working with Terraform and Infrastructure as Code._
When working with Terraform and IaC, there are several strategies/techniques and best practices that can help manage infrastructure effectively. Here are some  points which can be considered. However the key to effectively using Terraform and IaC is not just about writing the code but also about managing it properly. By following the below practices, customers can ensure a well-structured, standardized, and efficient Terraform infrastructure management process. <br/><br/>
    * `Solid Foundation`: Before diving into Terraform, take the time to understand the basics of Infrastructure as Code (IaC). Get familiarized with the 
      principles and benefits of IaC to ensure a smooth transition to Terraform.<br/>
    * `Clear Objective, plan and design` : Invest time planning and designing the infrastructure. A well-thought-out architecture is the foundation of a 
      successful Terraform project. Take into account all the requirements & NFR's, desired architecture, and scalability needs. This will help create a 
      well-structured and maintainable Terraform configuration. <br/>
    * `Version Control`: Treat infrastructure code like any other software project.<br/>
    * `Leverage Official Modules`: Official Terraform modules from AWS and other providers are best friends. They follow best practices, are well- 
       maintained, and simplify resource provisioning. This can make your team `auto-didactic` which can lead to huge cost savings & high quality delivery.<br/>
    * `Automation-First Mindset`: Make automation a priority to reduce manual tasks and minimize errors.<br/>
    * `Security-First Approach`: Security should be at the core of IaC.<br/>
    * `Modularize and Reuse` : This not only makes code more organized & manageable but also promotes reusability across different projects. <br/>
    * `Leverage Variables and Data Sources` to make configurations flexible and dynamic. <br/>
    * `Continuous Integration and Deployment`: This streamlines the process, reduces human error, and allows for faster iteration and scaling.<br/>
    * `Documentation`: Document the code, processes and configurations thoroughly (bespoke developments). This helps with troubleshooting, knowledge sharing, and 
       onboarding new team members.<br/>
    * `Test & validate`:Test Terraform code thoroughly. Running terraform plan is the easiest way to verify if your changes will work as 
       expected. Tools like TFLint are also very useful. <br/>
    * When working with `Terraform and IaC`, it's important to understand the benefits of `immutability` and when to consider adopting an immutable 
      infrastructure approach. <br/>

### _Immutable vs Mutable Infrastructure : Points to consider_
The correct approach to infrastructure management will depend on the specific needs of the organization. However, immutable infrastructure is often preferred for production environments where security and reliability are critical. Terraform itself does not inherently make infrastructure immutable or mutable; it's a tool that allows to define, provision and manage infrastructure as code (IaC). Knowing when to consider immutable infrastructure can be difficult, and there is no one clearly defined cutoff or inflection point. It's always important to consider the specific use cases, workloads, needs and constraints of project when deciding on a  strategy. Below points can be considered :
Immutable infrastructure can be a good choice for organizations that need to:
   * Increase reliability <br/>
   * Cost-efficiency: Immutable infrastructure can help to reduce costs by eliminating the need to patch & update infrastructure resources. This is because 
     each resource is replaced when it needs to be updated, rather than being patched in place. However sometimes resource churn can increase operational 
     overhead/concerns <br/>
   * Complex systems & need for Simplify operations : Immutability is the Answer to Complexity. Complex systems often benefit from the predictability of       
     immutable infrastructure. <br/>
   * Frequent Updates (dynamic vs static) : In environments with frequent updates and changes, immutability simplifies maintenance and ensures each change 
     results in a fresh, validated resource. For simpler, less dynamic environments where updates and changes are infrequent, mutable infrastructure may be more 
     practical.<br/>
   * Security-First Environments/ Improve security: For security-conscious environments, immutability facilitates quick response to vulnerabilities by replacing 
     resources with patched versions.
   * Resource Churn: Frequent replacement of resources can lead to resource churn and increased operational overhead.<br/>
   * Data Management: Immutable infrastructure can be challenging when dealing with stateful data, requiring proper planning for data persistence and 
     migration.For immutable infrastructure to be effective, data must be externalized. This could mean storing data on an external shared database, or on 
     software-defined storage.<br/>
   * Stateful Workloads: In scenarios with stateful workloads or data-intensive applications, managing resources in place may be more efficient.(mutable infra)<br/>
   * Immutable infrastructure is good choice when the system heavily relies on technologies that provide rapid and cheap provisioning of architectural 
     components. This approach is particularly beneficial in cloud computing environments. <br/>
   * Maturity needed: Implementing immutable infrastructure requires a high degree of maturity in customers business processes and network, server, and storage 
     resources.<br/>
   * Mutable infrastructure is a viable choice when it is expensive to replace servers, and there's a need to keep the servers in operation with minimal 
     downtime. This is common with physical servers and traditional server-based infrastructure or stateful workloads. <br/>
   * Hybrid Approaches: In some cases, a hybrid approach may be suitable, combining both mutable and immutable strategies as needed.<br/>
   * In conclusion, the choice between mutable and immutable infrastructure depends on multiple factors like the nature of servers (i.e., physical or 
     virtual), ability to manage data externally, cost, and the maturity level of business processes etc.. Both approaches have their pros and cons. The 
     general rule is, if customer frequently depend on cloud computing and virtual servers, an immutable infrastructure mostly would be good. However, if there 
     are physical servers where the cost of replacing a server is very high, a mutable infrastructure might be more suitable. <br/>

### _Conclusion_

Setting up a Three-tier architecture in AWS using Terraform & LAMP stack was an insightful & rewarding experience.  The combination of these technologies allowed us to achieve scalability, security, and reliability for our web application. It allowed us to gain a deeper understanding of AWS services and infrastructure as code practices. I hope this blog post inspires others to explore this architecture and its benefits.

### _Appendix/References_

Below are some additional resources and references for further learning: <br/>

1. [Opinionated Terraform Best Practices and Anti-Patterns](https://www.hashicorp.com/resources/opinionated-terraform-best-practices-and-anti-patterns)<br/>
2. [Terraform Modules on AWS](https://www.hashicorp.com/blog/terraform-modules-on-aws)<br/>
3. [Terraform: Beyond the Basics with AWS](https://aws.amazon.com/blogs/apn/terraform-beyond-the-basics-with-aws/)<br/>
4. [Module Creation - Recommended Pattern](https://developer.hashicorp.com/terraform/tutorials/modules/pattern-module-creation)<br/>
5. [Best practices for using Terraform - from Google](https://cloud.google.com/docs/terraform/best-practices-for-terraform)<br/>
6. [Terraform best Practices - Anton Babenko](https://www.terraform-best-practices.com/)<br/>
7. [Official Hasicorp Terraform hands-on tutorials](https://developer.hashicorp.com/terraform/tutorials)<br/>
8. [HashiCorp Terraform Associate Certification Course (003) - Pass the Exam](https://www.youtube.com/watch?v=SPcwo0Gq9T8)<br/>
9. [HashiCorp Terraform Associate Certification Course - Pass the Exam!](https://www.youtube.com/watch?v=V4waklkBC38)<br/>
