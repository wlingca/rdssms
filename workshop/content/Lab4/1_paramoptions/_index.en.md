+++
title = "Parameter and Option groups"
date = 2020-05-26T22:05:35-04:00
weight = 10
+++

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home) and click on [Databases](https://console.aws.amazon.com/rds/home#databases:) from left navigation pane. From list of databases click on `sqlserver-rdssql` under **DB identifier**.
{{% img "param1.png" "ParamOption" %}}

* Click on **Configuration** tab and scroll down and please look at the **Option groups** and **Parameter group**.
{{% img "param2.png" "ParamOption" %}}

* First click on `Option groups` and notice the **Option Group Properties** as shown below
{{% img "param3.png" "ParamOption" %}}

* Now click on `Parameter group` and from the **Parameter groups** notice the Property name, Allowed Values, Modifiable options.

{{% notice info %}} 
Parameter options allow you to modify some of the parameters like **trace flags** and **configuration options (sp_configure)**. Not all of the settings are configurable. You are allowed to modify values for parameters where Modifiable flag is true as shown the image below.
{{% /notice %}}
{{% img "param4.png" "ParamOption" %}}

