#!../../bin/linux-x86_64/systemMonitor

#- SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#-
#- SPDX-License-Identifier: EPICS

#- You may have to change systemMonitor to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

epicsEnvSet("EPICS_DB_INCLUDE_PATH", "${TOP}/db")

## Register all support components
dbLoadDatabase "dbd/systemMonitor.dbd"
systemMonitor_registerRecordDeviceDriver pdbbase

dbLoadRecords("db/linStatHost.db", "IOC=$(IOC)")
dbLoadRecords("db/linStatProc.db", "IOC=$(IOC)")
dbLoadRecords("db/linStatFS.db", "P=$(IOC):ROOT,DIR=/")
dbLoadRecords("db/linStatFS.db", "P=$(IOC):BOOT,DIR=/boot")

cd "${TOP}/iocBoot/${IOC}"
iocInit

