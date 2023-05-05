%% ʹ�������з�ʽ����ϵͳģ��
systemName = 'UsingTheCommandLineForDynamicSystemSimulation001';

% �½�һ���µ�ϵͳ, ��Ϊ UsingTheCommandLineForDynamicSystemSimulation001
new_system(systemName)

% ��ϵͳģ��
open_system(systemName)

% �����Ҫ��ӵ�ϵͳģ��
add_block('simulink/Sources/Sine Wave', [systemName, '/Sine Wave'])
add_block('simulink/Math Operations/Gain', [systemName, '/Gain'])
add_block('simulink/Sinks/Out1', [systemName, '/Out'])

% Ϊģ������
add_line(systemName, 'Sine Wave/1', 'Gain/1')
add_line(systemName, 'Gain/1', 'Out/1')

% ��������ģ�����
set_param([systemName, '/Gain'], 'Gain', '3')

% �������Ҳ�ģ�����
set_param([systemName, '/Sine Wave'], 'Frequency', '4')

% ���з���
[t, xout, yout] = sim(systemName);

% ������
plot(t,yout);

% ����ϵͳģ��
% ʹ��save_system(systemName) ���ļ���չ��Ĭ��Ϊ .slx
save_system(systemName, [systemName, '.mdl'])