import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter_template/json/product_myshop.dart';
import 'package:test_flutter_template/json/product_myshop_model.dart';

import 'package:test_flutter_template/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../chuong_trinh_khuyen_mai_page.dart';
import '../myshop_page.dart';
import 'choose_sale_product.dart';

class EditNewSaleOff extends StatefulWidget {
  _EditNewSaleOff createState() => _EditNewSaleOff();
}

class _EditNewSaleOff extends State<EditNewSaleOff> {
  DateTime _fromDateTime = DateFormat('dd-MM-yyyy hh:mm a').parse('28-10-2021 10:00 AM');
  String _chosenFromDate = '28-10-2021 10:00 AM';
  DateTime _toDateTime = DateFormat('dd-MM-yyyy hh:mm a').parse('28-10-2021 06:00 PM');
  String _chosenToDate = '28-10-2021 06:00 PM';
List<bool?> showValue = List.filled(allProductMyShop.length, false);


  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    showValue[1] = true;
    showValue[6] = true;
    showValue[7] = true;
    showValue[8] = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 103, 103, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Chỉnh sửa chương trình khuyến mãi"),
        elevation: 0,
      ),
      body: ListView(
            children: [
              getDataEdit(context),
            ],
          ),
      bottomNavigationBar: _btnSave(),
    );
  }

  Widget getDataEdit(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 5),
            //Tên ctr
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 50,
              color: Colors.white,
              child: Row(children: [
                Text("Tên chương trình khuyến mãi",
                    style: TextStyle(fontSize: 16))
              ]),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 40,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  new Flexible(
                    child: new TextField(
                      controller: TextEditingController()..text = 'Khuyến mãi đồ ăn vặt',
                      decoration: const InputDecoration(
                          hintText: "Nhập tên chương trình"),
                    ),
                  ),
                ],
              ),
            ),
            //Thời gian bắt đầu
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 50,
              color: Colors.white,
              child: Row(children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    "Thời gian bắt đầu",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: GestureDetector(
                    onTap: () {
                      _showFromDate(context);
                    },
                    child: Row(
                      children: [
                        Text(_chosenFromDate, style: TextStyle(fontSize: 16)),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(height: 5),
            //Thời gian kết thúc
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 50,
              color: Colors.white,
              child: Row(children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    "Thời gian kết thúc",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: GestureDetector(
                    onTap: () {
                      _showToDate(context);
                    },
                    child: Row(
                      children: [
                        Text(_chosenToDate, style: TextStyle(fontSize: 16)),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(height: 15),
            //% giảm giá
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 50,
              color: Colors.white,
              child: Row(children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    "Giảm giá",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    initialValue: '20',
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(2),
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Nhập % giảm',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).accentColor,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Text(
                      "%",
                      style: TextStyle(fontSize: 16),
                    )),
              ]),
            ),
            SizedBox(height: 15),
            Container(
              width: size.width,
              padding: EdgeInsets.only(left: 10, right: 10),
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                Text(
                  "Chọn sản phẩm khuyến mãi",
                  style: TextStyle(fontSize: 16),
                ),
                    SizedBox(
                      height: 10,
                    ),
                SingleChildScrollView(
                    // scrollDirection: Axis.horizontal,
                    child: Column(
                        children: List.generate(allProductMyShop.length, (index) {
                          return Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 5, right: 10),
                              child: Row(children: [
                                Checkbox(
                                  value: showValue[index],
                                  onChanged:
                                      (bool? value) {
                                    setState(() {
                                      showValue[index] = value;
                                    });
                                  },
                                ),
                                Image.network(
                                  allProductMyShop[index].urlImage,
                                  width: 70,
                                  height: 70,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          allProductMyShop[index].name,
                                          overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 15
                                        )
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: Image.asset(
                                                "assets/images/vietnamese-dong.png",
                                                width: 5,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: Text(
                                              NumberFormat.decimalPattern()
                                                  .format(allProductMyShop[index].price),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 1,
                                              child:
                                              SizedBox()
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ])
                          );
                        })
                    ))
              ]),
            ),

          ],
        ));
  }

  void _showFromDate(BuildContext context) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: 500,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    height: 400,
                    child: CupertinoDatePicker(
                        minimumDate:
                            DateTime.now().add(const Duration(minutes: 1)),
                        initialDateTime: _fromDateTime,
                        onDateTimeChanged: (val) {
                          setState(() {
                            _fromDateTime = val;
                            _chosenFromDate =
                                DateFormat('dd-MM-yyyy hh:mm a').format(val);
                          });
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ),
            ));
  }

  void _showToDate(BuildContext context) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: 500,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    height: 400,
                    child: CupertinoDatePicker(
                        minimumDate: DateTime.now()
                            .add(const Duration(hours: 1, minutes: 1)),
                        initialDateTime: _toDateTime,
                        onDateTimeChanged: (val) {
                          setState(() {
                            _toDateTime = val;
                            _chosenToDate =
                                DateFormat('dd-MM-yyyy hh:mm a').format(val);
                          });
                        }),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ),
            ));
  }

  Widget _btnSave() {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ChuongTrinhKhuyenMaiPage()));
      },
      child: Container(
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.all(Radius.circular(3)),
            color: Color.fromRGBO(240, 103, 103, 1),
          ),
          // margin: EdgeInsets.symmetric(horizontal: 15),
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
