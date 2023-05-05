%% 使用命令行方式建立系统模型
systemName = 'UsingTheCommandLineForDynamicSystemSimulation001';

% 新建一个新的系统, 名为 UsingTheCommandLineForDynamicSystemSimulation001
new_system(systemName)

% 打开系统模型
open_system(systemName)

% 添加需要添加的系统模块
add_block('simulink/Sources/Sine Wave', [systemName, '/Sine Wave'])
add_block('simulink/Math Operations/Gain', [systemName, '/Gain'])
add_block('simulink/Sinks/Out1', [systemName, '/Out'])

% 为模块连线
add_line(systemName, 'Sine Wave/1', 'Gain/1')
add_line(systemName, 'Gain/1', 'Out/1')

% 设置增益模块参数
set_param([systemName, '/Gain'], 'Gain', '3')

% 设置正弦波模块参数
set_param([systemName, '/Sine Wave'], 'Frequency', '4')

% 运行仿真
[t, xout, yout] = sim(systemName);

% 输出结果
plot(t,yout);

% 保存系统模型
% 使用save_system(systemName) 则文件扩展名默认为 .slx
save_system(systemName, [systemName, '.mdl'])