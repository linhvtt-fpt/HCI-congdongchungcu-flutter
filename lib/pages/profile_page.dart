
import 'package:test_flutter_template/json/bill_model.dart';
import 'package:test_flutter_template/json/cart_product_json.dart';
import 'package:test_flutter_template/json/list_bill_json.dart';
import 'package:test_flutter_template/json/user_model.dart';
import 'package:test_flutter_template/json/user_preferences.dart';
import 'package:test_flutter_template/pages/history_cancel_bill.dart';
import 'package:test_flutter_template/theme/colors.dart';
import 'package:test_flutter_template/widgets/profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cho_xac_nhan_page.dart';
import 'da_xac_nhan_page.dart';
import 'danh_gia_page.dart';
import 'edit_profile_page.dart';
import 'lich_su_mua_hang.dart';
import 'login_page.dart';
import 'myshop_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int pageIndex = 0;
  final List<Bill> listbillChuaXacNhan = listBill.where((element) => element.status.contains("Chưa xác nhận")).toList();
  final List<Bill> listbillDaXacNhan = listBill.where((element) => element.status.contains("Đã xác nhận")).toList(); 
  final List<Bill> listbillDaHuy = listBill.where((element) => element.status.contains("Đã hủy")).toList(); 
    final List<Bill> listbillDaHoanThanh = listBill.where((element) => element.status.contains("Đã hoàn thành")).toList(); 
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    List bottomItems = [
      Icons.my_library_books_sharp,
      Icons.card_giftcard,
      Icons.stars,
      Icons.delete_forever
    ];
    List textItems = ["Chờ xác nhận", "Đã xác nhận", "Đánh giá", "Đã hủy"];

    return Scaffold(
      // appBar: buildAppBar(context),

        body: ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: 30),
        Column(
          children: [
            SizedBox(
              height: 150,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  ProfileWidget(
                    imagePath: user.imagePath,
                    //hieu ung mo
                    onClicked: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EditProfilePage()),
                      );
                    },
                  ),

                  SizedBox(height: 10),
                  buildName(user),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.list_alt,
                  color: Colors.blue[900],
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Đơn mua",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  color: white,
                  border: Border(
                      top: BorderSide(width: 2, color: black.withOpacity(0.06)),
                      bottom: BorderSide(
                          width: 2, color: black.withOpacity(0.06)))),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, bottom: 0, top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(textItems.length, (index) {
                    // return InkWell(
                    //     onTap: () {
                    //       selectedTab(index);
                    //     },
                    //     child: Column(
                    //       children: [
                    //         Icon(bottomItems[index],
                    //             size: 22, color: Colors.black),
                    //         SizedBox(
                    //           height: 5,
                    //         ),
                    //         Text(
                    //           textItems[index],
                    //           style: TextStyle(fontSize: 15, color: black),
                    //         ),
                    //       ],
                    //     ));
                  return InkWell(
                    onTap: () {
                      selectedTab(index);
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Icon(
                            bottomItems[index],
                            size: 22,
                            color: Colors.black
                          ),
                          if (index == 0 && listbillChuaXacNhan.length > 0)
                      Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            listbillChuaXacNhan.length.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                        if(index == 1 && listbillDaXacNhan.length > 0)
                        Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            listbillDaXacNhan.length.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                      if( index == 3 && listbillDaHuy.length > 0)
                      Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            listbillDaHuy.length.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                      if(index == 2 && listbillDaHoanThanh.length > 0)
                        Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          child: Text(
                            listbillDaHoanThanh.length.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                          ],
                           
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          textItems[index],
                          style: TextStyle(
                              fontSize: 15,
                              color: black),
                        ),
                      ],
                    ));
                  }
                  )
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 30),
        Row(
          children: [
            _heading("Thông tin cá nhân"),
            SizedBox(
                width: 150,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyShopPage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.storefront,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Shop của tôi")
                    ],
                  ),
                ))
          ],
        ),
        SizedBox(
          height: 5,
        ),
        _profileDetail(user),
        SizedBox(
          height: 5,
        ),
        _heading("Cài đặt"),
        SizedBox(
          height: 5,
        ),
        _settingCard(),
        SizedBox(
          height: 5,
        ),
        _btnLogout(),
      ],
    ));
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      )
    ],
  );

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.60, //80% of width
      padding: EdgeInsets.only(left: 20),
      child: Text(
        heading,
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }

  Widget _profileDetail(User user) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 4,
          child: Column(
            children: [
              //each row of column
              Row(children: [
                Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10, top: 45)),
                    Icon(Icons.alternate_email),
                    SizedBox(width: 30,),
                    Text(
                      user.email,
                      style: TextStyle(fontSize: 16),
                    )
              ]),
              Divider(
                height: 0.6,
                color: Colors.black,
              ),
              Row(children: [
                Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10, top: 45)),
                    Icon(Icons.phone),
                    SizedBox(width: 30,),
                    Text(
                      user.phoneNumber,
                      style: TextStyle(fontSize: 16),
                    )
              ]),
              Divider(
                height: 0.6,
                color: Colors.black,
              ),
              Row(children: [
                Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10, top: 45)),
                    Icon(Icons.add_location_alt_rounded),
                    SizedBox(width: 30,),
                    Text(
                      user.address,
                      style: TextStyle(fontSize: 16),
                    )
              ]),
            ],
          ),
        ));
  }

  Widget _settingCard() {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 4,
          child: Column(
            children: [
              //each row of column
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 10, top: 45)),
                  Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Cài đặt chung",
                    style: TextStyle(fontSize: 18, color: Colors.black45),
                  ),
                ],
              ),
              Divider(
                height: 0.6,
                color: Colors.black,
              ),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 10, top: 45)),
                  Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Quyền riêng tư",
                    style: TextStyle(fontSize: 18, color: Colors.black45),
                  ),
                ],
              ),

              Divider(
                height: 0.6,
                color: Colors.black,
              ),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 10, top: 45)),
                  Icon(
                    Icons.dashboard_customize,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Hỗ trợ",
                    style: TextStyle(fontSize: 18, color: Colors.black45),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
      if (pageIndex == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => WaitAcceptPage(buyer: true, status: "Chưa xác nhận",)));
      } else if (pageIndex == 1){
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => AcceptedPage()));
      } else if (pageIndex == 2){
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => RatingPage()));
      }
      else if(pageIndex == 3){
         Navigator.push(context, MaterialPageRoute(builder: (_) => HistoryBuyedPage()));
      }
    });
  }

  Widget _btnLogout() {
    return InkWell(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Color.fromRGBO(240, 103, 103, 1),
          ),
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                SizedBox(width: 5),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => LoginScreen()));
                  },
                  child: Text(
                    "Đăng xuất",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
          )),
    );
  }
}