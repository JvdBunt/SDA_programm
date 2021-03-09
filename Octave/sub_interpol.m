%This programm interpolates all channels towards 1000hz signals
%This makes all signals the same length

%Select channel which is logged with 1000Hz
ref_channel= xSuspF;

%Check the length of the reference channel
ref_length= length(ref_channel);

%This function is able to interpolate signals to 1000Hz logging frequency
function [Signal] = IntpChannels (a,b,c,d)
  
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
  t=t500;
case 200
  t=t200;
case 100
  t=t100;
case 50
  t=t50;
case 10
  t=t10;
otherwise
  t=1;
endswitch

%Interpolate signal to 1000Hz
 Signal=interp1(t,c,t1000)';

endfunction 




%Switch condition to run the interpolation for multiple signals
counter=1;
for (counter=1:10)
  
  switch counter
          case 1
      SignalName = CAN_vGPS;
          case 2
      SignalName = Gear;
          case 3
      SignalName = RPM;
          case 4
      SignalName = T_Water;
          case 5
      SignalName = Throttle;
          case 6
      SignalName = V_Front;
          case 7
      SignalName = V_Rear;
          case 8
      SignalName = pBrakeF;
          case 9
      SignalName = pBrakeR;
      
  otherwise
    return
    
  endswitch
  
  
  



%Check the length of channel to interpolate
int_length= length(SignalName);

%Interpolate channels
IntpChannels(ref_channel,ref_length,SignalName,int_length);
t=(0:0.001:((ref_length/1000)-0.001))';

%Return value to signal
  switch counter
          case 1
      CAN_vGPS = ans;
          case 2
      Gear = ans;
          case 3
      RPM = ans;
          case 4
      T_Water = ans;
          case 5
      Throttle = ans;
          case 6
      V_Front = ans;
          case 7
      V_Rear = ans;
          case 8
      pBrakeF = ans;
          case 9
      pBrakeR = ans;
  otherwise
    return
    
  endswitch

%Increase counter
counter = counter +1;

endfor
