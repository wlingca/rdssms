+++
title = "Connect to SQL Server using SSMS"
date = 2020-05-12T22:35:10-04:00
weight = 30
pre = "<b>1.3 </b>"
+++

#### **Prerequisites for this task**

1. EC2 Instance Public DNS name.
2. RDS SQL Server Endpoint name.
3. Decrypted Password.
4. Remote Desktop Client of your choice.


* Go to **Cloudformation > Stacks > sqlimmersion-stack**, select the **Output** tab to get the EC2 instance name for the bastion host.
{{% img "cft-bastion.png" "client connection" %}}

* Navigate to the [EC2 Instances](https://console.aws.amazon.com/ec2/v2/home#Instances:sort=instanceType) and select the instance. Copy and paste the **Public DNS** to notepad for later use.

{{% img "get-instance.png" "connection" %}}

* Select **Connect** and click on **Get Password** from **Connect to your instance** window.

{{% img "get-pwd-1.png" "connection" %}}

* Choose **Browse** to select the **.pem** key file that was saved in the **Getting started** section, click **Open**, and then click on **Decrypt Password**. 

{{% img "get-pwd-2.png" "connection" %}}

* Copy and paste the decrypted password to notepad for later use.

{{% img "get-pwd-3.png" "connection" %}}

* Open remote desktop client of your choice.

* Enter **EC2 Instance Public DNS** against **computer name** and **Administrator** in User name and click on Connect.

{{% img "get-pwd-4.png" "connection" %}}

* Enter the decrypted password and click on **Ok**.

{{% img "get-pwd-5.png" "connection" %}}

* After logging into bastion host, open **SSMS (SQL Server Management Studio)** to connect to SQL Server.

{{% img "ssms-1.png" "connection" %}}

* In `Server name` enter the RDS Endpoint, for `Login` provide the login (admin) and for `Password`, enter the password that you selected during RDS setup. Click on Connect.

{{% img "ssms-2.png" "connection" %}}

* You should be able to successfully connect to the Amazon RDS instance using SSMS.

{{% img "ssms-3.png" "connection" %}}