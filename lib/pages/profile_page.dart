import 'package:test_flutter_template/json/user_model.dart';
import 'package:test_flutter_template/json/user_preferences.dart';
import 'package:test_flutter_template/widgets/appbar_widget.dart';
import 'package:test_flutter_template/widgets/profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
        // appBar: buildAppBar(context),

        body: ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: 10),
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
        SizedBox(height: 10),
        _heading("Thông tin cá nhân"),
        SizedBox(
          height: 5,
        ),
        _profileDetail(),
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
      width: MediaQuery.of(context).size.width * 0.80, //80% of width
      padding: EdgeInsets.only(left: 20),
      child: Text(
        heading,
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }

  Widget _profileDetail() {
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
                      "erenYeager@gmail.com",
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
                      "09236738253",
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
                      "Topaz Home apartment, Block 3",
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

  Widget _btnLogout() {
    return InkWell(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.blue,
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
                Text(
                  "Đăng xuất",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          )),
    );
  }
}
