%Corner counter

%
i=1;

while (i<=(Datafiles(1).lDatafiles))
  
%ref_length= length(Datafiles(i).xSuspF);
Datafiles(i).nCorner=zeros(1,Datafiles(i).ref_length);
Datafiles(i).zCornerSt=Datafiles(i).zCorner;
j=1;
k=1;
Datafiles(i).dCornerSt=diff(Datafiles(i).zCornerSt);
Datafiles(i).dCornerSt(end+1)=Datafiles(i).dCornerSt(end);

Datafiles(j).nCorner=Datafiles(j).nCorner';

i=i+1;
endwhile

clear('i');
clear('j');
clear('k');