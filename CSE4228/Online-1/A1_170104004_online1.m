I=imread('test3.jpg');
J=imread('greenback.jpg');
JR=imresize(J, [600 600]);
IR = imresize(I, [600 600]);
[row,column,channel]=size(IR);

r=ceil(row/2);
c=ceil(column/2);

for i=1:r
     for j=1:c
         if j>=i
            IR(1:i,1:c-i,:)=JR(1:i,1:c-i,:);      
         end
         
     end
end

figure;
imshow(IR);
