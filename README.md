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

#### References
1. [Install LAMP on Amazon Linux 2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html)<br/>
2. [Install LAMP on Amazon Linux 2023](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2023.html) <br/>
