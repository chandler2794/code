% off
% Range=[0,1, 0 ,1/2, 0, 1];
% P1 = min(CurAtomPosition);
% P2 = max(CurAtomPosition);
% 
% xCutMin=P1(1)+Range(1)*(P2(1)-P1(1));
% xCutMax=P1(1)+Range(2)*(P2(1)-P1(1));
% 
% yCutMin=P1(2)+Range(3)*(P2(2)-P1(2));
% yCutMax=P1(2)+Range(4)*(P2(2)-P1(2));
% 
% zCutMin=P1(3)+Range(5)*(P2(3)-P1(3));
% zCutMax=P1(3)+Range(6)*(P2(3)-P1(3));

facenode = [1 5 8 4;2 3 7 6;1 4 3 2;5 6 7 8;1 2 6 5;4 8 7 3];              % 填充多邊形的規則 (Face definitions)
         
PeColor = [222 184 135;...                                                 % Green３
           205 133  63;...                                                 % PaleGreen2
           160  82  45;...                                                 % PaleGreen4
           108  50  10;...                                                 % brown
    
           255 255   0;...                                                 % Gold
           255 215   0;...                                                 % LightGoldenrod
           238 221 130;...                                                 % goldenrod
           218 165  32;...                                                 % DarkGoldenrod YELLOW
    
           146 208  80;...                                                 % 9
            56  87  35;...                                                 % 10
           154 255 154;...                                                 % 11
            84 139  84;...                                                 % GREEN      12
    
           131 111 255;...                                                 % Blue4      13
            71  60 139;...                                                 % Blue1      14
             0   0 255;...                                                 % RoyalBlue4 15
             0   0 139;...                                                 % RoyalBlue1 16 主要
            72 118 255;...                                                 % SlateBlue4 17
            39  64 139;...                                                 % SlateBlue1 18
            
             0 255 255;...                                                 % 19
             0 139 139;...                                                 % 20
           151 255 255;...                                                 % 21          127 255 212 
            82 139 139;...                                                 % 22          69 139  116      
            
           255 255 255;...                                                 % white      23
           
           255 167   9;...                                                 % orange     24
           234  95   0;...                                                 % 25 
           193  99 215;...                                                 % purple     26
           109   0 158;...                                                 % 27
           
           255  52 179;...                                                 % 28
           255   0 102;...                                                 % 29
           128 128 105;...                                                 % 30
           152 138 125;...                                                 % 31
           
           255   0   0;...                                                 % 32
           192   0   0;...                                                 % 33
           255 182 193;...                                                 % red         34
           176  48  96;...                                                 % 35
           
            30  30  30]/255;                                               % Honeydew4   36
cdata = [];

% CellID = [1:length(N_CellID)];
% % 30752
% AverCurLatAtomPos1CellCorner(:,:,1,N_CellID)=0;

% for i = 71
%% 判斷是否超出Cut Minimum or Cut Maximum
 hold on
    IsPlot = 1;
% off change IsPlot to 1
%     for j = 1:8
%         if xCutMin < AverCurLatAtomPos1CellCorner(j,1,i) &&...
%            xCutMax > AverCurLatAtomPos1CellCorner(j,1,i) &&...
%            yCutMin < AverCurLatAtomPos1CellCorner(j,2,i) &&...
%            yCutMax > AverCurLatAtomPos1CellCorner(j,2,i) &&...
%            zCutMin < AverCurLatAtomPos1CellCorner(j,3,i) &&...
%            zCutMax > AverCurLatAtomPos1CellCorner(j,3,i)
%            IsPlot = 1;
%         end
%     end
for b =1:length(A)
    if IsPlot == 1
        p = patch('Faces',facenode,'Vertices',draw_x(:,:,b),'FaceColor','w'); % 原子座標點為 Polygon vertices，Face Color先設定為white
        clear cdata
        Clr = PeColor(U_Pos_Type(b,1),:);
        cdata = [Clr;Clr;Clr;Clr;Clr;Clr];                                 % 六面一樣顏色
        set(p,'FaceColor','flat','FaceVertexCData',cdata)                  % 將已畫出之白色結構上不同顏色
    end
end

%,'EdgeColor','none'
% for i = N_CellID
%     p = patch('Faces',facenode,'Vertices',AverCurLatAtomPos1CellCorner(:,:,1,i),'FaceColor','w');
%     clear cdata
%     Clr = PeColor(U_type_Pos(i,1),:);
%     cdata = [Clr;Clr;Clr;Clr;Clr;Clr];
%     set(p,'FaceColor','flat','FaceVertexCData',cdata)
% end%,'EdgeColor','none')
XL='$x (\textrm{\AA})$';YL='$y (\textrm{\AA})$';ZL='$z (\textrm{\AA})$';
xlabel(XL,'interpreter','latex','fontsize',12);
ylabel(YL,'interpreter','latex','fontsize',12);
zlabel(ZL,'interpreter','latex','fontsize',12);
% title('U_{1cell}');
% grid on
axis([0,100,0,100,0,100]);
axis equal
axis off
%     alpha(.8)
view(300,30);

% FigName = [num2str(Mx) 'x' num2str(My) 'x' num2str(Mz) '_' num2str(BegCurFile) 'to' num2str(EndCurFile) '_Aver' num2str(AverFramNum) 'fig_Normal'];

%% Resize graph
size=[100 50 500 500];
set(gcf,'Units','pixels','Position',size);

%% Printing
% r=300;
% 
% %             export_fig(figure(2),[DirName FigName '.png'],'-transparent',['-r',num2str(r)]);
% export_fig(figure(2),[DirName FigName '.jpg'],'-transparent',['-r',num2str(r)]);%'-transparent'
% 
% close

