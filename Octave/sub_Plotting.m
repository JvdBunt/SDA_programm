%This subfunction creates plots of the data available.

%Plot standard figure (1)
f1=figure(1);

subplot(3,1,1)
plot1=plotyy (t,RPM,t,Gear);

axis (plot1(1),([0 inf 5000 14800]));
axis (plot1(2),([0 inf 0 6.1]));

subplot(3,1,2)
%plot(t,zCorner,t,nCorner);
%axis([0 inf 0 7.1]);

plot(t,V_Front,t,V_Rear,t,CAN_vGPS);
legend('Vfront','Vrear','CAN_vGPS');

subplot(3,1,3)
plot1=plotyy (t, Throttle,t,pBrakeF);

xlabel ("time [sec]");

axis (plot1(1),([0 inf 0 105]));
axis (plot1(2),([0 inf 0 14]));

%Plot2
f2=figure(2);

subplot(4,3,1)
errorbar(sxSusp(1,4:(3+nCornerMax)),2,'#~.r');
axis([0.5 (nCornerMax+0.5) 60 100]);
grid on;
title('Midcorner suspension position - Front');
legend('Front');
xlabel ("CornerNr [-]");


subplot(4,3,2)
errorbar(sxSusp(2,4:(3+nCornerMax)),1,'#~.r');
xlabel ("CornerNr [-]");
axis([0.5 (nCornerMax+0.5) 10 27.5]);
grid on;
legend('Rear');
title('Midcorner suspension position - Rear');

subplot(4,3,3)
errorbar(sxSusp(1,(4+nCornerMax):3+nCornerMax+nCornerMax),0.05,'#~.r');
xlabel ("CornerNr [-]");
axis([0.5 (nCornerMax+0.5) 3 4]);
grid on;
title('Midcorner indication pitch angle');

subplot(4,3,4)
errorbar(sxSusp(3,1:(3+nCornerMax)),15,'#~.r');
xlabel ("CornerNr [-]");
axis([0.5 (nCornerMax+0.5) -300 0]);
grid on;
title('Rebound speed - Front');

subplot(4,3,5)
errorbar(sxSusp(4,1:(3+nCornerMax)),15,'#~.r');
xlabel ("CornerNr [-]");
axis([0.5 (nCornerMax+0.5) 200 500]);
grid on;
title('Compression speed - Front');

subplot(4,3,7)
errorbar(sxSusp(4,1+nCornerMax:(3+nCornerMax+nCornerMax)),15,'#~.r');
xlabel ("CornerNr [-]");
axis([0.5 (nCornerMax+0.5) -300 0]);
grid on;
title('Rebound speed - Rear');

subplot(4,3,8)
errorbar(sxSusp(3,1+nCornerMax:(3+nCornerMax+nCornerMax)),10,'#~.r');
xlabel ("CornerNr [-]");
axis([0.5 (nCornerMax+0.5) 0 200]);
grid on;
title('Compression speed - Rear');

subplot(4,2,7)
text(0.2,0.6,'xSuspF');
text(0.2,0.3,'xSuspR');

text(0.4,0.9,'Max');
text(0.6,0.9,'Min');
text(0.8,0.9,'Mean');

text(0.4,0.6,num2str(sxSusp(1,3),"%5.1f"));
text(0.4,0.3,num2str(sxSusp(2,3),"%5.1f"));
text(0.6,0.6,num2str(sxSusp(1,2),"%5.1f"));
text(0.6,0.3,num2str(sxSusp(2,2),"%5.1f"));
text(0.8,0.6,num2str(sxSusp(1,1),"%5.1f"));
text(0.8,0.3,num2str(sxSusp(2,1),"%5.1f"));

%Plot3
f3=figure(3);

%Row1
subplot(4,1,1)
errorbar(sVehicle(1,4:(3+nCornerMax)),2,'#~.r');
axis([0.5 (nCornerMax+0.5) 40 180]);
grid on;
title('Midcorner speed');
xlabel ("CornerNr [-]");

%Row 2
subplot(4,4,5)
errorbar(sVehicle(2,1:nCornerMax),2,'#~.r');
axis([0.5 (nCornerMax+0.5) -50 0]);
grid on;
title('Decceleration during braking - Mean');
xlabel ("CornerNr [-]");

subplot(4,4,6)
errorbar(sVehicle(2,nCornerMax+1:nCornerMax+nCornerMax),2,'#~.r');
axis([0.5 (nCornerMax+0.5) -70 0]);
grid on;
title('Decceleration during braking - Min');
xlabel ("CornerNr [-]");

subplot(4,4,7)
errorbar(sVehicle(4,1:nCornerMax),2,'#~.r');
axis([0.5 (nCornerMax+0.5) 0 inf]);
grid on;
title('pBrakeF - Mean');
xlabel ("CornerNr [-]");

subplot(4,4,8)
errorbar(sVehicle(4,nCornerMax+1:nCornerMax+nCornerMax),2,'#~.r');
axis([0.5 (nCornerMax+0.5) 0 inf]);
grid on;
title('pBrakeF - Max');
xlabel ("CornerNr [-]");

%Row 3
subplot(4,4,9)
errorbar(sVehicle(3,1:nCornerMax),2,'#~.r');
axis([0.5 (nCornerMax+0.5) 0 40]);
grid on;
title('Acceleration - Mean');
xlabel ("CornerNr [-]");

subplot(4,4,10)
errorbar(sVehicle(5,nCornerMax+1:nCornerMax+nCornerMax),2,'#~.r');
axis([0.5 (nCornerMax+0.5) 0 60]);
grid on;
title('Acceleration - Max');
xlabel ("CornerNr [-]");

subplot(4,4,11)
errorbar(sVehicle(5,1:nCornerMax),2,'#~.r');
axis([0.5 (nCornerMax+0.5) 0 inf]);
grid on;
title('rSlip - Mean');
xlabel ("CornerNr [-]");

subplot(4,4,12)
errorbar(sVehicle(5,nCornerMax+1:nCornerMax+nCornerMax),2,'#~.r');
axis([0.5 (nCornerMax+0.5) 0 inf]);
grid on;
title('rSlip - Max');
xlabel ("CornerNr [-]");

%Row 4
subplot(4,1,4)
text(0.2,0.6,'vVehicle');

text(0.4,0.9,'Max');
text(0.6,0.9,'Min');
text(0.8,0.9,'Mean');

text(0.4,0.6,num2str(sVehicle(1,3),"%5.1f"));
text(0.6,0.6,num2str(sVehicle(1,2),"%5.1f"));
text(0.8,0.6,num2str(sVehicle(1,1),"%5.1f"));