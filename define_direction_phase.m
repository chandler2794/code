function [find_z,find_nz,find_x,find_nx,find_y,find_ny]=define_direction_phase(B,q,ID,standard_vector)
vector11 =  B(ID(1,q),3:5)-B(q,3:5);
vector22 =  B(ID(2,q),3:5)-B(q,3:5);
vector33 =  B(ID(3,q),3:5)-B(q,3:5);
vector44 =  B(ID(4,q),3:5)-B(q,3:5);
vector55 =  B(ID(5,q),3:5)-B(q,3:5);

vector = [vector11;vector22;vector33;vector44;vector55];

find_z=find(ismembertol(vector(:,1),standard_vector(5,1),0.001));
find_nz=find(ismembertol(vector(:,1),standard_vector(6,1),0.001));

find_x=find(ismembertol(vector(:,1),standard_vector(1,1),0.001));
find_nx=find(ismembertol(vector(:,1),standard_vector(2,1),0.001));

find_y=find(ismembertol(vector(:,1),standard_vector(3,1),0.001));
find_ny=find(ismembertol(vector(:,1),standard_vector(4,1),0.001));



end