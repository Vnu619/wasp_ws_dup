# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "wasp_logistics: 15 messages, 1 services")

set(MSG_I_FLAGS "-Iwasp_logistics:/home/wasp1/wasp_ws/src/wasp_logistics/msg;-Iwasp_logistics:/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(wasp_logistics_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wasp1/wasp_ws/src/wasp_logistics/msg/logistics.msg" NAME_WE)
add_custom_target(_wasp_logistics_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wasp_logistics" "/home/wasp1/wasp_ws/src/wasp_logistics/msg/logistics.msg" ""
)

get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsAction.msg" NAME_WE)
add_custom_target(_wasp_logistics_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wasp_logistics" "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsAction.msg" "wasp_logistics/LogisticsActionFeedback:wasp_logistics/LogisticsResult:wasp_logistics/LogisticsFeedback:std_msgs/Header:actionlib_msgs/GoalID:wasp_logistics/LogisticsActionGoal:wasp_logistics/LogisticsActionResult:wasp_logistics/LogisticsGoal:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionGoal.msg" NAME_WE)
add_custom_target(_wasp_logistics_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wasp_logistics" "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionGoal.msg" "std_msgs/Header:actionlib_msgs/GoalID:wasp_logistics/LogisticsGoal"
)

get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionResult.msg" NAME_WE)
add_custom_target(_wasp_logistics_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wasp_logistics" "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionResult.msg" "actionlib_msgs/GoalStatus:std_msgs/Header:wasp_logistics/LogisticsResult:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionFeedback.msg" NAME_WE)
add_custom_target(_wasp_logistics_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wasp_logistics" "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionFeedback.msg" "actionlib_msgs/GoalStatus:std_msgs/Header:wasp_logistics/LogisticsFeedback:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg" NAME_WE)
add_custom_target(_wasp_logistics_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wasp_logistics" "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg" ""
)

get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg" NAME_WE)
add_custom_target(_wasp_logistics_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wasp_logistics" "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg" ""
)

get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg" NAME_WE)
add_custom_target(_wasp_logistics_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wasp_logistics" "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg" ""
)

get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignAction.msg" NAME_WE)
add_custom_target(_wasp_logistics_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wasp_logistics" "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignAction.msg" "wasp_logistics/TrolleyAlignFeedback:wasp_logistics/TrolleyAlignGoal:wasp_logistics/TrolleyAlignActionResult:wasp_logistics/TrolleyAlignActionFeedback:std_msgs/Header:actionlib_msgs/GoalID:wasp_logistics/TrolleyAlignResult:wasp_logistics/TrolleyAlignActionGoal:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionGoal.msg" NAME_WE)
add_custom_target(_wasp_logistics_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wasp_logistics" "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionGoal.msg" "std_msgs/Header:actionlib_msgs/GoalID:wasp_logistics/TrolleyAlignGoal"
)

get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionResult.msg" NAME_WE)
add_custom_target(_wasp_logistics_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wasp_logistics" "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionResult.msg" "actionlib_msgs/GoalStatus:std_msgs/Header:wasp_logistics/TrolleyAlignResult:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionFeedback.msg" NAME_WE)
add_custom_target(_wasp_logistics_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wasp_logistics" "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionFeedback.msg" "actionlib_msgs/GoalStatus:std_msgs/Header:wasp_logistics/TrolleyAlignFeedback:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg" NAME_WE)
add_custom_target(_wasp_logistics_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wasp_logistics" "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg" ""
)

get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg" NAME_WE)
add_custom_target(_wasp_logistics_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wasp_logistics" "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg" ""
)

get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg" NAME_WE)
add_custom_target(_wasp_logistics_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wasp_logistics" "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg" ""
)

get_filename_component(_filename "/home/wasp1/wasp_ws/src/wasp_logistics/srv/GetPose.srv" NAME_WE)
add_custom_target(_wasp_logistics_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "wasp_logistics" "/home/wasp1/wasp_ws/src/wasp_logistics/srv/GetPose.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(wasp_logistics
  "/home/wasp1/wasp_ws/src/wasp_logistics/msg/logistics.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_cpp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsAction.msg"
  "${MSG_I_FLAGS}"
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionFeedback.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionGoal.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_cpp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_cpp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_cpp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_cpp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_cpp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_cpp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_cpp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignAction.msg"
  "${MSG_I_FLAGS}"
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_cpp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_cpp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_cpp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_cpp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_cpp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_cpp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics
)

### Generating Services
_generate_srv_cpp(wasp_logistics
  "/home/wasp1/wasp_ws/src/wasp_logistics/srv/GetPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics
)

### Generating Module File
_generate_module_cpp(wasp_logistics
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(wasp_logistics_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(wasp_logistics_generate_messages wasp_logistics_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wasp1/wasp_ws/src/wasp_logistics/msg/logistics.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_cpp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsAction.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_cpp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_cpp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_cpp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_cpp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_cpp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_cpp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_cpp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignAction.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_cpp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_cpp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_cpp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_cpp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_cpp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_cpp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_cpp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/src/wasp_logistics/srv/GetPose.srv" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_cpp _wasp_logistics_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wasp_logistics_gencpp)
add_dependencies(wasp_logistics_gencpp wasp_logistics_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wasp_logistics_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(wasp_logistics
  "/home/wasp1/wasp_ws/src/wasp_logistics/msg/logistics.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics
)
_generate_msg_eus(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsAction.msg"
  "${MSG_I_FLAGS}"
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionFeedback.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionGoal.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics
)
_generate_msg_eus(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics
)
_generate_msg_eus(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics
)
_generate_msg_eus(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics
)
_generate_msg_eus(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics
)
_generate_msg_eus(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics
)
_generate_msg_eus(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics
)
_generate_msg_eus(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignAction.msg"
  "${MSG_I_FLAGS}"
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics
)
_generate_msg_eus(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics
)
_generate_msg_eus(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics
)
_generate_msg_eus(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics
)
_generate_msg_eus(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics
)
_generate_msg_eus(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics
)
_generate_msg_eus(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics
)

### Generating Services
_generate_srv_eus(wasp_logistics
  "/home/wasp1/wasp_ws/src/wasp_logistics/srv/GetPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics
)

### Generating Module File
_generate_module_eus(wasp_logistics
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(wasp_logistics_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(wasp_logistics_generate_messages wasp_logistics_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wasp1/wasp_ws/src/wasp_logistics/msg/logistics.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_eus _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsAction.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_eus _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_eus _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_eus _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_eus _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_eus _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_eus _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_eus _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignAction.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_eus _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_eus _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_eus _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_eus _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_eus _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_eus _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_eus _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/src/wasp_logistics/srv/GetPose.srv" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_eus _wasp_logistics_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wasp_logistics_geneus)
add_dependencies(wasp_logistics_geneus wasp_logistics_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wasp_logistics_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(wasp_logistics
  "/home/wasp1/wasp_ws/src/wasp_logistics/msg/logistics.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_lisp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsAction.msg"
  "${MSG_I_FLAGS}"
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionFeedback.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionGoal.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_lisp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_lisp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_lisp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_lisp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_lisp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_lisp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_lisp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignAction.msg"
  "${MSG_I_FLAGS}"
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_lisp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_lisp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_lisp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_lisp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_lisp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics
)
_generate_msg_lisp(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics
)

### Generating Services
_generate_srv_lisp(wasp_logistics
  "/home/wasp1/wasp_ws/src/wasp_logistics/srv/GetPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics
)

### Generating Module File
_generate_module_lisp(wasp_logistics
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(wasp_logistics_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(wasp_logistics_generate_messages wasp_logistics_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wasp1/wasp_ws/src/wasp_logistics/msg/logistics.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_lisp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsAction.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_lisp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_lisp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_lisp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_lisp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_lisp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_lisp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_lisp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignAction.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_lisp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_lisp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_lisp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_lisp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_lisp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_lisp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_lisp _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/src/wasp_logistics/srv/GetPose.srv" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_lisp _wasp_logistics_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wasp_logistics_genlisp)
add_dependencies(wasp_logistics_genlisp wasp_logistics_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wasp_logistics_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(wasp_logistics
  "/home/wasp1/wasp_ws/src/wasp_logistics/msg/logistics.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics
)
_generate_msg_nodejs(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsAction.msg"
  "${MSG_I_FLAGS}"
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionFeedback.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionGoal.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics
)
_generate_msg_nodejs(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics
)
_generate_msg_nodejs(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics
)
_generate_msg_nodejs(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics
)
_generate_msg_nodejs(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics
)
_generate_msg_nodejs(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics
)
_generate_msg_nodejs(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics
)
_generate_msg_nodejs(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignAction.msg"
  "${MSG_I_FLAGS}"
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics
)
_generate_msg_nodejs(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics
)
_generate_msg_nodejs(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics
)
_generate_msg_nodejs(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics
)
_generate_msg_nodejs(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics
)
_generate_msg_nodejs(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics
)
_generate_msg_nodejs(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics
)

### Generating Services
_generate_srv_nodejs(wasp_logistics
  "/home/wasp1/wasp_ws/src/wasp_logistics/srv/GetPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics
)

### Generating Module File
_generate_module_nodejs(wasp_logistics
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(wasp_logistics_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(wasp_logistics_generate_messages wasp_logistics_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wasp1/wasp_ws/src/wasp_logistics/msg/logistics.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_nodejs _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsAction.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_nodejs _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_nodejs _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_nodejs _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_nodejs _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_nodejs _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_nodejs _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_nodejs _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignAction.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_nodejs _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_nodejs _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_nodejs _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_nodejs _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_nodejs _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_nodejs _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_nodejs _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/src/wasp_logistics/srv/GetPose.srv" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_nodejs _wasp_logistics_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wasp_logistics_gennodejs)
add_dependencies(wasp_logistics_gennodejs wasp_logistics_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wasp_logistics_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(wasp_logistics
  "/home/wasp1/wasp_ws/src/wasp_logistics/msg/logistics.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics
)
_generate_msg_py(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsAction.msg"
  "${MSG_I_FLAGS}"
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionFeedback.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionGoal.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics
)
_generate_msg_py(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics
)
_generate_msg_py(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics
)
_generate_msg_py(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics
)
_generate_msg_py(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics
)
_generate_msg_py(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics
)
_generate_msg_py(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics
)
_generate_msg_py(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignAction.msg"
  "${MSG_I_FLAGS}"
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionFeedback.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionGoal.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics
)
_generate_msg_py(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics
)
_generate_msg_py(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics
)
_generate_msg_py(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg;/opt/ros/noetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics
)
_generate_msg_py(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics
)
_generate_msg_py(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics
)
_generate_msg_py(wasp_logistics
  "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics
)

### Generating Services
_generate_srv_py(wasp_logistics
  "/home/wasp1/wasp_ws/src/wasp_logistics/srv/GetPose.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics
)

### Generating Module File
_generate_module_py(wasp_logistics
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(wasp_logistics_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(wasp_logistics_generate_messages wasp_logistics_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wasp1/wasp_ws/src/wasp_logistics/msg/logistics.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_py _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsAction.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_py _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_py _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_py _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsActionFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_py _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_py _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_py _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/LogisticsFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_py _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignAction.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_py _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_py _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_py _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignActionFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_py _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignGoal.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_py _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignResult.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_py _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/devel/share/wasp_logistics/msg/TrolleyAlignFeedback.msg" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_py _wasp_logistics_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wasp1/wasp_ws/src/wasp_logistics/srv/GetPose.srv" NAME_WE)
add_dependencies(wasp_logistics_generate_messages_py _wasp_logistics_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(wasp_logistics_genpy)
add_dependencies(wasp_logistics_genpy wasp_logistics_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS wasp_logistics_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/wasp_logistics
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(wasp_logistics_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(wasp_logistics_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/wasp_logistics
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(wasp_logistics_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(wasp_logistics_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/wasp_logistics
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(wasp_logistics_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(wasp_logistics_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/wasp_logistics
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(wasp_logistics_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(wasp_logistics_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/wasp_logistics
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(wasp_logistics_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(wasp_logistics_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
