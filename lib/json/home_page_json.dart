const List menu = ["Delivery", "Pickup", "Dine-In"];
const List peopleFeedback = [
  "Fast & reliable (12)",
  "Well packed (11)",
  "Follow order notes (11)"
];
const List categories = [
  // {"img": "assets/images/protein.png", "name": "Protein"},
  // {"img": "assets/images/vegetables.png", "name": "Vegestable"},
  // {"img": "assets/images/snack.png", "name": "Snack"},
  // {"img": "assets/images/sneakers.png", "name": "Sneaker"},
  // {"img": "assets/images/soap.png", "name": "Soap"},
  // {"img": "assets/images/responsive.png", "name": "Technology"},
  // {"img": "assets/images/book.png", "name": "Book"},
  // {"img": "assets/images/images.png", "name": "More"},
  {"img": "assets/images/diet.png", "name": "Thực phẩm"},
    {"img": "assets/images/fast-food.png", "name": "Ăn vặt"},
  {"img": "assets/images/fashion.png", "name": "Thời trang"},
  {"img": "assets/images/electronics.png", "name": "Điện tử"},
  {"img": "assets/images/menu.png", "name": "Khác"},
];
const List firstMenu = [
  {
    "img":
        "https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTl8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "is_liked": true,
    "name": "Mary's Breakfast Burritos",
    "description": "Breakfast and Brunch - American - Sandwiches",
    "time": "45-55 Min",
    "delivery_fee": "\$1.49 Delivery Fee"
  }
];
const List exploreMenu = [
  {
    "img":
        "https://cf.shopee.vn/file/435d7bbfad159966b7c6aa1b3614ec9b_tn",
    "is_liked": true,
    "name": "Set nguyên liệu pha trà sữa",
    "description": "Trà sữa trân châu, thái xanh, truyền thống",
    "time": "15-25 Min",
    "price": "20.000",
    "rate": "4.5",
    "rate_number": "105",
    "imgShop": "assets/images/3.jpg",
    "nameShop": "Baba Tea"
  },
  {
    "img":
        "https://images.unsplash.com/photo-1552895638-f7fe08d2f7d5?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9vZCUyMG1jZG9uYWxkfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "is_liked": false,
    "name": "Khoai tây chiên",
    "description": "Khoai tây chiên truyền thống, lắc phô mai",
    "time": "20-30 Min",
    "price": "20.000",
    "rate": "4.5",
    "rate_number": "500+",
    "imgShop": "assets/images/3.jpg",
    "nameShop": "Baba Tea"
  },
  {
    "img":
        "https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTR8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "is_liked": true,
    "name": "Pizza",
    "description": "Pizza bò, xúc xích, phô mai",
    "time": "40-50 Min",
    "price": "90.000",
    "rate": "4.5",
    "rate_number": "133",
    "imgShop": "assets/images/3.jpg",
    "nameShop": "Baba Tea"
  },
  {
    "img":
        "https://toplist.vn/images/800px/cau-dat-farm-375871.jpg",
    "is_liked": true,
    "name": "Trái cây & rau củ sấy",
    "description": "Trái cây sấy, rau củ sấy",
    "time": "40-50 Min",
    "price": "40.000",
    "rate": "4.5",
    "rate_number": "133",
    "imgShop": "assets/images/3.jpg",
    "nameShop": "Baba Tea"
  },
  {
    "img":
        "http://cuatiemnho.vn/uploads/product/2019_04/beauty-care.jpg",
    "is_liked": true,
    "name": "Sữa tắm",
    "description": "Sữa tắm thái lan",
    "time": "40-50 Min",
    "price": "75.000",
    "rate": "4.5",
    "rate_number": "133",
    "imgShop": "assets/images/3.jpg",
    "nameShop": "Baba Tea"
  },
  {
    "img":
        "https://fado.vn/blog/wp-content/uploads/2020/05/giay-sneaker-trang-nu-nen-so-huu-1.jpg",
    "is_liked": true,
    "name": "Giày sneaker",
    "description": "Giày sneaker trắng nữ",
    "time": "40-50 Min",
    "price": "355.000",
    "rate": "4.5",
    "rate_number": "133",
    "imgShop": "assets/images/3.jpg",
    "nameShop": "Baba Tea"
  },
  // {
  //   "img":
  //       "https://thucphamvanquy.com/wp-content/uploads/2019/09/th%E1%BB%8Bt-ba-ch%E1%BB%89-t%C6%B0%C6%A1i.jpg.webp",
  //   "is_liked": true,
  //   "name": "Thịt heo",
  //   "description": "Ba rọi, má heo, sườn non",
  //   "time": "40-50 Min",
  //   "price": "180.000đ",
  //   "rate": "4.5",
  //   "rate_number": "133"
  // },
  {
    "img":
        "https://cdn.nguyenkimmall.com/images/companies/_1/Tin_tuc/kinh-nghiem-meo-hay/tu-lanh/bao-quan-thit-ca-tuoi-lau-trong-tu-lanh-3.jpg",
    "is_liked": true,
    "name": "Cá",
    "description": "Cá hồi, cá diêu hồng, cá basa",
    "time": "40-50 Min",
    "price": "90.000",
    "rate": "4.5",
    "rate_number": "133",
    "imgShop": "assets/images/3.jpg",
    "nameShop": "Baba Tea"
  },
  {
    "img":
        "https://mac24h.vn/images/thumbnails/350/350/detailed/48/Macbook_Pro_16_in_xrve-sz.png?t=1632170839",
    "is_liked": true,
    "name": "Laptop MacBook Pro",
    "description": "MacBook Pro",
    "time": "40-50 Min",
    "price": "24.000.000",
    "rate": "4.5",
    "rate_number": "133",
    "imgShop": "assets/images/3.jpg",
    "nameShop": "Baba Tea"
  },

];

