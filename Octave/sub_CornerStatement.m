%This function creates a corner statement. This splits a corner from:
% (1)Straight line
% (2)Corner entry
% (3)Midcorner
% (4)Corner exit
ref_length= length(xSuspF);
i=1;
t1=0;
t2=0;
tdiff=2;
t_corner=t;
t_corner(end+1)=t_corner(end);

%Corner statement calcultation
%Divided in straight line, braking zone, midcorner, accelerating zone
while (i<=ref_length)
  if ((Throttle(i)<2) && (pBrakeF(i)<1))
    if (tdiff(i)>0.1)
    zCorner(i)=2;
    else
    zCorner(i)=0;
    endif
    i=i+1;
  elseif (pBrakeF(i)>0.5)
    zCorner(i)=1;
    t1=t_corner(i);
    i=i+1;
 
  elseif ((Throttle(i)>2) && (pBrakeF(i)<1)&&(Throttle(i)<99.5))
    zCorner(i)=3;
    t1=t_corner(i);
    i=i+1;
  
  else
    zCorner(i)=0;
    t1=t_corner(i);
    i=i+1;
  endif
    t2=t_corner(i);
    tdiff(i)= (t2)-(t1);
endwhile
zCorner=zCorner';

