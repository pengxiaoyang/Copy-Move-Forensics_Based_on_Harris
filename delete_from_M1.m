function [ M1b ] = delete_from_M1( img,M1a,Threshold1,Threshold2,d )
%DELETE_FROM_M1 __abstract
% M1a=M1;
% M1a(:,[1,2])=M1a(:,[2,1]);
% M1a(:,[3,4])=M1a(:,[4,3]);
% Have done these codes in generate_M2
a=size(M1a);
M1b=M1a;
imgblocks=img;
k=0;
%Remove bad mathes in the first step of M1
%Right
for i=1:a(1)
    i1=i-k;
    M1bcol=M1b(i1,:);
    for d1=1:d
        t=M1bcol(1);    j=M1bcol(2)+d1;    e=M1bcol(3);    g=M1bcol(4)+d1;
        if j>1024-floor(d/2) || g>1024-floor(d/2)
            break;
        else
            points=[t,j;e,g];
            [DC,mk]=generate_NADCmk(2,imgblocks,points);
            if abs(DC(1)-DC(2)<Threshold1) && abs(mk(1)-mk(2)<Threshold2)
                continue;
            else
                M1b(i1,:)=[];
                k=k+1;
                break;
            end
        end
    end
end


%Left
a1=a(1)-k;
k=0;
for i=1:a1
    i1=i-k;
    M1bcol=M1b(i1,:);
    for d1=1:d
        t=M1bcol(1);    j=M1bcol(2)-d1;    e=M1bcol(3);    g=M1bcol(4)-d1;
        if j<ceil(d/2) || g<ceil(d/2)
            break;
        else
            points=[t,j;e,g];
            [DC,mk]=generate_NADCmk(2,imgblocks,points);
            if abs(DC(1)-DC(2)<Threshold1) && abs(mk(1)-mk(2)<Threshold2)
                continue;
            else
                M1b(i1,:)=[];
                k=k+1;
                break;
            end
        end
    end
end

%Up
a1=a1-k;
k=0;
for i=1:a1
    i1=i-k;
    M1bcol=M1b(i1,:);
    for d1=1:d
        t=M1bcol(1)-d1;    j=M1bcol(2);    e=M1bcol(3)-d1;    g=M1bcol(4);
        if t<ceil(d/2) || e<ceil(d/2)
            break;
        else
            points=[t,j;e,g];
            [DC,mk]=generate_NADCmk(2,imgblocks,points);
            if abs(DC(1)-DC(2)<Threshold1) && abs(mk(1)-mk(2)<Threshold2)
                continue;
            else
                M1b(i1,:)=[];
                k=k+1;
                break;
            end
        end
    end
end

%Down
a1=a1-k;
k=0;
for i=1:a1
    i1=i-k;
    M1bcol=M1b(i1,:);
    for d1=1:d
        t=M1bcol(1)+d1;    j=M1bcol(2);    e=M1bcol(3)+d1;    g=M1bcol(4);
        if t>768-floor(d/2) || e>768-floor(d/2)
            break;
        else
            points=[t,j;e,g];
            [DC,mk]=generate_NADCmk(2,imgblocks,points);
            if abs(DC(1)-DC(2)<Threshold1) && abs(mk(1)-mk(2)<Threshold2)
                continue;
            else
                M1b(i1,:)=[];
                k=k+1;
                break;
            end
        end
    end
end
t=2;
end

