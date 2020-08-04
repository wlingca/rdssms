+++
title = "Perform native backup"
date = 2020-06-01T10:01:11-04:00
weight = 40
pre = "<b>4.4 </b>"
+++

In this lab, a new databases will be created and then a backup to S3 will be performed.

#### ***Prerequisites***

* Database to be backup (created in this lab).

* ARN of S3 bucket (You have created S3 bucket in previous lab).

* Using RDS properietry stored procedure: `msdb.dbo.rds_backup_database` to take backup.

* Using RDS properietry stored procedure: `msdb.dbo.rds_task_status` to check the status of backup.



#### ***Create new Database***

* Open remote desktop connection to bastion host and connect to Database instance using SSMS. You may go back to the previous lab named [Connect to SQL Server using SSMS](../lab1/3_clientconnection.html) for instructions.

* Once you are connected to Database Instance using SSMS, click on `New Query`. In query window type or copy the following command and click on `Execute` to create new database.

        USE master 
        GO

        CREATE DATABASE testdb
        GO
{{% img "native2.png" "Native Backup" %}}

#### ***Perform new Backup***

* To get the ARN of S3 bucket you have created in the previous lab, navigate to [S3 service](https://s3.console.aws.amazon.com/s3/home). From list of buckets select the bucket you created and then click on `Copy Bucket ARN`. Paste the ARN in a notepad or other accessible place that you can use in next step.
{{% img "native3.png" "Native Backup" %}}

* Go to Bastion host, in SSMS type the following script to perform the backup and note down the **task_id** from the result.

        USE msdb
        GO
        exec [dbo].[rds_backup_database]
        @source_db_name='testdb'
        , @s3_arn_to_backup_to = 'arn:aws:s3:::mysqlbackup-2020/mysqlbackup_full.bak' 
        --Change bucketname as per your configuration and backup name as per your need.
        , @type='full'
{{% img "native4.png" "Native Backup" %}}

* To check the status of backup, execute the following script, notice the lifecycle value as shown below.

        USE msdb
        GO
        exec dbo.rds_task_status @task_id=10 -- <-- Enter task id value here
{{% img "native5.png" "Native Backup" %}}

* Navigate to S3 bucket where you have taken the backup to, you should see the backup file there.
{{% img "native6.png" "Native Backup" %}}