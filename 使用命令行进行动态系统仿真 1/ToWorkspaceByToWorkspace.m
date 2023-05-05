%% 利用Sink模块中的 To Workspace 模块将信号输入到 MATLAB 工作空间中

clear;clc;
% 要修改的模型名字
systemName = 'UsingTheCommandLineForDynamicSystemSimulation001';
% 新的名字
newSystemName = 'UsingTheCommandLineForDynamicSystemSimulation004';

%% 载入模型（不打开Simulink编辑窗口）
load_system(systemName)

%% 修改模型
% 删除与 Out 的连线
delete_line(systemName, 'Gain/1', 'Out/1')
% 删除 Out 模块
delete_block([systemName, '/Out'])
% 添加 Scope 模块
add_block('simulink/Sinks/To Workspace', [systemName, '/To Workspace'])
% 添加到 Scope 的连线
add_line(systemName, 'Gain/1', 'To Workspace/1')

%% 运行仿真
sim(systemName);

%% 输出结果
plot(simout);

%% 保存并关闭
save_system(systemName,newSystemName);
close_system(newSystemName);

