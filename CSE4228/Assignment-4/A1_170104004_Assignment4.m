clc;
clear;
image='f';
extension='.png';
plot=1;
figure('position',[0,0,900,750])

for j=1:5
    disp('Plots' )
    disp(plot)
    img_number=num2str(j);
    path=[image,img_number,extension];
    orginal_img= imread(path);
    I= rgb2gray(orginal_img);
    resize=imresize(I,[50,50]);
    Binary_img = imbinarize(resize);
    structuring_element = strel( 'disk' ,4);
    opening= imopen(Binary_img,structuring_element);
    noisy_img= Binary_img-opening;
    noiseless_img = bwareaopen(noisy_img,4);

    
    [objects,no_of_element]=bwlabel(noiseless_img );
    blank_img = ones(50,50);
    RGB = insertText(blank_img,[20,20],no_of_element,'FontSize',10,'TextColor','black','BoxColor','white' );
    subplot(5,6,1)
    title('Original Image')
    subplot(5,6,2)
    title('Binary Image')
    subplot(5,6,3)
    title('Palm')
    subplot(5,6,4)
    title('Fingers(Noisy)')
    subplot(5,6,5)
    title('Fingers(NoiseleSS)')
    subplot(5,6,6)
    title('Number Of Finger')
    
    subplot(5,6,plot),imshow(orginal_img)   
    plot=plot+1;
    subplot(5,6,plot),imshow(Binary_img)
    plot=plot+1;
    subplot(5,6,plot),imshow(opening)
    plot=plot+1;
    subplot(5,6,plot),imshow(noisy_img)
    plot=plot+1;
    subplot(5,6,plot),imshow(noiseless_img )
    plot=plot+1;
    subplot(5,6,plot),imshow(RGB)
    plot=plot+1;
        
end


