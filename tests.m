clc
close all
clear all

%% let's try the two C(||∆I||) proposed in the wiki

x = linspace(-20,20,10000);

figure 
hold on
for k=logspace(-2,1,10)
    plot(x,C1(x,k),'r')
    plot(x,C2(x,k),'b')
%     plot(x,C3(x,k),'k')
%     plot(x,C4(x,k),'y')
    plot(x,C1C2(x,k,0.5,0.5),'g');
%     legend('C1','C2','C3','C4')
end

hold off
title('testing different K value with the two  C(||∆I||)')

%% testing my C(||∆I||)
k = 1;

figure 
hold on
plot(x,C1(x,k),'r')
plot(x,C2(x,k),'b')
plot(x,C3(x,k),'k')


