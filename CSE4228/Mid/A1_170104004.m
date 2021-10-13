clc;
clear;
I = rgb2gray(im2double(imread('noisy_img.jpeg')));
sigma = 1;
figure();
subplot(131),imshow(I);

[m,n] = size(I);
padImg = zeros(m+6,n+6);

for i = 4: m+3
    for j = 4:n+3
        padImg(i,j) = I(i-3,j-3);
    end
end


filx = 7;
fily = 7;
[X, Y]=meshgrid(-(filx-1)/2:(filx-1)/2, -(fily-1)/2:(fily-1)/2);
a = 1/(2*pi*power(sigma,2));
b1 = -(power(X,2) + power(Y,2));
b2 = 2*power(sigma,2);
b = b1/b2;
gussfil = a*exp(b);

filteredImg = zeros([m,n]);
for i = 1:m
    for j = 1:n
        N = padImg(i:i+6,j:j+6);
        N = N.*gussfil;
        B = reshape(N,1,[]);
        filteredImg(i,j) = sum(B);
    end
end

subplot(132),imshow(filteredImg);
subI = I - filteredImg;
subplot(133),imshow(subI);
I2 = rgb2gray(im2double(imread('msg.jpg')));
[r1, c1] = size(I2);
disp(m);
disp(n);
filteredImg(344:393,501:700) = I2;
figure; imshow(filteredImg);

