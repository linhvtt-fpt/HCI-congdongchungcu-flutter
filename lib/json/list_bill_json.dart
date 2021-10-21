import 'package:test_flutter_template/json/bill_model.dart';
import 'package:test_flutter_template/json/product_model.dart';
import 'package:test_flutter_template/json/user_checkout.dart';

List<Bill> listBill = [
  Bill(status: "Chưa xác nhận", buyer: user[0], isRating: false, listProduct: [
    Product(
        name: "Set nguyên liệu pha trà sữa",
        description: "Trà sữa trân châu, thái xanh, truyền thống",
        price: 20000,
        urlImage:
            'https://cf.shopee.vn/file/435d7bbfad159966b7c6aa1b3614ec9b_tn',
        imgShop: "assets/images/3.jpg",
        nameShop: "Baba Tea",
        rate: "3.5",
        rate_number: "155",
        quantity: 1,
        categoryId: 2),
    Product(
        name: "Khoai tây chiên phô mai túi 200g",
        description: "Khoai tây chiên truyền thống, lắc phô mai",
        price: 20000,
        urlImage:
            'https://images.unsplash.com/photo-1552895638-f7fe08d2f7d5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9vZCUyMG1jZG9uYWxkfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
        imgShop: "assets/images/3.jpg",
        nameShop: "Baba Tea",
        rate: "4.0",
        quantity: 1,
        rate_number: "155",
        categoryId: 1),
    Product(
        urlImage: "https://toplist.vn/images/800px/cau-dat-farm-375871.jpg",
        name: "Trái cây sấy thập cẩm mít, xoài túi 150g",
        description: "Trái cây sấy",
        price: 20000,
        imgShop: "assets/images/3.jpg",
        nameShop: "Baba Tea",
        rate: "4.3",
        rate_number: "155",
        quantity: 1,
        categoryId: 3),
  ]),
  Bill(status: "Đã xác nhận", buyer: user[0], isRating: false, listProduct: [
    Product(
        urlImage: "https://toplist.vn/images/800px/cau-dat-farm-375871.jpg",
        name: "Trái cây sấy thập cẩm mít, xoài túi 150g",
        description: "Trái cây sấy",
        price: 20000,
        imgShop: "assets/images/3.jpg",
        nameShop: "Baba Juice",
        rate: "4.3",
        rate_number: "155",
        quantity: 1,
        categoryId: 3),
    Product(
        name: "Khoai tây chiên phô mai túi 200g",
        description: "Khoai tây chiên truyền thống, lắc phô mai",
        price: 20000,
        urlImage:
            'https://images.unsplash.com/photo-1552895638-f7fe08d2f7d5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9vZCUyMG1jZG9uYWxkfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
        imgShop: "assets/images/3.jpg",
        nameShop: "Baba Juice",
        rate: "4.0",
        quantity: 1,
        rate_number: "155",
        categoryId: 1),
    Product(
        name: "Set nguyên liệu pha trà sữa",
        description: "Trà sữa trân châu, thái xanh, truyền thống",
        price: 20000,
        urlImage:
            'https://cf.shopee.vn/file/435d7bbfad159966b7c6aa1b3614ec9b_tn',
        imgShop: "assets/images/3.jpg",
        nameShop: "Baba Juice",
        rate: "3.5",
        rate_number: "155",
        quantity: 1,
        categoryId: 2),
  ]),
  Bill(status: "Chưa xác nhận", buyer: user[0], isRating: false, listProduct: [
    Product(
        name: "Set nguyên liệu pha trà sữa",
        description: "Trà sữa trân châu, thái xanh, truyền thống",
        price: 20000,
        urlImage:
            'https://cf.shopee.vn/file/435d7bbfad159966b7c6aa1b3614ec9b_tn',
        imgShop: "assets/images/3.jpg",
        nameShop: "Baba Juice",
        rate: "3.5",
        rate_number: "155",
        quantity: 1,
        categoryId: 2),
    Product(
        name: "Khoai tây chiên phô mai túi 200g",
        description: "Khoai tây chiên truyền thống, lắc phô mai",
        price: 20000,
        urlImage:
            'https://images.unsplash.com/photo-1552895638-f7fe08d2f7d5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9vZCUyMG1jZG9uYWxkfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
        imgShop: "assets/images/3.jpg",
        nameShop: "Baba Juice",
        rate: "4.0",
        quantity: 1,
        rate_number: "155",
        categoryId: 1),
    Product(
        urlImage: "https://toplist.vn/images/800px/cau-dat-farm-375871.jpg",
        name: "Trái cây sấy thập cẩm mít, xoài túi 150g",
        description: "Trái cây sấy",
        price: 20000,
        imgShop: "assets/images/3.jpg",
        nameShop: "Baba Juice",
        rate: "4.3",
        rate_number: "155",
        quantity: 1,
        categoryId: 3),
  ]),
  Bill(status: "Đã hoàn thành", buyer: user[0], isRating: false, listProduct: [
    Product(
        name: "Set nguyên liệu pha trà sữa",
        description: "Trà sữa trân châu, thái xanh, truyền thống",
        price: 20000,
        urlImage:
            'https://cf.shopee.vn/file/435d7bbfad159966b7c6aa1b3614ec9b_tn',
        imgShop: "assets/images/3.jpg",
        nameShop: "Baba Tea",
        rate: "3.5",
        rate_number: "155",
        quantity: 1,
        categoryId: 2),
    Product(
        name: "Khoai tây chiên phô mai túi 200g",
        description: "Khoai tây chiên truyền thống, lắc phô mai",
        price: 20000,
        urlImage:
            'https://images.unsplash.com/photo-1552895638-f7fe08d2f7d5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9vZCUyMG1jZG9uYWxkfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
        imgShop: "assets/images/3.jpg",
        nameShop: "Baba Tea",
        rate: "4.0",
        quantity: 1,
        rate_number: "155",
        categoryId: 1),
    Product(
        urlImage: "https://toplist.vn/images/800px/cau-dat-farm-375871.jpg",
        name: "Trái cây sấy thập cẩm mít, xoài túi 150g",
        description: "Trái cây sấy",
        price: 20000,
        imgShop: "assets/images/3.jpg",
        nameShop: "Baba Tea",
        rate: "4.3",
        rate_number: "155",
        quantity: 1,
        categoryId: 3),
  ]),
  Bill(
     status: "Đã hoàn thành",
     buyer: user[0],
     isRating: false,
     listProduct: [
       Product(
      name: "Set nguyên liệu pha trà sữa",
      description: "Trà sữa trân châu, thái xanh, truyền thống",
      price: 20000,
      urlImage: 'https://cf.shopee.vn/file/435d7bbfad159966b7c6aa1b3614ec9b_tn',
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "3.5",
      rate_number: "155",
      quantity: 1,
      categoryId: 2),
       Product(
      urlImage: "https://toplist.vn/images/800px/cau-dat-farm-375871.jpg",
      name: "Trái cây sấy thập cẩm mít, xoài túi 150g",
      description: "Trái cây sấy",
      price: 20000,
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "4.3",
      rate_number: "155",
      quantity: 1,
      categoryId: 3),
  Product(
      name: "Khoai tây chiên phô mai túi 200g",
      description: "Khoai tây chiên truyền thống, lắc phô mai",
      price: 20000,
      urlImage:
          'https://images.unsplash.com/photo-1552895638-f7fe08d2f7d5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9vZCUyMG1jZG9uYWxkfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "4.0",
      quantity: 1,
      rate_number: "155",
      categoryId: 1),
 
     ]
   ),

   Bill(
     status: "Đã hoàn thành",
     buyer: user[0],
     isRating: false,
     listProduct: [
       Product(
      name: "Set nguyên liệu pha trà sữa",
      description: "Trà sữa trân châu, thái xanh, truyền thống",
      price: 20000,
      urlImage: 'https://cf.shopee.vn/file/435d7bbfad159966b7c6aa1b3614ec9b_tn',
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "3.5",
      rate_number: "155",
      quantity: 1,
      categoryId: 2),
  Product(
      name: "Khoai tây chiên phô mai túi 200g",
      description: "Khoai tây chiên truyền thống, lắc phô mai",
      price: 20000,
      urlImage:
          'https://images.unsplash.com/photo-1552895638-f7fe08d2f7d5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9vZCUyMG1jZG9uYWxkfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "4.0",
      quantity: 1,
      rate_number: "155",
      categoryId: 1),
  Product(
      urlImage: "https://toplist.vn/images/800px/cau-dat-farm-375871.jpg",
      name: "Trái cây sấy thập cẩm mít, xoài túi 150g",
      description: "Trái cây sấy",
      price: 20000,
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "4.3",
      rate_number: "155",
      quantity: 1,
      categoryId: 3),
     ]
   ),
   Bill(
     status: "Đã hủy",
     buyer: user[0],
     isRating: false,
     listProduct: [
       Product(
      name: "Set nguyên liệu pha trà sữa",
      description: "Trà sữa trân châu, thái xanh, truyền thống",
      price: 20000,
      urlImage: 'https://cf.shopee.vn/file/435d7bbfad159966b7c6aa1b3614ec9b_tn',
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "3.5",
      rate_number: "155",
      quantity: 1,
      categoryId: 2),
  Product(
      name: "Khoai tây chiên phô mai túi 200g",
      description: "Khoai tây chiên truyền thống, lắc phô mai",
      price: 20000,
      urlImage:
          'https://images.unsplash.com/photo-1552895638-f7fe08d2f7d5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9vZCUyMG1jZG9uYWxkfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "4.0",
      quantity: 1,
      rate_number: "155",
      categoryId: 1),
  Product(
      urlImage: "https://toplist.vn/images/800px/cau-dat-farm-375871.jpg",
      name: "Trái cây sấy thập cẩm mít, xoài túi 150g",
      description: "Trái cây sấy",
      price: 20000,
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "4.3",
      rate_number: "155",
      quantity: 1,
      categoryId: 3),
     ]
   )
 ];

