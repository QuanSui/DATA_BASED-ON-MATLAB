clear all;

%% branch data
X_m_base = [0.06; 0.19; 0.17; 0.2; 0.18; 0.04;     0.04; 0.26; 0.12; 0.08; 0.04; 0.21;      0.56; 0.06; 0.2; 0.11; 0.21; 0.08;  0.21; 0.07; 0.15; 0.14; 0.26; 0.13; 0.2; 0.2; 0.22; 0.2	; 0.19; 0.13; 0.07; 0.02; 0.18; 0.27; 0.33; 0.38; 0.21; 0.42; 0.6 ; 0.4	; 0.45;];
dia_x=zeros(41,41); % 电抗矩阵
for i=1:41
    dia_x(i,i)=1./X_m_base(i);
end
% 1-5                 % 6-10                       % 11-15                     % 16-20                 % 21-25                       % 26-30
C_matrix=[
    1   -1   0   0   0      0   0   0   0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    1   0   -1   0   0      0   0   0   0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   1   0   -1   0      0   0   0   0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   1   0   0   -1      0   0   0   0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   1  0   0    0       -1  0   0   0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   0   1   -1  0       0   0   0   0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   0   0   1   0       -1  0   0   0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   0   0   1   0       0   0   0   0   0          0   -1   0   0   0         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   0   0   0   1       0  -1   0   0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   0   0   0   0       1  -1   0   0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    % 1-10
    0   0   0   0   0       1   0   -1  0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   0   0   0   0       1   0   0  -1   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   0   0   0   0       1   0   0   0   -1         0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   0   0   0   0       1   0   0   0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    0  -1   0   0;
    0   0   0   0   0       0   0   1   0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    0  -1   0   0;
    0   0   0   0   0       0   0   0   1  -1          0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   0   0   0   0       0   0   0   1   0         -1    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   0   0   0   0       0   0   0   0   1          0    0   0   0   0         0   -1   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   0   0   0   0       0   0   0   0   1          0    0   0   0   0         0    0   0   0  -1        0    0   0   0   0         0    0   0   0   0;
    0   0   0   0   0       0   0   0   0   1          0    0   0   0   0         0    0   0   0   0       -1    0   0   0   0         0    0   0   0   0;
    % 11-20
    0   0   0   0   0       0   0   0   0   1          0    0   0   0   0         0    0   0   0   0        0   -1   0   0   0         0    0   0   0   0;
    0   0   0   0   0       0   0   0   0   0          0    1  -1   0   0         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   0   0   0   0       0   0   0   0   0          0    1   0  -1   0         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   0   0   0   0       0   0   0   0   0          0    1   0   0  -1         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   0   0   0   0       0   0   0   0   0          0    1   0   0   0        -1    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   0   0   0   0       0   0   0   0   0          0    0   0   1  -1         0    0   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   0   0   0   0       0   0   0   0   0          0    0   0   0   1         0    0  -1   0   0        0    0   0   0   0         0    0   0   0   0;
    0   0   0   0   0       0   0   0   0   0          0    0   0   0   1         0    0   0   0   0        0    0  -1   0   0         0    0   0   0   0;
    0   0   0   0   0       0   0   0   0   0          0    0   0   0   0         1   -1   0   0   0        0    0   0   0   0         0    0   0   0   0;
    0   0   0   0   0       0   0   0   0   0          0    0   0   0   0         0    0   1  -1   0        0    0   0   0   0         0    0   0   0   0;
    % 21-30
    0   0   0   0   0       0   0   0   0   0          0    0   0   0   0         0    0   0   1   -1       0    0   0   0   0         0    0   0   0   0;
    0   0   0   0   0       0   0   0   0   0          0    0   0   0   0         0    0   0   0   0        1   -1   0   0   0         0    0   0   0   0;
    0   0   0   0   0       0   0   0   0   0          0    0   0   0   0         0    0   0   0   0        0     1  0  -1   0         0    0   0   0   0;
    0   0   0   0   0       0   0   0   0   0          0    0   0   0   0         0    0   0   0   0        0    0   1  -1   0         0    0   0   0   0;
    0   0   0   0   0       0   0   0   0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   1  -1         0    0   0   0   0;
    0   0   0   0   0       0   0   0   0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   1        -1    0   0   0   0;
    0   0   0   0   0       0   0   0   0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   1         0   -1   0   0   0;
    0   0   0   0   0       0   0   0   0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    1   0  -1   0;
    0   0   0   0   0       0   0   0   0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    1   0   0   -1;
    0   0   0   0   0       0   0   0   0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    1   -1  0   0;
    0   0   0   0   0       0   0   0   0   0          0    0   0   0   0         0    0   0   0   0        0    0   0   0   0         0    0   0   1  -1;
    % 31-41
    ];
