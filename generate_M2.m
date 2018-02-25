function [ M2 ] = generate_M2( img, M1,Threshold1,Threshold2,d)
%GENERATE_M2  __abstract

M1a=M1;
M1a(:,[1,2])=M1a(:,[2,1]);
M1a(:,[3,4])=M1a(:,[4,3]);

M1b=M1a;  % M1b=delete_from_M1(img,M1a,Threshold1,Threshold2,d);

M2tmp=generate_M2tmp( img, M1b,0,Threshold1,Threshold2,d); %Right
M2=M2tmp;
M2tmp=generate_M2tmp( img, M1b,1,Threshold1,Threshold2,d); %Left
M2=[M2;M2tmp];
M2tmp=generate_M2tmp( img, M1b,2,Threshold1,Threshold2,d); %Up
M2=[M2;M2tmp];
M2tmp=generate_M2tmp( img, M1b ,3,Threshold1,Threshold2,d); %Down
M2=[M2;M2tmp];


end