[filename,pathname,~]=uigetfile('*.jpg','Please choose one picture');   % You can change the name suffix
if ~ischar(filename)
return 
end
str=[pathname filename];
pic=imread(str);clear filename pathname str;
if length(size(pic))==3
    img=rgb2gray(pic);
end
loc=Harris(img);
d=33;
Threshold1=10.0;
Threshold2=0.45;
% test generate_MF
[M1]=generate_M1(loc,img,d,Threshold1,Threshold2);

% test generate_M2
% M2=generate_M2( img, M1 ,Threshold1,Threshold2,d); 
M1a=M1;
M1a(:,[1,2])=M1a(:,[2,1]);
M1a(:,[3,4])=M1a(:,[4,3]);

M1b=M1a;  % M1b=delete_from_M1(img,M1a,Threshold1,Threshold2,d);

[M2,M1bnew]=generate_M2vertical( img, M1b,0,Threshold1,Threshold2,d); % Right         %M2=M2tmp;

[M2tmp,M1bnew]=generate_M2vertical( img, M1bnew,1,Threshold1,Threshold2,d); % Left
M2=[M2;M2tmp];

[Mf,M2new]=generate_M2horizontal( img, M2,0,Threshold1,Threshold2,d) ;% Up   %Mf=Mftmp;

[Mftmp,M2new]=generate_M2horizontal( img, M2new,1,Threshold1,Threshold2,d) ;% Down   %Mf=Mftmp;
Mf=[Mf;Mftmp];