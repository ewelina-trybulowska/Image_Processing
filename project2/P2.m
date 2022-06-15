%% GLAUKONIT
close all; clear; clc;
a=imread('1N_00.jpg');
N=10;
L=fspecial('Gaussian', [N N], N/3);
b=imfilter(a,L,'symmetric');
figure
imshow(a)

%glaukonit1:
glaukonit1=b(:,:,1)>=78 & b(:,:,1)<=124 & b(:,:,2)>=94 & b(:,:,2)<=132 & b(:,:,3)>=44 & b(:,:,3)<=69;
glaukonit1=bwareaopen(glaukonit1,1105);
glaukonit1=imclose(glaukonit1,strel('disk',10));
glaukonit1=imopen(glaukonit1,strel('disk',8));
glaukonit1=imdilate(glaukonit1, strel('disk', 25));

glaukonit2=b(:,:,1)>=95 & b(:,:,1)<=122 & b(:,:,2)>=106 & b(:,:,2)<=133 & b(:,:,3)>=36 & b(:,:,3)<=64;
glaukonit2=bwareaopen(glaukonit2, 330);
glaukonit2=imclose(glaukonit2,strel('disk',5));
glaukonit2=imopen(glaukonit2,strel('disk',5));
glaukonit2=imdilate(glaukonit2, strel('disk', 22));
glaukonit2=(glaukonit2 & (~glaukonit1));%usuniecie powtarzajacych sie wartosci

g=glaukonit1 + glaukonit2;
obwodGlaukonit=edge(g);
obwodGlaukonit=imoverlay(a, imdilate(obwodGlaukonit,ones(5)), 'm');
%przy zalozeniu ze 181 px=100um=0.1mm
PoleGlaukonit = bwarea(g(:)) / 1810^2

figure;
imshow(g) 
figure;
imshow(obwodGlaukonit) ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MIKA
close all; clear; clc;

a=imread('XN_90.jpg');
b=imrotate(a, 90, 'crop');


%odcienie różu
mika1=b(:,:,1)>=100 & b(:,:,1)<=255 & b(:,:,2)>=30 & b(:,:,2)<=95 & b(:,:,3)>=100 & b(:,:,3)<=180; 
mika1=bwareaopen(mika1, 170);
mika1=imclose(mika1,strel('disk',15));
mika1=imopen(mika1,strel('disk',1));
mika1=imdilate(mika1, strel('disk', 7));


%odcienie pomarańczu
mika2=b(:,:,1)>=145 & b(:,:,1)<=255 & b(:,:,2)>=65 & b(:,:,2)<=255 & b(:,:,3)>=20 & b(:,:,3)<=100; 
mika2=bwareaopen(mika2, 270);
mika2=imclose(mika2,strel('disk',10));
mika2=imopen(mika2,strel('disk',3));
mika2=imdilate(mika2, strel('disk', 3));
mika2=(mika2 & (~mika1));%usuniecie powtarzajacych sie wartosci


m1=mika1+mika2;

c=imread('XN_30.jpg');
d=imrotate(c, 30, 'crop');

mika3=d(:,:,1)>=230 & d(:,:,1)<=255 & d(:,:,2)>=143 & d(:,:,2)<=212 & d(:,:,3)>=33 & d(:,:,3)<=137; 
mika3=bwareaopen(mika3, 15);
mika3=imclose(mika3,strel('disk',30));
mika3=imopen(mika3,strel('disk',5));
mika3=imdilate(mika3, strel('disk', 5));


mika4=d(:,:,1)>=90 & d(:,:,1)<=221 & d(:,:,2)>=17 & d(:,:,2)<=69 & d(:,:,3)>=85 & d(:,:,3)<=236; 
mika4=bwareaopen(mika4, 15);
mika4=imclose(mika4,strel('disk',25));
mika4=imopen(mika4,strel('disk',2));
mika4=imdilate(mika4, strel('disk', 5));
mika4=(mika4 & (~mika3));%usuniecie powtarzajacych sie wartosci
m2=mika3+mika4;

