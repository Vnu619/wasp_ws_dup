# Install script for directory: /home/wasp1/wasp_ws/src/wasp_logistics

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/wasp1/wasp_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wasp_logistics/msg" TYPE FILE FILES "/home/wasp1/wasp_ws/src/wasp_logistics/msg/logistics.msg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wasp_logistics/action" TYPE FILE FILES
    "/home/wasp1/wasp_ws/src/wasp_logistics/action/Logistics.action"
    "/home/wasp1/wasp_ws/src/wasp_logistics/action/TrolleyAlign.action"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wasp_logistics/msg" TYPE FILE FILES
    "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsAction.msg"
    "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionGoal.msg"
    "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionResult.msg"
    "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionFeedback.msg"
    "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg"
    "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg"
    "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wasp_logistics/msg" TYPE FILE FILES
    "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignAction.msg"
    "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionGoal.msg"
    "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionResult.msg"
    "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionFeedback.msg"
    "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg"
    "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg"
    "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wasp_logistics/srv" TYPE FILE FILES "/home/wasp1/wasp_ws/src/wasp_logistics/srv/GetPose.srv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wasp_logistics/cmake" TYPE FILE FILES "/home/wasp1/wasp_ws/build/wasp_logistics/catkin_generated/installspace/wasp_logistics-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/wasp1/wasp_ws/devel/include/wasp_logistics")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/wasp1/wasp_ws/devel/share/roseus/ros/wasp_logistics")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/wasp1/wasp_ws/devel/share/common-lisp/ros/wasp_logistics")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/wasp1/wasp_ws/devel/share/gennodejs/ros/wasp_logistics")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/wasp1/wasp_ws/devel/lib/python3/dist-packages/wasp_logistics")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/wasp1/wasp_ws/devel/lib/python3/dist-packages/wasp_logistics")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/wasp_logistics" TYPE FILE FILES "/home/wasp1/wasp_ws/devel/include/wasp_logistics/testConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/wasp_logistics" TYPE FILE FILES "/home/wasp1/wasp_ws/devel/lib/python3/dist-packages/wasp_logistics/__init__.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/wasp1/wasp_ws/devel/lib/python3/dist-packages/wasp_logistics/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/wasp_logistics" TYPE DIRECTORY FILES "/home/wasp1/wasp_ws/devel/lib/python3/dist-packages/wasp_logistics/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/wasp1/wasp_ws/build/wasp_logistics/catkin_generated/installspace/wasp_logistics.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wasp_logistics/cmake" TYPE FILE FILES "/home/wasp1/wasp_ws/build/wasp_logistics/catkin_generated/installspace/wasp_logistics-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wasp_logistics/cmake" TYPE FILE FILES
    "/home/wasp1/wasp_ws/build/wasp_logistics/catkin_generated/installspace/wasp_logisticsConfig.cmake"
    "/home/wasp1/wasp_ws/build/wasp_logistics/catkin_generated/installspace/wasp_logisticsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wasp_logistics" TYPE FILE FILES "/home/wasp1/wasp_ws/src/wasp_logistics/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_logi_server" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_logi_server")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_logi_server"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics" TYPE EXECUTABLE FILES "/home/wasp1/wasp_ws/devel/lib/wasp_logistics/wasp_logistics_logi_server")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_logi_server" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_logi_server")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_logi_server"
         OLD_RPATH "/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_logi_server")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_logi_client" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_logi_client")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_logi_client"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics" TYPE EXECUTABLE FILES "/home/wasp1/wasp_ws/devel/lib/wasp_logistics/wasp_logistics_logi_client")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_logi_client" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_logi_client")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_logi_client"
         OLD_RPATH "/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_logi_client")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_align_server" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_align_server")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_align_server"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics" TYPE EXECUTABLE FILES "/home/wasp1/wasp_ws/devel/lib/wasp_logistics/wasp_logistics_align_server")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_align_server" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_align_server")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_align_server"
         OLD_RPATH "/opt/ros/noetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wasp_logistics/wasp_logistics_align_server")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/wasp_logistics" TYPE DIRECTORY FILES "/home/wasp1/wasp_ws/src/wasp_logistics/include/wasp_logistics/" FILES_MATCHING REGEX "/[^/]*\\.h$" REGEX "/\\.svn$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/wasp_logistics/launch" TYPE DIRECTORY FILES "/home/wasp1/wasp_ws/src/wasp_logistics/launch/" REGEX "/\\.svn$" EXCLUDE)
endif()

