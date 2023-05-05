%% 示例2: 使用不同工作空间参数作为输入
clc;clear;
systemName = 'UsingTheCommandLineForDynamicSystemSimulation006';

load_system(systemName)

simInput1=[ 0, 1;
            1,1;
            1,-1;
            2,-1;
            2, 1;
            3, 1;
            3, 1;
            4, 1;
            4, 1;
            5, 1;
            5,-1;
            6,-1;
            6, 1;
            7, 1 ];
t=0:0.1:7;
simInput2=[t', sin(0:0.1:7)'];
simInput3=[t', cos(0:0.1:7)'];

sim(systemName,7, [], simInput1);
subplot(3,1,1);
plot(simout);
ylim([-4, 4]);
title('simInput1');

sim(systemName,7, [], simInput2);
subplot(3,1,2);
plot(simout);
ylim([-4, 4]);
title('simInput2');

sim(systemName,7, [], simInput3);
subplot(3,1,3);
plot(simout);
ylim([-4, 4]);
title('simInput3');

sgtitle('示 例  2', 'Color', [0.9102, 0.4124, 0.0379], 'FontWeight', 'bold', 'FontSize', 16);
close_system(systemName, 0)