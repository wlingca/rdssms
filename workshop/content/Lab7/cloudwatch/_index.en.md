+++
title = "CloudWatch and Enhanced Monitoring"
date = 2020-06-10T09:35:30-07:00
weight = 30
+++

You can monitor DB instances using Amazon CloudWatch, which collects and processes raw data from Amazon RDS into readable, near real-time metrics. By default, Amazon RDS metric data is automatically sent to CloudWatch every 60 seconds. Metrics collected with a period of 60 seconds (1 minute) are retented for 15 days. Metrics may retent for longer if collection interval changes. For more information, see [Metrics Retention](https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#metrics-retention) in the Amazon CloudWatch User Guide. 

* From **RDS Service Console**, select to **Databases** from the left menu bar, and click on **sqlserver-rdssql** from the database list. On the database details view, click on the **Monitoring** tab.
{{% img "cloudwatch.png" "cloudwatch" %}}

* You can click on a chart to drill down for more details, select any chart area to zoom in on a specific time period. 
{{% img "chart.png" "chart" %}}

* If you have Enhanced Monitoring option enabled for the database instance, select **Enhanced Monitoring** option from the **Monitoring** dropdown list. 

{{% img "enhancedMonitoring.png" "enhancedMonitoring" %}}

* You will see additional counters showing metrics captured at the guest OS level.

{{% img "enhancedMonitoringCharts.png" "enhancedMonitoringcharts" %}}