const List popluarNearYou = [
  {
    "img":
        "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "is_liked": false,
    "name": "Village Breakfast Snob",
    "description": "Breakfast and Brunch - American - Sandwich",
    "time": "20-30 Min",
    "delivery_fee": "\$1.49 Delivery Fee",
    "rate": "4.3",
    "rate_number": "273"
  },
  {
    "img":
        "https://images.unsplash.com/photo-1467453678174-768ec283a940?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mjd8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "is_liked": false,
    "name": "Soho Finest Market",
    "description": "Breakfast aand Brunch - Juice and Smoothies",
    "time": "15-25 Min",
    "delivery_fee": "\$2.49 Delivery Fee",
    "rate": "4.4",
    "rate_number": "22"
  },
];

const List packForYou = [
  {
    "img":
        "https://images.unsplash.com/photo-1559847844-5315695dadae?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1940&q=80",
    "name": "The Bacon, Egg, and Cheese Bagel",
    "description":
        'Fresh eggs, bacon, and creamy cheese stuffed and between a begel...',
    "price": "\$ 11.99"
  },
  {
    "img":
        "https://images.unsplash.com/photo-1527324688151-0e627063f2b1?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8&auto=format&fit=crop&w=800&q=60",
    "name": "Original French Toast",
    "description":
        'Sliced challah bread soaked in eggs and milk, then fried serve with a good...',
    "price": "\$ 9.99"
  },
  {
    "img":
        "https://images.unsplash.com/photo-1557079604-d28080618be0?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDV8fHxlbnwwfHx8&auto=format&fit=crop&w=800&q=60",
    "name": "Spanish Omelette",
    "description":
        'French eggs, tomatoes, onions, and peppers, creamy cheese, and salads...',
    "price": "\$ 13.99"
  },
  {
    "img":
        "https://images.unsplash.com/photo-1557499305-87bd9049ec2d?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDh8fHxlbnwwfHx8&auto=format&fit=crop&w=800&q=60",
    "name": "2 Eggs Served with Home Fries and Toast",
    "description":
        '2 eggs served your way with home fries and hot toast. Choicee of add...',
    "price": "\$ 10.99"
  },
  {
    "img":
        "https://images.unsplash.com/photo-1580476262798-bddd9f4b7369?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE4fHx8ZW58MHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
    "name": "The Bacon Egg, and Cheese Sandwich",
    "description":
        'Fresh eggs, bacon, and creamy cheese stuffed in between sandwich...',
    "price": "\$ 11.99"
  }
];
