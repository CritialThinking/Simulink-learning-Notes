%%  ���� Scope ʾ����ģ�齫�ź����뵽 MATLAB �����ռ���
clear;clc;
% Ҫ�޸ĵ�ģ������
systemName = 'UsingTheCommandLineForDynamicSystemSimulation001';
% �µ�����
newSystemName = 'UsingTheCommandLineForDynamicSystemSimulation003';

%% ����ģ�ͣ�����Simulink�༭���ڣ�
open_system(systemName)

%% �޸�ģ��
% ɾ���� Out ������
delete_line(systemName, 'Gain/1', 'Out/1')
% ɾ�� Out ģ��
delete_block([systemName, '/Out'])
% ��� Scope ģ��
add_block('simulink/Sinks/Scope', [systemName, '/Scope'])
% ��ӵ� Scope ������
add_line(systemName, 'Gain/1', 'Scope/1')

%% ���� Scope ģ��
% ��ȡ Scope ģ������þ��
scopeConfig = get_param([systemName, '/Scope'], 'ScopeConfiguration');
% ���� Scope ����
scopeConfig.DataLogging = true;% ʹ���ܹ���¼���ݵ�������
scopeConfig.DataLoggingVariableName = 'Fist1Sim';% ���ñ����ڹ������еı�����

% ����������ݵĸ�ʽ����������ʽ������
% StructureWithTime ���� ��ʱ��Ľṹ��
% Structure ���� �ṹ��
% Array ���� ����
% Dataset ���� ���ݼ�
scopeConfig.DataLoggingSaveFormat = 'Array';

%% ���з���
sim(systemName);

%% ������
plot(Fist1Sim(:,1), Fist1Sim(:,2));

%% ���沢�ر�
save_system(systemName,newSystemName);
close_system(newSystemName);

