+++
title = "Create CloudWatch Alarm"
date = 2020-06-15T09:42:02-07:00
weight = 50
+++

* From **RDS Service Console**, select to **Databases** from the left menu bar, and click on **sqlserver-rdssql** from the database list. On the database details view, click on the **Logs & events** tab. Then click on **Create alarm**.

{{% img "logNevent.png" "log and event" %}}

* Create a new alarm to get an email notification if database instance CPU utilization reaches 80% or above for over 15 minutes. Be sure to select “Send Notifications to New Email address”, define a topic name, and put in your email address. Select CPU Utilization, 80% threshold & 1 evaluation period of 15 Minute. Then click **Create alarm**.

{{% img "alarm.png" "alarm" %}}

{{% notice note %}}
To receive the alarm email you will need to confirm your subscription. You should receive a confirmation email from Amazon SNS within 90 seconds or so. Click on the link to confirm your subscription. The alarm will be active after confirming the subscription.
{{% /notice %}}