import 'package:flutter/material.dart';
import 'package:test_flutter_template/pages/home_page.dart';
import 'package:test_flutter_template/pages/myshop_add_new_product.dart';
import 'package:test_flutter_template/pages/root_app.dart';
import 'package:test_flutter_template/pages/myshop_page.dart';

import 'pages/login_page.dart';
// @dart=2.9

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: RootApp(),
    home: LoginScreen(),
  ));
}

