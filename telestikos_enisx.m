%Stavros Vasileios Bouliopoulos 9671
%Hlentronikh 3 ergasia telestikou enisxyth
clear;
%prodiagrafes apo pdf ekfwnhshs

CL =2.71*10^(-12);
%SR>...
SR_min =18.71*10^(6);
V_dd =2.013;
V_ss =-V_dd;
%GB>...
GB_min =7.71*10^(6);
%A>...
A_min =20.71;
%P<...
P_max =50.71*10^(-3);
Vin_max =0.1;
Vin_min =-Vin_max;
%dedomena apo pspice model tou pdf ekfwnhshs 

Vton =0.786;
Vtop =-0.9056;
%thelw reumata Ib me I5 kontina
%k 50 me 150 kai Cox apo forum thread
%gia eukolia ston algori8mo ta 8ewroume ametablhta kai sta8era
kn =100*10^(-6);
kp =50*10^(-6);
Cox =2.3*10^(-3); %f/ì^2=mili
%CMOS 5n+3p
k1 =kn;
k2 =k1;
k7 =kn;
k8 =k7;
k5 =kn;

k3 =kp;
k4 =k3;
k6 =kp;

%bhmata sxediashs apo aggliko pdf selida27-36
%1
L =1*10^(-6); %ola idio mhkos
%2
Cc_min =0.22*CL; %0.5962p
%3
I5_min =Cc_min*SR_min;
%4
S3 = I5_min /(k3*(V_dd -Vin_max -abs(Vtop)+Vton)^2);
S3 =ceil(S3);
S4 =S3;
%5
I3 =I5_min;
W3 =S3 *L;
W4 =W3;
p3 =sqrt(kp *S3 *I3)/(2 *0.667 *W3 *L *Cox); 
p3 =p3/(2*pi); %1.225051503945623e+09>>77.1M
%6
gm_1 =GB_min* 2* pi*Cc_min;
gm_2 =gm_1;
S1 =gm_1^2/(k2*I5_min);
S1 =ceil(S1);
S2 =S1;
W1 =S1 *L;
W2 =W1;
%7
b1 =k1*S1;
VDS5_sat =Vin_min - V_ss - sqrt(I5_min/b1) - Vton; % 0.7930>0.1 comple
S5 =2*(I5_min)/(k5 *(VDS5_sat)^2);
S5 =ceil(S5);
S8 =S5;
W5 =S5 *L;
W8 =W5;
%telos me 1h aristerh bathmida ,twra gia thn 2h
%8
I4 =I5_min/2;
gm_4 =sqrt(2 *kp * S4 * I4);
gm_6 =2.2 *gm_2 *CL/Cc_min;
S6 =S4*gm_6/gm_4; %VGS4=VGS6
S6 =ceil(S6); %12.2295
I6 =gm_6^2/(2*k6*S6);
%9
S6other = gm_6 /(k6*VDS5_sat); %agnooume gt 7.284123555911043<S6
W6 =S6 *L;
%10
S7 =S5 *I6 /I5_min; 
S7 =ceil(S7);%5.7523
W7 =S7 *L;
%11
el_n =0.05;
el_p =0.15;
P_diss =(I5_min+I6)*(V_dd +abs(V_ss));
A_v =(2 *gm_2 *gm_6) /(I5_min *I6 *(el_n+el_p)^2); %582
A_v =10 *log10(A_v);
%12+13 = bhmata gia prosomoiwsh kai tuning kai allages W apo pinakaki selida32


















