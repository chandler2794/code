l = 1000;
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