+++
title = "Data at Rest Encryption (10 mins)"
date = 2020-06-07T12:22:34-04:00
weight = 40
+++

To set up encryption at rest, you have two options:

1. You can set up encryption at rest by using AWS Key Management Service (AWS KMS) encryption keys. For more information, see [Encrypting Amazon RDS Resources](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Encryption.html).

2. If you are running Enterprise Edition, you can choose to use Transparent Data Encryption (TDE) to achieve encryption at rest. For more information, see [Support for Transparent Data Encryption in SQL Server](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Appendix.SQLServer.Options.TDE.html).

### Data at rest Encryption using AWS KMS

{{% notice info %}}
With data at rest encryption using AWS KMS, you can only enable encryption for an Amazon RDS database instance when you create it, not after the database instance is created.
{{% /notice %}}

* You may go back to [Create a new RDS SQL Server](../lab1/1_createdatabase.html) for instructions on creating a new database instance. Below figure shows the encryption section that you can configure to enable encryption with data at rest using AWS KMS during database instance creation.
{{% img "kms1.png" kms %}}

### Data at rest Encryption using TDE

#### Add Option for TDE

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home) and click on [Options groups](https://console.aws.amazon.com/rds/home#option-groups-list:) from left navigation pane. 

* From **Options group** page, select `sql-2017-enable-native-backup-audit-tde` and click on `Add option`
{{% img "tde_1.png" TDE %}}

* Select `TRANSPARENT_DATA_ENCRYPTION` from **Option name** dropdown list.

* Select `Immediately` from Scheduling and click on `Add option`.
{{% img "tde_3.png" TDE %}}


* The Database instance will go through Modify cycle to apply the changes. The DB Instance status will change to **Modifying** to **Available** in few minutes.


{{% notice info %}}
Once TDE is enabled from the options group for a SQL Server, a certificate will be created on SQL Server that can be further used to configure TDE from within SQL Server.
{{% /notice %}}

#### **Configure TDE from SQL Server**

* Login to Bastion host and connect to SQL Server instance using SSMS. Please follow the steps [here](../lab1/3_clientconnection.html).

* **Get Certificate name**: Open a **New Query** and copy the following script, copy and save the certificate name from the result for later use:

        USE [master]
        GO
        SELECT name FROM sys.certificates WHERE name LIKE 'RDSTDECertificate%'
        GO
{{% img "tde_4.png" TDE %}}

* **Create DB Encryption Key**: Copy the following script in a query windows in SSMS, replace **[RDSTDECertificate20200522T172322]** with the certificate name saved above, then **Execute** the script:

        USE testdb
        GO
        -- Create DEK using the certificate
        CREATE DATABASE ENCRYPTION KEY
        WITH ALGORITHM = AES_256
        ENCRYPTION BY SERVER CERTIFICATE [RDSTDECertificate20200522T172322] /*<--Replace with the cerfiticate*/
        GO 
{{% img "tde_5.png" TDE %}}

#### **Enable Database Encryption**

* Copy the folloiwng script and execute to enable database encryption.

        USE master
        GO
        ALTER DATABASE testdb
        SET ENCRYPTION ON
        GO
{{% img "tde_6.png" TDE %}}

* **Verify Encryption Status**: Execute the following script to get the encryption of database.

        SELECT DB_NAME(database_id) as DatabaseName, * FROM sys.dm_database_encryption_keys

{{% img "tde_7.png" TDE %}}
