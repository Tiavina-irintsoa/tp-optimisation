CREATE TABLE IF NOT EXISTS admin (
    id serial PRIMARY KEY,
    firstName varchar(125) NOT NULL,
    lastName varchar(125) NOT NULL,
    email varchar(100) NOT NULL,
    mobile varchar(25) NOT NULL,
    address text NOT NULL,
    password varchar(100) NOT NULL,
    type varchar(20) NOT NULL,
    confirmCode varchar(10) NOT NULL
);


CREATE TABLE IF NOT EXISTS users (
id serial primary key,
  firstName varchar(25) NOT NULL,
  lastName varchar(25) NOT NULL,
  email varchar(100) NOT NULL,
  mobile varchar(20) NOT NULL,
  address varchar(120) NOT NULL,
  password varchar(100) NOT NULL,
  confirmCode varchar(10) NOT NULL,
  activation varchar(10) NOT NULL DEFAULT 'no'
);

CREATE TABLE IF NOT EXISTS products (
id serial primary key,
  pName varchar(100) NOT NULL,
  price int NOT NULL,
  description text NOT NULL,
  available int NOT NULL,
  category varchar(100) NOT NULL,
  type varchar(100) NOT NULL,
  item varchar(100) NOT NULL,
  pCode varchar(20) NOT NULL,
  picture text NOT NULL
);

CREATE TABLE IF NOT EXISTS orders (
id serial primary key,
  uid int NOT NULL references users(id),
  pid int NOT NULL references products(id),
  quantity int NOT NULL,
  oplace text NOT NULL,
  mobile varchar(15) NOT NULL,
  dstatus varchar(10) NOT NULL DEFAULT 'no',
  odate date NOT NULL,
  ddate date NOT NULL
);

INSERT into user (id, firstName, lastName, email, mobile, address, password, confirmCode, activation) VALUES
(default, 'Borsha', 'Tanjina', 'Tanjina@gmail.com', '01578399283', 'Dhaka, Bangladesh', 'aa030295ae26e8acbd3d1c9415a60f12', '217576', 'yes'),
(default, 'Trisha', 'Rehman', 'trisha@gmail.com', '01923457834', 'Mirpur 2, Dhaka', '5af7a513a7c48f6cc97253254b29509b', '0', 'yes'),
(default, 'Akhi', 'Alam', 'akhi@gmail.com', '01678293748', 'Saver, Dhaka', 'ca52febd8be7c4480ae90cdae8438a03', '0', 'yes');


INSERT INTO admin (firstName, lastName, email, mobile, address, password, type, confirmCode) VALUES
('Borsha', 'Tasnim', 'borsha@gmail.com', '01678293748', 'Dhaka, Bangladesh', 'aa030295ae26e8acbd3d1c9415a60f12', 'manager', '117631');


