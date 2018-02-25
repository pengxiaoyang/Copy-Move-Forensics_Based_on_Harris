function [ M1] = generate_M1(loc,img,d,Threshold1,Threshold2)
% GENERATE M1 __abstract
% d=33
% Threshold1=10.0;
% Threshold2=0.45;
a=size(loc);
points=loc;
imgblocks=img;
%delete the edge of image in points
k=0;
for i=1:a(1)
    i1=i-k;
    if points(i1,1)<ceil(d/2)
        points(i1,:)=[];
        k=k+1;
    elseif points(i1,2)<ceil(d/2)
        points(i1,:)=[];   
        k=k+1;
    elseif points(i1,1)>1024-floor(d/2)
        points(i1,:)=[];  
        k=k+1;
    elseif points(i1,2)>768-floor(d/2)
        points(i1,:)=[];  
        k=k+1;
    end
end
i1=i-k;
points(:,[1,2])=points(:,[2,1]); %exchange 1st row and 2nd row

%generate DC,mk
[DC,mk]=generate_NADCmk(i1,imgblocks,points);

%generate MF
MF=zeros(i1,4);
MF(1,:)=[DC(1),mk(1),points(1,2),points(1,1)];
for k=2:i1
    MFb=[DC(k),mk(k),points(k,2),points(k,1)];  % Make M1 show the form 'col row' 
    MF(k,:)=MFb;
end

%generate M1
a=size(MF);     
M1=[];
for k=1:a(1)
    for g=k+1:a(1)
        MFk=MF(k,:);
        MFg=MF(g,:);
        if abs(MFk(1)-MFg(1))<Threshold1 && abs(MFk(2)-MFg(2))<Threshold2
            MFb=[MFk(3),MFk(4),MFg(3),MFg(4)];  % Make M1 show the form 'col row' 
            M1=[M1;MFb];
        end
    end
end
clear i i1 k g a points imgblocks DC mk MF MFb MFg d Threshold1 Threshold2 loc;
end

