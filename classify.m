clear all;
clc;
% filename1 = '8nm_nomin.dump';
% A=importdata(filename1,' ',9);
cd ../download

filename2 = 'niti_8nm_G30_Temp_0.dump';

AA=importdata(filename2,' ',9);

% B = A.data(:,:);
B= AA.data(:,:);

%% suppose 30 grains
number_grain_1=18269;
number_grain_2=15991;
number_grain_3=21740;
number_grain_4=10449;
number_grain_5=15509;
number_grain_6=32544;
number_grain_7=12233;
number_grain_8=14194;
number_grain_9=12595;
number_grain_10=18065;
number_grain_11=10751;
number_grain_12=32518;
number_grain_13=7347;
number_grain_14=3295;
number_grain_15=11761;
number_grain_16=29364;
number_grain_17=14354;
number_grain_18=40819;
number_grain_19=9413;
number_grain_20=22437;
number_grain_21=39426;
number_grain_22=13777;
number_grain_23=29143;
number_grain_24=17188;
number_grain_25=16406;
number_grain_26=24388;
number_grain_27=29251;
number_grain_28=25581;
number_grain_29=18695;
number_grain_30=25738;

%%
a=number_grain_1+number_grain_2;
b=a+number_grain_3;
c=b+number_grain_4;
d=c+number_grain_5;
e=d+number_grain_6;
f=e+number_grain_7;
g=f+number_grain_8;
h=g+number_grain_9;
i=h+number_grain_10;
j=i+number_grain_11;
k=j+number_grain_12;
l=k+number_grain_13;
m=l+number_grain_14;
n=m+number_grain_15;
o=n+number_grain_16;
p=o+number_grain_17;
q=p+number_grain_18;
r=q+number_grain_19;
s=r+number_grain_20;
t=s+number_grain_21;
u=t+number_grain_22;
v=u+number_grain_23;
w=v+number_grain_24;
x=w+number_grain_25;
y=x+number_grain_26;
z=y+number_grain_27;
aa=z+number_grain_28;
bb=aa+number_grain_29;
cc=bb+number_grain_30;


grain_1=B(1:number_grain_1,:);
grain_2=B(number_grain_1+1:a,:);
grain_3=B(a+1:b,:);
grain_4=B(b+1:c,:);
grain_5=B(c+1:d,:);
grain_6=B(d+1:e,:);
grain_7=B(e+1:f,:);
grain_8=B(f+1:g,:);
grain_9=B(g+1:h,:);
grain_10=B(h+1:i,:);
grain_11=B(i+1:j,:);
grain_12=B(j+1:k,:);
grain_13=B(k+1:l,:);
grain_14=B(l+1:m,:);
grain_15=B(m+1:n,:);
grain_16=B(n+1:o,:);
grain_17=B(o+1:p,:);
grain_18=B(p+1:q,:);
grain_19=B(q+1:r,:);
grain_20=B(r+1:s,:);
grain_21=B(s+1:t,:);
grain_22=B(t+1:u,:);
grain_23=B(u+1:v,:);
grain_24=B(v+1:w,:);
grain_25=B(w+1:x,:);
grain_26=B(x+1:y,:);
grain_27=B(y+1:z,:);
grain_28=B(z+1:aa,:);
grain_29=B(aa+1:bb,:);
grain_30=B(bb+1:cc,:);


cd ../classify_grain
for N=1:30
eval(['output_classify(grain_',int2str(N),',',int2str(N),');'])
end
%%
% tic
% for t = 13
% eval(['IDtransfer(BB,grain_',int2str(t),',',int2str(t),');'])
% end
% toc





