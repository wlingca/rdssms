+++
title = "Review Network Security"
date = 2020-06-06T22:32:59-04:00
weight = 10
+++

In this Lab, you will review the Network Security that includes VPCs, Security Groups and Subnet Groups.

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home?region=us-east-1) and click on [Databases](https://console.aws.amazon.com/rds/home?region=us-east-1#databases:) from left navigation pane. From list of databases click on `sqlserver-rdssql` under **DB identifier**.
{{% img "network1.png" "review" %}}

* From Database Page, click on `Connectivity & security` tab and view the **VPC** and **Subnet group** from **Networking section**. Also review the **VPC Security groups** from **Security** section.
{{% img "network2.png" "review" %}}

#### **VPC (Virtual Private Cloud)**
* Marked #1 in the picture, please click on the VPC link, this would open VPC details page
* From VPC page, click on Tab `CIDR Blocks`.
* Notice the current CIDR IP Range. This is the range of IP addresses for this VPC from where IP will be assigned to resources in this VPC.
{{% img "network3.png" "review" %}}

#### **Subnet groups**
* Navigate back to **RDS Database instance** and click on `sqlserver-rdssql`.
* From **Subnet group** note the subnet group name.
* From left page click on `Subnet groups` and click on the subnet group name as you noted in previous step.
{{% img "network4.png" "review" %}}
* You will notice multiple subnets under the **Subnets** section. Click on one the first Subnet ID.
{{% img "network5.png" "review" %}}
* From **Subnets** page click and review `Route Table` and `Network ACL` tabs to understand how network is routed and the restrictions on inbound or outbound rules.
{{% img "network6.png" "review" %}}

#### **VPC Security groups**
* Navigate back to **RDS Database instance** and click on `sqlserver-rdssql`.
* Under VPC security groups click on security groups link.
* From Security groups, click on Inbound rules, you can allow or disallow different ports to the Source.
* Click on `Edit inbout rules`.
{{% img "network7.png" "review" %}}

* The **Edit inbound rules** allows to add\modify rules to control the incoming traffic. 
* The picture below shows the example how inbound traffic can be allowed from user's machine. Adding this rule on this specific security group won't be applicable as public access has been restricted.
{{% img "network8.png" "review" %}}

{{% notice warning %}}
Do not allow public access to RDS Database unless it is a business requirement. It would allow the database endpoint reachable from public network.
{{% /notice %}}

