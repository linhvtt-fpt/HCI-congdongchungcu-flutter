import 'package:test_flutter_template/json/product_model.dart';

final allProduct = <Product>[
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
      categoryId: 1),
  Product(
      name: "Khoai tây chiên",
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
      name: "Trái cây sấy",
      description: "Trái cây sấy",
      price: 20000,
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "4.3",
      rate_number: "155",
      quantity: 1,
      categoryId: 1),
  Product(
      urlImage:
          "https://cdn.nguyenkimmall.com/images/companies/_1/Tin_tuc/kinh-nghiem-meo-hay/tu-lanh/bao-quan-thit-ca-tuoi-lau-trong-tu-lanh-3.jpg",
      name: "Cá",
      description: "Cá hồi, cá diêu hồng, cá basa",
      price: 90000,
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "3.9",
      rate_number: "155",
      quantity: 1,
      categoryId: 1),
  Product(
      urlImage:
          "https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTR8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      name: "Pizza",
      description: "Pizza bò, heo, phô mai",
      price: 90000,
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "4.5",
      rate_number: "155",
      quantity: 1,
      categoryId: 1),
  Product(
      urlImage:
          "https://vinmec-prod.s3.amazonaws.com/images/20190425_063710_470758_rau_xanh.max-800x800.jpg",
      name: "Rau củ",
      description: "Súp lơ, cà rốt, cải thảo",
      price: 35000,
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "4",
      rate_number: "155",
      quantity: 1,
      categoryId: 1),

  // Ăn Vặt
  // Product(
  //     urlImage:
  //         "https://gacobap.com/wp-content/uploads/2018/04/kinh-doanh-do-an-vat-2.jpg",
  //     name: "Bánh tráng trộng siêu cấp",
  //     description: "bánh tráng phơi sương, muối",
  //     price: 35000,
  //     imgShop: "assets/images/3.jpg",
  //     nameShop: "Baba Tea",
  //     rate: "4",
  //     rate_number: "155",
  //     quantity: 1,
  //     categoryId: 2),

  // Product(
  //     urlImage:
  //         "https://gacobap.com/wp-content/uploads/2018/04/kinh-doanh-do-an-vat-2.jpg",
  //     name: "Bánh tráng trộng siêu cấp",
  //     description: "bánh tráng phơi sương, muối",
  //     price: 35000,
  //     imgShop: "assets/images/3.jpg",
  //     nameShop: "Baba Tea",
  //     rate: "4",
  //     rate_number: "155",
  //     quantity: 1,
  //     categoryId: 2),

  // Product(
  //     urlImage:
  //         "https://gacobap.com/wp-content/uploads/2018/04/kinh-doanh-do-an-vat-2.jpg",
  //     name: "Bánh tráng trộng siêu cấp",
  //     description: "bánh tráng phơi sương, muối",
  //     price: 35000,
  //     imgShop: "assets/images/3.jpg",
  //     nameShop: "Baba Tea",
  //     rate: "4",
  //     rate_number: "155",
  //     quantity: 1,
  //     categoryId: 2),

  //Thời Trang
  Product(
      urlImage:
          "https://product.hstatic.net/1000282067/product/jordan-1-low-unc-light-ao9944-441-on-foot-01_ff11227602e1426b9b1117f136d74c70_1024x1024.jpg",
      name: "Jordan 1 UNC",
      description: "giày dép",
      price: 35000,
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "4",
      rate_number: "155",
      quantity: 1,
      categoryId: 3),

  Product(
      urlImage:
          "https://static.highsnobiety.com/thumbor/LahtTaMze9wF-iYecDeO3_zV0TQ=/1600x1067/static.highsnobiety.com/wp-content/uploads/2019/07/23125708/adidas-yeezy-boost-700-multi-family-sizes-01.jpg",
      name: "Yeezy Boost 700 OG",
      description: "gìay dép sneaker",
      price: 35000,
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "4",
      rate_number: "155",
      quantity: 1,
      categoryId: 3),

  Product(
      urlImage:
          "https://bizweb.dktcdn.net/thumb/1024x1024/100/347/923/products/e3ww-3.png",
      name: "Vans Slip On All White",
      description: "giày dép thời trang",
      price: 35000,
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "4",
      rate_number: "155",
      quantity: 1,
      categoryId: 3),

//Điện tử

  Product(
      urlImage:
          "https://genk.mediacdn.vn/139269124445442048/2021/3/9/photo-1-16152785247611799272501.png",
      name: "Play Station 5",
      description: "máy game",
      price: 35000,
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "4",
      rate_number: "155",
      quantity: 1,
      categoryId: 4),

  Product(
      urlImage:
          "http://product.hstatic.net/1000231532/product/nintendo_switch_oled_model_white_set_ef9614f7f1c149ba9303a294c1018eb5_grande.jpg",
      name: "Nintendo Switch Oled",
      description: "máy game",
      price: 35000,
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "4",
      rate_number: "155",
      quantity: 1,
      categoryId: 4),

  Product(
      urlImage:
          "https://img.websosanh.vn/v10/users/review/images/ly55edarluxu2/iphone-13-pro-mau-xanh.jpg?compress=85",
      name: "I Phone 13 - 512GB",
      description: "điện thoại",
      price: 35000,
      imgShop: "assets/images/3.jpg",
      nameShop: "Baba Tea",
      rate: "4",
      rate_number: "155",
      quantity: 1,
      categoryId: 4),
];
