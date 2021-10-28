import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_template/json/cancel_bill.dart';
import 'package:test_flutter_template/json/list_ly_do_huy_don.dart';
import 'package:test_flutter_template/widgets/textfield_widget.dart';

import 'da_huy_buyer_page.dart';
import 'da_huy_seller_page.dart';

class CancelBillReason extends StatefulWidget {
  bool buyer;
  CancelBillReason(this.buyer);
  @override
  _CancelBillReasonState createState() => _CancelBillReasonState();
}

class _CancelBillReasonState extends State<CancelBillReason> {
    late int? selectedRadio;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int? val) {
    setState(() {
      selectedRadio = val;
    });
  }

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            if(widget.buyer)
            RadioListTile<int>(
              value: 1,
              groupValue: selectedRadio,
              title: Text(listReason[0]['1']),
              onChanged: (int? val) {
                  setSelectedRadio(val);
              },
              activeColor: Colors.red,
            ),
            if(!widget.buyer)
            RadioListTile<int>(
              value: 1,
              groupValue: selectedRadio,
              title: Text(listReason[1]['1']),
              onChanged: (int? val) {
                  setSelectedRadio(val);
              },
              activeColor: Colors.red,
            ),
      
            if(widget.buyer)
            RadioListTile(
              value: 2,
              groupValue: selectedRadio,
              title: Text(listReason[0]['2']),
              onChanged: (int? val) {
                setSelectedRadio(val);
              },
              activeColor: Colors.red,
            ),
            if(!widget.buyer)
            RadioListTile(
              value: 2,
              groupValue: selectedRadio,
              title: Text(listReason[1]['2']),
              onChanged: (int? val) {
                setSelectedRadio(val);
              },
              activeColor: Colors.red,
            ),
      
            if(widget.buyer)
            RadioListTile(
              value: 3,
              groupValue: selectedRadio,
              title: Text(listReason[0]['3']),
              onChanged: (int? val) {
                setSelectedRadio(val);
              },
              activeColor: Colors.red,
            ),
            if(!widget.buyer)
            RadioListTile(
              value: 3,
              groupValue: selectedRadio,
              title: Text(listReason[1]['3']),
              onChanged: (int? val) {
                setSelectedRadio(val);
              },
              activeColor: Colors.red,
            ),
      
            if(widget.buyer)
            RadioListTile(
              value: 4,
              groupValue: selectedRadio,
              title: Text(listReason[0]['4']),
              onChanged: (int? val) {
                setSelectedRadio(val);
              },
              activeColor: Colors.red,
            ),
            if(!widget.buyer)
            RadioListTile(
              value: 4,
              groupValue: selectedRadio,
              title: Text(listReason[1]['4']),
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
            _btnAcceptCancel(context, widget.buyer),
          ],
        ),
      ),
    );
  }
}

Widget _btnAcceptCancel(context, buyer) {
  return InkWell(
    onTap: () {
      if(buyer){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HistoryBuyedPage()));
      }
      else if(!buyer){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HistorySellerPage()));
      }

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
