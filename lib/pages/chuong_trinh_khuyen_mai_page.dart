import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:test_flutter_template/json/khuyen_mai_json.dart';
import 'package:test_flutter_template/pages/saleoff/create_sale_off.dart';
import 'package:test_flutter_template/theme/colors.dart';

class ChuongTrinhKhuyenMaiPage extends StatefulWidget {
  const ChuongTrinhKhuyenMaiPage({Key? key}) : super(key: key);

  @override
  _ChuongTrinhKhuyenMaiPageState createState() =>
      _ChuongTrinhKhuyenMaiPageState();
}

class _ChuongTrinhKhuyenMaiPageState extends State<ChuongTrinhKhuyenMaiPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Chương trình khuyến mãi"),
        backgroundColor: Color.fromRGBO(240, 103, 103, 1),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: List.generate(listSale.length, (index) {
            return Container(
              padding: EdgeInsets.all(20),
              width: 400,
              // height: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        "Tên chương trình: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        listSale[index].name,
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Thời gian bắt đầu: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17)),
                      SizedBox(
                        width: 20,
                      ),
                      Text(listSale[index].start_date_time,
                          style: TextStyle(fontSize: 17))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Thời gian kết thúc: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17)),
                      SizedBox(
                        width: 20,
                      ),
                      Text(listSale[index].end_date_time,
                          style: TextStyle(fontSize: 17))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Giảm: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17)),
                      SizedBox(
                        width: 20,
                      ),
                      Text(listSale[index].saleNum.toString() + "%",
                          style: TextStyle(fontSize: 17))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          listSale[index].listProduct.length, (index1) {
                        return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.network(
                              listSale[index].listProduct[index1].urlImage,
                              width: 80,
                              height: 80,
                            ));
                      })),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(100, 30),
                          primary: Colors.red[200], // background
                          onPrimary: Colors.black, // foreground
                        ),
                        onPressed: () {},
                        child: const Text('Thay đổi'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                           fixedSize: const Size(100, 30),
                          primary: Colors.red[200], // background
                          onPrimary: Colors.black, // foreground
                        ),
                        onPressed: () {},
                        child: const Text('Xóa'),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: Container(
        width: 100,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              onPrimary: Colors.white,
              primary: Colors.red),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddNewSaleOff()));
          },
          child: const Text('Tạo chương trình khuyến mãi'),
        ),
      ),
    );
  }
}
