# SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#
# SPDX-License-Identifier: EPICS

TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = systemMonitor
# systemMonitor.dbd will be created and installed
DBD += systemMonitor.dbd

# systemMonitor.dbd will be made up from these files:
systemMonitor_DBD += base.dbd

# Include dbd files from all support applications:
#systemMonitor_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#systemMonitor_LIBS += xxx

# systemMonitor_registerRecordDeviceDriver.cpp derives from systemMonitor.dbd
systemMonitor_SRCS += systemMonitor_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
systemMonitor_SRCS_DEFAULT += systemMonitorMain.cpp
systemMonitor_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#systemMonitor_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
systemMonitor_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

