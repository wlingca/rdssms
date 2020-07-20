+++
title = "Data at Rest Encryption"
date = 2020-06-07T12:22:34-04:00
weight = 40
+++

#### **Add Option for TDE**

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home?region=us-east-1) and click on [Options groups](https://console.aws.amazon.com/rds/home?region=us-east-1#option-groups-list:) from left navigation pane. 

* From **Options group** select options group `sql-2017-enable-native-backup-audit-tde` and click on `Add option`
{{% img "tde_1.png" TDE %}}

* From the option name select `TRANSPARENT_DATA_ENCRYPTION`

* Select `Immediately` from Scheduling and click on `Add option`.
{{% img "tde_3.png" TDE %}}


* The Database instance will go through Modify cycle to apply the changes. The DB Instance status will change to **Modifying** to **Available** in few minutes.


{{% notice info %}}
Once TDE is enabled from the options group for a SQL Server, a certificate will be created on SQL Server that can be further used to configure TDE from within SQL Server.
{{% /notice %}}

#### **Configure TDE from SQL Server**

* Login to Bastion host and connect to SQL Server instance using SSMS. Please follow the steps [here]({{% siteurl %}}en/lab1/3_clientconnection.html).

* **Get Certificate name**: Open a **New Query** and copy the following script and get the certificate name from the result:

        USE [master]
        GO
        SELECT name FROM sys.certificates WHERE name LIKE 'RDSTDECertificate%'
        GO
{{% img "tde_4.png" TDE %}}

* **Create DB Encryption Key**: Copy the following script in a query windows in SSMS and execute it:

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
