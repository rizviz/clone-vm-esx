 
# Clone VM with ESXCli/Vsphere without VCenter

This tool automates clonning of a VM without the need of a VCenter by using the VMWare's VSphere/ESX command line interface. 

## Description
Cloning a VM usually requires VCenter based on official documentation which means additional license (cost). This is a 'hack' way of cloning a template VM to a new VM in a fast, cost effective and quick fashion. You can run  multiple clone processes to automate creating of multiple VMs from a single source template. 

ESXi is built on the Linux kernel. And that gives us a lot of power and flexibility . All you need is ssh shell access and you can pretty much perform any task as you would on a linux box. 

Cloning manually through ESXi GUI can be really cumbersome and time consuming process. This tool automates those tasks using ESX cli . It takes care of : 

* Gathering VM datastore location
* creating target VM folder
* copying and customizing target VM files
* registering newly cloned VM with ESXi

## Steps
### Method 1: Automatic download to ESXi
1. Login to ESXi with ssh 
2. Direct download to ESX shell : ` wget -O clone-vm-esx.sh https://raw.githubusercontent.com/rizviz/clone-vm-esx/main/clone-vm.sh --no-check
-certificate ; chmod +x clone-vm-esx.sh `
3. Clone desired VM e.g. : `  sh clone-vm.sh ub22-template-v2 k8snode01 `

### Method 2: Manual download first
1. Clone the repo ` git clone https://github.com/rizviz/clone-vm-esx.git `
2. Copy the shell script to ESX host through scp ` cd clone-vm-esx; scp  clone-vm-esx.sh root@esxihost.local `
3. Login to ESXi host with ssh
3. Execute the shell script on the ESXi shell as : ` sh clone-vm.sh <source_vm_name> <target_vm_name>`
4. Example:  ` sh clone-vm.sh ub22-template-v2 k8snode01 ` 

Once the cloning is complete , power up new VM and select "I Copied it" from the pop up menu on the ESXi client. Don't forget to change the hostname and IP of the target VM to avoid conflict with source VM configuration

### PreRequisites

Following are needed before installing : ESX SSH service enabled, SSH username/password , a template VM (or for that matter any VM you'd want to clone) and enough disk space in the datastore for cloning the VM. 

### Notes
* Cloning process is dependent on disk size and CPU/Mem of the ESX host. e.g. 8GB disk VM will take about 3-4 minutes but 32GB will take longer. 



## Authors
@rizviz

## License
This project is licensed under the Apache License - see the LICENSE.md file for details

## Acknowledgments

