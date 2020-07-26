+++
title = "In Transit Encryption with SSL (10 mins)"
date = 2020-06-07T15:32:22-04:00
weight = 45
+++

#### **Enable SSL from Parameters**

* Open the [Amazon RDS  service console](https://console.aws.amazon.com/rds/home) and click on [Parameters groups](https://console.aws.amazon.com/rds/home#parameter-groups:) from left navigation pane. Click on the Parameter group `sql-2017-force-ssl-enable-clr` that was created in the [Create new Parameter group](../lab4/2_newparamgroup.html) labs.
{{% img "ssl_1.png" "SSL" %}}

* Search the Parameter named **rds.force_ssl** from filter and select the filter then click on `Edit parameters`. 
{{% img "ssl_2.png" "SSL" %}}

* Select 1 from Values drop down for **rds.force_ssl** then click on Save changes.
{{% img "ssl_3.png" "SSL" %}}

* It would take a few minutes to apply new changes.

#### **Download and Install root certificate**

* On Bastion host download the Amazon RDS root certificate directly from this [location](https://s3.amazonaws.com/rds-downloads/rds-ca-2019-root.pem) in specified location. Alternatively open this [location](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL.html) and download the root certificate that works for all AWS Regions.

* On the Start menu, type Run in the search box and press Enter.

* In the Open box, type MMC and then choose OK.

* In the MMC console, on the File menu, choose Add/Remove Snap-in.

* In the Add or Remove Snap-ins dialog box, for Available snap-ins, select Certificates, and then choose Add.

* In the Certificates snap-in dialog box, choose Computer account, and then choose Next.

* In the Select computer dialog box, choose Finish.

* In the Add or Remove Snap-ins dialog box, choose OK.

* In the MMC console, expand Certificates, open the context (right-click) menu for Trusted Root Certification Authorities, choose All Tasks, and then choose Import.

* On the first page of the Certificate Import Wizard, choose Next.

* On the second page of the Certificate Import Wizard, choose Browse. In the browse window, change the file type to All files (*.*) because .pem is not a standard certificate extension. Locate the .pem file that you downloaded previously.

* Choose Open to select the certificate file, and then choose Next.
{{% img "ssl_4.png" "SSL" %}}

* On the third page of the Certificate Import Wizard, choose Next.

* On the fourth page of the Certificate Import Wizard, choose Finish. A dialog box appears indicating that the import was successful.

* In the MMC console, expand Certificates, expand Trusted Root Certification Authorities, and then choose Certificates. Locate the certificate to confirm it exists, as shown here. 
{{% img "ssl_5.png" "SSL" %}}

#### **Connect to SQL Server using SSL**

* Open SSMS and click on Connect.

* In **Connect to Server** Dialog box enter **Server Name**, **Login** and **Password** and then click on `Options`.
{{% img "ssl_6.png" "SSL" %}}

* From **Connection Properties** select `Encrypt connection` and click on Connect.
{{% img "ssl_7.png" "SSL" %}}

* You have now established a SSL Secured connection to SQL Server.