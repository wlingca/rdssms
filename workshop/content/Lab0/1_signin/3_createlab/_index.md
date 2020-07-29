+++
title = "Creating lab environment (25 mins)"
date = 2020-04-20T22:52:43-05:00
weight = 30
+++

To simplify the getting started experience with the labs, we have created foundational templates for [AWS CloudFormation](https://aws.amazon.com/cloudformation/) that provision the resources needed for the lab environment. These templates are designed to deploy a consistent networking infrastructure, and client-side experience of software packages and components used in the lab.

* Click [**here**](cft-rdsSQL.yaml) to download the cloud formation template.
{{% img "download-template.png" "goto-cft" %}}

* Save the template on your computer and remember the location where you saved it.

* Click **Services** on the top menu, type **CloudFormation** in the input field, and press **Enter** and go to the CloudFormation Service

{{% img "goto-cft.png" "goto-cft" %}}

* On the CloudFormation console, and click  **Create Stack** in the right side of the screen.

{{% img "sel-create-stack.png" "sel-create-stack" %}}

* Select **Template is ready**, and choose **Upload a template file** as the source template. Then, click on **Choose file**

* Select the cloud formation template that you downloaded in the previous step and click on **Open**.
{{% img "upload-template.png" "goto-cft" %}}

* Click **Next**.


* In Stack details page populate the form with values specified below.

    | Input Parameter      | Value                                                                     |
    | -------------------  | ------------------------------------------------------------------------- |
    | Stack Name           | sqlimmersion-stack                                                        |
    | DomainAdminPassword  | Amazon1!                                                                  |
    | LatestAmiId          | /aws/service/ami-windows-latest/Windows_Server-2019-English-Full-SQL_2017_Express                                                |    
    | WinKeyName           | sqlimmersion ***(This is the keypair that you created in previous lab)*** |


* Scroll to the bottom of the page and click **Next**.

{{% img "console-labstack.png" "Console" %}}  

* Scroll to the bottom of **Configure stack options** page and click on **Next**.

{{% img "stack-options.png" "Console" %}}  

* On the **Review sqlimmersion-stack** page, scroll to the bottom of the page, **Acknowledge the creation of AM resources** and then click **Create stack.**

{{% img "review-labstack.png" "Console" %}}

The stack will take approximatively 30 minutes to provision, you can monitor the status on the **Stack detail** page.

