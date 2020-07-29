+++
title = "Restore options"
date = 2020-06-01T14:05:31-04:00
weight = 50
+++

{{% notice note %}}
When the RDS SQL Server instance is running in Multi-AZ mode, you may only restore backups which have full recovery model.
{{% /notice %}}

* Please proceed to Bastion host and open SSMS.

* From SSMS, Please expand **Databases-> System Databases -> msdb-> Programability -> Stored Procedures**.

* Under **Stored Procedures**, there are two stored procedures that you can explore to restore native sql backups on S3 to RDS.

#### ***Using rds_restore_database***

* Use the following SQL Script in SSMS to restore the backup that we backed up in previous task with a different name.

        USE msdb
        GO
        EXEC [dbo].[rds_restore_database]
        @restore_db_name='testdb_copy'
        , @s3_arn_to_restore_from='arn:aws:s3:::mysqlbackup-2020/mysqlbackup_full.bak'
        , @type='full' --valid type options are full and differential
        , @with_norecovery=0 --Change to 1 if you don't want to recover database and keep restoring new differentials or log backups

{{% img "restore1.png" "Restore" %}}

* To check the status of restore.

        USE msdb
        GO
        EXEC dbo.rds_task_status @task_id=11
{{% img "restore2.png" "Restore" %}}

{{% notice tip %}}
If the Multi-AZ has been enabled on the db instance, then the restored database will automatically becomes part of Multi-AZ.
{{% /notice %}}

#### ***Using rds_restore_log***

* The **rds_restore_log** is used the same way the **rds_restore_database** is used except rds_restore_log is restored incrementally on existing "no recovery" database that matches Log Sequence Chain.
{{% img "restore3.png" "Restore" %}}

