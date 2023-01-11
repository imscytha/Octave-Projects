<head>
  <link rel="stylesheet" href="../assets/styles.css">
</head>
<p align="center"><img src="../assets/uni-logo.png" alt="image_description" style="width: 60%;">
<h1 align="center">Rikrijimi i flamurit dhe himnit të Holandës në MATLAB/GNU Octave</h1>

Fillimisht të definojmë se flamuri i Holandës është i përbërë nga një trengjyrësh horizontal me ngjyrat kuqe <span class="first-col"></span>, bardhë <span class="second-col"></span> dhe kaltër <span class="third-col"></span>.
Kështu që në Octave e krijojmë një matricë tredimensionale për të ruajtur vlerat RGB dhe pozitën e tyre në pixel të imazhit.

Kodi i tillë duket si vijon:

```octave
flag=uint8(zeros(300, 600, 3));     % definimi
flag(:, :, :)=255;                  % mbushja me të bardhë
```

Reprezentimi i ngjyrës së kuqe në formatin RGB:

```octave
flag(1:100, :, 1)=169;              % Red Channel
flag(1:100, :, 2)=31;               % Green Channel
flag(1:100, :, 3)=50;               % Blue Channel
```

Vërejmë se definimin e ngjyrës së bardhë skemi nevojë ta bëjmë pasi kemi ngjyrosur të gjithë kornizën në ngjyrë të bardhë.

Definimi i ngjyrë së kaltër me RGB:

```octave
flag(200:300, :, 1)=30;             % Red Channel
flag(200:300, :, 2)=71;             % Green Channel
flag(200:300, :, 3)=133;            % Blue Channel
```

Së fundi bëjmë shfaqjen e imazhit të procesuar:

```octave
imshow(flag);
```

Për dëgjimin e himnit:
```octave
[y,fs] = audioread("../assets/Flag/anthem.oga");
sound(y, fs);
```

![Flag](../assets/Flag/flag.png)
