%This sub function is able to load data 

% Save the folderpath of the main execution file
pwd_Main = pwd;

% Select folderpath of data file
pwd_data= (input('Copy past the Folderpath of the datafile: ', 's'));

%Check if folderpath exists

check_Folderpath= exist(pwd_data);

while (check_Folderpath ~= 7)

  disp('Folderpath input is not correct or doesnt exist. Please try again. ')
  pwd_data= (input('Copy past the Folderpath of the selected folder: ','s'));
  check_Folderpath= exist(pwd_data);
  
endwhile

cd (pwd_data)

%
%
%Load filename
FileName= (input('Copy past the Filename of the selected data file: ','s'));

%Check if filename exists

check_FileName= exist(FileName);

while (check_FileName ~= 2)

  disp('FileName input is not correct or doenst exist. Please try again. ')
  FileName= (input('Copy past the Filename of the selected data file: ','s'));
  check_FileName= exist(FileName);
  
endwhile
%Load datafile
load (FileName);

cd (pwd_Main)

%Define signals needed
%Delete other channels
clear('AF1');
clear('APS_angle');
clear('AccX_Corr');
clear('AccY_Corr');
clear('AccZ_Corr');
clear('Acc_X2');
clear('Acc_Y2');
clear('Acc_Z2');
clear('Altitude');
clear('Angle');
clear('Course');
clear('CurrHigh');
clear('CurrLED');
clear('CurrOK');
clear('CurrentOK');
clear('Dist');
clear('Distance32');
clear('FilerON');
clear('FilterON_OFF');
clear('FilterSetting');
clear('FilterType');
clear('HHMM');
clear('LampCurrent');
clear('MMDD');
clear('Mode_PWR');
clear('Mode_SCS');
clear('Mode_TCS');
clear('OpticOK');
clear('PowerOK');
clear('SSHH');
clear('SensorOK');
clear('SerialNo');
clear('SerialNr');
clear('TBox_Corr');
clear('T_Air');
clear('TempOK');
clear('TempSens');
clear('Temperature');
clear('TemperatureOK');
clear('Timestamp');
clear('ValidSat');
clear('Vbatt_Corr');
clear('Vel');
clear('VelX');
clear('VelY');
clear('X2_0x0CF');
clear('aLean');
clear('pComp');
clear('pRebound');
clear('tLap');
clear('tLapLast');
clear('v');
clear('vl');
clear('vq');
clear('xLaserL');
clear('xLaserR');
clear('aSteer');
clear('Lat_dez');
clear('Lon_dez');
clear('LogLapTime');

%Clear parameters used in this sub function
clear('pwd_Main');
clear('pwd_data');
clear('check_Folderpath');
clear('FileName');
clear('check_FileName');