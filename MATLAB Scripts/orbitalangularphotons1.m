% Starting field profile image input
root = '';
[name, root] = uigetfile([root, '#.#'], ('Startingfield'));
[XRGB, MAP] = imread([root, name]);
X = XRGB(:,:,1);
