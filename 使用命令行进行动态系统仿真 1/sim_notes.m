systemName = 'UsingTheCommandLineForDynamicSystemSimulation001';
configSet = getActiveConfigSet(systemName);
configSetNames = get_param(configSet, 'ObjectParameters');


simOut = sim(systemName, 'StopTime', '15.0', 'MaxStep', '0.1', ...
            'SaveState', 'on', 'StateSaveName', 'xout', ...
            'SaveOutput', 'on', 'OutputSaveName', 'yout');

