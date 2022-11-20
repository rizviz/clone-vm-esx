 
# Clone VM with ESXCli/Vsphere without VCenter

This tool automates clonning of a VM without the need of a VCenter by using the VMWare's VSphere/ESX command line interface. 

## Description
ESXi is built on the Linux kernel. And that gives us a lot of power and flexibility . All you need is ssh shell access and you can pretty much perform any task as you would on a linux box. This tool automates the tasks of gathering source VM's information like : 
* datastore location,
* creating target VM folder
* copying and customizing target VM files
* registering newly cloned VM with ESXi

## Steps
### Method 1: Automatic

### Method 2: Manual 
1. Clone the repo ` git clone https://github.com/rizviz/clone-vm-esx.git `
2. Copy the shell script to ESX host through scp ` cd clone-vm-esx; scp  clone-vm-esx.sh root@esxihost.local `
3. Login to ESXi host with ssh
3. Execute the shell script on the ESXi shell as : ` sh clone-vm.sh <source_vm_name> <target_vm_name>`
4. Example:  ` sh clone-vm.sh ub22-template-v2 k8snode01 `

### PreRequisites

Following are needed before installing : ESX SSH service enabled, SSH username/password , enough disk space in the datastore for cloning the VM. 

### Notes
* Cloning process is dependent on disk size and CPU/Mem of the ESX host. e.g. 8GB disk VM will take about 3-4 minutes but 32GB will take longer. 



## Authors
@rizviz

## License
This project is licensed under the Apache License - see the LICENSE.md file for details

## Acknowledgments

