+++
title = "Generate Test Workload"
date = 2020-06-08T11:45:09-07:00
weight = 20
+++

* In this lab, you will use **SQLQueryStress** tool to generate load against the **AdvendureWorks2017** database.

* Download [**SQLQueryStress**](generateload/SQLQueryStress.exe) onto your bastion host. Download **AdventureWorks2017.bak** from [AdventureWorks installation and configuration](https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15) site. And upload the file to the S3 bucket created in Lab 6. 

* From your bastion host, copy the following SQL Script in SSMS, replace **mysqlbackup-2020** with the name of the S3 bucket you created in Lab 6, and run the script to restore the AdventureWorks2017 database.

    ```
    USE msdb
    GO

    EXEC [dbo].[rds_restore_database]
    @restore_db_name='AdventureWorks2017'
    , @s3_arn_to_restore_from='arn:aws:s3:::mysqlbackup-2020/AdventureWorks2017.bak'
    , @type='full' --valid type options are full and differential
    , @with_norecovery=0 --Change to 1 if you don't want to recover database and keep restoring new differentials or log backups
    ```

{{% img "restore.png" "Restore" %}}

* To check the status of restore, replace the **task_id** value with value returned in step #2.

    ```
    USE msdb
    GO

    EXEC dbo.rds_task_status @task_id=4
    ```

* When **% Complete** reaches 100, you should be able to see the database **AdventureWorks2017** is restored. 

{{% img "restorestatus.png" "Restore status" %}}

* From the bastion host, launch **SQLQueryStress** tool, and click on the **Database** button to setup database connection information.
{{% img "selDB.png" "DB Connection" %}}

* Enter in the followings for database connection information, and click on **Test Connection** button to test database connection. Exit out of the **Database Select** window after the connection is setup successfully.



    | Field             | Value                                                           |
    | ----------------  | --------------------------------------------------------------- |
    | Server            | value of RDS SQL Server endpoint                                |
    | Authentication    | SQL Server Authentication                                       |
    | Login             | admin                                                           |
    | Password          | password for SQL login "admin"                                  |
    | Default Database  | AdventureWorks2017                                              |


{{% img "dbconnection.png" "Connection string" %}}

* Now that we have the database connection setup and pointing to the **AdventureWorks22017** database, let's generate some load against the database. From the **Query** window, type the following store procedure to execute. 

    ```
    EXEC uspGetEmployeeManagers @BusinessEntityID
    ```
{{% img "query.png" "query" %}}

*   Use random data for the **@BusinessEntityID** parameter. Click on the **Parameter Substitution** button. 

{{% img "param.png" "parameter" %}}

*   On the **Parameter Substitution** window, type the following query to get value for parameter **@BusinessEntityID**.

    ```
    select BusinessEntityID 
    from HumanResources.Employee
    ```
* Click on **Get Columns** button to setup the parameter mapping. Click **OK** to exit the **Parameter Substitution** window.

{{% img "paramSel.png" "paramSel" %}}

* The store procedure will now run with random value from the parameter mapping created. You can generate additional load to the database by changing the number of threads and iterations . The number of Iterations means the query will be executed this amount of times for each thread that is specified. The numbers of threads specify how many concurrent threads (SPIDS) will be used to execute the number of iterations. Set the **Number of Iterations** and the **Number of Threads** to the following values. Press **GO** to start generating load to the database.

    | Field                  | Value                               |
    | ---------------------  | ----------------------------------- |
    | Number of Iterations   | 99999                               |
    | Number of Threads      | 2000                                |

{{% img "iterations.png" "iterations" %}}    

* You can leave the workload running. And move onto next lab.