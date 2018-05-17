function [Result,Structure] = IsNewStructure(Angle,U,TOL)

% L=sort(L);

if      Angle(1,1) >= 93 && Angle(1,2) <= 92.5 && Angle(1,2) >= 87 && Angle(1,3) <= 92.5 && Angle(1,3) >= 87   ||...
        Angle(1,2) >= 93 && Angle(1,1) <= 92.5 && Angle(1,1) >= 87 && Angle(1,3) <= 92.5 && Angle(1,3) >= 87   ||...
        Angle(1,3) >= 93 && Angle(1,1) <= 92.5 && Angle(1,1) >= 87 && Angle(1,2) <= 92.5 && Angle(1,2) >= 87   ||...
        Angle(1,1) <= 88 && Angle(1,2) <= 92.5 && Angle(1,2) >= 87 && Angle(1,3) <= 92.5 && Angle(1,3) >= 87 ||...
        Angle(1,2) <= 88 && Angle(1,1) <= 92.5 && Angle(1,1) >= 87 && Angle(1,3) <= 92.5 && Angle(1,3) >= 87 ||...
        Angle(1,3) <= 88 && Angle(1,1) <= 92.5 && Angle(1,1) >= 87 && Angle(1,2) <= 92.5 && Angle(1,2) >= 87 
        
    Structure = 1;
    
elseif  Angle(1,1) < 93 && Angle(1,1) > 88 && Angle(1,2) < 93 && Angle(1,2) > 88 && Angle(1,3) < 93 && Angle(1,3) > 88 
 
    
    Structure = 2;
    
else
    Structure = 36;
    
end

% while  Structure == 36
%     n=0;
%     for i=1:8
%         if      Angle(i,1) >= 93 && Angle(i,2) <= 92.5 && Angle(i,2) >= 87 && Angle(i,3) <= 92.5 && Angle(i,3) >= 87 ||...
%                 Angle(i,2) >= 93 && Angle(i,1) <= 92.5 && Angle(i,1) >= 87 && Angle(i,3) <= 92.5 && Angle(i,3) >= 87 ||...
%                 Angle(i,3) >= 93 && Angle(i,1) <= 92.5 && Angle(i,1) >= 87 && Angle(i,2) <= 92.5 && Angle(i,2) >= 87 ||...
%                 Angle(i,1) <= 88 && Angle(i,2) <= 92.5 && Angle(i,2) >= 87 && Angle(i,3) <= 92.5 && Angle(i,3) >= 87 ||...
%                 Angle(i,2) <= 88 && Angle(i,1) <= 92.5 && Angle(i,1) >= 87 && Angle(i,3) <= 92.5 && Angle(i,3) >= 87 ||...
%                 Angle(i,3) <= 88 && Angle(i,1) <= 92.5 && Angle(i,1) >= 87 && Angle(i,2) <= 92.5 && Angle(i,2) >= 87
%             n=n+1;
%         end
%     end
%     if n>=4
%         Structure=1;
%     end
%     break
% end
        

% M Standard matrix =           0.9576   -0.0442   -0.0442
%                              -0.0442    1.0351    0.0616
%                              -0.0442    0.0616    1.0351

if     Structure == 2 && U(1,1)<U(2,2) && U(1,1)<U(3,3) && abs(U(1,2))>=1.2*TOL ||... % Á×§K»~§P
       Structure == 2 && U(1,1)<U(2,2) && U(1,1)<U(3,3) && abs(U(1,3))>=1.2*TOL ||...
       Structure == 2 && U(2,2)<U(1,1) && U(2,2)<U(3,3) && abs(U(1,2))>=1.2*TOL ||...
       Structure == 2 && U(2,2)<U(1,1) && U(2,2)<U(3,3) && abs(U(2,3))>=1.2*TOL ||...
       Structure == 2 && U(3,3)<U(1,1) && U(3,3)<U(2,2) && abs(U(1,3))>=1.2*TOL ||...
       Structure == 2 && U(3,3)<U(1,1) && U(3,3)<U(2,2) && abs(U(2,3))>=1.2*TOL
  
   Structure=1;
   
