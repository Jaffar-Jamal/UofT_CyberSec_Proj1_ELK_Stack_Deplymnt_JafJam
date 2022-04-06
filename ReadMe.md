# Automated ELK Stack Deployment – by Jaffar Jamal

The files in this repository were used to configure the network depicted in the diagram below.

![__ELK Stack Diagram__ by __Jaffar Jamal__](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Diagrams/ELK_Stack_Diagram.png)

Thes files below have been tested and used to generate a live ELK deployment on [__Azure__](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Images/Azure%20Home.JPG). They can be used to recreate the entire deployment pictured in the above diagram. Alternatively, select portions of the playbook files may be used to install only certain pieces of it, such as Filebeat.

[Ansible Configuration](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Ansible/ansible.cfg.txt)

[Hosts](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Ansible/hosts.txt)

[Web VM DVWA w/Docker](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Ansible/pentest.yml.txt)

[ELK Server w/Docker](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Ansible/install-elk.yml.txt)

[Filebeat Configuration](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Ansible/filebeat-config.yml.txt)

[Filebeat Playbook](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Ansible/filebeat-playbook.yml.txt)

[Metricbeat Configuration](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Ansible/metricbeat-config.yml.txt)

[Metricbeat Playbook](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Ansible/metricbeat-playbook.yml.txt)

