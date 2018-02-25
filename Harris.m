function [ loc ] = Harris( img )
%HARRIS  __abstract

[m,n]=size(img);
tmp=zeros(m+2,n+2);
tmp(2:m+1,2:n+1)=img;   % Extend the border of img by one pixel.
Ix=zeros(m+2,n+2);
Iy=zeros(m+2,n+2);
Ix(:,2:n+1)=tmp(:,3:n+2)-tmp(:,1:n);    % Difference-equation on the x-oriented
Iy(2:m+1,:)=tmp(3:m+2,:)-tmp(1:m,:);    % Difference-equation on the y-oriented
Ix2=Ix(2:m+1,2:n+1).^2;
Iy2=Iy(2:m+1,2:n+1).^2;
Ixy=Ix(2:m+1,2:n+1).*Iy(2:m+1,2:n+1);
h=fspecial('gaussian',[7 7],2);     % Generate Gaussian filter, weaken the influence of noise.
Ix2=filter2(h,Ix2);     % Filter
Iy2=filter2(h,Iy2);
Ixy=filter2(h,Ixy);
R=zeros(m,n);
for i=1:m
    for j=1:n
        M=[Ix2(i,j) Ixy(i,j);
            Ixy(i,j) Iy2(i,j)];     % Construct Hessian matrix
        R(i,j)=det(M)-0.06*(trace(M))^2;    % The corner discriminant formula
    end
end
Rmax=max(max(R));
loc=[];     % Record the cordinate of the Harris corner
tmp(2:m+1,2:n+1)=R;     % Extend the border of img by one pixel.
for i=2:m+1
    for j=2:n+1
%         if tmp(i,j)>0   % Dense Harris corner
        if tmp(i,j)>0.01*Rmax  % Require the value of every elements > 0.01* Maximum
            sq=tmp(i-1:i+1,j-1:j+1);
            sq=reshape(sq,1,9);
            sq=[sq(1:4),sq(6:9)];
            if tmp(i,j)>sq  % Local non-maximum restrain
                loc=[loc;[j-1,i-1]];
            end
        end
    end
end
end

