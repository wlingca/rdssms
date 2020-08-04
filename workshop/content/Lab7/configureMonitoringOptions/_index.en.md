+++
title = "Configure Monitoring Options"
date = 2020-06-10T09:52:26-07:00
weight = 10
pre = "<b>6.1 </b>"
+++



* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home) and click on [Databases](https://console.aws.amazon.com/rds/home#databases:) from left navigation pane. From list of databases, select `sqlserver-rdssql` under **DB identifier** and click on `Modify`.
{{% img "console.png" "console" %}}

* From **Modify DB Instance** page, scroll down to **Monitoring** section, select the **Enable enhanced monitoring** option, and change the **Granularity** to **10 seconds**
{{% img "enhancedmonitoring.png" "enhancedmonitoring" %}}

* Scroll down to **Log exports** section, check the **Agent log** and **Error log** options to export SQL Server agent logs and error logs to CloudWatch.
{{% img "logexport.png" "log export" %}}

* On the **Performance Insights** section, check the **Enable Performance Insights** option.
{{% img "perfInsight.png" "performance insights option" %}}

* Scroll down to the bottom of the screen, and click on the **Continue** button.
{{% img "continue.png" "continue" %}}

* Select the **Apply immediately** option, and then click on the **Modify DB Instance** button.

{{% img "applyImmediately.png" "Apply immediately" %}}