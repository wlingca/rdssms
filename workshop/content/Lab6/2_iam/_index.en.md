+++
title = "Identity & Access Management (5 mins)"
date = 2020-06-07T10:02:34-04:00
weight = 20
pre = "<b>5.2 </b>"
+++

{{% notice info %}}
With IAM policies actions can be allowed or denied at DB Instance level, a good example would be controlling who can start\stop the instance. For RDS SQL Server, IAM policies do not control who can Login to the instance.
{{% /notice %}}

#### Create Policy

* Open [IAM service console](https://console.aws.amazon.com/iam/home) or go to services and select IAM from list of services.

* From left pane click on **Policies** and then click on `Create policy`.
{{% img "iamad_1.png" IAM_AD%}}

* Click on `JSON` tab, delete the existing content and replace with the following script, then click on `Review policy`. This script defines a policy that denies **Describing the Listing of DB Access** to all RDS resources. 

        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Sid": "VisualEditor0",
                    "Effect": "Deny",
                    "Action": "rds:DescribeDBInstances",
                    "Resource": "*"
                }
            ]
        }
{{% img "iamad_2.png" IAM_AD%}}

* In the **Create policy** page enter the details as below:

     **Name**: `RDS-Deny-Describe-DB`

     **Description**: `Denies describing the DB Access`

* Click on **Create policy**.
{{% img "iamad_3.png" IAM_AD%}}

* Continue to follow instructions to [Map policy to User](#map-policy-to-the-user) if you are running this lab using your own AWS credential. Or continue to follow instructions on [Map policy to Role](#map-policy-to-role) if you are running this lab from an AWS-sponsored or AWS-staffed event. 

#### Map policy to User

{{% notice note %}}
Continue with **Map policy to User** only if you are running this lab using your own AWS credential. If you are running this lab from an AWS-sponsored or AWS-staffed event, please follow instructions in the [Map policy to Role](#map-policy-to-role) section instead.
{{% /notice  %}}

* From left pane of the IAM page, click on `Users` and click on the user that you logged in with.
{{% img "iamad_4.png" IAM_AD%}}

* From **Summary** page, click on `Add permissions`.
{{% img "iamad_5.png" IAM_AD%}}

* From **Add permissions** page, Click on `Attach existing policies directly` then Search for the policy **RDS-Deny-Describe-DB** that was created in previous step and select the policy.

* Click on `Next: Review`.
{{% img "iamad_6.png" IAM_AD%}}

* From the **Add permissions** page click on `Add permissions`.
{{% img "iamad_6-1.png" IAM_AD%}}

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home) and click on [Databases](https://console.aws.amazon.com/rds/home#databases:) from left navigation pane. You won't see any DB Instances listed there as per the defined policy.
{{% img "iamad_7.png" IAM_AD%}}

**Clean up the policy**

* Navigate to [IAM service console](https://console.aws.amazon.com/iam/home).

* From left pane, click on `Users` and click on the user that you logged in with.
{{% img "iamad_4.png" IAM_AD%}}

* Remove the policy mapping that you mapped earlier by clicking on `(x)` in front of the policy and then click on `Detach` from **Detach policy** confirmation page to remove the policy.
{{% img "iamad_8.png" IAM_AD%}}

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home) and click on [Databases](https://console.aws.amazon.com/rds/home#databases:) from left navigation pane. You will now be able to see DB instances.
{{% img "iamad_9.png" IAM_AD%}}

#### Map policy to Role 
{{% notice note %}}
Continue with **Map policy to Role** only if you are running this lab from an AWS-sponsored or AWS-staffed event. If you are running this lab using your own AWS credential, please follow instructions in the above [Map policy to User](#map-policy-to-user) section instead.
{{% /notice  %}}

* From left pane of the IAM page, click on `Roles`, search for `TeamRole` on the **Roles** page.
{{% img "role1.png" IAM_AD%}}

* From **Summary** page, click on the `Attach policies` button.
{{% img "role2.png" IAM_AD%}}

* From **Add permissions to TeamRole** page, type `RDS-Deny-Describe-DB` in **Filter policies** to search for the policy you created in previous step, select the policy, then click on the `Attach policy` button.
{{% img "role3.png" IAM_AD%}}

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home) and click on [Databases](https://console.aws.amazon.com/rds/home#databases:) from left navigation pane. You won't see any DB Instances listed there as per the defined policy.
{{% img "iamad_7.png" IAM_AD%}}

**Clean up the policy**

* Navigate to [IAM service console](https://console.aws.amazon.com/iam/home).

* From left pane of the IAM page, click on `Roles`, search for `TeamRole` on the **Roles** page.
{{% img "role1.png" IAM_AD%}}

* From **Summary** page, click to show additional policies.
{{% img "role4.png" IAM_AD%}}

* From the list of policies, click `x` to detach policy **RDS-Deny-Describe-DB** from role.
{{% img "role5.png" IAM_AD%}}

* From the **Detach policy** window, click `Detach` to confirm.
{{% img "role6.png" IAM_AD%}}

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home) and click on [Databases](https://console.aws.amazon.com/rds/home#databases:) from left navigation pane. You will now be able to see DB instances.
{{% img "iamad_9.png" IAM_AD%}}










