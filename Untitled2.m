% a=5;%to demonstrate the break function of 'for'
% b=5;
% for j=1:10
%     b=b+1;
%     if b>9
%         break;
%     end
%     for i=1:10
%         a=a+1;
%         if a>10
%             break;
%         end
%     end
% end
% X=M1(:,1);
% Y=M1(:,2);
% figure;
% subplot(1,2,1);
% imshow(pic);
% hold on
% plot(X,Y,'y+');
% X1=M1(:,3);
% Y1=M1(:,4);
% subplot(1,2,2);
% imshow(pic);
% hold on
% plot(X1,Y1,'r.');
% hold off
% 
% X=M1(:,1);
% Y=M1(:,2);
% X1=M1(:,3);
% Y1=M1(:,4);
% figure;
% imshow(pic);
% hold on
% X=[788 522];
% Y=[34 132];
% X1=522;
% Y1=132;
% line(X,Y);
% plot(X1,Y1,'y+');
% plot([X,X1],[Y,Y1]);
% plot(X,Y,);
% plot(X1,Y1,'r.');
% hold off

M1c=Mr;
M1c(:,[1,2])=M1c(:,[2,1]);
M1c(:,[3,4])=M1c(:,[4,3]);

% M1c=M1;

figure;
imshow(pic);
hold on
X=[M1c(:,1);M1c(:,3)];
Y=[M1c(:,2);M1c(:,4)];
a=size(M1c);
for i=1:a(1)
    line([X(i),X(i+a(1))],[Y(i),Y(i+a(1))]);
    t=2;
end
hold off

% imshow(pic);
% hold on
% line([X(1),X(1+290)],[Y(1),Y(1+290)]);
% hold off