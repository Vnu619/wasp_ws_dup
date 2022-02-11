## *********************************************************
##
## File autogenerated for the image_proc package
## by the dynamic_reconfigure package.
## Please do not edit.
##
## ********************************************************/

from dynamic_reconfigure.encoding import extract_params

inf = float('inf')

config_description = {'name': 'Default', 'type': '', 'state': True, 'cstate': 'true', 'id': 0, 'parent': 0, 'parameters': [{'name': 'interpolation', 'type': 'int', 'default': 1, 'level': 0, 'description': 'Interpolation algorithm between source image pixels', 'min': 0, 'max': 4, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': "{'enum': [{'name': 'NN', 'type': 'int', 'value': 0, 'srcline': 11, 'srcfile': '/home/wasp1/wasp_ws/src/image_pipeline/image_proc/cfg/Resize.cfg', 'description': 'Nearest neighbor', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'Linear', 'type': 'int', 'value': 1, 'srcline': 12, 'srcfile': '/home/wasp1/wasp_ws/src/image_pipeline/image_proc/cfg/Resize.cfg', 'description': 'Linear', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'Cubic', 'type': 'int', 'value': 2, 'srcline': 13, 'srcfile': '/home/wasp1/wasp_ws/src/image_pipeline/image_proc/cfg/Resize.cfg', 'description': 'Cubic', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'Lanczos4', 'type': 'int', 'value': 4, 'srcline': 14, 'srcfile': '/home/wasp1/wasp_ws/src/image_pipeline/image_proc/cfg/Resize.cfg', 'description': 'Lanczos4', 'ctype': 'int', 'cconsttype': 'const int'}], 'enum_description': 'interpolation type'}", 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'use_scale', 'type': 'bool', 'default': True, 'level': 0, 'description': 'Flag to use scale instead of static size.', 'min': False, 'max': True, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'bool', 'cconsttype': 'const bool'}, {'name': 'scale_height', 'type': 'double', 'default': 1.0, 'level': 0, 'description': 'Scale of height.', 'min': 0.0, 'max': 10.0, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'scale_width', 'type': 'double', 'default': 1.0, 'level': 0, 'description': 'Scale of width', 'min': 0.0, 'max': 10.0, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'double', 'cconsttype': 'const double'}, {'name': 'height', 'type': 'int', 'default': -1, 'level': 0, 'description': 'Destination height. Ignored if negative.', 'min': -1, 'max': 2147483647, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'int', 'cconsttype': 'const int'}, {'name': 'width', 'type': 'int', 'default': -1, 'level': 0, 'description': 'Destination width. Ignored if negative.', 'min': -1, 'max': 2147483647, 'srcline': 291, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'edit_method': '', 'ctype': 'int', 'cconsttype': 'const int'}], 'groups': [], 'srcline': 246, 'srcfile': '/opt/ros/noetic/lib/python3/dist-packages/dynamic_reconfigure/parameter_generator_catkin.py', 'class': 'DEFAULT', 'parentclass': '', 'parentname': 'Default', 'field': 'default', 'upper': 'DEFAULT', 'lower': 'groups'}

min = {}
max = {}
defaults = {}
level = {}
type = {}
all_level = 0

#def extract_params(config):
#    params = []
#    params.extend(config['parameters'])
#    for group in config['groups']:
#        params.extend(extract_params(group))
#    return params

for param in extract_params(config_description):
    min[param['name']] = param['min']
    max[param['name']] = param['max']
    defaults[param['name']] = param['default']
    level[param['name']] = param['level']
    type[param['name']] = param['type']
    all_level = all_level | param['level']

Resize_NN = 0
Resize_Linear = 1
Resize_Cubic = 2
Resize_Lanczos4 = 4
