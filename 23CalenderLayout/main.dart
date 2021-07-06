import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: new Main(),);
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter - HowTo"),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CalenderLayout()
          ],
        ),
      ),
    );
  }
}

class CalenderLayout extends StatelessWidget {
  const CalenderLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, size: 12.0,),
                  onPressed: (){},
                ),
                Text("00월"),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios, size: 12.0,),
                  onPressed: (){},
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <String>['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'].map<Widget>(
                (String s) => Expanded(
                  child: Container(
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: Text(s,style: TextStyle(color: Colors.white),),
                  ),
                )
              ).toList(),
            ),
          ),
          Container(
            child: Column(
              children: new List<int>.generate(5, (int i) => i).map<Widget>(
                (int e) => Row(
                  children: new List<int>.generate(7, (int v) => v).map<Widget>(
                    (int t) => Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: ((e)*7+(t+1)) > 31 ? Container() : Text(((e)*7+(t+1)).toString())
                      ),
                    )
                  ).toList(),
                )
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
