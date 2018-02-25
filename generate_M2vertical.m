function [ M2,M1b ] = generate_M2vertical( img, M1b ,direction,Threshold1,Threshold2,d)
%GENERATE_M2tmp __abstract
% M1b has been exchanged into col and row ,it can visit directly 
%                                                       %row and
% col
% direction = 0 1 2 3 , means right left up down
imgblocks=img;
M2=[]; 
a=size(M1b);
k=0;%add
if direction==0 %Right
    for i=1:a(1)
        i1=i-k;%add
        M1bcol=M1b(i1,:);  
        t=M1bcol(1);
        j=M1bcol(2)+1;
        e=M1bcol(3);
        g=M1bcol(4)+1;% add
        if g<=1024-floor(d/2) && g>=ceil(d/2) && j<=1024-floor(d/2) && j>=ceil(d/2) %The first right-oriented point satisfies the demand of border
            points=[t,j;e,g];
            [DC,mk]=generate_NADCmk(2,imgblocks,points);
            if abs(DC(1)-DC(2))<Threshold1 && abs(mk(1)-mk(2))<Threshold2
                MF=[t,j,e,g];
                M2=[M2;MF];
                x1=1024-floor(d/2)-max(g,j); 
                for x=1:x1
                    j=j+1;
                    g=g+1;%add
                    if g<=1024-floor(d/2) && g>=ceil(d/2) && j<=1024-floor(d/2) && j>=ceil(d/2)
                        points=[t,j;e,g];
                        [DC,mk]=generate_NADCmk(2,imgblocks,points);
                        if abs(DC(1)-DC(2))<Threshold1 && abs(mk(1)-mk(2))<Threshold2
                            MF=[t,j,e,g];
                            M2=[M2;MF];
                        else
                            break;
                        end
                    else
                        break;
                    end
                end
            else
                M1b(i1,:)=[];
                k=k+1;
            end
        end
    end
end
% a=size(M1b);
% k=0;
if direction==1 %Left
    for i=1:a(1)
        i1=i-k;%add
        M1bcol=M1b(i1,:);
        t=M1bcol(1);
        j=M1bcol(2)-1;
        e=M1bcol(3);
        g=M1bcol(4)-1;% add
        if g<=1024-floor(d/2) && g>=ceil(d/2) && j<=1024-floor(d/2) && j>=ceil(d/2) %The first right-oriented point satisfies the demand of border
            points=[t,j;e,g];
            [DC,mk]=generate_NADCmk(2,imgblocks,points);
            if abs(DC(1)-DC(2))<Threshold1 && abs(mk(1)-mk(2))<Threshold2
                MF=[t,j,e,g];
                M2=[M2;MF];
                x1=min(j,g)-ceil(d/2);
                for x=1:x1
                    j=j-1;
                    g=g-1;
                    if g<=1024-floor(d/2) && g>=ceil(d/2) && j<=1024-floor(d/2) && j>=ceil(d/2)
                        points=[t,j;e,g];
                        [DC,mk]=generate_NADCmk(2,imgblocks,points);
                        if abs(DC(1)-DC(2))<Threshold1 && abs(mk(1)-mk(2))<Threshold2
                            MF=[t,j,e,g];
                            M2=[M2;MF];
                        else
                            break;
                        end
                    else
                        break;
                    end
                end
            else
                M1b(i1,:)=[];
                k=k+1;
            end
        end
    end
end
end
