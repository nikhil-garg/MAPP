function test = parallelRLC_transient()

	% Author: Bichen Wu
	% Date: 05/06/2014
	% Moved from run_parallelRLC_transient.m
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Circuit DAE

	DAE = parallelLC('||rlc'); 
    test.DAE = DAE;
    test.name = 'parallelLRC_tran'; % Type of analysis
    test.analysis = 'transient'; % Type of analysis
    test.refFile = 'parallelLRC_tran.mat';

    % Simulation time-related parameters
    test.args.xinit = [ 0; 0];


    % [3; 3; -0.5]; % Initial condition
    test.args.tstart = 0;           % Start time
    test.args.tstep = 1.5e-9;        % Time step
    test.args.tstop = 1e-6;         % Stop time
    % Transient simulation parameters
    test.args.tranparms = defaultTranParms; % Transient simulation
    test.args.tranparms.NRparms.limiting = 1; 
    test.args.tranparms.doStepControl = 0;
    % Any changes to default tranparms setting
    test.args.tranparms.trandbglvl = -1; % Only errors 
    % LMS method to be used
    test.args.LMSMethod = 'BE'; % {'BE','FE','TRAP','GEAR2'}
    % Update or testing/comparison
    % test.args.LogMsgDisplay = 0; % 1 = verbose, 0 = non-verbose
end

