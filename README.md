#### Setting up a Three-tier Architecture in AWS using Terraform using official AWS Terraform modules (LAMP stack). 
##### Introduction
In this blog post, I will share my experience of setting up a Three-tier architecture in AWS using Terraform. All using offcial AWS Terraform modules. The project aimed to create a scalable, secure, and high-performing web application environment. <br/>
##### Project Overview
The Three-tier architecture consists of a Web tier, an Application tier, and a Database tier. The Web tier handles client requests and forwards them to the Application tier. The Application tier processes the requests and retrieves or updates data from the Database tier. We used Terraform and AWS to deploy and manage this architecture. <br/>

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

##### Conclusion

Setting up a Three-tier architecture in AWS using Terraform was an insightful experience. It allowed us to gain a deeper understanding of AWS services and infrastructure as code practices. I hope this blog post inspires others to explore this architecture and its benefits.

#### Appendix/References

Below are some additional resources and references for further learning: <br/>

1. [Install LAMP on Amazon Linux 2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html)<br/>
2. [Install LAMP on Amazon Linux 2023](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2023.html) <br/>
