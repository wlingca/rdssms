+++
title = "Verify lab environment"
date = 2020-04-21T21:18:20-05:00
weight = 40
+++

* Go to the [AWS Management Console](https://console.aws.amazon.com/), ensure you are on the correct AWS Region. If you’re in a different region, please change the region from the top right corner of the screen to the designated region.
{{% img "region.png" "Region" %}}

* Navigate to [AWS CloudFormation](https://console.aws.amazon.com/cloudformation/) and click on the **sqlimmersion-stack** stack.
{{% img "selStack.png" "stack" %}}

* If the status of the stack is **CREATE_COMPLETE**, click on the **Outputs** tab. Take a note of these values in a notepad that you have easy access to, as they will be critical to the completion of the remainder of the lab. You should see resources similar to below being created.

{{% img "output.png" "Console" %}}


