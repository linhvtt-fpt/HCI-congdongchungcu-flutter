
import 'package:test_flutter_template/json/product_myshop_model.dart';
import 'package:test_flutter_template/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewProductMyShop extends StatefulWidget {
  // final ProductMyShop product;
  // const AddNewProductMyShop(
  //     {Key? key,
  //       required this.product})
  //     : super(key: key);
  _AddNewProductMyShopState createState() => _AddNewProductMyShopState();
}

class _AddNewProductMyShopState extends State<AddNewProductMyShop> {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromRGBO(240, 103, 103, 1),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      ),
      title: Text("Thêm mới sản phẩm"),
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
                    child: Image(
                      image: NetworkImage("https://support.sapo.vn/Upload/ImageManager/Image/HaBTT/Sapoweb/San%20pham/sp6.jpg"),
                      fit: BoxFit.cover,
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
                          // if (_selectedCate == 'Ăn vặt') {
                          //   _selectedCate = "Ăn Vặt";
                          // } else if (_selectedCate == 'Đồ gia dụng') {
                          //   _selectedCate = "Đồ gia dụng";
                          // } else if (_selectedCate == 'Điện thoại') {
                          //   _selectedCate= "Điện thoại";
                          // }
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    TextFieldWidget(
                      label: "Tên sản phẩm",
                      text: "",
                      onChanged: (name) {},
                    ),
                    SizedBox(height: 10),
                    TextFieldWidget(
                      label: "Giá thành (VND)",
                      text: "",
                      onChanged: (price) {},
                    ),
                    SizedBox(height: 10),
                    TextFieldWidget(
                      label: "Số lượng",
                      text: "",
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
                    TextFieldWidget(
                      label: "Mô tả sản phẩm",
                      text: "",
                      onChanged: (description) {},
                    ),
                    SizedBox(height: 10),
                    // TextFieldWidget(
                    //   label: "Thêm chi tiết quảng cáo",
                    //   text: "#bánh_trung_thu_mùa_dịch, #bánh_trung_thu_ế \n"
                    //       "Thành phần: \n",
                    //   onChanged: (description) {},
                    // ),
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
                  "Thêm mới sản phẩm",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          )),
    );
  }

}