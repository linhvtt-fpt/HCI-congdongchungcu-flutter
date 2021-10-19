import 'package:intl/intl.dart';
import 'package:test_flutter_template/json/product_myshop.dart';
import 'package:test_flutter_template/json/product_myshop_model.dart';
import 'package:test_flutter_template/json/user_model.dart';
import 'package:test_flutter_template/json/user_preferences.dart';
import 'package:test_flutter_template/widgets/appbar_widget.dart';
import 'package:test_flutter_template/widgets/profile_widget.dart';
import 'package:test_flutter_template/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditMyShopProduct extends StatefulWidget {
  final ProductMyShop product;
  const EditMyShopProduct(
      {Key? key,
        required this.product})
      : super(key: key);
  _EditMyShopProductState createState() => _EditMyShopProductState();
}

class _EditMyShopProductState extends State<EditMyShopProduct> {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromRGBO(240, 103, 103, 1),
      elevation: 0,
    ),
    body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 15),
      physics: BouncingScrollPhysics(),
      children: [
        getDataEdit(),
        _btnSave(),
      ],
    ),
  );

  Widget getDataEdit() {
    String dropdownValue = 'Thực phẩm';
    String? _selectedCate = 'Thực phẩm';
    //List<Choice> choices = choices2021;
    var size = MediaQuery.of(context).size;
     return SingleChildScrollView(
       child: Padding(
         padding: EdgeInsets.only(bottom: 60),
          child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 350,
                      height: 230,
                      child: InkWell(
                        onTap: () {

                        },
                        child: Image(
                          image: NetworkImage(widget.product.urlImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TextFieldWidget(
                    //   label: "Phân loại",
                    //   text: widget.product.category,
                    //   onChanged: (category) {},
                    // ),
                    Text("Phân loại", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                    DropdownButton<String>(
                      isExpanded: true,
                      value: _selectedCate,
                      items: <String>['Thực phẩm', 'Ăn vặt', 'Đồ gia dụng', 'Điện thoại'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            textAlign: TextAlign.center,
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCate = newValue;
                          if (_selectedCate == 'Ăn vặt') {
                            _selectedCate = "Ăn Vặt";
                          } else if (_selectedCate == 'Đồ gia dụng') {
                            _selectedCate = "Đồ gia dụng";
                          } else if (_selectedCate == 'Điện thoại') {
                            _selectedCate= "Điện thoại";
                          }
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    TextFieldWidget(
                      label: "Tên sản phẩm",
                      text: widget.product.name,
                      onChanged: (name) {},
                    ),
                    SizedBox(height: 10),
                    TextFieldWidget(
                      label: "Giá thành (VND)",
                      text: widget.product.price.toString(),
                      onChanged: (price) {},
                    ),
                    SizedBox(height: 10),
                    TextFieldWidget(
                      label: "Số lượng",
                      text: widget.product.quantity.toString(),
                      onChanged: (quantity) {},
                    ),
                    SizedBox(height: 10),
                  // TextFormField(
                  //   initialValue: /*widget.productId != 'add'
                  //           ? _product.description
                  //           :*/
                  //   '',
                  //   // focusNode: _descriptionFocusNode,
                  //   maxLines: 3,
                  //   keyboardType: TextInputType.multiline,
                  //   decoration: InputDecoration(
                  //     border: ,
                  //     filled: true,
                  //     fillColor: Colors.white,
                  //     hintText: 'Input Description',
                  //     hintStyle: TextStyle(color: Colors.grey),
                  //     focusedBorder: UnderlineInputBorder(
                  //       borderSide: BorderSide(
                  //         color: Theme.of(context).accentColor,
                  //         width: 2.0,
                  //       ),
                  //     ),
                  //     focusedErrorBorder: UnderlineInputBorder(
                  //       borderSide: BorderSide(
                  //         color: Colors.red,
                  //         width: 2.0,
                  //       ),
                  //     ),
                  //     enabledBorder: UnderlineInputBorder(
                  //       borderSide: BorderSide(
                  //         color: Colors.grey.shade500,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  //   TextFieldWidget(
                  //     label: "Mô tả sản phẩm",
                  //     text: widget.product.description,
                  //     onChanged: (description) {},
                  //   ),
                    SizedBox(height: 10),
                    // TextFieldWidget(
                    //   label: "Thêm chi tiết quảng cáo",
                    //   text: "#bánh_trung_thu_mùa_dịch, #bánh_trung_thu_ế \n"
                    //       "Thành phần: \n",
                    //   onChanged: (description) {},
                    // ),
                    TextFieldWidget(
                      label: "Mô tả sản phẩm",
                      maxLines: 15,
                      text: widget.product.description + "\n"
                          "#bánh_trung_thu_mùa_dịch, #bánh_trung_thu_ngon \n"
                          "Thành phần: \n"
                          " 1 Bánh nhân dừa \n"
                          " 1 Bánh nhân đậu xanh \n"
                          " 1 Bánh nhân thập cẩm \n"
                          " 1 Bánh nhân gà quay\n",
                      onChanged: (description) {},
                    ),
                  ],
                  ),
                ),
              ],
          )
       ),
     );
  }

  Widget _btnSave() {
    return InkWell(
      onTap: () {

      },
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(3)), color: Color.fromRGBO(240, 103, 103, 1),),
           margin: EdgeInsets.symmetric(horizontal: 15),
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