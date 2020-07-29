+++
title = "High Availability (40 mins)"
date = 2020-04-22T23:10:18-05:00
weight = 20
chapter = true
+++

#### Before starting this lab, please complete
1. [Getting started](lab0.html)
2. [Create a new RDS SQL Server](lab1.html)

<div align="left">In this lab you will enable Multi-AZ for the RDS SQL Server Instance. Multi-AZ is the high availability feature in RDS. It deploys RDS database instances in multiple availability zones with synchronous replication between the instances. In the event of the primary database instance failure, the secondary instance automatically takes over to become the new primary.</div>  

## This lab contains following tasks:
1. [Modify the RDS Instance to enable Multi-AZ (HA)](lab2/1_enablemultiaz.html)
2. [Test Failover](lab2/2_failover.html)