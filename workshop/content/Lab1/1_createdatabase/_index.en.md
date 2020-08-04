+++
title = "Create the DB Instance"
date = 2020-05-12T09:16:40-04:00
weight = 10
pre = "<b>1.1 </b>"
+++

#### **Create Database Instance**

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home)

* Click **Create database** to start the configuration process. 
{{% img "start-createdb.png" "Create DB" %}}

**Choose a database creation method**

* In the **Chose a database create method** section, select **Standard Create**, next in **Engine options** select **Microsoft SQL Server** and in **Edition Section** select **SQL Server Enterprise Edition**. Also select the latest version from **Version** option.

{{% notice note %}}
**Free Tier**  
For this lab SQL Server Enterprise Edition has been selected and will incur some cost. To use free tier select **SQL Server Express Edition** under **Editions**. Note that some of the advanced features are not supported with SQL Server Express Edition.

{{% /notice %}}
{{% img "create-db-engine.png" "Create DB" %}}


**Templates**

* Select **Production** template.
{{% img "template.png" "Create DB" %}}


**Settings**

* `DB instance identifier`: sqlserver-rdssql

* `Master username`: admin

* `Master password`: enter a password
{{% img "settings.png" "Create DB" %}}

**DB instance size**

* `DB instance class`: **Burstable** classes and select **db.t3.2xlarge** from dropdown.
{{% img "dbinstancesize.png" "Create DB" %}}

**Storage**

* `Storage type`: Provisioned IOPS (SSD)

* `Allocated storage`: 20 GiB

* `Provisioned IOPS`: 1000

* `Storage autoscaling`: Check Enable storage autoscaling

* `Maximum storage threshold`: 1000 GiB
{{% img "storage.png" "Create DB" %}}

**Availability & durability**

* For this lab please do not enable Multi-AZ. This will covered in one of the next labs in this workshop.
{{% img "availability.png" "Create DB" %}}

**Connectivity** *(Please refer to cloudformation stack to get the name of the resources to be used below)*

* `Virtual private cloud (VPC)`: sqlimmersion-stack-vpcRDSSQL.

* Expand `Additional connectivity configuration`

* `Subnet group`: sqlimmersion-stack-dbsubnetgroup-xxxxxx.

* `Publicly accessible`: No

* `VPC security group`: Choose existing

* `Existing VPC security groups`: sqlimmersion-stack-SQLSecGroup-xxxxxx (also remove the default group from selection)

* `Availability Zone`: Leave default

* `Database port`: Leave default
{{% img "connectivity.png" "Create DB" %}}

**Create database**

* Leave all other options default and click on **Create database** to create database.
{{% img "complete-create.png" "Create DB" %}}

* It will take a few minutes to provision the Database Instance. You may monitor the DB Instance provisioning progress from [Databases List](https://console.aws.amazon.com/rds/home#databases:). The status will change to **Available** once Instance gets provisioned. 
{{% img "progress1.png" "Create DB" %}}

You may press the **Refresh** icon to check on the latest progress of the **status**. Once the **status** is no longer in **Creating** state, you may move to the next section of the lab.




