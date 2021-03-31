%This function creates a corner statement. This splits a corner from:
% (1)Straight line
% (2)Corner entry
% (3)Midcorner
% (4)Corner exit

i=1;
j=1;
t1=0;
t2=0;
tdiff=2;
t_corner=Datafiles(j).t;
t_corner(end+1)=t_corner(end);

%Corner statement calcultation
%Divided in straight line, braking zone, midcorner, accelerating zone
while (j<=(Datafiles(1).lDatafiles))
  %ref_length= length(Datafiles(j).xSuspF);

while (i<=Datafiles(j).ref_length)
  if ((Datafiles(j).Throttle(i)<2) && (Datafiles(j).pBrakeF(i)<1))
    if (tdiff(i)>0.1)
    Datafiles(j).zCorner(i)=2;
    else
    Datafiles(j).zCorner(i)=0;
    endif
    i=i+1;
  elseif (Datafiles(j).pBrakeF(i)>0.5)
    Datafiles(j).zCorner(i)=1;
    t1=t_corner(i);
    i=i+1;
 
  elseif ((Datafiles(j).Throttle(i)>2) && (Datafiles(j).pBrakeF(i)<1)&&(Datafiles(j).Throttle(i)<99.5))
    Datafiles(j).zCorner(i)=3;
    t1=t_corner(i);
    i=i+1;
  
  else
    Datafiles(j).zCorner(i)=0;
    t1=t_corner(i);
    i=i+1;
  endif
    t2=t_corner(i);
    tdiff(i)= (t2)-(t1);
endwhile
Datafiles(j).zCorner=Datafiles(j).zCorner';
j=j+1;

endwhile

clear('i');
clear('j');
clear('t1');
clear('t2');
clear('t_corner');
clear('tdiff');