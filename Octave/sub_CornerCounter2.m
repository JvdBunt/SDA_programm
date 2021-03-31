
i=1;
j=1;
k=1;

while (i<=(Datafiles(1).lDatafiles))
  
  %ref_length= length(Datafiles(i).xSuspF);
  
while(j<=Datafiles(i).ref_length)

  if (Datafiles(i).dCornerSt(j)==2)
      Datafiles(i).nCorner(1,j)=Datafiles(i).nCorner(1,k);
      ++Datafiles(i).nCorner(1,j);
      k=j;
      
    else
      Datafiles(i).nCorner(1,j)=Datafiles(i).nCorner(1,k);
      
  endif
  Datafiles(i).nCorner(1,j)=Datafiles(i).nCorner(1,k);
  j=j+1;
endwhile

Datafiles(i).nCorner=Datafiles(i).nCorner';

i=i+1;
endwhile