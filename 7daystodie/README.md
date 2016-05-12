ansible-7days
=============
Ansible Playbook for setting up a 7 Days to Die Server on CentOS/RHEL/Fedora

![ELK](/image/ansible-elk.png?raw=true)

**What does it do?**
   - Automated deployment of a full ELK stack (Elasticsearch, Logstash, Kibana)
     * Adds either iptables or firewalld rules if firewall is active
     * Tunes Elasticsearch heapsize to half your memory, to a max of 32G
     * Deploys ELK clients using SSL and Filebeat
     * More information [available here](https://hobo.house/2016/04/08/automate-elk-stack-and-clients-with-ansible/)

**Requirements**
   - RHEL7 or CentOS7+ server/client with no modifications
     - Fedora 23 or higher needs to have ```yum python2 python2-dnf libselinux-python``` packages.
       * You can run this against Fedora clients prior to running Ansible ELK:
       - ```ansible fedora-client-01 -u root -m shell -i hosts -a "dnf install yum python2 libsemanage-python python2-dnf -y"```
   - Deployment tested on Ansible 1.9.4 and 2.0.2

**Notes**
   - Sets the nginx htpasswd to admin/admin initially
   - nginx listen ports default to 80/8080 for Kibana and SSL cert retrieval
     - You can modify this in the ```group_vars/all``` file
   - Uses OpenJDK for Java
   - It's fairly quick, takes around 3minutes on test VM
   - Filebeat templating is focused around OpenStack service logs

**ELK Server Instructions**
   - Clone repo and setup your hosts file
```
git clone https://github.com/sadsfae/ansible-elk
cd ansible-elk
sed -i 's/host-01/elkserver/' hosts
sed -i 's/host-02/elkclient/' hosts
```
   - Run the playbook
```
ansible-playbook -i hosts install/elk.yml
```
   - Navigate to the server at http://yourhost
   - Default login is admin/admin
![ELK](/image/elk-index.png?raw=true "Click the green button.")

**ELK Client Instructions**
   - Run the client playbook against the generated elk_server variable
```
ansible-playbook -i hosts install/elk-client.yml --extra-vars 'elk_server=X.X.X.X'
```
   - You can view a deployment video here:


[![Ansible Elk](http://img.youtube.com/vi/6is6Ecxc2zE/0.jpg)](http://www.youtube.com/watch?v=6is6Ecxc2zE "Deploying ELK with Ansible")


**File Hierarchy**
```
```

