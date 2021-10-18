import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_flutter_template/model/Choice.dart';

import 'detail_fee.dart';

class FeePage extends StatefulWidget {
  // final productId;
  FeePage();

  @override
  _FeePage createState() => _FeePage();
}

class _FeePage extends State<FeePage> {
  String? _selectedYear = '2021';
  List<Choice> choices = choices2021;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            backgroundColor: Color.fromRGBO(240, 103, 103, 1),
            centerTitle: true,
            title: Text('LỊCH SỬ ĐÓNG PHÍ')),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              Row(children: [
                Expanded(
                  flex: 1,
                  child: Text("Năm"),
                ),
                SizedBox(width: 10),
                Expanded(
                    flex: 3,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _selectedYear,
                      items: <String>['2021', '2020'].map((String value) {
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
                          _selectedYear = newValue;
                          if (_selectedYear == '2021') {
                            choices = choices2021;
                          } else if (_selectedYear == '2020') {
                            choices = choices2020;
                          }
                        });
                      },
                    )),
                Expanded(
                  flex: 6,
                  child: SizedBox(),
                ),
              ]),
              SizedBox(height: 10),
              Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 12,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 15.0,
                          childAspectRatio:
                              MediaQuery.of(context).size.height / 400),
                      itemBuilder: (BuildContext context, int index) {
                        var choice = choices[index];
                        //List.generate(choices2021.length, (index) {
                        return new GestureDetector(
                          child: Card(
                              color: Colors.white,
                              elevation: 4,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                      Text(choice.month),
                                      SizedBox(height: 10),
                                      Text(
                                        choice.fee,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                                text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.green),
                                              text: choice.status,
                                            )),
                                            new Text(choice.date)
                                          ]),
                                    ])),
                              )),
                          onTap: () {
                            if (choice.fee != '') {
                              Route route = MaterialPageRoute(
                                  builder: (context) =>
                                      DetailFeeScreen(choice));
                              Navigator.push(context, route);
                            }
                          },
                        );
                      }))
            ])));
  }

// Widget getStaggeredGridView(BuildContext context) {
//   return GridView.count(
//     crossAxisCount: 6,
//     children: categoryItemsDemo.asMap().entries.map<Widget>((e) {
//       int index = e.key;
//       CategoryItem categoryItem = e.value;
//       return GestureDetector(
//         onTap: () {
//           onCategoryItemClicked(context, categoryItem);
//         },
//         child: Container(
//           padding: EdgeInsets.all(10),
//           child: CategoryItemCardWidget(
//             item: categoryItem,
//             color: gridColors[index % gridColors.length],
//           ),
//         ),
//       );
//     }).toList(),
//
//     //Here is the place that we are getting flexible/ dynamic card for various images
//     staggeredTiles: categoryItemsDemo
//         .map<StaggeredTile>((_) => StaggeredTile.fit(2))
//         .toList(),
//     mainAxisSpacing: 3.0,
//     crossAxisSpacing: 4.0, // add some space
//   );
// }

}

class SelectCard extends StatelessWidget {
  const SelectCard({required this.choice});

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        elevation: 4,
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(choice.month),
                    SizedBox(height: 10),
                    Text(
                      choice.fee,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(
                            style: TextStyle(color: Colors.green),
                            text: choice.status,
                          )),
                          new Text(choice.date)
                        ]),
                  ]),
            )));
  }
}
