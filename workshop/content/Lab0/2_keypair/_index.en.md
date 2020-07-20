+++
title = "Create Key Pair"
date = 2020-05-13T15:53:01-04:00
weight = 20
+++

* Open [**Amazon EC2** console](https://console.aws.amazon.com/ec2), in the navigation pane choose **Key Pairs**. Then click **Create key pair**.

{{% img "keypair-add.png" "keypair" %}}

* Provide following information for create key pair

    * `Name`: sqlimmersion

    * `File format`: pem

* Click on **Create key pair**.
{{% img "keypair-file.png" "keypair" %}}

* You will get a prompt to save the keypair file, please save file at a safe location, you will need this file to access bastion host.
{{% img "keypair-save.png" "keypair" %}}

{{% notice warning %}}
**Key pair**  
key pair is required to decrypt the initial password. Please keep the key pair in safe location and remember the location where you keep it. You won't be able to download key pair file again.
{{% /notice %}}