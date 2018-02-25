function [ Mf ,M2] = generate_M2horizontal( img, M2,direction,Threshold1,Threshold2,d )
%GENERATE_M2HORIZONTAL __abstract

imgblocks=img;
Mf=[]; 
a=size(M2);
k=0;

for i=1:a(1)
    i1=i-k;%add
    M2col=M2(i1,:);
    if direction==0 %Up
        t=M2col(1)-1;
        j=M2col(2);
        e=M2col(3)-1;
        g=M2col(4);% add
        if t>=ceil(d/2) && e>=ceil(d/2) && t<=768-floor(d/2) && e<=768-floor(d/2) %The first down-oriented point satisfies the demand of border
            points=[t,j;e,g];
            [DC,mk]=generate_NADCmk(2,imgblocks,points);
            if abs(DC(1)-DC(2))<Threshold1 && abs(mk(1)-mk(2))<Threshold2
                MF=[t,j,e,g];
                Mf=[Mf;MF];                
                x1=min(t,e)-ceil(d/2); 
                for x=1:x1
                    t=t-1;
                    e=e-1;%add
                    if  t>=ceil(d/2) && e>=ceil(d/2) && t<=768-floor(d/2) && e<=768-floor(d/2)
                        points=[t,j;e,g];
                        [DC,mk]=generate_NADCmk(2,imgblocks,points);
                        if abs(DC(1)-DC(2))<Threshold1 && abs(mk(1)-mk(2))<Threshold2
                            MF=[t,j,e,g];
                            Mf=[Mf;MF];
                        else
                            break;
                        end
                    else
                        break;
                    end
                end
             else
                M2(i1,:)=[];
                k=k+1;
            end
        end      
    end
    t=2;
end


a=size(M2);
k=0;
for i=1:a(1)
    i1=i-k;%add
    M2col=M2(i1,:);
    if direction==1 %Down
        t=M2col(1)+1;
        j=M2col(2);
        e=M2col(3)+1;
        g=M2col(4);% add
        if t<=768-floor(d/2) && e<=768-floor(d/2) %The first down-oriented point satisfies the demand of border             
            points=[t,j;e,g];
            [DC,mk]=generate_NADCmk(2,imgblocks,points);
            if abs(DC(1)-DC(2))<Threshold1 && abs(mk(1)-mk(2))<Threshold2
                MF=[t,j,e,g];
                Mf=[Mf;MF];                
                x1=768-floor(d/2)-max(t,e); 
                for x=1:x1
                    t=t+1;
                    e=e+1;%add
                    if t<=768-floor(d/2) && e<=768-floor(d/2)
                        points=[t,j;e,g];
                        [DC,mk]=generate_NADCmk(2,imgblocks,points);
                        if abs(DC(1)-DC(2))<Threshold1 && abs(mk(1)-mk(2))<Threshold2
                            MF=[t,j,e,g];
                            Mf=[Mf;MF];
                        else
                            break;
                        end
                    else
                        break;
                    end
                end
             else
                M2(i1,:)=[];
                k=k+1;
            end
        end      
    end
end
end