end

% M Standard matrix =           0.9576   -0.0442   -0.0442
%                              -0.0442    1.0351    0.0616
%                              -0.0442    0.0616    1.0351
   
if     Structure == 1 && U(1,1)<U(2,2) && U(1,1)<U(3,3) && U(2,2)>=1 && U(3,3)>=1 && U(2,3)>0 %&& abs(U(2,3))>=TOL
    Result = 12;
elseif Structure == 1 && U(1,1)<U(2,2) && U(1,1)<U(3,3) && U(2,2)>=1 && U(3,3)>=1 && U(2,3)<0 %&& abs(U(2,3))>=TOL
    Result = 34;
elseif Structure == 1 && U(2,2)<U(1,1) && U(2,2)<U(3,3) && U(1,1)>=1 && U(3,3)>=1 && U(1,3)>0 %&& abs(U(1,3))>=TOL
    Result = 56;
elseif Structure == 1 && U(2,2)<U(1,1) && U(2,2)<U(3,3) && U(1,1)>=1 && U(3,3)>=1 && U(1,3)<0 %&& abs(U(1,3))>=TOL
    Result = 78;
elseif Structure == 1 && U(3,3)<U(1,1) && U(3,3)<U(2,2) && U(1,1)>=1 && U(2,2)>=1 && U(1,2)>0  %&& abs(U(1,2))>=TOL
    Result = 910;
elseif Structure == 1 && U(3,3)<U(1,1) && U(3,3)<U(2,2) && U(1,1)>=1 && U(2,2)>=1 && U(1,2)<0  %&& abs(U(1,2))>=TOL
    Result = 1112;
    
% O Standard matrix =       0.9366       0         0
%                           0            1.0347    0.0269
%                           0            0.0269    1.0347        
elseif Structure == 2 && U(1,1)<U(2,2) && U(1,1)<U(3,3) && abs(U(1,2))<=2*TOL && abs(U(1,3))<=2*TOL && U(2,3)>0 && abs(U(2,3))>1.2*TOL
    Result = 13;
elseif Structure == 2 && U(1,1)<U(2,2) && U(1,1)<U(3,3) && abs(U(1,2))<=2*TOL && abs(U(1,3))<=2*TOL && U(2,3)<0 && abs(U(2,3))>1.2*TOL
    Result = 14;
elseif Structure == 2 && U(2,2)<U(1,1) && U(2,2)<U(3,3) && abs(U(1,2))<=2*TOL && abs(U(2,3))<=2*TOL && U(1,3)>0 && abs(U(1,3))>1.2*TOL
    Result = 15;
elseif Structure == 2 && U(2,2)<U(1,1) && U(2,2)<U(3,3) && abs(U(1,2))<=2*TOL && abs(U(2,3))<=2*TOL && U(1,3)<0 && abs(U(1,3))>1.2*TOL
    Result = 16;
elseif Structure == 2 && U(3,3)<U(1,1) && U(3,3)<U(2,2) && abs(U(1,3))<=2*TOL && abs(U(2,3))<=2*TOL && U(1,2)>0 && abs(U(1,2))>1.2*TOL
    Result = 17;
elseif Structure == 2 && U(3,3)<U(1,1) && U(3,3)<U(2,2) && abs(U(1,3))<=2*TOL && abs(U(2,3))<=2*TOL && U(1,2)<0 && abs(U(1,2))>1.2*TOL
    Result = 18;
    
    % A
elseif Structure == 2 && U(1,2)<1.2*TOL && U(3,3)<=U(2,2) && U(3,3)<=U(1,1) ||...
       Structure == 2 && U(1,3)<1.2*TOL && U(2,2)<=U(3,3) && U(2,2)<=U(1,1) ||...
       Structure == 2 && U(2,3)<1.2*TOL && U(1,1)<=U(2,2) && U(1,1)<=U(3,3)
 
    Result =23;
    
    %unknown
else 
    Result=36;
    
