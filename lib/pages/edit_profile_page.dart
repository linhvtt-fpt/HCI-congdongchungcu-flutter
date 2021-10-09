import 'package:test_flutter_template/json/user_model.dart';
import 'package:test_flutter_template/json/user_preferences.dart';
import 'package:test_flutter_template/widgets/appbar_widget.dart';
import 'package:test_flutter_template/widgets/profile_widget.dart';
import 'package:test_flutter_template/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: buildAppBar(context),
    body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 23),
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: 10,),
        ProfileWidget(
            imagePath: user.imagePath,
            isEdit: true,
            onClicked: () async {},
        ),
        SizedBox(height: 10,),
        TextFieldWidget(
          label: "Họ và tên",
          text: user.name,
          onChanged: (name) {}
        ),
        SizedBox(height: 10,),
        TextFieldWidget(
            label: "Email",
            text: user.email,
            onChanged: (email) {}
        ),
        SizedBox(height: 10,),
        TextFieldWidget(
            label: "Số điện thoại",
            text: user.phoneNumber,
            onChanged: (phone) {}
        ),
        SizedBox(height: 10,),
        TextFieldWidget(
            label: "Địa chỉ",
            text: user.address,
            onChanged: (address) {}
        ),
        SizedBox(height: 20,),
        _btnSave(),
      ],

    ),
  );

  Widget _btnSave() {
    return InkWell(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(3)), color: Colors.blue,),
          // margin: EdgeInsets.symmetric(horizontal: 1),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 5),
                Text(
                  "Lưu",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          )),
    );
  }

}