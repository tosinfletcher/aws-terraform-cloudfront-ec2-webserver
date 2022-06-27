# aws-terraform-cloudfront-ec2-webserver

This following terraform IaaC is used to deploy a webserver that run and AWS EC2 Instance and sources it image from cloudfront.

Prerequisite:

1.    Ensure you have the following installed and configured

            1.  Terraform
            2.  AWS CLI
            3.  Pre-created EC2 keypair

USAGE:
 
2.  Initialize terraform
    
        terraform init

2.  Format terraform files
    
        terraform fmt
    
3.  Validate that the terraform files were configured correctly
    
        terraform validate

4.  Issue terraform plan to preview the infrastructure plan that will be deployed to AWS
    
        terraform plan

5.  Issue terraform apply to deploy the infrastructure to AWS
    
        terraform apply
    
6.  Configure the Static Website on the webserver

        * Edit the index.html located in the aws-terraform-cloudfront-ec2-webserver directory and add the cloudfront url and picture file from s3 to the image src. 
        * copy the copy the modified index.html
        * SSH into the EC2 instance
        * On the deployed webserver EC2 instance, type sudo vim /var/www/html/index.html
        * past the following and save :wq

7.  visit the website

        http://<ec2_instance_public_ip>/index.html
        
              
          

    
