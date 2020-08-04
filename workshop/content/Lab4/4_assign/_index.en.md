+++
title = "Associate Parameter and Options to database instance"
date = 2020-05-27T00:15:34-04:00
weight = 40
pre = "<b>3.4 </b>"
+++

* Navigate to [Amazon RDS  service console](https://console.aws.amazon.com/rds/home). Click on [Databases](https://console.aws.amazon.com/rds/home#databases:) from left navigation pane. From list of databases select `sqlserver-rdssql` under **DB identifier** and then click on `Modify`.
{{% img "assign1.png" "Assign" %}}

* On the modify page, scroll down to Database options section.

* For **DB parameter group** select `sql-2017-force-ssl-enable-clr` parameter group. This parameter group was created in one of the previous labs.

* For **Option group** select `sql-2017-enable-native-backup-audit-tde` option group. This option group was created in one of the previous labs.
{{% img "assign2.png" "Assign" %}}

* Scroll down to the bottom of the page and click on **Continue**.

* On the summary of modification, review the changes, select `Apply Immediately` and then click on **Modify Db Instance** to apply these changes immediately to the DB instance.
{{% img "assign3.png" "Assign" %}}


