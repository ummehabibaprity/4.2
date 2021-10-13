input1 = imread('input1.jpg');
input2 = imread('input2.jpg');

input1 = imresize(input1,[600,600]);
input2 = imresize(input2,[600,600]);

[row, column, channel] = size(input1);

output = uint8(zeros(row,column,channel));

output(:,1:100,:) = input1(:,1:100,:);
output(:,101:200,:) = input2(:,101:200,:);

output(:,201:300,:) = input1(:,201:300,:);
output(:,301:400,:) = input2(:,301:400,:);

output(:,401:500,:) = input1(:,401:500,:);
output(:,501:600,:) = input2(:,501:600,:);

figure;
imshow(output);