end

%M
if     Result == 12 && abs(U(1,2)-U(1,3))<=4.5*TOL && U(1,2)<0 && U(1,3)<0
    Result = 1;
elseif Result == 12 && abs(U(1,2)-U(1,3))<=4.5*TOL && U(1,2)>0 && U(1,3)>0
    Result = 2;
elseif Result == 34 && abs(U(1,2)+U(1,3))<=4.5*TOL && U(1,2)>0 && U(1,3)<0
    Result = 3;
elseif Result == 34 && abs(U(1,2)+U(1,3))<=4.5*TOL && U(1,2)<0 && U(1,3)>0
    Result = 4;
elseif Result == 56 && abs(U(1,2)-U(2,3))<=4.5*TOL && U(1,2)<0 && U(2,3)<0
    Result = 5;
elseif Result == 56 && abs(U(1,2)-U(2,3))<=4.5*TOL && U(1,2)>0 && U(2,3)>0
    Result = 6;
elseif Result == 78 && abs(U(1,2)+U(2,3))<=4.5*TOL && U(1,2)>0 && U(2,3)<0
    Result = 7;
elseif Result == 78 && abs(U(1,2)+U(2,3))<=4.5*TOL && U(1,2)<0 && U(2,3)>0
    Result = 8;
elseif Result == 910 && abs(U(1,3)-U(2,3))<=4.5*TOL && U(1,3)<0 && U(2,3)<0 ||...
       Result == 910 && abs(U(1,3)-U(2,3))<=4.5*TOL && abs(U(1,3))<2*TOL && U(2,3)<0 ||...
       Result == 910 && abs(U(1,3)-U(2,3))<=4.5*TOL && U(1,3)<0 && abs(U(2,3))<2*TOL
    Result = 9;
elseif Result == 910 && abs(U(1,3)-U(2,3))<=4.5*TOL && U(1,3)>0 && U(2,3)>0 ||...
       Result == 910 && abs(U(1,3)-U(2,3))<=4.5*TOL && abs(U(1,3))<2*TOL && U(2,3)>0 ||...
       Result == 910 && abs(U(1,3)-U(2,3))<=4.5*TOL && U(1,3)>0 && abs(U(2,3))<2*TOL
    Result = 10;
elseif Result == 1112 && abs(U(1,3)+U(2,3))<=4.5*TOL && U(1,3)<0 && U(2,3)>0 ||...
       Result == 1112 && abs(U(1,3)+U(2,3))<=4.5*TOL && abs(U(1,3))<2*TOL && U(2,3)>0 ||...
       Result == 1112 && abs(U(1,3)+U(2,3))<=4.5*TOL && U(1,3)<0 && abs(U(2,3))<2*TOL 
    Result = 11;
elseif Result == 1112 && abs(U(1,3)+U(2,3))<=4.5*TOL && U(1,3)>0 && U(2,3)<0 ||...
       Result == 1112 && abs(U(1,3)+U(2,3))<=4.5*TOL && abs(U(1,3))<2*TOL && U(2,3)<0 ||...
       Result == 1112 && abs(U(1,3)+U(2,3))<=4.5*TOL && U(1,3)>0 && abs(U(2,3))<2*TOL 
    Result = 12;
    
%O
elseif Result == 13 && U(1,1)<1
    Result = 13;
elseif Result == 13
    Result = 23;
elseif Result == 14 && U(1,1)<1
    Result = 14;
elseif Result == 14
    Result = 23;
elseif Result == 15 && U(2,2)<1
    Result = 15;
elseif Result == 15
    Result = 23;
elseif Result == 16 && U(2,2)<1
    Result = 16;
elseif Result == 16
    Result = 23;
elseif Result == 17 && U(3,3)<1
    Result = 17;
elseif Result == 17
    Result = 23;
elseif Result == 18 && U(3,3)<1
    Result = 18;
elseif Result == 18
    Result = 23;
    
    %A
elseif Result == 23
    Result = 23;
    
    %unknown
else
    Result = 36;
    
end
end




