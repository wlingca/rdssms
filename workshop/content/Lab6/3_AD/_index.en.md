+++
title = "Active Directory"
date = 2020-06-28T19:41:34-04:00
weight = 30
+++

#### **Active Directory**

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home?region=us-east-1) and click on [Databases](https://console.aws.amazon.com/rds/home?region=us-east-1#databases:) from left navigation pane. From list of databases select `sqlserver-rdssql` under **DB identifier** and click on Modify.
{{% img "iamad_10.png" IAM_AD%}}

* Scroll down to **Microsoft SQL Server Windows Authentication** section.

* From **Directory**, select the directory. 
{{% img "iamad_11.png" IAM_AD%}}

* Scroll to the bottom of screen and click on `Continue`
{{% img "iamad_12.png" IAM_AD%}}

* On the summary of modification click on `Modify DB Instance`.
{{% img "iamad_13.png" IAM_AD%}}

* Go back to Amazon RDS service console and notice the **Directory status** changing from **Joining** to **rdssql**. It will take few minutes for Amazon RDS to join the Active Directory.
{{% img "iamad_14.png" IAM_AD%}}

#### **Register Active Directory Login on SQL Server**

* You will need active directory domain name, login name and password to login to Bastion host as domain administrator. If you have not updated active directory information during cloudformation setup then please use the following information to connect to Bastion Host

    * `Directory name`: **rdssql.rds.com**
    
    * `Domain Login Name`: admin

    * `Password`: Amazon1!
{{% img "iamad_15.png" IAM_AD%}}

* Open SSMS and login with **SQL Authentication**
{{% img "iamad_16.png" IAM_AD%}}

* From SSMS, create a `New Query` and execute following script.

        USE [master]
        GO

        CREATE LOGIN [rdssql\admin] FROM WINDOWS;
        GO

        GRANT ALTER ANY CONNECTION TO [rdssql\admin]
        GRANT ALTER ANY LINKED SERVER TO [rdssql\admin]
        GRANT ALTER ANY LOGIN TO [rdssql\admin]
        GRANT ALTER SERVER STATE TO [rdssql\admin]
        GRANT ALTER TRACE TO [rdssql\admin]
        GRANT CONNECT SQL TO [rdssql\admin]
        GRANT CREATE ANY DATABASE TO [rdssql\admin]
        GRANT VIEW ANY DATABASE TO [rdssql\admin]
        GRANT VIEW ANY DEFINITION TO [rdssql\admin]
        GRANT VIEW SERVER STATE TO [rdssql\admin]
        GRANT ALTER ANY SERVER ROLE TO [rdssql\admin]
        GO

* Now try to login with Windows Authentication

    * Click on Connect SSMS and select Database Engine

    * In Login Window select `Windows Authentication` as **Authentication** 
    {{% img "iamad_17.png" IAM_AD%}}

* You should be able to connect successfully using Windows Authentication