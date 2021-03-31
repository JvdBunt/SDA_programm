%This sub function is able to load data 

% Save the folderpath of the main execution file
pwd_Main = pwd;
sDataLoad = 'Y';
i=1;

while (i<3)
  
if (sDataLoad == 'Y')

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
%% Create counter for DataFile index
Datafiles(1,i)=load(FileName);

%C Check if more data wants to be loaded
sDataLoad=(input('Do you want to load more Data? Type: Yes/No ', 's'));
sDataLoad=sDataLoad(1);


endif



i=i+1;
endwhile


cd (pwd_Main)

%Define signals needed
%Delete other channels

%Clear parameters used in this sub function
clear('pwd_Main');
clear('pwd_data');
clear('check_Folderpath');
clear('FileName');
clear('check_FileName');
clear('sDataLoad');
clear('i');