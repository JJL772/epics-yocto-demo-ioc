#!../../bin/linux-x86_64/systemMonitor

#- SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#-
#- SPDX-License-Identifier: EPICS

#- You may have to change systemMonitor to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/systemMonitor.dbd"
systemMonitor_registerRecordDeviceDriver pdbbase

## Load record instances
#dbLoadRecords("db/systemMonitor.db","user=jeremy")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=jeremy"
