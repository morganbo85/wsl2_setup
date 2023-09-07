:: bat file to enable VM platform if not already enabled
:: HAVE TO RUN as ADMIN/SUDO

@echo off 

start dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
