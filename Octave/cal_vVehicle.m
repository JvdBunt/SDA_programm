% This function performs a statistical analysis of the vehicle speed.
% Structure 
% vVehicle: mean - min - max
% avehicle: mean - min - max

ref_length= length(xSuspF);
nCornerMax=max(nCorner);
p1=zeros(1,nCornerMax);
p2=zeros(1,nCornerMax);

vVehicle=zeros(1,ref_length)';
aVehicle=zeros(1,ref_length)';

vVehicle=V_Front;
sVehicle=[mean(vVehicle(1:ref_length-1)),min(vVehicle),max(vVehicle)];

lp_coeff=fir1(50,5/1000,'low'); %(length of the filter, drop freq, lowpassfilter)

j=1;
while (j<=nCornerMax)
i=1;
while (i<=ref_length)
  
    %Calculation for Midcorner --> zCorner == 2
  if (dCornerSt(i)==2 && nCorner(i)==j)
    p1(j)=i;
  
  elseif(dCornerSt(i)==1 && nCorner(i)==j && zCorner(i)==2)
    p2(j)=i;
  endif
  
  %Calculation for Braking --> zCorner == 1
  if (dCornerSt(i)==1 && nCorner(i)==j-1)
    p1(2,j)=i;
  
  elseif(dCornerSt(i)==-1 && nCorner(i)==j-1 && zCorner(i)==1)
    p2(2,j)=i;
  endif
  
    %Calculation for acceleration --> zCorner == 3
  if (dCornerSt(i)==1 && nCorner(i)==j && zCorner(i)==2)
    p1(3,j)=i;
  
  elseif(dCornerSt(i)==-3 && nCorner(i)==j && zCorner(i)==3)
    p2(3,j)=i;
  endif
  
i=i+1;
  
  if (i>2 && i<=ref_length)
    aVehicle(i)=((vVehicle(i)-vVehicle(i-1))/0.001);
  endif
  
endwhile

%sVehicle structure
%(1:-) = [mean,min,max,mean turns] of vVehicle
%(2:-) = [mean turns, min turns] of Decceleration
%(3:-) = [mean turns, max turns] of Acceleration
%(4:-) = [mean turns, max turns] of pBrakeF
%(5:-) = [mean turns, max turns] of rSlip

sVehicle(1,j+3)=mean(vVehicle(p1(j):p2(j)));

aVehicle=filter(lp_coeff,1,aVehicle);
aVehicle=medfilt1(aVehicle, 650);

sVehicle(2,j)=mean(aVehicle(p1(2,j):p2(2,j)));
sVehicle(2,j+nCornerMax)=min(aVehicle(p1(2,j):p2(2,j)));

sVehicle(4,j)=mean(pBrakeF(p1(2,j):p2(2,j)));
sVehicle(4,j+nCornerMax)=max(pBrakeF(p1(2,j):p2(2,j)));

sVehicle(3,j)=mean(aVehicle(p1(3,j):p2(3,j)));
sVehicle(3,j+nCornerMax)=max(aVehicle(p1(3,j):p2(3,j)));

sVehicle(5,j)=mean(rSlip(p1(3,j):p2(3,j)));
sVehicle(5,j+nCornerMax)=max(rSlip(p1(3,j):p2(3,j)));

j=j+1;
endwhile