function [finalid_x]=Xdirection_catching(B,atomnumber,ID,finalid_x,standard_vector)

for q = 1:atomnumber
%% inside atom
if all(ID(1:6,q)>0)

[find_z,find_nz,find_x,find_nx,find_y,find_ny]=define_direction_inside(B,q,ID,standard_vector);

PX=ID(find_x(1),q);

P1=ID(find_z(1),q);
P2=ID(find_y(1),q);
P3=ID(find_nz(1),q);
P4=ID(find_ny(1),q);

if all(ID(:,PX)>0)
[find_z,find_nz,find_x,find_nx,find_y,find_ny]=define_direction_inside(B,PX,ID,standard_vector);
P5=ID(find_z(1),PX);
P6=ID(find_y(1),PX);
P7=ID(find_nz(1),PX);
P8=ID(find_ny(1),PX);

elseif all(ID(1:5,PX)>0)
[find_z,find_nz,find_x,find_nx,find_y,find_ny]=define_direction_phase(B,PX,ID,standard_vector);

if all(find_x==0)
P5=ID(find_z(1),PX);
P6=ID(find_y(1),PX);
P7=ID(find_nz(1),PX);
P8=ID(find_ny(1),PX);
else
    P5=0;
    P6=0;
    P7=0;
    P8=0;
end

else
    P5=0;
    P6=0;
    P7=0;
    P8=0;
end
    
eightpoints_check=P1*P2*P3*P4*P5*P6*P7*P8;
    if eightpoints_check~=0
     finalid_x(1:8,q)=[B(P1) B(P2) B(P3) ...
        B(P4) B(P5) B(P6) B(P7) B(P8)];
    end
%%  phase   
elseif all(ID(1:5,q)~=0) && all(ID(6,q)==0)
[find_z,find_nz,find_x,find_nx,find_y,find_ny]=define_direction_phase(B,q,ID,standard_vector);

if all(find_x~=0) && all(find_nx==0)

PX=ID(find_x(1),q);

P1=ID(find_z(1),q);
P2=ID(find_y(1),q);
P3=ID(find_nz(1),q);
P4=ID(find_ny(1),q);
if all(ID(:,PX)>0)
[find_z,find_nz,find_x,find_nx,find_y,find_ny]=define_direction_inside(B,PX,ID,standard_vector);
P5=ID(find_z(1),PX);
P6=ID(find_y(1),PX);
P7=ID(find_nz(1),PX);
P8=ID(find_ny(1),PX);
else
    P5=0;
    P6=0;
    P7=0;
    P8=0;
end


eightpoints_check=P1*P2*P3*P4*P5*P6*P7*P8;
    if eightpoints_check~=0
     finalid_x(1:8,q)=[B(P1) B(P2) B(P3) ...
        B(P4) B(P5) B(P6) B(P7) B(P8)];
    end
else
    continue
end

end   
end   
end


