function [R,ID,IDout_x,IDout_y,IDout_z,N] = catching_postprocess_2999(N)

strr1='grain';
strr2='.dump';
filename = [strr1 num2str(N) strr2];

A=importdata(filename,' ',8);
B = A.data(:,:);


atomnumber = length(B);

ID = zeros(6,atomnumber);
finalid_x = zeros(8,atomnumber);
finalid_y = zeros(8,atomnumber);
finalid_z = zeros(8,atomnumber);
norm_dis = zeros(atomnumber,atomnumber);


%% distance
for n = 1:atomnumber
    for m = 1:atomnumber
        norm_dis(m,n)=norm(B(n,3:5)-B(m,3:5));
    end
end
norm_sort=sort(norm_dis);
format long

%% find ID(5cases)
for k =1:atomnumber
    if all(norm_sort(2:7,k)<=3)  %%%%%%inside atom
        find_id=find(ismembertol(norm_dis(:,k),2.999,0.0001));
        
        ID(1,k) = find_id(1);
        ID(2,k) = find_id(2);
        ID(3,k) = find_id(3);
        ID(4,k) = find_id(4);
        ID(5,k) = find_id(5);
        ID(6,k) = find_id(6);
        
    elseif all(norm_sort(2:6,k)<=3) && all(norm_sort(7,k)>=3)
        find_id=find(ismembertol(norm_dis(:,k),2.999,0.0001));
        ID(1,k) = find_id(1);
        ID(2,k) = find_id(2);
        ID(3,k) = find_id(3);
        ID(4,k) = find_id(4);
        ID(5,k) = find_id(5);
        ID(6,k) = 0;
        
    elseif all(norm_sort(2:5,k)<=3) && all(norm_sort(6:7,k)>=3)
        find_id=find(ismembertol(norm_dis(:,k),2.999,0.0001));
        ID(1,k) = find_id(1);
        ID(2,k) = find_id(2);
        ID(3,k) = find_id(3);
        ID(4,k) = find_id(4);
        ID(5,k) = 0;
        ID(6,k) = 0;
        
    elseif all(norm_sort(2:4,k)<=3) && all(norm_sort(5:7,k)>=3)
        find_id=find(ismembertol(norm_dis(:,k),2.999,0.0001));
        ID(1,k) = find_id(1);
        ID(2,k) = find_id(2);
        ID(3,k) = find_id(3);
        ID(4,k) = 0;
        ID(5,k) = 0;
        ID(6,k) = 0;
        
    else
        ID(1:6,k)=0;
    end
    
end

%% criteria
l = 1500;
if all(ID(:,l)>0)
    vector1 =  B(ID(1,l),3:5)-B(l,3:5);
    vector2 =  B(ID(2,l),3:5)-B(l,3:5);
    vector3 =  B(ID(3,l),3:5)-B(l,3:5);
    vector4 =  B(ID(4,l),3:5)-B(l,3:5);
    vector5 =  B(ID(5,l),3:5)-B(l,3:5);
    vector6 =  B(ID(6,l),3:5)-B(l,3:5);
    vector = [vector1;vector2;vector3;vector4;vector5;vector6;];
    vector_new = [vector1;vector2;vector3;vector4;vector5;vector6;];
else
    return
end
m = 1;
for n = 1:6
    if all((vector(m,:)>0)==(vector(n,:)*-1>0))
        
        Xvector=[vector(m,:);vector(n,:)];
        
        vector([m n],:)=[];
    end
end

for n = 1:4
    if all((vector(m,:)>0)==(vector(n,:)*-1>0))
        
        Yvector=[vector(m,:);vector(n,:)];
        
        vector([m n],:)=[];
    end
end

for n = 1:2
    if all((vector(m,:)>0)==(vector(n,:)*-1>0))
        
        Zvector=[vector(m,:);vector(n,:)];
        
        vector([m n],:)=[];
    end
end

standard_vectorX=Xvector(1,:);
standard_vectorY=Yvector(1,:);
standard_vectorZ=Zvector(1,:);
standard_vectornX=Xvector(2,:);
standard_vectornY=Yvector(2,:);
standard_vectornZ=Zvector(2,:);
standard_vector=[standard_vectorX;standard_vectornX;standard_vectorY;standard_vectornY;standard_vectorZ;standard_vectornZ];

%% R
Q1=[2.999 0 0; 0 2.999 0; 0 0 2.999];
Q2=[standard_vector(1,:);standard_vector(3,:);standard_vector(5,:)];
R=Q1\Q2;


%% result
[finalid_x]=Xdirection_catching(B,atomnumber,ID,finalid_x,standard_vector);
[finalid_y]=Ydirection_catching(B,atomnumber,ID,finalid_y,standard_vector);
[finalid_z]=Zdirection_catching(B,atomnumber,ID,finalid_z,standard_vector);


b=1;
for g=1:atomnumber
    if all(finalid_x(:,g)>0)
        finalid_result_x(:,b)=finalid_x(:,g);
        b=b+1;
    end
end

b=1;
for g=1:atomnumber
    if all(finalid_y(:,g)>0)
        finalid_result_y(:,b)=finalid_y(:,g);
        b=b+1;
    end
end

b=1;
for g=1:atomnumber
    if all(finalid_z(:,g)>0)
        finalid_result_z(:,b)=finalid_z(:,g);
        b=b+1;
    end
end

IDout_x=finalid_result_x';
IDout_y=finalid_result_y';
IDout_z=finalid_result_z';

%% output
% str1 = 'grain';
% str2 = '_IDX.txt';
% filename = [str1 num2str(N) str2];
% fileID = fopen(filename,'w');
% fprintf(fileID, '%d %d %d %d %d %d %d %d \r\n',finalid_result_x');
% fclose(fileID);
%
% str2 = '_IDY.txt';
% filename = [str1 num2str(N) str2];
% fileID = fopen(filename,'w');
% fprintf(fileID, '%d %d %d %d %d %d %d %d \r\n',finalid_result_y');
% fclose(fileID);
%
% str2 = '_IDZ.txt';
% filename = [str1 num2str(N) str2];
% fileID = fopen(filename,'w');
% fprintf(fileID, '%d %d %d %d %d %d %d %d \r\n',finalid_result_z');
% fclose(fileID);
end












