+++
title = "Enable Multi-AZ HA (30 mins)"
date = 2020-05-20T22:14:33-04:00
weight = 10
re = "<b>2. </b>"
+++

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home)

* Proceed to Databases section of [RDS](https://console.aws.amazon.com/rds/home#databases:).

* Select the DB Identifier **sqlserver-rdssql** and click on `Modify`.
{{% img "console.png" "Multi-AZ" %}}

* From **Modify DB Instance** page scroll down to **Multi-AZ deployment** and select `Yes (Mirroring /Always On)`.
{{% img "multiaz-enable.png" "Multi-AZ" %}}

* Scroll down to the bottom of the page and click on `Continue` button.
{{% img "multiaz-continue.png" "Multi-AZ" %}}

* On **Summary** page under **Scheduling of modifications**, select `Apply Immediately` and then click on `Modify DB Instance`.
{{% img "multiaz-confirm.png" "Multi-AZ" %}}

{{% notice note %}}

* **Apply immediately** selection above would immediately start the process and could cause downtime. It is recommended to apply these changes during maintenance window in production or similar environment. That can be done by selecting **Apply during the next scheduled maintenance window**.
{{% /notice %}}

* It will take a few minutes for Multi-AZ to be setup. Once the process is completed the **Status** of the database instance will change from **Modifying** to **Available**.
{{% img "multiaz-modifying.png" "Multi-AZ" %}}

* From the Databases page, check that the **Status** of the database instance is `Available`, then click on the database instance `sqlserver-rdssql`.
{{% img "multiaz-validate1.png" "Multi-AZ" %}}

* On the **Summary** page click on the **Configuration** tab. Note that the **Multi AZ** information section now shows **Yes (Always On)**. Also note that the **Region & AZ** information section and the **Secondary Zone** information section are showing primary instance and secondary instance in different availability zones.
{{% img "multiaz-validate2.png" "Multi-AZ" %}}

* On the **Summary** page click on **Connectivity & security** tab, copy and paste the **Listener endpoint** information to notepad for later use.
{{% img "multiaz-endpoint.png" "Multi-AZ" %}}