INSERT INTO products (id, pName, price, description, available, category, type, item, pCode, picture) VALUES
(default, 'Metal-Collar-Bone-Chain-Set', 1200, 'Dekhte khub e sundor', 2, 'women', 'Chain Set', 'ornament', 'SR002', 'Women-Neck-Jewelry-Exaggerated-Metal-Collar-Bone-Chain-Set.jpg'),
(default, 'Colors-Women-Embellished-Saree', 1200, 'kichu koilam na', 2, 'women', 'cloathing', 'saree', 'SR002', 'Colors-Women-Embellished-Saree_2.jpg'),
(default, 'Colors-Women-Embellished-Sarees', 1200, 'kichu koilam na', 2, 'women', 'cloathing', 'saree', 'SR002', 'Colors-Women-Embellished-Saree_3.jpg'),
(default, 'Jewelry-Color-diamond-Love-font', 2000, 'Dekhte khub e sundor', 2, 'women', 'Chain Set', 'ornament', 'SR002', 'Jewelry-Color-created-created-diamond-Love-font-b.jpg'),
(default, 'Jewelry-full metal earring', 2000, 'Dekhte khub e sundor', 2, 'women', 'earring', 'ornament', 'SR002', 'earrings-online-for-women-4.jpg'),
(default,  'Boutique Saree 1', 1300, 'Osthir mama!', 4, 'women', 'cloathing', 'saree', 'SR001', 'Saree Red Color 1.jpg'),
(default,  'fancy-look-attractive-saree-2-original', 1200, 'kichu koilam na', 2, 'women', 'cloathing', 'saree', 'SR002', 'new-designer-fancy-look-attractive-saree-2-original.jpg'),
(default,  'Watches-for-women-5', 700, 'à¦¸à§à¦¨à§à¦¦à¦°, à¦†à¦•à¦°à§à¦·à¦£à§€à§Ÿ', 2, 'women', 'No', 'watch', 'W234', '1491496755.jpg'),
(default,  'Diamond-Setting-Watch-3', 700, '2016-New-Electronic-Style-Women-Dress-New-Fashion-Watches-Imitation-Diamond-Setting-Watch-Casual-Wrist-Watch-3', 3, 'women', 'yes', 'watch', 'W234', '1491496880.jpg'),
(default,  'Steel-Bracelet 2', 399, 'Steel-Bracelet-Women-Watches-Designs', 2, 'women', 'no', 'watch', 'W345', '1491496956.jpg'),
(default,  'Steel-Bracelet-Women-3', 1000, 'Steel-Bracelet-Women-Watches', 3, 'women', 'yes', 'watch', 'W345', '1491497102.jpg'),
(default,  'Right-hand-rings 2', 200, 'Right-hand-rings-collection-ornament-champagne-diamond-ring-for-women_mainro', 3, 'women', 'ok', 'ornament', 'O234', '1491497201.jpg'),
(default,  'floral-ornament-ring-3d', 1200, 'floral-ornament-ring-3d-model-stl-3dm', 3, 'women', 'ok', 'ornament', 'O254', '1491497263.jpg'),
(default,  'Nekles set', 799, 'Good, Awesome', 2, 'women', 'no', 'ornament', 'O2352', '1491497316.jpg'),
(default,  'T Shirt 1', 250, 'Nice', 10, 'women', 'no', 'tshirt', 'TS252', '1491497478.jpg'),
(default,  'T Shirt 2', 400, 'Nice Looking', 12, 'women', 'no', 'tshirt', 'TS3463', '1491497528.jpg'),
(default,  'T Shirt 3', 299, 'Nice', 27, 'women', 'no', 'tshirt', 'TS345', '1491497588.jpg'),
(default,  'T Shirt 4', 890, 'Nice, good', 30, 'women', 'no', 'tshirt', 'TS2354', '1491497644.jpg'),
(default,  'CHARCOAL_SOFT_G_HIJAB', 700, 'CHARCOAL_SOFT_G_HIJAB', 3, 'women', 'no', 'hijab', 'H98', '1491498074.jpg'),
(default,  'HijabScarf (20)', 400, 'HijabScarf ', 23, 'women', 'no', 'hijab', 'H3254', '1491498134.JPG'),
(default,  'Hijab 3', 600, 'hijab-2013', 20, 'women', 'no', 'hijab', 'H2354', '1491498202.jpg'),
(default,  'Hijab 4', 800, 'nice and cool', 23, 'women', 'no', 'hijab', 'H233', '1491498250.jpg'),
(default,  'vera_wang_princess', 2000, 'vera_wang_princess_perfume_for_women', 10, 'women', 'no', 'perfume', 'P2354', '1491498354.jpg'),
(default,  'Perfume 1', 150, 'top-perfumes-for-women', 2, 'women', 'no', 'perfume', 'P345', '1491498398.jpg'),
(default,  'Perfume 2', 3000, 'Awesome smell', 6, 'women', 'no', 'perfume', 'P252', '1491649246.jpg'),
(default,  'Perfume 3', 5000, 'Nice', 3, 'women', 'no', 'perfume', 'P254', '1491498508.jpg'),
(default,  'Latest-Fancy 2', 5000, 'Latest-Fancy-Ladiess-Shoes-Designs-2014', 300, 'kidsmom', 'clothing', 'footwear', 'S32543', '1491498848.jpg'),
(default,  'Soap 1', 80, 'Nice', 20, 'women', 'no', 'toiletry', 'SP234', '1491499503.jpg'),
(default,  'New Perfume 4', 4453, 'asdfa', 34, 'women', 'clothing', 'watch', 'asdf78', '1491707164.jpg'),
(default,  'Sareesf', 453354, 'asdfa', 342, 'women', 'clothing', 'perfume', 'S56', '1491850298.jpg'),
(default,  'Soap 3', 345, 'Cool', 30, 'women', 'clothing', 'toiletry', 'S789', '1491850339.jpg');


