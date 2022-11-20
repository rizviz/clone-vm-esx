 
# Clone VM with ESXCli/Vsphere without VCenter

This tool automates clonning of a VM without the need of a VCenter by using the VMWare's VSphere/ESX command line interface. 

## Description
ESXi is built on the Linux kernel. And that gives us a lot of power and flexibility . All you need is ssh shell access and you can pretty much perform any task as you would on a linux box. This tool automates the tasks of gathering source VM's information like : 
* datastore location,
* creating target VM folder
* copying and customizing target VM files
* registering newly cloned VM with ESXi

## Getting Started
1. Clone the repo
2. Copy the shell script to ESX host through scp
3. Execute the shell script as : ` sh clone-vm.sh <source_vm_name> <target_vm_name>`
4. Example:  ` sh clone-vm.sh ub22-template-v2 k8snode01 `

### PreRequisites

Following are needed before installing : ESX SSH service enabled, SSH username/password , enough disk space in the datastore for cloning the VM. 

### Notes
* Cloning process is dependent on disk size and CPU/Mem of the ESX host



## Authors
@rizviz

## License
This project is licensed under the Apache License - see the LICENSE.md file for details

## Acknowledgments

