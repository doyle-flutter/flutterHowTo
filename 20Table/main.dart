import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: new Main(),);
  }
}

class Main extends StatelessWidget {

  TextStyle _tableTitleTxtStyle = new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0);
  List<List<String>> _tableData = [
    ["Name","age"],
    ["홍길동","20세"],
    ["백두산","30세"],
    ["한라산","40세"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter - HowTo")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Table(
              border: TableBorder.symmetric(inside: BorderSide(color: Colors.black)),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        child: Text("이름",style: this._tableTitleTxtStyle,)
                      )
                    ),
                    TableCell(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        alignment: Alignment.center,
                        child: Text("나이",style: this._tableTitleTxtStyle,)
                      )
                    ),
                  ]
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        alignment: Alignment.center,
                        child: Text("홍길동")
                      )
                    ),
                    TableCell(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        alignment: Alignment.center,
                        child: Text("20세")
                      )
                    ),
                  ]
                )
              ],
            ),

            Table(
              border: TableBorder.symmetric(outside: BorderSide(color: Colors.black)),
              children: this._tableData.map<TableRow>(
                (List<String> tr) => TableRow( 
                  children: tr.map<TableCell>(
                    (String v) => TableCell(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        alignment: Alignment.center,
                        child: this._tableData.indexOf(tr) == 0
                          ? Text(v, style: this._tableTitleTxtStyle,)
                          : Text(v),
                      )
                    )
                  ).toList()
                )
              ).toList()
            )
          ],
        ),
      )
    );
  }
}
