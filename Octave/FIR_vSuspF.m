% test

pkg load signal

lp_coeff=fir1(50,10/1000,'low');
output_filter=filter(lp_coeff,1,vSuspF);

plot(t,output_filter,t,Throttle,t,xSuspF,t,zCorner)
