%% 使用工作空间中的变量作为系统输入信号 使用 In1
clear;clc;

% 要修改的模型名字
systemName = 'UsingTheCommandLineForDynamicSystemSimulation004';
% 新的名字
newSystemName = 'UsingTheCommandLineForDynamicSystemSimulation006';

%% 载入模型（不打开Simulink编辑窗口）
load_system(systemName)

%% 修改模型
% 删除 Sine Wave 与 Gain 的连线
delete_line(systemName, 'Sine Wave/1', 'Gain/1')
% 删除 Sine Wave
delete_block([systemName, '/Sine Wave'])
% 添加 From Workspace
add_block('simulink/Sources/In1', [systemName, '/Input'])
% From Workspace 连接到系统
add_line(systemName, 'Input/1', 'Gain/1')

%% 设置工作区变量作为系统输入
t = 0:0.1:10;
u = 1/3 * sin(t);
Input = [t', u'];

sim(systemName, 10, [], Input);

% 打印结果
plot(simout);

% 保存模型
save_system(systemName,newSystemName);

% 关闭模型
close_system(newSystemName);