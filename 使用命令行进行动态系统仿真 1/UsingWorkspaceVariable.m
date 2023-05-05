%% ��MATLAB�����ռ��������ϵͳģ�����
clear;clc;
% Ҫ�޸ĵ�ģ������
systemName = 'UsingTheCommandLineForDynamicSystemSimulation001';
% �µ�����
newSystemName = 'UsingTheCommandLineForDynamicSystemSimulation002';

% ������ MATLAB �����ռ佨������ a
a = 10;

% ����ģ�ͣ���Simulink�༭���ڣ�
open_system(systemName)

% �޸�ģ�����
set_param([systemName, '/Gain'], 'Gain', 'a+3')

% ���з���
[t, xout, yout] = sim(systemName);

% ��ӡ���
plot(t, yout);% To WorkSpace ����ı�����Ĭ��Ϊ simout 

% ����ģ��
save_system(systemName,newSystemName);

% �ر�ģ��
close_system(newSystemName);