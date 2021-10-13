I=imread('cameraman.png');%a

Noofpixels=size(I,1)*size(I,2);%b
NI=uint8(zeros(size(I,1),size(I,2)));

freqI=zeros(256,1);
freqNI=zeros(256,1);
PDF=zeros(256,1);
CDF=zeros(256,1);
Output=zeros(256,1);

for i=1:size(I,1)
    for j=1:size(I,2)
        v=I(i,j);
        freqI(v+1)=freqI(v+1)+1;
        PDF(v+1)=freqI(v+1)/Noofpixels;%c
    end
end
sum=0;
L=256;

for i=1:size(PDF)
   sum=sum+freqI(i);
   CDF(i)=sum;%d
   PDF(i)=CDF(i)/Noofpixels;
   M=(PDF(i)*(L-1));%e
   Output(i)=round(M);%f

end

%output img

for i=1:size(I,1)
    for j=1:size(I,2)
            NI(i,j)=Output(I(i,j)+1);
    end
end
%output hist
for i=1:size(I,1)
    for j=1:size(I,2)
        v=NI(i,j);
        freqNI(v+1)=freqNI(v+1)+1;
        PDF(v+1)=freqNI(v+1)/Noofpixels;
    end
end

figure;
subplot(221),imshow(I);title('Original Image');
subplot(222),imshow(NI);title('Equalized Image');
subplot(223),bar(freqI);title('Original Histogram');
subplot(224),bar(freqNI);title('Equalized Histogram');

