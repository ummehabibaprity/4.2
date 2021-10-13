clc;
clear;

% ploting figures  
screen_size = get(0,'ScreenSize');
x0 = floor(screen_size(1)+40);
y0 = floor(screen_size(2) + 40);
width = floor((screen_size(3)/12)*11);
height = floor((screen_size(4)/14)*12);
figure('position',[x0,y0,width,height]);

%step-1
input = im2double(imread('Image1.jpg'));

subplot(2,4,1);
imshow(input);
xlabel('Figure (a)','FontSize',18);

%step-2
[row,col]=size(input);

temp1 = zeros(row+2,col+2);
temp1(2:row+1,2:col+1) = input;
lap_fil=[0 1 0;1 -4 1;0 1 0];

b = zeros(row,col);
for i = 1:row
    for j = 1:col
        cnv = temp1(i:i+2,j:j+2).*lap_fil;
        cnv = reshape(cnv,1,[]);
        cnv = sum(cnv);
        b(i,j) = cnv;
    end
end

subplot(2,4,2);
imshow(b,[]);
xlabel('Figure (b)','FontSize',18);

% step-3
c = input - b;
subplot(2,4,3);
imshow(c);
xlabel('Figure (c)','FontSize',18);

%step-4
gx = [-1 0 1; -2 0 2; -1 0 1];
gy = [1 2 1; 0 0 0; -1 -2 -1];

temp1 = zeros(row+2,col+2);
temp1(2:row+1,2:col+1) = input;
temp2 = zeros(row+2,col+2);
temp2(2:row+1,2:col+1) = input;

I1 = zeros(row,col);
I2 = zeros(row,col);

for i = 1:row
    for j = 1:col
        cnv = temp1(i:i+2,j:j+2).*gx;
        cnv = reshape(cnv,1,[]);
        cnv = sum(cnv);
        I1(i,j) = cnv;
        
        cnv = temp2(i:i+2,j:j+2).*gy;
        cnv = reshape(cnv,1,[]);
        cnv = sum(cnv);
        I2(i,j) = cnv;
    end
end

d = sqrt((I1.^2) + (I2.^2));

th = 0.2;
for i = 1:row
    for j = 1:col
        if d(i,j) > th
            d(i,j) = d(i,j);
        else
            d(i,j) = 0;
        end
    end
end

subplot(2,4,4);
imshow(d);
xlabel('Figure (d)','FontSize',18);

%step-5
avg_fil=[1/25 1/25 1/25 1/25 1/25;
    1/25 1/25 1/25 1/25 1/25;
    1/25 1/25 1/25 1/25 1/25;
    1/25 1/25 1/25 1/25 1/25;
    1/25 1/25 1/25 1/25 1/25];

temp1 = zeros(row+4,col+4);
temp1(4:row+3,4:col+3) = d;

e = zeros(row,col);

for i = 1:row
    for j = 1:col
        N = temp1(i:i+4, j:j+4);
        cnv = sum(sum(N.*avg_fil));
        e(i,j) = cnv;    
    end
end

subplot(2,4,5);
imshow(e);
xlabel('Figure (e)','FontSize',18);


%Step-6
f=c.*e;
subplot(2,4,6);
imshow(f);
xlabel('Figure (f)','FontSize',18);


%Step-7
g=input+f;
subplot(2,4,7);
imshow(g);
xlabel('Figure (g)','FontSize',18);

%step-8
c=1;
gamma=0.5;
h=c*(g.^gamma);
subplot(2,4,8);
imshow(h);
xlabel('Figure (h)','FontSize',18);




