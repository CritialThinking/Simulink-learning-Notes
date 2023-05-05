%% 示例1：修改模型参数，进行迭代仿真
clc;clear;

systemName = 'UsingTheCommandLineForDynamicSystemSimulation001';
load_system(systemName)

for index = 1:4
    tmp = 4 - index;
    % 每次循环修改 Sine Wave 模块的频率
    set_param([systemName, '/Sine Wave'], 'Frequency', num2str(tmp));
    % 进行仿真
    simOut = sim(systemName, 'StopTime', '4*pi', 'MaxStep', '0.1', ...
        'SaveFormat', 'Array', ...
        'SaveState', 'on', 'StateSaveName', 'xout', ...
        'SaveOutput', 'on', 'OutputSaveName', 'yout');

    % 输出结果
    subplot(4,1,index);
    plot(simOut.tout, simOut.yout);
    title(['Frequency = ', num2str(tmp)]);
end
sgtitle('示 例  1', 'Color', [0.9102, 0.4124, 0.0379], 'FontWeight', 'bold', 'FontSize', 16);
close_system(systemName, 0)