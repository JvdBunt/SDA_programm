%This programm interpolates all channels towards 1000hz signals
%This makes all signals the same length in order to compare/calculate with eachother

Datafiles(1).lDatafiles=length(Datafiles);
i=1;




%This function is able to interpolate signals to 1000Hz logging frequency
function [Signal] = IntpChannels (a,b,c,d,i)
  
  %Create reference Time
t1000=(0:0.001:((b/1000)-0.001));
t500=(0:0.002:((b/1000)));
t200=(0:0.005:((b/1000)));
t100=(0:0.01:((b/1000)));
t50=(0:0.02:((b/1000)));
t10=(0:0.1:((b/1000)));

  %Calculate signal logging frequency
 Freq= round(1000/(b/length(c)));

 switch Freq
case 500
  Datafiles(i).t=t500;
case 200
  Datafiles(i).t=t200;
case 100
  Datafiles(i).t=t100;
case 50
  Datafiles(i).t=t50;
case 10
  Datafiles(i).t=t10;
otherwise
  Datafiles(i).t=1;
endswitch

%Interpolate signal to 1000Hz
 Signal=interp1(Datafiles(i).t,c,t1000)';

endfunction 


while (i<=(Datafiles(1).lDatafiles))

disp('Another round ');

%Switch condition to run the interpolation for multiple signals
counter=1;
for (counter=1:10)
  
  switch counter
          case 1
      Datafiles(i).SignalName = Datafiles(i).CAN_vGPS;
          case 2
      Datafiles(i).SignalName = Datafiles(i).Gear;
          case 3
      Datafiles(i).SignalName = Datafiles(i).RPM;
          case 4
      Datafiles(i).SignalName = Datafiles(i).T_Water;
          case 5
      Datafiles(i).SignalName = Datafiles(i).Throttle;
          case 6
      Datafiles(i).SignalName = Datafiles(i).V_Front;
          case 7
      Datafiles(i).SignalName = Datafiles(i).V_Rear;
          case 8
      Datafiles(i).SignalName = Datafiles(i).pBrakeF;
          case 9
      Datafiles(i).SignalName = Datafiles(i).pBrakeR;
      
  otherwise
    %return
    
  endswitch
  
  
  
%Select channel which is logged with 1000Hz
Datafiles(i).ref_channel= Datafiles(i).xSuspF;

%Check the length of the reference channel
Datafiles(i).ref_length= length(Datafiles(i).ref_channel);

%Check the length of channel to interpolate
Datafiles(i).int_length= length(Datafiles(i).SignalName);

%Interpolate channels
IntpChannels(Datafiles(i).ref_channel,Datafiles(i).ref_length,Datafiles(i).SignalName,Datafiles(i).int_length,i);
Datafiles(i).t=(0:0.001:((Datafiles(i).ref_length/1000)-0.001))';

%Return value to signal
  switch counter
          case 1
      Datafiles(i).CAN_vGPS = ans;
          case 2
      Datafiles(i).Gear = ans;
          case 3
      Datafiles(i).RPM = ans;
          case 4
      Datafiles(i).T_Water = ans;
          case 5
      Datafiles(i).Throttle = ans;
          case 6
      Datafiles(i).V_Front = ans;
          case 7
      Datafiles(i).V_Rear = ans;
          case 8
      Datafiles(i).pBrakeF = ans;
          case 9
      Datafiles(i).pBrakeR = ans;
  otherwise
    %return
    
  endswitch

%Increase counter
counter = counter +1;

endfor

i=i+1;
endwhile

clear('i');
clear('ans');
clear('counter');