C1_matrix(:,:)=C_matrix(:,2:30);
H1=(dia_x*C1_matrix)*inv(C1_matrix'*dia_x*C1_matrix); %不计参考母线的PTDF矩阵
H2(:,:)=[zeros(41,1),H1];
P_fmax=[130; 130; 65; 130; 65; 130; 90; 65; 70; 130; 32; 65; 32; 32; 32; 65; 65; 32; 32; 32; 32; 65; 32; 32; 32; 16; 16; 16;16; 16; 32; 32; 16; 16; 16; 16; 16; 16; 16; 65; 16]; %power flow limit of branchs
P_wind=[ 95, 90, 92, 87, 80, 59,  62, 62, 63, 58, 52, 55,  67, 66, 70, 61, 68, 66, 67, 74, 80, 88,85, 91 ]*1.8*0.95; % wind power
Pload=[69, 65, 61,60,  61,64, 68, 70, 73, 80, 90, 93, 95, 95, 97, 100, 100, 97, 96, 92, 92, 90, 77, 77]*2.4*0.95;  % load power
t=1:24;
plot(t,Pload(t),'-k',t,P_wind(t),'-b');
legend('Load','Wind');

T=24;  % hour; dispatching period
Point=30; %  2 minutes



M=100000; % a large number
Price_H2=40; % yuan/kg
Price_coal=750; % yuan/t

Number_load=19;  % node number with loads.
% r_wind=normrnd(0,0.13,1,720);
load('rand.mat');


Pload_net=zeros(1,720);


P_heatingN=100;  %  rated heating power (MW)
Heat_capactiy=650;  %  heat storage capactiy (MWh)
SOC_heat0=0.5;  %  initial storage energy (MW)
E_H2_N=50;  %  rated input power of hydrogen produciton

a_H2=-0.00359745176041988   *36/1.425; % coefficients of hydraogen production funciton  kg/MW^2
b_H2=0.688848964007796    *36/1.425;% coefficients of hydraogen production funciton  kg/MW
c_H2=-1.07720793353467   *36/1.425;% coefficients of hydraogen production funciton  kg
E0=-sqrt(b_H2^2-4*a_H2*c_H2)/(2*abs(a_H2))-b_H2/(2*a_H2);

P_G1_min=3;
P_G2_min=2;
P_G3_min=10;
P_G4_min=15;
P_G5_min=15;
P_G1_max=20;
P_G2_max=25;
P_G3_max=45;
P_G4_max=60;
P_G5_max=80;
D_G1=0.20.*60;
D_G2=0.25.*60;
D_G3=0.45.*60;
D_G4=0.60.*60;
D_G5=0.80.*60;
U_G1=D_G1;
U_G2=D_G2;
U_G3=D_G3;
U_G4=D_G4;
U_G5=D_G5;

P_G1=sdpvar(1,T,'full'); % thermal unit 1-5
P_G2=sdpvar(1,T,'full');
P_G3=sdpvar(1,T,'full');
P_G4=sdpvar(1,T,'full');
P_G5=sdpvar(1,T,'full');
P_flow=sdpvar(41,T*Point,'full'); % branch power flow
P_inj=sdpvar(30,T*Point,'full'); % nodal injection power

% P_wind_curtail=sdpvar(1,T*Point,'full'); % wind curtailment
E_H2_input=sdpvar(1,T*Point,'full');  %  input power of hydrogen produciton
P_H2_input=sdpvar(1,T*Point,'full');  %  input electric power of hydrogen produciton
Q_H2_input=sdpvar(1,T*Point,'full');  %  input thermal power of hydrogen produciton
P_heating=sdpvar(1,T*Point,'full');  %  heating power (MW)
SOC_heat=sdpvar(1,T*Point,'full');  %  heat storage energy (MW)
P_surplus=sdpvar(1,T*Point,'full');  %  P_surplus power (MW)

U_lb=binvar(1,T*Point);
U_ub=binvar(1,T*Point);
P_lb=sdpvar(1,T,'full');
P_ub=sdpvar(1,T,'full');
P_lb_surplus=sdpvar(1,T*Point,'full');
P_ub_surplus=sdpvar(1,T*Point,'full');
P_ub_ub=sdpvar(1,T*Point,'full'); % P_ub_ub=P_ub*U_ub

U_H=binvar(1,T*Point); % linearizaiton of hydrogen produciton  characteristic




%%【发电机节点只能是1,2,22,27,23,13】{此文就分别放置1号机组（平衡节点）、风电、3号机组、4号机组、5号机组、2号机组}；
F=(P_inj(1,1)==P_G1(1));
for t=1:T
    for point=1:Point
        F=F+(P_G1(t)+P_G2(t)+P_G3(t)+P_G4(t)+P_G5(t)+P_wind(t)*(1+r_wind(t*Point-Point+point))-Pload(t)*(1+r_load(t*Point-Point+point))==P_surplus(t*Point-Point+point)); % Power balance
        F=F+(P_surplus(t*Point-Point+point)==P_H2_input(t*Point-Point+point)+P_heating(t*Point-Point+point)); % Power balance
        %         F=F+(U_ub(t*Point-Point+point)==0);
        %         F=F+(U_lb(t*Point-Point+point)==1);
        F=F+(0<=P_lb(t)<=P_ub(t));   %  P_ub_ub=P_ub*U_ub
        F=F+(0<=P_ub_ub(t*Point-Point+point)<=P_ub(t));   %  P_ub_ub=P_ub*U_ub
        F=F+(P_ub(t)+U_ub(t*Point-Point+point)*M-M<=P_ub_ub(t*Point-Point+point)<=U_ub(t*Point-Point+point)*M);
        F=F+(0<=P_lb_surplus(t*Point-Point+point)<=P_surplus(t*Point-Point+point)); % P_lb_surplus=P_surplus*U_lb
        F=F+(P_surplus(t*Point-Point+point)+U_lb(t*Point-Point+point)*M-M<=P_lb_surplus(t*Point-Point+point)<=U_lb(t*Point-Point+point)*M); % P_lb_surplus=P_surplus*U_lb
        F=F+(0<=P_ub_surplus(t*Point-Point+point)<=P_surplus(t*Point-Point+point)); % P_ub_surplus=P_surplus*U_ub
        F=F+(P_surplus(t*Point-Point+point)+U_ub(t*Point-Point+point)*M-M<=P_ub_surplus(t*Point-Point+point)<=U_ub(t*Point-Point+point)*M); % P_ub_surplus=P_surplus*U_ub
        F=F+(U_lb(t*Point-Point+point)+U_ub(t*Point-Point+point)<=1);
        
        F=F+(P_surplus(t*Point-Point+point)+U_lb(t*Point-Point+point)*M-M<=P_lb(t));
        F=F+(P_lb(t)-(U_ub(t*Point-Point+point)+U_lb(t*Point-Point+point))*M<=P_surplus(t*Point-Point+point)<=P_ub(t)+(U_ub(t*Point-Point+point)+U_lb(t*Point-Point+point))*M);
        F=F+(P_ub(t)<=(1-U_ub(t*Point-Point+point))*M+ P_ub_surplus(t*Point-Point+point));
        
        F=F+(P_H2_input(t*Point-Point+point)==P_surplus(t*Point-Point+point)-P_lb_surplus(t*Point-Point+point)-P_ub_surplus(t*Point-Point+point)+P_ub_ub(t*Point-Point+point));
        
        
        F=F+(0<=E_H2_input(t*Point-Point+point)<=E_H2_N*U_H(t*Point-Point+point)); % hydrogen production power limit
        F=F+(E0-M+M*U_H(t*Point-Point+point)<=E_H2_input(t*Point-Point+point)<=E_H2_N+M-M*U_H(t*Point-Point+point) ); % hydrogen production power limit

        F=F+(P_H2_input(t*Point-Point+point)==0.61836060981885.*E_H2_input(t*Point-Point+point)); % relationship between the hydrogen production power and electric power
        F=F+(Q_H2_input(t*Point-Point+point)==0.585361466702031.*(1-298.15/873.15).*E_H2_input(t*Point-Point+point)); % relationship between the hydrogen production power and themal power
        F=F+(0<=P_heating(t*Point-Point+point)<=P_heatingN); % heating pwoer constriant
        F=F+(0<=SOC_heat(t*Point-Point+point)<=1); % heat storage constriant
        if t==1 && point==1
            F=F+(SOC_heat(t*Point-Point+point)==SOC_heat0+(P_heating(t*Point-Point+point)-Q_H2_input(t*Point-Point+point))/Point/Heat_capactiy);
        else
            F=F+(SOC_heat(t*Point-Point+point)==SOC_heat(t*Point-Point+point-1)+(P_heating(t*Point-Point+point)-Q_H2_input(t*Point-Point+point))/Point/Heat_capactiy);
        end
        if t==T && point==Point
           F=F+(SOC_heat(t*Point-Point+point)==SOC_heat0);
        end
    end
    
    F=F+(P_G1_min<=P_G1(t)<=P_G1_max);     %thermal unit power constriant
    F=F+(P_G2_min<=P_G2(t)<=P_G2_max);
    F=F+(P_G3_min<=P_G3(t)<=P_G3_max);
    F=F+(P_G4_min<=P_G4(t)<=P_G4_max);
    F=F+(P_G5_min<=P_G5(t)<=P_G5_max);
    
    if t>=2
        F=F+(-D_G1<=P_G1(t)-P_G1(t-1)<=U_G1);      %thermal unit power ramp constriant
        F=F+(-D_G2<=P_G2(t)-P_G2(t-1)<=U_G2);
        F=F+(-D_G3<=P_G3(t)-P_G3(t-1)<=U_G3);
        F=F+(-D_G4<=P_G4(t)-P_G4(t-1)<=U_G4);
        F=F+(-D_G5<=P_G5(t)-P_G5(t-1)<=U_G5);
    end
    F=F+( min(D_G1,P_G1(t)-P_G1_min)+min(D_G2,P_G2(t)-P_G2_min)+min(D_G3,P_G3(t)-P_G3_min)+min(D_G4,P_G4(t)-P_G4_min)+min(D_G5,P_G5(t)-P_G5_min)>=P_wind(t)*0.1+Pload(t)*0.035 );    % Spinning reserve
    F=F+( min(U_G1,P_G1_max-P_G1(t))+min(U_G2,P_G2_max-P_G2(t))+min(U_G3,P_G3_max-P_G3(t))+min(U_G4,P_G4_max-P_G4(t))+min(U_G5,P_G5_max-P_G5(t))>=P_wind(t)*0.1+Pload(t)*0.035 );
    
    
end

for s=1:41
    for t=1:T*Point
        F=F+(-P_fmax(s)<=P_flow(s,t)<= P_fmax(s));  % power flow limit
    end
end
F=F+(P_flow==H2*P_inj) ;
for t=1:T
    for point=1:Point
        F=F+(P_inj(1,t*Point-Point+point)==P_G1(t));% thermal unit 1
        F=F+(P_inj(2,t*Point-Point+point)==P_wind(t)*(1+r_wind(t*Point-Point+point))-P_surplus(t*Point-Point+point)); %风电、制氢储热(先不加) 这个容易错！！！！！
        F=F+(P_inj(3,t*Point-Point+point)==-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);
        F=F+(P_inj(4,t*Point-Point+point)==-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);
        F=F+(P_inj(5,t*Point-Point+point)==0);
        F=F+(P_inj(6,t*Point-Point+point)==0);
        F=F+(P_inj(7,t*Point-Point+point)==-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);
        F=F+(P_inj(8,t*Point-Point+point)==-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);
        F=F+(P_inj(9,t*Point-Point+point)==0);
        F=F+(P_inj(10,t*Point-Point+point)==-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);
        F=F+(P_inj(11,t*Point-Point+point)==0);
        F=F+(P_inj(12,t*Point-Point+point)==-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);
        F=F+(P_inj(13,t*Point-Point+point)==P_G2(t));   % thermal unit 2
        F=F+(P_inj(14,t*Point-Point+point)==-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);
        F=F+(P_inj(15,t*Point-Point+point)==-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);
        F=F+(P_inj(16,t*Point-Point+point)==-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);
        F=F+(P_inj(17,t*Point-Point+point)==-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);
        F=F+(P_inj(18,t*Point-Point+point)==-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);
        F=F+(P_inj(19,t*Point-Point+point)==-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);
        F=F+(P_inj(20,t*Point-Point+point)==-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);
        F=F+(P_inj(21,t*Point-Point+point)==-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);
        F=F+(P_inj(22,t*Point-Point+point)==P_G3(t));   % thermal unit 3
        F=F+(P_inj(23,t*Point-Point+point)==P_G5(t)-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);% thermal unit 5
        F=F+(P_inj(24,t*Point-Point+point)==-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);
        F=F+(P_inj(25,t*Point-Point+point)==0);
        F=F+(P_inj(26,t*Point-Point+point)==-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);
        F=F+(P_inj(27,t*Point-Point+point)==P_G4(t));% thermal unit 4
        F=F+(P_inj(28,t*Point-Point+point)==0);
        F=F+(P_inj(29,t*Point-Point+point)==-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);
        F=F+(P_inj(30,t*Point-Point+point)==-Pload(t)*(1+r_load(t*Point-Point+point))/Number_load);
    end
end

f=0;
f1=0;
f2=0;
for t=1:T
    f1=f1+ Price_coal*((0.000525.*P_G1(t).^2+0.5.*P_G1(t)+7.5)+(0.0004375.* P_G2(t).^2+0.5625.*P_G2(t)+9.375)+(0.0005625.*P_G3(t)^2+0.5.*P_G3(t)+11.25)+(0.004375.*P_G4(t)^2+0.4375.*P_G4(t)+12.5)+(0.000525.*P_G5(t)^2+0.3875.*P_G5(t)+20));
    for point=1:Point
        f2=f2-Price_H2*(a_H2*E_H2_input(t*Point-Point+point)^2+b_H2*E_H2_input(t*Point-Point+point)+c_H2*U_H(t*Point-Point+point))/Point;
    end
end
f=f1+f2;
ops = sdpsettings('solver', 'Gurobi', 'verbose', 2);
solvesdp(F,f,ops)
objective1=double(f1);
objective2=double(f2);
u_H=double(U_H);
objective=double(f);
p_g=double(P_G1+P_G2+P_G3+P_G4+P_G5);
sum(p_g) % thermal generaiton 
e_H2=double(E_H2_input);
sum(a_H2*e_H2(:).^2+b_H2*e_H2(:)+c_H2*double(u_H(:)))  % hydrogen production 
sum(e_H2(:))  % energy consumption for hydrogen production 

p_surplus=double(P_surplus);  % surplus power 
p_heating=double(P_heating);  % heating power 
p_H2_input=double(P_H2_input);  % electric power for hydrogen produciton
for t=1:T
    [p_surplus_new(t*Point-Point+1:t*Point), index]=sort(p_surplus(t*Point-Point+1:t*Point));
    Index(t*Point-Point+1:t*Point)=index(1:Point)+t*Point-Point; 
end
t=1:T*Point;
plot(t,p_surplus_new(t),'-r',t,p_heating(Index(t)),'-b',t,p_H2_input(Index(t)),'-k');



plot(e_H2)
t=1:T;
plot(t,p_g(t),'-r',t,P_wind(t),'-b',t,Pload(t),'-k',t,e_H2(t),'-m');
legend('火电','风电','负荷');


t=1:T*Point;
plot(t,double(P_surplus(t)),'-r',t,e_H2(t),'-b');
legend('Surplus power','Hydrogen produciton power');

t=1:T*Point;
plot(t,double(P_H2_input(t)),'-r',t,double(P_heating(t)),'-b',t,double(Q_H2_input(t)),'-m');
legend('Electric power for hydrogen produciton','Heating power','Thermal power for hydrogen produciton');




plot(double(SOC_heat))
plot(double(P_heating))