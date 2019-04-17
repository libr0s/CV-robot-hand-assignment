clear all;

%% PREDEFINED 3D POINTS COORDINATES %
points3D = [
    [380 25 50];
    [430 -25 0];
    [680 75 50];
    [630 25 0];
    [430 -175 50];
    [480 225 50];
    [580 -125 50];
    [630 -175 50];
];

CUBE_OPTIONS = ["Red"; "Blue"; "Green"; "Black"];
TOWER_HEIGHT = 0;

%% GETTING 2D POSITIONS FROM IMAGE %
[imname, pathname] = uigetfile({'*.jpg;*.jpeg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' },'Choose an image');
path = fullfile(pathname,imname);
image = imread(path);

figure
imshow(image)
[x,y] = getpts;
points2D(:, 1) = x;
points2D(:, 2) = y;

%% TAKE THE PROJECTION MATRIX AND CAMERA CENTER LOCATION %

M = calibrateCamera(points2D, points3D);

C = getCameraCenter(M);

%% TAKE THE PSEUDO INVERSE MATRIX %

M_inv = pinv(M);

%% SELECTING THE FIRST CUBE
[choice, CUBE_OPTIONS] = chooseCube(CUBE_OPTIONS);
% towerXY = get X and Y of specific cube

%% ITERATING OVER 3 LASTING CUBES

for i=1:3
    [choice, CUBE_OPTIONS] = chooseCube(CUBE_OPTIONS);
    % stackCube(choice, towerXY, TOWER_HEIGHT);
    % TOWER_HEIGHT += 50;
end