figure;
imshow(d);
mika=m1+m2;

mika_obwod=edge(mika);

mika_obwod=imoverlay(d, imdilate(mika_obwod,ones(5)), 'g');
PoleMika = bwarea(mika(:))/1810^2

figure;
imshow(mika) 
figure;
imshow(mika_obwod) ;

%% KWARC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

close all; clear; clc;
XN_0=imread('XN_00.jpg');

%kwarc jasnoszary
kwarc1=XN_0(:,:,1)>=134 & XN_0(:,:,1)<=245 & XN_0(:,:,2)>=136 & XN_0(:,:,2)<=246 & XN_0(:,:,3)>=124 & XN_0(:,:,3)<=244; 
kwarc1=bwareaopen(kwarc1, 350);
kwarc1=imclose(kwarc1,strel('disk',5));
kwarc1=imfill(kwarc1, 'holes');
kwarc1=imopen(kwarc1,strel('disk',5));
kwarc1=imdilate(kwarc1, strel('disk', 3));

%kwarc ciemnoszary
kwarc2=XN_0(:,:,1)>=80 & XN_0(:,:,1)<=133 & XN_0(:,:,2)>=80 & XN_0(:,:,2)<=140 & XN_0(:,:,3)>=80 & XN_0(:,:,3)<=140; 
kwarc2=bwareaopen(kwarc2, 900);
kwarc2=imclose(kwarc2,strel('disk',15));
kwarc2=imfill(kwarc2, 'holes');
kwarc2=imopen(kwarc2,strel('disk',5));
kwarc2=imdilate(kwarc2, strel('disk', 5));
kwarc2=(kwarc2 & (~kwarc1));%usuniecie powtarzajacych sie wartosci


%kwarc mocno ciemnoszary
kwarc3=XN_0(:,:,1)>=20 & XN_0(:,:,1)<=71 & XN_0(:,:,2)>=15 & XN_0(:,:,2)<=72 & XN_0(:,:,3)>=25 & XN_0(:,:,3)<=68; 
kwarc3=bwareaopen(kwarc3, 3000);
kwarc3=imclose(kwarc3,strel('disk',20));
kwarc3=imfill(kwarc3, 'holes');
kwarc3=imopen(kwarc3,strel('disk',5));
kwarc3=imdilate(kwarc3, strel('disk', 20));
kwarc3=(kwarc3 & (~kwarc1) &(~kwarc2));%usuniecie powtarzajacych sie wartosci


%brakujacy ciemny kwarc pomiedzy glaukonitami
XN_30=imread('XN_30.jpg');
XN_30=imrotate(XN_30, 30, 'crop');
kwarc4=XN_30(:,:,1)>=40 & XN_30(:,:,1)<=80 & XN_30(:,:,2)>=53 & XN_30(:,:,2)<=83 & XN_30(:,:,3)>=52 & XN_30(:,:,3)<=78;
kwarc4=bwareaopen(kwarc4, 800);
kwarc4=imclose(kwarc4,strel('disk',10));
kwarc4=imfill(kwarc4, 'holes');
kwarc4=imopen(kwarc4,strel('disk',5));
kwarc4=imdilate(kwarc4, strel('disk', 15));
kwarc4=(kwarc4 & (~kwarc1) &(~kwarc2)& (~kwarc3));%usuniecie powtarzajacych sie wartosci

kwarc=kwarc1+kwarc2+kwarc3+kwarc4;
imshow(kwarc);

kwarc_obwod=edge(kwarc);

kwarc_obwod=imoverlay(XN_0, imdilate(kwarc_obwod,ones(5)), 'm');
PoleKwarc =  bwarea(kwarc(:))/1810^2
figure;
imshow(kwarc) 
figure;
imshow(kwarc_obwod) ;





