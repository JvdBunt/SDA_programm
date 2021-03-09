% This function performs a statistical analysis of the suspension behaviour.
% Structure 
% xSuspF: mean - min - max
% xSuspR: mean - min - max

ref_length= length(xSuspF);
nCornerMax=max(nCorner);
p1=zeros(1,nCornerMax);
p2=zeros(1,nCornerMax);

sxSusp=[mean(xSuspF),min(xSuspF),max(xSuspF);
mean(xSuspR),min(xSuspR),max(xSuspR)];

sxSuspF=zeros(1,ref_length)';
sxSuspR=zeros(1,ref_length)';
vSuspF=zeros(1,ref_length)';

pkg load signal
lp_coeff=fir1(50,10/1000,'low'); %(length of the filter, drop freq, lowpassfilter)

%Calculation of midcorner start and end points
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

i=i+1;
  
  if (i>2 && i<=ref_length)
    vSuspF(i)=((xSuspF(i)-xSuspF(i-1))/0.001);
    vSuspR(i)=((xSuspR(i)-xSuspR(i-1))/0.001);
  endif
  
endwhile

%calculation of midcorner values
sxSusp(1,j+3)=mean(xSuspF(p1(j):p2(j)));
sxSusp(2,j+3)=mean(xSuspR(p1(j):p2(j)));
vSuspF=filter(lp_coeff,1,vSuspF);
vSuspR=filter(lp_coeff,1,vSuspR);
sxSusp(3,j)=min(vSuspF(p1(j):p2(j)));
sxSusp(4,j)=max(vSuspF(p1(2,j):p2(2,j)));
sxSusp(3,j+nCornerMax)=max(vSuspF(p1(j):p2(j)));
sxSusp(4,j+nCornerMax)=min(vSuspF(p1(2,j):p2(2,j)));

sxSuspF(p1(j):p2(j))=xSuspF(p1(j):p2(j));
sxSuspR(p1(j):p2(j))=xSuspR(p1(j):p2(j));

%calculation of indication pitch angle
%wheelbase = 1200
sxSusp(1,j+3+nCornerMax)=tan((sxSusp(1,j+3)-(sxSusp(2,j+3)*2.1))/1200)*100;

j=j+1;
endwhile




%vSuspF=filter(lp_coeff,1,vSuspF);



