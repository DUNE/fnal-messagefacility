# - Build messagefacility component
# This is a real mess, and we leave extensions out because it's not
# clear this is even used. Same for the classes_def.xml file
# Also not obvious if there is any split between public/private headers
# Some direct use of C++11 headers as well.

# - Base directories
set(messagefacility_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/messagefacility")
set(messagefacility_INCLUDE_DIR "${messagefacility_ROOT_DIR}/messagefacility")


#-----------------------------------------------------------------------
# Utilities
#
set(MessageFacility_Utilities_HEADERS
  ${messagefacility_INCLUDE_DIR}/Utilities/DebugMacros.h
  ${messagefacility_INCLUDE_DIR}/Utilities/do_nothing_deleter.h
  ${messagefacility_INCLUDE_DIR}/Utilities/exception.h
  ${messagefacility_INCLUDE_DIR}/Utilities/formatTime.h
  ${messagefacility_INCLUDE_DIR}/Utilities/JobMode.h
  ${messagefacility_INCLUDE_DIR}/Utilities/SingleConsumerQ.h
  ${messagefacility_INCLUDE_DIR}/Utilities/tinystr.h
  ${messagefacility_INCLUDE_DIR}/Utilities/tinyxml.h
  ${messagefacility_INCLUDE_DIR}/Utilities/UnixSignalHandlers.h
  )
set(MessageFacility_Utilities_SOURCES
  ${messagefacility_INCLUDE_DIR}/Utilities/DebugMacros.cc
  ${messagefacility_INCLUDE_DIR}/Utilities/exception.cc
  ${messagefacility_INCLUDE_DIR}/Utilities/formatTime.cc
  ${messagefacility_INCLUDE_DIR}/Utilities/SingleConsumerQ.cc
  ${messagefacility_INCLUDE_DIR}/Utilities/tinyxml.cc
  ${messagefacility_INCLUDE_DIR}/Utilities/tinyxmlerror.cc
  ${messagefacility_INCLUDE_DIR}/Utilities/tinyxmlparser.cc
  ${messagefacility_INCLUDE_DIR}/Utilities/UnixSignalHandlers.cc
  )

#-----------------------------------------------------------------------
# Logger/Service
#
set(MessageService_HEADERS
  ${messagefacility_INCLUDE_DIR}/MessageService/ELadministrator.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ELassertN.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ELcollected.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ELcontextSupplier.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ELdestControl.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ELdestination.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ELdestMakerMacros.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ELerrorList.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ELfwkJobReport.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ELlimitsTable.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ELostreamOutput.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ELrecv.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ELsender.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ELset.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ELstatistics.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ELtsErrorLog.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ELtsErrorLog.icc
  ${messagefacility_INCLUDE_DIR}/MessageService/ErrorLog.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ErrorLog.icc
  ${messagefacility_INCLUDE_DIR}/MessageService/MainThreadMLscribe.h
  ${messagefacility_INCLUDE_DIR}/MessageService/MessageLoggerDefaults.h
  ${messagefacility_INCLUDE_DIR}/MessageService/MessageLogger.h
  ${messagefacility_INCLUDE_DIR}/MessageService/MessageLoggerScribe.h
  ${messagefacility_INCLUDE_DIR}/MessageService/MessageServicePresence.h
  ${messagefacility_INCLUDE_DIR}/MessageService/MsgContext.h
  ${messagefacility_INCLUDE_DIR}/MessageService/MsgFormatSettings.h
  ${messagefacility_INCLUDE_DIR}/MessageService/MsgStatistics.h
  ${messagefacility_INCLUDE_DIR}/MessageService/Presence.h
  ${messagefacility_INCLUDE_DIR}/MessageService/SingleThreadMSPresence.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ThreadQueue.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ThreadSafeErrorLog.h
  )
set(MessageLogger_HEADERS
  ${messagefacility_INCLUDE_DIR}/MessageLogger/AbstractMLscribe.h
  ${messagefacility_INCLUDE_DIR}/MessageLogger/ConfigurationHandshake.h
  ${messagefacility_INCLUDE_DIR}/MessageLogger/ELextendedID.h
  ${messagefacility_INCLUDE_DIR}/MessageLogger/ELlist.h
  ${messagefacility_INCLUDE_DIR}/MessageLogger/ELmap.h
  ${messagefacility_INCLUDE_DIR}/MessageLogger/ELseverityLevel.h
  ${messagefacility_INCLUDE_DIR}/MessageLogger/ELseverityLevel.icc
  ${messagefacility_INCLUDE_DIR}/MessageLogger/ELstring.h
  ${messagefacility_INCLUDE_DIR}/MessageLogger/ErrorObj.h
  ${messagefacility_INCLUDE_DIR}/MessageLogger/ErrorObj.icc
  ${messagefacility_INCLUDE_DIR}/MessageLogger/ErrorSummaryEntry.h
  ${messagefacility_INCLUDE_DIR}/MessageLogger/ExceptionMessages.h
  ${messagefacility_INCLUDE_DIR}/MessageLogger/JobReport.h
  ${messagefacility_INCLUDE_DIR}/MessageLogger/LoggedErrorsSummary.h
  ${messagefacility_INCLUDE_DIR}/MessageLogger/MessageDrop.h
  ${messagefacility_INCLUDE_DIR}/MessageLogger/MessageFacilityMsg.h
  ${messagefacility_INCLUDE_DIR}/MessageLogger/MessageLogger.h
  ${messagefacility_INCLUDE_DIR}/MessageLogger/MessageLoggerQ.h
  ${messagefacility_INCLUDE_DIR}/MessageLogger/MessageSender.h
  ${messagefacility_INCLUDE_DIR}/MessageLogger/SilentMLscribe.h
  ${messagefacility_INCLUDE_DIR}/MessageLogger/ThreadSafeErrorLog.icc
  )
set(MessageFacility_HEADERS ${MessageService_HEADERS} ${MessageLogger_HEADERS})

set(MessageFacility_SOURCES
  ${messagefacility_INCLUDE_DIR}/MessageService/ELadministrator.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/ELcollected.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/ELdestControl.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/ELdestination.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/ELerrorList.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/ELfwkJobReport.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/ELlimitsTable.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/ELostreamOutput.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/ELrecv.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/ELstatistics.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/ELtsErrorLog.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/ErrorLog.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/HardwiredDefaults.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/MainThreadMLscribe.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/MessageLogger.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/MessageLoggerDefaults.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/MessageLoggerScribe.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/MessageServicePresence.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/MsgContext.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/MsgFormatSettings.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/MsgStatistics.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/Presence.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/SingleThreadMSPresence.cc
  ${messagefacility_INCLUDE_DIR}/MessageService/ThreadQueue.cc
  ${messagefacility_INCLUDE_DIR}/MessageLogger/AbstractMLscribe.cc
  ${messagefacility_INCLUDE_DIR}/MessageLogger/ELextendedID.cc
  ${messagefacility_INCLUDE_DIR}/MessageLogger/ELmap.cc
  ${messagefacility_INCLUDE_DIR}/MessageLogger/ELseverityLevel.cc
  ${messagefacility_INCLUDE_DIR}/MessageLogger/ELstring.cc
  ${messagefacility_INCLUDE_DIR}/MessageLogger/ErrorObj.cc
  ${messagefacility_INCLUDE_DIR}/MessageLogger/ExceptionMessages.cc
  ${messagefacility_INCLUDE_DIR}/MessageLogger/JobReport.cc
  ${messagefacility_INCLUDE_DIR}/MessageLogger/LoggedErrorsSummary.cc
  ${messagefacility_INCLUDE_DIR}/MessageLogger/MessageDrop.cc
  ${messagefacility_INCLUDE_DIR}/MessageLogger/MessageFacilityMsg.cc
  ${messagefacility_INCLUDE_DIR}/MessageLogger/MessageLogger.cc
  ${messagefacility_INCLUDE_DIR}/MessageLogger/MessageLoggerQ.cc
  ${messagefacility_INCLUDE_DIR}/MessageLogger/MessageSender.cc
  ${messagefacility_INCLUDE_DIR}/MessageLogger/SilentMLscribe.cc
  )

set_source_files_properties(${MessageFacility_HEADERS}
  PROPERTIES
    HEADER_FILE_ONLY TRUE
  )

add_library(obj-messagefacility OBJECT
  ${MessageFacility_HEADERS}
  ${MessageFacility_SOURCES}
  ${MessageFacility_Utilities_HEADERS}
  ${MessageFacility_Utilities_SOURCES}
  )

# - New plugins. Need to link to FNALCore eventually
# There is an oddity here - there is (surprise, surprise...) yet
# another library "MF_FileFormat", but it lives under the mfplugins
# namespace and only appears used by "file_mfPlugin" and "file_mfStatsPlugin"
# Not clear if this is private functionality of MessageFacility, or intended
# for use by other plugins (header does not appear to be installed, but
# with cetbuildtools who knows).
# - TEMP: Just build the core ones
add_library(messagefacility_cout_mfPlugin SHARED
  ${messagefacility_INCLUDE_DIR}/MessageService/plugins/cout_mfPlugin.cc)
target_link_libraries(messagefacility_cout_mfPlugin FNALCore)

add_library(messagefacility_cerr_mfPlugin SHARED
  ${messagefacility_INCLUDE_DIR}/MessageService/plugins/cerr_mfPlugin.cc)
target_link_libraries(messagefacility_cerr_mfPlugin FNALCore)

add_library(messagefacility_syslog_mfPlugin SHARED
  ${messagefacility_INCLUDE_DIR}/MessageService/plugins/syslog_mfPlugin.cc)
target_link_libraries(messagefacility_syslog_mfPlugin FNALCore)

add_library(messagefacility_cout_mfStatsPlugin SHARED
  ${messagefacility_INCLUDE_DIR}/MessageService/plugins/cout_mfStatsPlugin.cc)
target_link_libraries(messagefacility_cout_mfStatsPlugin FNALCore)

add_library(messagefacility_cerr_mfStatsPlugin SHARED
  ${messagefacility_INCLUDE_DIR}/MessageService/plugins/cerr_mfStatsPlugin.cc)
target_link_libraries(messagefacility_cerr_mfStatsPlugin FNALCore)



# TEMP local install of headers
install(FILES ${MessageFacility_Utilities_HEADERS}
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/FNALCore/messagefacility/Utilities
  COMPONENT Development
  )
install(FILES ${MessageService_HEADERS}
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/FNALCore/messagefacility/MessageService
  COMPONENT Development
  )
install(FILES ${MessageLogger_HEADERS}
  DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/FNALCore/messagefacility/MessageLogger
  COMPONENT Development
  )

# Also install plugins, though we don't need to export these because
# they're not designed to be linked to
install(TARGETS
  messagefacility_cout_mfPlugin
  messagefacility_cerr_mfPlugin
  messagefacility_syslog_mfPlugin
  messagefacility_cout_mfStatsPlugin
  messagefacility_cerr_mfStatsPlugin
  DESTINATION ${CMAKE_INSTALL_LIBDIR}
  COMPONENT Runtime
  )

#-----------------------------------------------------------------------
# Annnnd.... We have to build the test executable that for some surely
# very good reason resides in the library sources...
# Except as per Redmine 8020, it's an actual application, so better
# install and export it!!
add_executable(ELdestinationTester
  ${messagefacility_INCLUDE_DIR}/MessageService/ELdestinationTester.h
  ${messagefacility_INCLUDE_DIR}/MessageService/ELdestinationTester.cc
  )
target_link_libraries(ELdestinationTester FNALCore)
install(TARGETS ELdestinationTester
  EXPORT FNALCoreExports
  DESTINATION ${CMAKE_INSTALL_BINDIR}
  COMPONENT Development
  )

