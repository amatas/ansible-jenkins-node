Ansible role: Jenkins-node
==========================

Installs a standalone Jenkins node and configure the node at master.

It can also .create administrator users and install additional plugins.

At the moment of installation, the master hostname you pass through jenkins_master_host must be reachable and pointing to the server where Jenkins will be running (because some checks and operations are run against it during the installation).

The role uses the following [Ansible tags](http://docs.ansible.com/ansible/playbooks_tags.html) to control the provisioning process:

* ``install`` - installs Jenkins node software
* ``configure`` - sets up Jenkins node at master, and configure Systemd if needed.
* ``deploy`` - enable and start a Systemd unit if a VM or physical machine is being used or in the case of Docker, add a Supervisor config
* ``test`` - check the application's HTTP endpoint for a response to confirm it is working and check if Jenkins is working pulling the list of plugins using Jenkins-cli.

Requirements
------------

* [Ansible facts](https://github.com/idi-ops/ansible-facts)

Role Variables
--------------

* ``jenkins_node_name`` - Main name of the node
* ``jenkins_master_host`` - Hostname of the master, must be reachable by the client at the moment of the execution of the playbook
* ``jenkins_master_port`` - Listening port of the master, by default is 8080
* ``jenkins_node_description`` - Description of the node
* ``jenkins_node_fspath`` - Working path of the node, it will be created if doesn't exist.
* ``jenkins_node_executors`` - Number of executors of the node
* ``jenkins_node_labels`` - List of labels of the node
* ``jenkins_admin_credentials`` - Credentials to create the node at the master, it must be [ 'adminuser', 'password' ]


Please refer to the [defaults/main.yml](defaults/main.yml) file for a list of variables along with additional documentation.

Example Playbook
----------------

```
---

- hosts: slave1
  become: true

  vars:
    - jenkins_node_name: "slave1"
    - jenkins_master_host: "master"
    - jenkins_master_port: 8081
    - jenkins_node_description: "Description slave1"
    - jenkins_node_fspath: "/var/jenkins"
    - jenkins_node_executors: "3"
    - jenkins_node_labels:
      - centos7
      - linux
    - jenkins_admin_credentials: ["admin", "root"]

  roles:
    - ansible-facts
    - ansible-jenkins-node
 
```
License
-------

MIT

Author Information
------------------

* Inclusive Design Research Centre (OCAD University)
* Raising the floor - International

