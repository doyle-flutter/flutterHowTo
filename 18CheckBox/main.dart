import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: new Main(),);
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  String? checkListValue1;
  List<String?> checkListValue2 = [];

  List<String> checkList1 = [
    "One",
    "Two",
    "Three"
  ];

  List<String> checkList2 = [
    "111",
    "222",
    "333"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter - HowTo"),),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [

              Container(
                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("단일", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                    ),
                    Container(
                      child: Column(
                        children: this.checkList1.map<Widget>(
                          (String v) => Container(
                            margin: EdgeInsets.all(20.0),
                            child: CheckboxListTile(
                              onChanged: (bool? check) => setState(() => this.checkListValue1 = v),
                              title: Text(v),
                              value: this.checkListValue1 == v ? true : false,
                            ),
                          )
                        ).toList(),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("중복(2개 이상)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                    ),
                    Container(
                      child: Column(
                        children: this.checkList2.map<Widget>(
                          (String v) => Container(
                            margin: EdgeInsets.all(20.0),
                            child: CheckboxListTile(
                              onChanged: (bool? check){
                                setState((){
                                  if(this.checkListValue2.indexOf(v) > -1) {
                                    this.checkListValue2.remove(v);
                                    return;
                                  }
                                  this.checkListValue2.add(v);
                                });
                              },
                              title: Text(v),
                              value: this.checkListValue2.indexOf(v) > -1 ? true : false,
                            ),
                          )
                        ).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
