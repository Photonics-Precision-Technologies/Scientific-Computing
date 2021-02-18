% Starting field profile image input
root = '';
[name, root] = uigetfile([root, '∗.∗'], ('Startingfield'));
[XRGB, MAP] = imread([root, name]);
X = XRGB(:,:,1);

% Variables input
 w = input('Wavelength(mm) : ');
 L0 = input('Width of the startingfield L0(mm) : ');
 k=2*pi/w;
 %X = X(110:309 ,180:379);
 [M,N] = size (X);
 X = double(X);
 A = max(M,N);

 % Squaring by filling it with zeros the starting image to get a AxA size
Z1 = zeros(A, (A-N)/2);
Z2 = zeros ((A-M)/2, N);

UT=[Z1, [Z2;X; Z2], Z1]; % Temporary starting field variable

% Maximum distance to fullfill sampling theorem
zmax = L0^2/A/w;

% Var iable i npu t
disp(['Maximum distance to comply wi th the sampling theorem : ' , num2str(zmax), 'mm' ]);
z0 = input(['Diffractedfield distance z0 (mm) (<'  , num2str (zmax), 'mm) : ']);
U0=UT; % Startingfield variable U0

% Grayscale mesh appl ied to s t a r t i n g f i e l d
figure(1), imagesc(U0), colormap(flipud('gray')); ylabel ('pixels');
axis equal; axis tight;
xlabel(['Width of the startinfield = ' , num2str(L0), ' mm' ]);
title('Starting amplitude ');

