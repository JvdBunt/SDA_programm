%Corner counter

%
ref_length= length(xSuspF);
nCorner=zeros(1,ref_length);
zCornerSt=zCorner;
j=1;
k=1;
dCornerSt=diff(zCornerSt);
dCornerSt(end+1)=dCornerSt(end);


