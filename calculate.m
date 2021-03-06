%% move
% cd ../classify_grain

% [R,ID,IDout_x,IDout_y,IDout_z,N] = catching_postprocess_2999(1);


cd ../dumpoutput
filename_ref = 'ref';
filename = 'out.0';

C=importdata(filename_ref,' ',8);
B = C.data(:,:);

AA=importdata(filename,' ',8);
BB = AA.data(:,:);
%% direction
A=IDout_x;
%% 
M1=zeros(8,3);
M2=zeros(8,3);
U=zeros(3,3,length(A));
ang_r=zeros(length(A),3);
ang_o=zeros(length(A),3);
M1_vector=zeros(3,3,length(A));
M2_vector=zeros(3,3,length(A));





figure(1)
for b =1:length(A)
%%  8 points and three vector
for i = 1:8
M1(i,1:3)=B(logical(ismember(B(:,1),A(b,i))),3:5);
end

M1_vector(:,:,b)=[M1(2,:)-M1(1,:);M1(4,:)-M1(1,:);M1(5,:)-M1(1,:)];



for j = 1:8
M2(j,1:3)=BB(logical(ismember(BB(:,1),A(b,j))),3:5);
end

M2_vector(:,:,b)=[M2(2,:)-M2(1,:);M2(4,:)-M2(1,:);M2(5,:)-M2(1,:)];
%% angle
ang1=acosd(dot(M1_vector(1,:,b),M1_vector(3,:,b))/(norm(M1_vector(1,:,b))*norm(M1_vector(3,:,b))));
ang2=acosd(dot(M1_vector(2,:,b),M1_vector(3,:,b))/(norm(M1_vector(2,:,b))*norm(M1_vector(3,:,b))));
ang3=acosd(dot(M1_vector(1,:,b),M1_vector(2,:,b))/(norm(M1_vector(1,:,b))*norm(M1_vector(2,:,b))));
ang_r(b,1:3)=[ang1 ang2 ang3];

ang11=acosd(dot(M2_vector(1,:,b),M2_vector(3,:,b))/(norm(M2_vector(1,:,b))*norm(M2_vector(3,:,b))));
ang22=acosd(dot(M2_vector(2,:,b),M2_vector(3,:,b))/(norm(M2_vector(2,:,b))*norm(M2_vector(3,:,b))));
ang33=acosd(dot(M2_vector(1,:,b),M2_vector(2,:,b))/(norm(M2_vector(1,:,b))*norm(M2_vector(2,:,b))));
ang_o(b,1:3)=[ang11 ang22 ang33];

%% R
M1_trans(1,:,b)= M1_vector(1,:,b)/R;
M1_trans(2,:,b)= M1_vector(2,:,b)/R;
M1_trans(3,:,b)= M1_vector(3,:,b)/R;

M2_trans(1,:,b)= M2_vector(1,:,b)/R;
M2_trans(2,:,b)= M2_vector(2,:,b)/R;
M2_trans(3,:,b)= M2_vector(3,:,b)/R;
%% 
T=M2_trans(:,:,b)'/M1_trans(:,:,b)';
U(:,:,b)=sqrtm(T*T');
%% move

cd ../code

[U_Pos_Type(b,1),Structure(b,1)] = IsNewStructure(ang_o(b,1:3),U(:,:,b),0.012);

for a=1:8
   dia_x(a)=find(ismember(BB(:,1),A(b,a)));
 end
draw_x(:,:,b)=[BB(dia_x(1),3:5);BB(dia_x(2),3:5);BB(dia_x(3),3:5);BB(dia_x(4),3:5);...
     BB(dia_x(5),3:5);BB(dia_x(6),3:5);BB(dia_x(7),3:5);BB(dia_x(8),3:5)];


end
m_DrawPic;