If you run into errors using the playbooks above, please replace the beats version in the playbook with the latest available version from [__Elastic.__](https://www.elastic.co/downloads/beats/)

__This document contains the following details:__

•	Description of the Topology

•	Access Policies

•	ELK Configuration

    - Beats in Use
    - Machines Being Monitored

•	How to Use the Ansible Build

# Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly responsive, in addition to restricting access to the network.

A __Load Balancer__ increases availability and reliability of a service while defending it from threats such as DDoS attacks, by routing traffic from one server to another if either becomes unavailable.
	
A __Jump Box__ acts as a gateway and provides quick remote access to servers in an infrastructure through SSH. As accessing each server directly increases the risk of exposing them, jump boxes act as a single point of access to the internal network that also creates logs for any failed login attempts.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the files and system logs.

__Filebeat__ watches for log files and events, collects and forwards them to Elasticsearch or Logstash.

__Metricbeat__ watches for key metrics from the operating system and services running on the servers, collects and forwards them to Elasticsearch or Logstash.

The configuration details of each [__virtual machine__](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Images/Azure%20-VMs.JPG) can be seen below.

| Name               | Operating System | Function   | Public IP      | Internal IP |
|--------------------|------------------|------------|----------------|-------------|
| JumpBoxProvisioner | Linux - Ubuntu   | Gateway    | 20.211.176.243 | 10.1.0.4    |
| Web-1              | Linux - Ubuntu   | Web Server | 20.211.110.180 | 10.1.0.5    |
| Web-2              | Linux - Ubuntu   | Web Server | 20.211.110.180 | 10.1.0.6    |
| Web-3              | Linux - Ubuntu   | Web Server | None           | 10.1.0.7    |
| ELK-Server         | Linux - Ubuntu   | ELK Stack  | 20.37.255.53   | 10.0.0.4    |

# Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the __JumpBoxProvisioner__ machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

     -  My Public IP (undisclosed for privacy) over Port 22.

Machines within the network can only be accessed by __JumpBoxProvisioner__.

•	Machines allowed to access my __ELK-Server__:

    - My Local Host Machine over Port 5601
    - Any over SSH

•	IP addresses:

    - My Public IP (undisclosed for privacy) over Port 5601
    - Any over Port 22

A summary of the access policies in place can be found in the table below.

| Name               | Publicly Accessible | Allowed IP Addresses          |
|--------------------|---------------------|-------------------------------|
| JumpBoxProvisioner | No                  | My Public IP (22)             |
| Bug-Bytes-LB       | No                  | My Public IP (80)             |
| Web-1              | No                  | 10.1.0.4                      |
| Web-2              | No                  | 10.1.0.4                      |
| Web-3              | No                  | 10.1.0.4                      |
| ELK-Server         | Yes                 | My Public IP (5601), Any (22) |


# Elk Configuration

__Ansible__ was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it is simple, easy to configure and set up.

The main advantage of automating configuration with Ansible is the ability to create playbooks using YAML and use it to deploy multiple applications.

The playbook implements the following tasks:

•	Configures the ELK VM with docker by downloading and installing docker.io.

•	Prepares the ELK VM for Ansible automation by downloading Python3.

•	Installs the Docker module and increases virtual memory to set value.

•	Downloads and launches the Docker ELK container and enables it on boot.

The screenshot below displays the result of running __docker ps__ after successfully configuring the ELK instance.

![**screenshot**](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Images/docker_ps_output.JPG)

# Target Machines & Beats

This ELK server is configured to monitor the following machines:

•	Web-1 – 10.1.0.5

•	Web-2 - 10.1.0.6

•	Web-3 - 10.1.0.7

I have installed the following Beats on these machines:

•	[__Filebeat__](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Images/Filebeat.JPG) on ELK Server.

•	[__Metricbeat__](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Images/Metricbeat.JPG) on Web-1, Web-2 and Web-3.

These Beats allow us to collect the following information from each machine:

•	__Filebeat__ monitors and collects system logs, server logs, SQL logs, GC logs and audit logs to name a few. It then forwards them to ELK for indexing which can later be filtered and reviewed to identify and examine specific events.

 Link to => [Filebeat logs](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Images/Filebeat_logs.JPG)

•	__Metricbeat__ monitors and collects metrics from operating systems and services that run on the server. These metrics can include CPU and memory usage, memory and network stats, which is used to identify and examine any non-standard unusual behaviors consuming system resources.

Link to => [Metricbeat logs](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Images/Metricbeat_logs.JPG)

# Using the Playbook

In order to use the playbook, you will need to have an __Ansible__ control node already configured. Assuming you have such a control node provisioned: 

•	Copy the [__install-elk.yml__](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Ansible/install-elk.yml.txt) file to the Ansible folder.

•	Update the [__hosts__](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Ansible/hosts.txt) file to include the internal IP addresses of Web-Servers 1, 2 and 3 under the [webservers] group. 

• Create an [ELK] group and add the internal IP address of the ELK server under the new group in the same [__hosts__](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Ansible/hosts.txt) file.

• Do not forget to include ansible_python_interpreter=/usr/bin/python3 to each IP address as shown [here](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Images/Host_file_with_VMs.JPG).

•	The [__filebeat-playbook.yml__](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Ansible/filebeat-playbook.yml.txt) installs the Filebeat on the ELK server as the group [ELK] is assigned as the host.

•	The [__metricbeat-playbook.yml__](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Ansible/metricbeat-playbook.yml.txt) installs the Metricbeat on the Webservers as the group [webservers] is assigned as the host.

•	To run the playbook, use the command: __ansible-playbook [playbook name].yml__ from the Ansible folder. 
For e.g., ansible-playbook filebeat-playbook.yml.

After running the playbooks successfully with no errors, navigate to http://[your_elk_server_public_ip]:5601/app/kibana on your host browser to check that the installation worked as expected. You should see the Kibana webpage below starting with the public IP of your ELK machine:

![__My Kibana Homepage__](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Images/Kibana_Home.JPG) 

Additional screenshots for Kibana:

[__My Kibana Logs 1__](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Images/Kibana%20-%20Most%20Bytes%20(activity).JPG) [__My Kibana Logs 2__](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Images/Kibana%20-%20404%20last%202%20days.jpg) [__My Kibana Logs 3__](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Images/Kibana%20-%20503%20last%202%20days.jpg) [__MY Kibana Logs 4__](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Images/Kibana%20-%20India%207%20days.JPG) [__My Kibana Logs 5__](https://github.com/Jaffar-Jamal/UofT_CyberSec_Proj1_ELK_Stack_Deplymnt_JafJam/blob/1a89681c5a7ef359d63eb3e1f4fa7ff7a975d343/Images/Kibana%20-%20Files%20downloaded.JPG)

__If this is what you see after deploying, congratulations! You too have successfully configured and deployed an automated ELK stack.__

# References:

https://avinetworks.com/what-is-load-balancing/#:~:text=Load%20Balancing%20Definition%3A%20Load%20balancing,applications%20and%20websites%20for%20users.

https://www.f5.com/services/resources/glossary/load-balancer

https://goteleport.com/blog/ssh-jump-server/

https://rangle.io/blog/jumpboxes-avoid-storing-ssh-keys/

https://en.wikipedia.org/wiki/Jump_server

https://www.elastic.co/guide/en/beats/filebeat/current/filebeat-overview.html#:~:text=Filebeat%20overviewedit,Elasticsearch%20or%20Logstash%20for%20indexing.

https://www.elastic.co/guide/en/beats/metricbeat/current/metricbeat-overview.html#:~:text=Metricbeat%20takes%20the%20metrics%20and,Apache

https://www.simplilearn.com/tutorials/ansible-tutorial/what-is-ansible#:~:text=Benefits%20of%20Ansible,-Free%3A%20Ansible%20is&text=Very%20simple%20to%20set%20up,no%20matter%20where%20it's%20deployed.