List<Bill> listBillShop = [
  Bill(status: "Chưa xác nhận", buyer: user[0], isRating: false, listProduct: [
    Product(
        name: "Set bánh trung thu hiện đại hộp 500gr",
        description: "Gồm 4 loại bánh khác nhau",
        price: 20000,
        urlImage:
        'https://lambanhngon.com/product_pictures/eny1473631885.jpg',
        imgShop: "assets/images/3.jpg",
        nameShop: user[0].name,
        rate: "3.5",
        rate_number: "155",
        quantity: 1,
        categoryId: 2),
    Product(
        name: "Pizza viền phô mai 2 loại cỡ vừa",
        description: "Pizza bò, heo, phô mai",
        price: 90000,
        urlImage:
        'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTR8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
        imgShop: "assets/images/3.jpg",
        nameShop: user[0].name,
        rate: "4.0",
        quantity: 1,
        rate_number: "155",
        categoryId: 1),
    Product(
        urlImage: "https://vinmec-prod.s3.amazonaws.com/images/20190425_063710_470758_rau_xanh.max-800x800.jpg",
        name: "Rau củ thập cẩm các loại ngẫu nhiên",
        description: "Súp lơ, cà rốt, cải thảo",
        price: 35000,
        imgShop: "assets/images/3.jpg",
        nameShop: user[0].name,
        rate: "4.3",
        rate_number: "155",
        quantity: 1,
        categoryId: 3),
  ]),
   Bill(status: "Chưa xác nhận", buyer: user[0], isRating: false, listProduct: [
    Product(
        name: "Set bánh trung thu hiện đại hộp 500gr",
        description: "Gồm 4 loại bánh khác nhau",
        price: 20000,
        urlImage:
        'https://lambanhngon.com/product_pictures/eny1473631885.jpg',
        imgShop: "assets/images/3.jpg",
        nameShop: user[0].name,
        rate: "3.5",
        rate_number: "155",
        quantity: 1,
        categoryId: 2),
    Product(
        name: "Pizza viền phô mai 2 loại cỡ vừa",
        description: "Pizza bò, heo, phô mai",
        price: 90000,
        urlImage:
        'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTR8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
        imgShop: "assets/images/3.jpg",
        nameShop: user[0].name,
        rate: "4.0",
        quantity: 1,
        rate_number: "155",
        categoryId: 1),
    Product(
        urlImage: "https://vinmec-prod.s3.amazonaws.com/images/20190425_063710_470758_rau_xanh.max-800x800.jpg",
        name: "Rau củ thập cẩm các loại ngẫu nhiên",
        description: "Súp lơ, cà rốt, cải thảo",
        price: 35000,
        imgShop: "assets/images/3.jpg",
        nameShop: user[0].name,
        rate: "4.3",
        rate_number: "155",
        quantity: 1,
        categoryId: 3),
  ]),
  Bill(status: "Đã xác nhận", buyer: user[0], isRating: false, listProduct: [
    Product(
        name: "Set bánh trung thu hiện đại hộp 500gr",
        description: "Gồm 4 loại bánh khác nhau",
        price: 20000,
        urlImage:
        'https://lambanhngon.com/product_pictures/eny1473631885.jpg',
        imgShop: "assets/images/3.jpg",
        nameShop: user[0].name,
        rate: "3.5",
        rate_number: "155",
        quantity: 1,
        categoryId: 2),
    Product(
        urlImage: "https://vinmec-prod.s3.amazonaws.com/images/20190425_063710_470758_rau_xanh.max-800x800.jpg",
        name: "Rau củ thập cẩm các loại ngẫu nhiên",
        description: "Súp lơ, cà rốt, cải thảo",
        price: 35000,
        imgShop: "assets/images/3.jpg",
        nameShop: user[0].name,
        rate: "4.3",
        rate_number: "155",
        quantity: 1,
        categoryId: 3),
    Product(
        name: "Pizza viền phô mai 2 loại cỡ vừa",
        description: "Pizza bò, heo, phô mai",
        price: 90000,
        urlImage:
        'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTR8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
        imgShop: "assets/images/3.jpg",
        nameShop: user[0].name,
        rate: "4.0",
        quantity: 1,
        rate_number: "155",
        categoryId: 1),
  ]),
  Bill(status: "Đã hủy", buyer: user[0], isRating: false, listProduct: [
    Product(
        name: "Pizza viền phô mai 2 loại cỡ vừa",
        description: "Pizza bò, heo, phô mai",
        price: 90000,
        urlImage:
        'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTR8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
        imgShop: "assets/images/3.jpg",
        nameShop: user[0].name,
        rate: "4.0",
        quantity: 1,
        rate_number: "155",
        categoryId: 1),
    Product(
        name: "Set bánh trung thu hiện đại hộp 500gr",
        description: "Gồm 4 loại bánh khác nhau",
        price: 20000,
        urlImage:
        'https://lambanhngon.com/product_pictures/eny1473631885.jpg',
        imgShop: "assets/images/3.jpg",
        nameShop: user[0].name,
        rate: "3.5",
        rate_number: "155",
        quantity: 1,
        categoryId: 2),
    Product(
        urlImage: "https://vinmec-prod.s3.amazonaws.com/images/20190425_063710_470758_rau_xanh.max-800x800.jpg",
        name: "Rau củ thập cẩm các loại ngẫu nhiên",
        description: "Súp lơ, cà rốt, cải thảo",
        price: 35000,
        imgShop: "assets/images/3.jpg",
        nameShop: user[0].name,
        rate: "4.3",
        rate_number: "155",
        quantity: 1,
        categoryId: 3),
  ]),
  Bill(status: "Đã hoàn thành", buyer: user[0], isRating: false, listProduct: [
    Product(
        urlImage: "https://vinmec-prod.s3.amazonaws.com/images/20190425_063710_470758_rau_xanh.max-800x800.jpg",
        name: "Rau củ thập cẩm các loại ngẫu nhiên",
        description: "Súp lơ, cà rốt, cải thảo",
        price: 35000,
        imgShop: "assets/images/3.jpg",
        nameShop: user[0].name,
        rate: "4.3",
        rate_number: "155",
        quantity: 1,
        categoryId: 3),
    Product(
        name: "Pizza viền phô mai 2 loại cỡ vừa",
        description: "Pizza bò, heo, phô mai",
        price: 90000,
        urlImage:
        'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTR8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
        imgShop: "assets/images/3.jpg",
        nameShop: user[0].name,
        rate: "4.0",
        quantity: 1,
        rate_number: "155",
        categoryId: 1),
    Product(
        name: "Set bánh trung thu hiện đại hộp 500gr",
        description: "Gồm 4 loại bánh khác nhau",
        price: 20000,
        urlImage:
        'https://lambanhngon.com/product_pictures/eny1473631885.jpg',
        imgShop: "assets/images/3.jpg",
        nameShop: user[0].name,
        rate: "3.5",
        rate_number: "155",
        quantity: 1,
        categoryId: 2),
  ]),
  Bill(status: "Đã hoàn thành", buyer: user[0], isRating: true, listProduct: [
    Product(
        name: "Set bánh trung thu hiện đại hộp 500gr",
        description: "Gồm 4 loại bánh khác nhau",
        price: 20000,
        urlImage:
        'https://lambanhngon.com/product_pictures/eny1473631885.jpg',
        imgShop: "assets/images/3.jpg",
        nameShop: user[0].name,
        rate: "3.5",
        rate_number: "155",
        quantity: 1,
        categoryId: 2),
    Product(
        urlImage: "https://vinmec-prod.s3.amazonaws.com/images/20190425_063710_470758_rau_xanh.max-800x800.jpg",
        name: "Rau củ thập cẩm các loại ngẫu nhiên",
        description: "Súp lơ, cà rốt, cải thảo",
        price: 35000,
        imgShop: "assets/images/3.jpg",
        nameShop: user[0].name,
        rate: "4.3",
        rate_number: "155",
        quantity: 1,
        categoryId: 3),
    Product(
        name: "Pizza viền phô mai 2 loại cỡ vừa",
        description: "Pizza bò, heo, phô mai",
        price: 90000,
        urlImage:
        'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTR8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
        imgShop: "assets/images/3.jpg",
        nameShop: user[0].name,
        rate: "4.0",
        quantity: 1,
        rate_number: "155",
        categoryId: 1),

  ])
];
   