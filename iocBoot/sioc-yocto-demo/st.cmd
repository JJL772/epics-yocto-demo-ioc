#!../../bin/linux-x86_64/systemMonitor

#- SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#-
#- SPDX-License-Identifier: EPICS

#- You may have to change systemMonitor to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

epicsEnvSet("EPICS_DB_INCLUDE_PATH", "${TOP}/db")

# Register all support components
dbLoadDatabase "dbd/systemMonitor.dbd"
systemMonitor_registerRecordDeviceDriver pdbbase

# Load linStat records
dbLoadRecords("db/linStatHost.db", "IOC=$(EPICS_IOC_PV)")
dbLoadRecords("db/linStatProc.db", "IOC=$(EPICS_IOC_PV)")
dbLoadRecords("db/linStatFS.db", "P=$(EPICS_IOC_PV):ROOT,DIR=/")
dbLoadRecords("db/linStatFS.db", "P=$(EPICS_IOC_PV):BOOT,DIR=/boot")

cd "${TOP}/iocBoot/${IOC}"
iocInit
