+++
title = "Generate Test Workload (10 mins)"
date = 2020-06-08T11:45:09-07:00
weight = 20
+++

In this lab, you will use the provided script to generate load on the RDS SQL Server instance.

* Remote desktop to the bastion host and connect to Database instance using SSMS. You may go back to the previous lab named [Connect to SQL Server using SSMS](../lab1/3_clientconnection.html) for instructions.

* Once you are connected to Database Instance using SSMS, click on `New Query`. In query window, copy and paste the content of [mssql_load_script.sql](generateload/mssql_load_script.sql) and click on `Execute` to create a new database for load generation load. This will take about 10 minutes to complete.
{{% img "genload1.png" "genload" %}}

* Once the above task is completed, click on `New Query` 5 times to open 5 new connections. In each query window, copy and paste the following script, then click on `Execute` to start 5 load generating sessions. Leave these queries running and continue with the rest of the Performance Monitoring lab. 

    ```
    USE db2
    GO

    EXEC dbo.usp_RandomQ 100;
    go
    ```

{{% img "genload2.png" "genload" %}}
