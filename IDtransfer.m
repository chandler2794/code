function [number_list]=IDtransfer(BB,grain_number,N)

number_list=zeros(length(grain_number),5);

i=1;
while i<=length(grain_number)
[n1,~]=ismembertol(BB(:,3),grain_number(i,3),0.0001);
[n2,~]=ismembertol(BB(:,4),grain_number(i,4),0.0001);
[n3,~]=ismembertol(BB(:,5),grain_number(i,5),0.0001);
k1=find(n1);
k2=find(n2);
k3=find(n3);
intersect_num1=intersect(k1,k2);
intersect_num2=intersect(intersect_num1,k3);

 if isempty(intersect_num1)==0 && isempty(intersect_num2)==0 


    number_list(i,1:5)=BB(intersect_num2,1:5) ;
    BB(intersect_num2,:)=[];

 end
 i=i+1;
end
str1 = 'grain';
str2 = '_translate.txt';
filename = [str1 num2str(N) str2];
fileID = fopen(filename,'w');
fprintf(fileID, '%d %d %7.4f %7.4f %7.4f \r\n',number_list');  
fclose(fileID);
end
