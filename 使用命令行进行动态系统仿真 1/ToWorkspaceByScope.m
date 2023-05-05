%%  利用 Scope 示波器模块将信号输入到 MATLAB 工作空间中
clear;clc;
% 要修改的模型名字
systemName = 'UsingTheCommandLineForDynamicSystemSimulation001';
% 新的名字
newSystemName = 'UsingTheCommandLineForDynamicSystemSimulation003';

%% 载入模型（不打开Simulink编辑窗口）
open_system(systemName)

%% 修改模型
% 删除与 Out 的连线
delete_line(systemName, 'Gain/1', 'Out/1')
% 删除 Out 模块
delete_block([systemName, '/Out'])
% 添加 Scope 模块
add_block('simulink/Sinks/Scope', [systemName, '/Scope'])
% 添加到 Scope 的连线
add_line(systemName, 'Gain/1', 'Scope/1')

%% 设置 Scope 模块
% 获取 Scope 模块的设置句柄
scopeConfig = get_param([systemName, '/Scope'], 'ScopeConfiguration');
% 设置 Scope 属性
scopeConfig.DataLogging = true;% 使得能够记录数据到工作区
scopeConfig.DataLoggingVariableName = 'Fist1Sim';% 设置保存在工作区中的变量名

% 设置输出数据的格式，以数组形式输出结果
% StructureWithTime —— 带时间的结构体
% Structure —— 结构体
% Array —— 数组
% Dataset —— 数据集
scopeConfig.DataLoggingSaveFormat = 'Array';

%% 运行仿真
sim(systemName);

%% 输出结果
plot(Fist1Sim(:,1), Fist1Sim(:,2));

%% 保存并关闭
save_system(systemName,newSystemName);
close_system(newSystemName);

