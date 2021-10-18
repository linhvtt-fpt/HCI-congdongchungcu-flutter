import 'package:flutter/material.dart';
import 'package:test_flutter_template/pages/root_app.dart';
import 'package:test_flutter_template/widgets/input_text_widget.dart';
class LoginScreen extends StatefulWidget {
  LoginScreen() : super();

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<LoginScreen> {
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  //final snackBar = SnackBar(content: Text('email ou mot de passe incorrect'));
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double r = (175 / 360); //  rapport for web test(304 / 540);
    final coverHeight = screenWidth * r;
    bool _pinned = false;
    bool _snap = false;
    bool _floating = false;

    final widgetList = [
      Row(
        children: [
          SizedBox(
            width: 28,
          ),
          Text(
            'CỘNG ĐỒNG CHUNG CƯ',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: const Color(0xff000000),
              
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      SizedBox(
        height: 12.0,
      ),
      Column(
        children: [
          InputTextWidget(
              // controller: _emailController,
              labelText: "Email",
              icon: Icons.email,
              obscureText: false,
              keyboardType: TextInputType.emailAddress),
          SizedBox(
            height: 12.0,
          ),
          InputTextWidget(
              // controller: _pwdController,
              labelText: "Mật khẩu",
              icon: Icons.lock,
              obscureText: true,
              keyboardType: TextInputType.text),
          Padding(
            padding: const EdgeInsets.only(right: 25.0, top: 10.0),
            child: Align(
                alignment: Alignment.topRight,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Quên mật khẩu",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700]),
                    ),
                  ),
                )),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: 55.0,
            child: ElevatedButton(
              onPressed: () async {
                // if (_formKey.currentState!.validate()) {
                //   print("I ove tunisia");
                // }
                //Get.to(ChoiceScreen());
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 0.0,
                minimumSize: Size(screenWidth, 150),
                padding: EdgeInsets.symmetric(horizontal: 30),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
              ),
              child: Ink(
                decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color.fromRGBO(240, 103, 103, 1),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                    color: Color.fromRGBO(240, 103, 103, 1), // Color(0xffF05945),
                    borderRadius: BorderRadius.circular(12.0)),
                child: Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: (){
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => RootApp()));
                     
                    },
                    child: Text(
                      "Đăng nhập",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 30.0,
      ),
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: coverHeight - 25, //304,
            // backgroundColor: Color(0xFFdccdb4),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background:
                  Image.asset("assets/images/masteri-waterfront-background.jpg", fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: screenWidth,
              height: 25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: screenWidth,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return widgetList[index];
          }, childCount: widgetList.length))
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          new Container(
            height: 50.0,
            color: Colors.white,
            child: Center(
                child: Wrap(
              children: [
                Text(
                  "Chưa có tài khoản ",
                  style: TextStyle(
                      color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Material(
                    child: InkWell(
                  onTap: () {
                    // print("sign up tapped");
                    // Get.to(SignUpScreen());
                  },
                  child: Text(
                    "Đăng ký",
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                )),
              ],
            )),
          ),
        ],
      ),
    );
  }
}