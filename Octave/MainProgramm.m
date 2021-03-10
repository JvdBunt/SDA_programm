% Main programm which is capable of creating a statistical analysis of motorsport data.
% Editor: Jerry van de Bunt
% Version: v1b01
% 
% The structure is as followed:
% 1) Loading data
% 2) Interpolating to 1000Hz signal frequencies
% 3) Plotting of loaded data
% 4) Selecting predefined laps out of the data
% 5) Plotting predefined laps of data
% 6) Statistical analysis of suspension parameters

% 1) Loading data
sub_LoadingData;

% 2) Interpolating to 1000Hz signal frequencies
sub_interpol;

% Corner statement
sub_CornerStatement;

% Corner counter
sub_CornerCounter;
sub_CornerCounter2;

%Calculation of suspension values
cal_Susp;


%Plot results
sub_Plotting;

% Clear unused signals 
sub_ClearSignals;


disp('Thanks for using this programm!');