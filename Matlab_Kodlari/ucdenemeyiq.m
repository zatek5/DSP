i = imread('C:\Users\ahmet\OneDrive\Masaüstü\BİTİRME PROJESİ\Görüntü işleme\daire.png');
YUQim = rgb2ntsc(i);
a = fspecial('sobel');

YUQim(:,:,1)=filter2(a,YUQim(:,:,1));
RGBim = ntsc2rgb(YUQim);

figure,imshow(RGBim)


%----------------------------------------------
YUQim1 = YUQim;

%--------------------------------------------
Y1= YUQim1;
Y1(:,:,2) = 0;
Y1(:,:,3) = 0;

I1= YUQim1;
I1(:,:,1) = 0;
I1(:,:,3) = 0;

Q1= YUQim1;
Q1(:,:,1) = 0;
Q1(:,:,2) = 0;
%--------------------------------------------