INSERT INTO orders (id, uid, pid, quantity, oplace, mobile, dstatus, odate, ddate) VALUES
(default, 1, 28, 1, 'Manikganj Sadar', '01677531881', 'no', '2017-04-07', '2017-04-07'),
(default, 1, 31, 1, 'Nikunja 2, Khilkhet, Dhaka', '01677531881', 'yes', '2017-04-07', '2017-04-07'),
(default, 1, 26, 1, 'South Seota, Manikganj Sadar', '01677531881', 'no', '2017-04-07', '2017-04-07'),
(default, 1, 1, 1, 'Nikunja 2, Khilkhet, Dhaka', '01677531881', 'no', '2017-04-08', '2017-04-07'),
(default,  1, 1, 3, 'Nikunja 2, Khilkhet, Dhaka', '01677531881', 'Yes', '2017-04-08', '2017-04-07'),
(default,  1, 3,  2, 'Nikunja 2, Khilkhet, Dhaka', '01677531881', 'Cancel', '2017-04-08', '2017-04-07'),
(default,  1, 29, 1, 'Nikunja 2, Khilkhet, Dhaka', '01677531881', 'no', '2017-04-08', '2017-04-07'),
(default,  1, 7, 1, 'Nikunja 2, Khilkhet, Dhaka', '01677531881', 'no', '2017-04-08', '2017-04-07'),
(default,  1, 29, 3, 'Nikunja 2, Khilkhet, Dhaka', '01677531881', 'no', '2017-04-09', '2017-04-07'),
(default,  3,  25, 1, 'Saver, Dhaka', '01678293748', 'no', '2017-04-09', '2017-04-07'),
(default,  1, 31, 1, 'Nikunja 2, Khilkhet, Dhaka', '01677531881', 'no', '2017-04-09', '2017-04-07'),
(default, 2,  23, 3, 'asdfas', '789', 'Yes', '2017-04-09', '2017-04-07'),
(default, 2,  29, 1, 'asdfas', '789', 'Yes', '2017-04-09', '2017-04-14'),
(default,  1, 23, 1, 'Nikunja 2, Khilkhet, Dhaka', '01677531881', 'no', '2017-04-09', '2017-04-07'),
(default,  3,  15, 1, 'Saver, Dhaka', '01678293748', 'no', '2017-04-09', '2017-04-07'),
(default,  3,  22, 1, 'Saver, Dhaka', '01678293748', 'no', '2017-04-10', '2017-04-07'),
(default,  3,  22, 1, 'Saver, Dhaka', '01678293748', 'no', '2017-04-10', '2017-04-07'),
(default,  3,  21, 1, 'Saver, Dhaka', '01678293748', 'no', '2017-04-10', '2017-04-07'),
(default,  3,  29, 2, 'Saver, Dhaka', '01678293748', 'Cancel', '2017-04-10', '2017-04-07'),
(default,  1, 23, 1, 'Nikunja 2, Khilkhet, Dhaka', '01677531881', 'no', '2017-04-10', '2017-04-07'),
(default,  3,  29, 1, 'Saver, Dhaka', '01678293748', 'no', '2017-04-10', '2017-04-11'),
(default,  3,  13, 1, 'Saver, Dhaka', '01678293748', 'no', '2017-04-10', '2017-06-12');