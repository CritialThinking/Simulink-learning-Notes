%% 由MATLAB工作空间变量设置系统模块参数
clear;clc;
% 要修改的模型名字
systemName = 'UsingTheCommandLineForDynamicSystemSimulation001';
% 新的名字
newSystemName = 'UsingTheCommandLineForDynamicSystemSimulation002';

% 首先在 MATLAB 工作空间建立变量 a
a = 10;

% 载入模型（打开Simulink编辑窗口）
open_system(systemName)

% 修改模块参数
set_param([systemName, '/Gain'], 'Gain', 'a+3')

% 运行仿真
[t, xout, yout] = sim(systemName);

% 打印结果
plot(t, yout);% To WorkSpace 输出的变量名默认为 simout 

% 保存模型
save_system(systemName,newSystemName);

% 关闭模型
close_system(newSystemName);