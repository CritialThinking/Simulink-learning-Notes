%% ����Sinkģ���е� To Workspace ģ�齫�ź����뵽 MATLAB �����ռ���

clear;clc;
% Ҫ�޸ĵ�ģ������
systemName = 'UsingTheCommandLineForDynamicSystemSimulation001';
% �µ�����
newSystemName = 'UsingTheCommandLineForDynamicSystemSimulation004';

%% ����ģ�ͣ�����Simulink�༭���ڣ�
load_system(systemName)

%% �޸�ģ��
% ɾ���� Out ������
delete_line(systemName, 'Gain/1', 'Out/1')
% ɾ�� Out ģ��
delete_block([systemName, '/Out'])
% ��� Scope ģ��
add_block('simulink/Sinks/To Workspace', [systemName, '/To Workspace'])
% ��ӵ� Scope ������
add_line(systemName, 'Gain/1', 'To Workspace/1')

%% ���з���
sim(systemName);

%% ������
plot(simout);

%% ���沢�ر�
save_system(systemName,newSystemName);
close_system(newSystemName);

