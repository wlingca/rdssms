+++
title = "Retrieve Database Instance Endpoint"
date = 2020-05-12T10:31:57-04:00
weight = 20
pre = "<b>1.2 </b>"
+++

**Please proceed to this step after DB Instance has been provisioned from previous lab.**

* In order to connect to the DB instance and start using it in subsequent labs, you need to retrieve the DB instance endpoint.

* Proceed to Databases section of [RDS](https://console.aws.amazon.com/rds/home#databases:).

* Select **DB Identifier** that you have created.

{{% img "endpoint-db.png" "Endpoint" %}}

* The **Endpoint & port** section in the **Connectivity and security** tab of the details page displays the endpoint. Note this value down, as you will use them later.

{{% img "endpoint-connection.png" "Endpoint" %}}

{{% notice tip %}} 
* Copy and paste the endpoint to a notepad to keep it handy for the next step.

{{% /notice %}}