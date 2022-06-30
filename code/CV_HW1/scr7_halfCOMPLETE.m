clear;
syms c1 c2 c3 c4
%THE REFRENCE IMAGE
in1 = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\1\car1.jpg');

%THE INPUT IMAGE
in2 = imread('C:\Users\Arya\Desktop\computer vision\HW\Images\1\car2.jpg');

figure(1);
imshow(in1);

figure(2);
imshow(in2);

% ----STEP 1 ~ SOLVE LINEAR EQUATION FOR THE 8 POINTS -----
eqn1 = 279*c1 + 512*c2+ (279*512)*c3+c4 == 697;
eqn2 = 239*c1 + 490*c2+ (239*490)*c3+c4 == 657;
eqn3 = 108*c1 + 402*c2+ (108*402)*c3+c4 == 532;
eqn4 = 336*c1 + 356*c2+ (336*356)*c3+c4 ==752;
[A,B] = equationsToMatrix([eqn1, eqn2, eqn3,eqn4], [c1, c2, c3,c4]);
cgp1  = round(linsolve(A,B)) %CONTAINS C1 TO C4

eqn1 = 279*c1 + 512*c2 + (279*512)*c3 + c4 == 483;
eqn2 = 239*c1 + 490*c2 + (239*490)*c3 + c4 == 441;
eqn3 = 108*c1 + 402*c2 + (108*402)*c3 + c4 == 385;
eqn4 = 336*c1 + 356*c2 + (336*356)*c3 + c4 == 337;
[A,B] = equationsToMatrix([eqn1, eqn2, eqn3,eqn4], [c1, c2, c3,c4]);
cgp2 = round(linsolve(A,B)) %CONTAINS C5 TO C8

%---- STEP 2 TRANSFORM INPUTS BASED ON NEWLY FOUND WEIGHTS FOR THE EQS -----

[V,W] = size(in2);
output = zeros(2*V,2*W);
midX = V;
midY = W;
z=0
for v = 1:V
      for w = 1:W
          i = V-(cgp1(1,1)*v + cgp1(2,1)*w + cgp1(3,1)*(v*w) + cgp1(4,1));
          
          j = W-(cgp2(1,1)*v + cgp2(2,1)*w + cgp2(3,1)*(v*w) + cgp2(4,1));
          
          output(i,j) = in2(v,w);
      end
            z = z+1
end

output = uint8(output);




