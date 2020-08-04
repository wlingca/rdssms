+++
title = "Auditing (10 mins)"
date = 2020-06-07T14:42:36-04:00
weight = 60
pre = "<b>5.6 </b>"
+++

#### **Create S3 bucket to store Audit Data**

* Navigate to [Amazon S3](https://s3.console.aws.amazon.com/s3/home) and click on `Create bucket`.
{{% img "tde_0.png" TDE %}}

* On the **Create bucket** page provide the information as below. **Bucket name** needs to be globally unique. You may add your initials or other unique characters for unique bucket name.

    * **Bucket name**: `sqlimmersion-sql-audit-data`

    * **Region**: `US East (N. Virginia)`

* Click on `Create`
{{% img "tde_2.png" TDE %}}

#### **Enable Auditing option**

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home) and click on [Options groups](https://console.aws.amazon.com/rds/home#option-groups-list:) from left navigation pane. 

* On **Options group** page, select `sql-2017-enable-native-backup-audit-tde` and click on `Add option`
{{% img "audit1.png" audit %}}

* **Option name**: `SQLSERVER_AUDIT`

* **S3 Bucket**: `sqlimmersion-sql-audit-data`.

* **IAM role**: `Create a new role`.

* **IAM role**: `sqlimmersion-write-s3-bucket`

* Select the **Immediately** option from Scheduling and click on `Add option`.
{{% img "tde_3.png" TDE %}}


* The Database instance will go through Modify cycle to apply the changes. The DB Instance status will change to **Modifying** to **Available** in few minutes.

#### **Setup auditing on server**

* Login to Bastion host and connect to SQL Server instance using SSMS. Please follow the steps [here]({{% siteurl %}}en/lab1/3_clientconnection.html).

* **Create  audit**: Copy the following script to a new query window and execute the script.

    
        USE [master]
        GO
        CREATE SERVER AUDIT [sqlimmersion-audit]
        TO FILE 
        (	FILEPATH = N'D:\rdsdbdata\SQLAudit'
            ,MAXSIZE = 20 MB
        )
        WITH
        (	QUEUE_DELAY = 1000
            ,ON_FAILURE = CONTINUE
        )
        GO
        ALTER SERVER AUDIT [sqlimmersion-audit] WITH (STATE=ON)
        GO
{{% img "tde_4.png" TDE %}}

* **Create Server Audit Specification**: Execute the following script in query window to create Server Level Audit specification. 

        USE [master]
        GO
        CREATE SERVER AUDIT SPECIFICATION [sqlimmersion-serverspec]
        FOR SERVER AUDIT [sqlimmersion-audit]
        ADD (SUCCESSFUL_LOGIN_GROUP)
        GO
        ALTER SERVER AUDIT SPECIFICATION [sqlimmersion-serverspec] WITH (STATE=ON)
        GO
{{% img "tde_5.png" TDE %}}

* From **SSMS**, Expand the Server and Security objects. Then expand **Audits** and **Server Audit Specifications**. You should see the Audit details as shown below.
{{% img "tde_6.png" TDE %}}

* To review the captured audit data, please execute the following script.

        select * from 
		msdb.dbo.rds_fn_get_audit_file('D:\rdsdbdata\SQLAudit\*.sqlaudit', default, default)

{{% img "tde_7.png" TDE %}}

{{% notice info %}}
Please review more information about [Server Audit Specifications](https://docs.microsoft.com/sql/t-sql/statements/create-server-audit-specification-transact-sql) and [Database Audit Specifications](https://docs.microsoft.com/sql/t-sql/statements/create-database-audit-specification-transact-sql).
{{% /notice %}}

