import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_template/json/cancel_bill.dart';
import 'package:test_flutter_template/widgets/textfield_widget.dart';

import 'history_cancel_bill.dart';

class CancelBillReason extends StatefulWidget {
  @override
  _CancelBillReasonState createState() => _CancelBillReasonState();
}

class _CancelBillReasonState extends State<CancelBillReason> {
    late int? selectedRadio;
    //late List<CancelReason> cancelReasons;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    //cancelReasons = CancelReason.getCancelReason();
  }

  setSelectedRadio(int? val) {
    setState(() {
      selectedRadio = val;
    });
  }

  // List<Widget> createRadioListReason() {
  //   List<Widget> widgets =[];
  //   for (CancelReason cancelReason in cancelReasons) {
  //     widgets.add(
  //         RadioListTile(
  //             value: cancelReason,
  //             groupValue: cancelReason,
  //             title: Text(cancelReason.reason),
  //             onChanged: (currentReason) {
  //             },
  //             selected: true,
  //         ),
  //     );
  //   }
  //     return widgets;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 103, 103, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Bạn muốn hủy vì lý do gì?"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // Container(
          //   padding: EdgeInsets.all(20.0),
          // ),
          // Column(
          //   children: [
          //     createRadioListReason(),
          //   ],
          // ),
          RadioListTile<int>(
            value: 1,
            groupValue: selectedRadio,
            title: Text("Muốn thay đổi địa chỉ giao hàng"),
            onChanged: (int? val) {
                setSelectedRadio(val);
            },
            activeColor: Colors.red,
          ),
          RadioListTile(
            value: 2,
            groupValue: selectedRadio,
            title: Text("Muốn thay đổi sản phẩm trong đơn hàng(size, màu sắc, số lượng,...)"),
            onChanged: (int? val) {
              setSelectedRadio(val);
            },
            activeColor: Colors.red,
          ),
          RadioListTile(
            value: 3,
            groupValue: selectedRadio,
            title: Text("Thủ tục thanh toán quá rắc rối"),
            onChanged: (int? val) {
              setSelectedRadio(val);
            },
            activeColor: Colors.red,
          ),
          RadioListTile(
            value: 4,
            groupValue: selectedRadio,
            title: Text("Tìm thấy giá rẻ hơn ở chỗ khác"),
            onChanged: (int? val) {
              setSelectedRadio(val);
            },
            activeColor: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldWidget(
                label: "Khác",
                text: "",
                maxLines: 5,
                onChanged: (other){}),
          ),
          _btnAcceptCancel(context),
        ],
      ),
    );
  }
}

Widget _btnAcceptCancel(context) {
  return InkWell(
    onTap: () {
         Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HistoryBuyedPage()));
    },
    child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(3)), color: Color.fromRGBO(240, 103, 103, 1),),
         margin: EdgeInsets.symmetric(horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 5),
              Text(
                "Đồng ý",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
        )),
  );
}
