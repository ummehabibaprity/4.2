I = imread('cameraman.png');
[r,c] = size(I);
V=reshape(I,1,{}).';
A = min(V);
disp(A);
B = max(V);
disp(B)
D = B - A;
M = 255;
R = I-A;
R  = R./D;
R = R.*M;
R = R + A;
 
figure();
subplot(221),imshow(I);title('Input Image');
subplot(222),imshow(R);title('Output Image');

freqI=zeros(256,1);
freqO=zeros(256,1);

for i=1:size(I,1)
    for j=1:size(I,2)
        v=I(i,j);
        freqI(v+1)=freqI(v+1)+1;
    end
end

for i=1:size(R,1)
    for j=1:size(R,2)
        v=R(i,j);
        freqO(v+1)=freqO(v+1)+1;
    end
end

% G 
subplot(223),bar(freqI);title('Input Histogram');
subplot(224),bar(freqO);title('Output Histogram');
