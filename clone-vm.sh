#!/bin/bash

if [ -z "$1" ]
   then
     echo
     echo " No configuration option specified. "
     echo "  Usage    : sh clone-vm.sh <source_vm_name> <target_vm_name>"
     echo "  Example: sh clone-vm.sh ub22-template-v2 k8snode01"
     exit
fi
export SOURCE_VM=$1
export TARGET_VM=$2
cd /vmfs/volumes/
export DATASTORE=`ls | grep datastore`
## Find source vm datastore 
cd /vmfs/volumes/$DATASTORE
pwd
## Create Target VM folder

mkdir -p /vmfs/volumes/$DATASTORE/$TARGET_VM
echo
ls
echo
cd /vmfs/volumes/$DATASTORE/$SOURCE_VM
pwd
echo "Changed to $SOURCE_VM VM Directory `pwd`"
echo
cp /vmfs/volumes/$DATASTORE/$SOURCE_VM/* /vmfs/volumes/$DATASTORE/$TARGET_VM/
# Customize target VM

cd /vmfs/volumes/$DATASTORE/$TARGET_VM/
vmkfstools -E $SOURCE_VM.vmdk $TARGET_VM.vmdk
mv $SOURCE_VM.vmx $TARGET_VM.vmx
sed -i s/$SOURCE_VM/$TARGET_VM/g $TARGET_VM.vmx
for f in *.vm*; do mv "$f" "$(echo "$f" | sed s/$SOURCE_VM/$TARGET_VM/)"; done
mv $SOURCE_VM.nvram $TARGET_VM.nvram
cd /vmfs/volumes/$DATASTORE
# Register newly cloned VM with VMWare ESXi

vim-cmd solo/registervm /vmfs/volumes/$DATASTORE/$TARGET_VM/$TARGET_VM.vmx
