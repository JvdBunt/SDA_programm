j=1;
k=1;
while(j<=ref_length)
  if (dCornerSt(j)==2)
      nCorner(1,j)=nCorner(1,k);
      ++nCorner(1,j);
      k=j;
      
    else
      nCorner(1,j)=nCorner(1,k);
      
  endif
  nCorner(1,j)=nCorner(1,k);
  j=j+1;
endwhile

nCorner=nCorner';