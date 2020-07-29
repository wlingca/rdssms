+++
title = "Sign in: from an AWS event"
date = 2020-04-20T22:43:00-05:00
weight = 10 
+++

<div align="left">If you are <strong>NOT</strong> running this workshop in an AWS-sponsored or AWS-staffed event, please go to <a href="1_signin.html">Sign in: using regular AWS account</a>.</div><br>

<div align="left">If you are running this workshop in an AWS-sponsored or AWS-staffed event, it is likely that you are given a temporary AWS account environment. This allows you to run the workshop without incurring any usage fees and also provides a clean environment with some prerequisite resources already pre-provisioned to save time.</div><br>

<div align="left">At the beginning of the workshop you have been provided with a <strong>12-character access code</strong>. This access code grants you permission to use a dedicated AWS account for the purpose of this workshop. Your workshop instructor or lead presenter will also share with you the AWS Region in which the workshop will be used.</div>

* Go to [Event Engine Dashboard](https://dashboard.eventengine.run/login), enter the access code and click on **Accept Terms & Login**. 
{{% img "ee1.png" "ee" %}}

* On the **Team Dashboard**, please click **AWS Console** to log into the AWS Management Console. 
{{% img "ee2.png" "ee" %}}

* Click **Open Console**. For the purposes of this workshop, you will not need to use command line and API access credentials.
{{% img "ee3.png" "ee" %}}

* On your browser, return to [Event Engine Dashboard](https://dashboard.eventengine.run/), you should be back on the **Team Dashboard**, click on **SSH Key**.
{{% img "ee4.png" "ee" %}}

* Click on the **Download Key** button. This will download the .pem file. Remember the location that you saved the pem keypair file on your computer. You will use this file later to decrypt the Windows login password in order to log on to the remote desktop.
{{% img "ee5.png" "ee" %}}

{{% notice info %}}
We use Remote Desktop Protocol (RDP) to connect to the Amazon EC2 Instance. Please ensure you have a RDP client such as Microsoft Remote Desktop installed on your workstation.
{{% /notice %}}

* You should have your base lab environment created as part of the event setup. Please proceed to [Verify lab environment](lab0/4_verifylab.html).