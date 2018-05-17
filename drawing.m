close all;
facenode = [ 1 5 8 4;
    2 3 7 6;
    1 4 3 2;
    5 6 7 8;
    1 2 6 5;
    4 8 7 3];
%% X-direction
figure(1)
title('X-direction')
for i =1000

 for a=1:8
   dia_x(a)=find(ismember(BB(:,1),IDout_z(i,a)));
 end
draw_x=[BB(dia_x(1),3:5);BB(dia_x(2),3:5);BB(dia_x(3),3:5);BB(dia_x(4),3:5);...
     BB(dia_x(5),3:5);BB(dia_x(6),3:5);BB(dia_x(7),3:5);BB(dia_x(8),3:5)];
hold on
p=patch('Faces',facenode,'Vertices',draw_x,'EdgeColor','b','FaceColor','none','LineWidth',2);

end
%% draw unknow
% for j = 1:size(finalid_x,2)
% if all(finalid_x(:,j)==0)
%     hold on
% plot3(B(j,3),B(j,4),B(j,5),'Marker','o','MarkerEdgeColor','k','MarkerSize',3,'MarkerFaceColor','w')
% end
% end
axis equal
view(300,30);

%% Y-direction
figure(2)
title('Y-direction')
for i =1%:size(finalid_result_y,2)

 for a=1:8
   dia_y(a)=find(ismember(BB(:,1),IDout_y(a,i)));
 end
draw_y=[BB(dia_y(1),3:5);BB(dia_y(2),3:5);BB(dia_y(3),3:5);BB(dia_y(4),3:5);...
     BB(dia_y(5),3:5);BB(dia_y(6),3:5);BB(dia_y(7),3:5);BB(dia_y(8),3:5)];

hold on
p=patch('Faces',facenode,'Vertices',draw_y,'FaceColor','g');

end
axis equal
view(300,30);
%% Z-direction
figure(3)
title('Z-direction')
for i =1%:size(finalid_result_z,2)

 for a=1:8
   dia_z(a)=find(ismember(B(:,1),finalid_result_z(a,i)));
 end
draw_z=[B(dia_z(1),3:5);B(dia_z(2),3:5);B(dia_z(3),3:5);B(dia_z(4),3:5);...
     B(dia_z(5),3:5);B(dia_z(6),3:5);B(dia_z(7),3:5);B(dia_z(8),3:5)];

hold on
p=patch('Faces',facenode,'Vertices',draw_z,'FaceColor','r');

end
axis equal
view(300,30);






