%% 系统模型命令
% 新建一个空系统
new_system(sys)
new_system(sys, 'Library')
% 打开一个已存在的Simulink系统模型
open_system('sys')
open_system('blk')
open_system('blk', 'force')
% 保存Simulink系统模型
save_system
save_system(sys)
save_system(sys, newsysname)
save_system(sys, newsysname.slx)

% 载入系统模型
% 将模型载入到内存中,而无需在 Simulink 编辑器中打开模型
% 将模型加载到内存中后,就可以(否则不行)使用 Simulink API 命令对其进行处理。
% 处理完后使用 save_system 保存对模型的更改
load_system('sys')
% 关闭系统模型
close_system
close_system('sys')
close_system('sys', saveflag)
close_system('sys', 'newname')
% 搜索指定系统或子系统
find_system(sys, 'c1', cv1, 'c2', cv2, ...'p1', v1, 'p2', v2, ...)


%% 模块命令
% 添加模块
add_block('src', 'dest')
add_block('src', 'dest', 'param1', value1, ...)
% 删除模块
delete_block('blk')
% 替换模块
replace_block('sys', 'old_blk', 'new_blk')
replace_block('sys', 'parameter', 'value', ..., 'blk')

%% 连线命令
h = add_line('sys', 'oport', 'iport') % 在系统模型sys中从输出端口oport添加连线至输入端口iport,并返回连线的句柄
delete_line('sys', 'outPort', 'inPort')

%% 参数命令
set_param(object, param1, value1, ..., paramN, valueN)
ParameterValue = get_param(Object, ParameterName)
ParameterValues = get_param(ObjectCellArray, ParameterName)
ParameterValue = get_param(ObjectHandle, ParameterName)
ParameterValue = get_param(0, ParameterName)
ParameterStruct = get_param(Object, 'ObjectParameters')
ParameterCellArray = get_param(Object, 'DialogParameters')

add_param('sys', 'parameter1', value1, 'parameter2', value2, ...)
delete_param('sys', 'parameter1', 'parameter2', ...)