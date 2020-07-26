+++
title = "Enable Window Authentication (30 mins)"
date = 2020-06-28T19:41:34-04:00
weight = 30
+++

#### **Active Directory**

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home) and click on [Databases](https://console.aws.amazon.com/rds/home#databases:) from left navigation pane. From list of databases select `sqlserver-rdssql` under **DB identifier** and click on `Modify`.
{{% img "iamad_10.png" IAM_AD%}}

* Scroll down to **Microsoft SQL Server Windows Authentication** section.

* From **Directory**, select the directory. 
{{% img "iamad_11.png" IAM_AD%}}

* Scroll to the bottom of screen and click on `Continue`
{{% img "iamad_12.png" IAM_AD%}}

* On the **Summary of modifications** page, check the **Apply immediately** option, then click on `Modify DB Instance`.
{{% img "iamad_13.png" IAM_AD%}}

* Click on database instance `sqlserver-rdssql`, then select the **Connectivity & security** tab. You can see the Directory status shows **Joining**. Once the operationi for joining the active directory is completed, the status will change to **Joined**. It will take approximately 20 minutes for Amazon RDS to join the Active Directory.
{{% img "iamad_14.png" IAM_AD%}}

#### **Register Active Directory Login on SQL Server**

* Wait until the database instance is joined to the domain. 

* Go to [Cloudformation](https://console.aws.amazon.com/cloudformation/home), click on **Stack Name** `sqlimmersion-stack` and select the **Output** tab to retrieve the domain admin user login information. Verify the following from the stack output. 

    * Active directory name: `rdssql.rds.com`
    
    * Domain admin login name: `rdssql\admin`

    * Domain admin password: `Amazon1!`
{{% img "adinfo.png" IAM_AD%}}

* Open a new Remote Destop session to connect to the bastion host. Login with domain admin user `rdssql\admin` and password `Amazon1!`.
{{% img "iamad_15.png" IAM_AD%}}

* Open SSMS and login with **SQL Authentication** using the master username and password you specified when you created the database in the RDS console.
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

* Now try to log onto the SQL Server instance with Windows Authentication. In the **Object Explorer**, click on **Connect**, then select **Database Engine**.
{{% img "connect.png" IAM_AD%}}

* In Login Window select `Windows Authentication` as **Authentication** 
{{% img "iamad_17.png" IAM_AD%}}

* You should be able to connect successfully using Windows Authentication