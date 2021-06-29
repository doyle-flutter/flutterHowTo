import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: new Main(),);
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter - How To")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              minWidth: 200.0,
              child: Text("Show - Dialog"),
              color: Colors.yellow,
              onPressed: () async => await showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text("ShowDialog"),
                  content: Text("Dialog Content"),
                  actions: [
                    TextButton(
                      child: Text("Close"),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    TextButton(
                      child: Text("OK"),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                )
              ),
            ),

            MaterialButton(
              color: Colors.cyanAccent,
              child: Text("Show - Bottom(Ma)"),
              minWidth: 200.0,
              onPressed: () async => showModalBottomSheet(
                context: context,
                builder: (BuildContext context) => BottomSheet(
                  enableDrag: false,
                  onClosing: (){},
                  builder: (BuildContext context) => Container(
                    color: Colors.blueAccent,
                    alignment: Alignment.center,
                    child: Text("Modal - BottomSheet"),
                  )
                )
              ),
            ),

            MaterialButton(
              minWidth: 200.0,
              color: Colors.pinkAccent,
              child: Text("Show - Bottom(Cu)"),
              onPressed: () async => showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) => CupertinoActionSheet(
                  title: Text("TITLE"),
                  message: Text("(Cu) Modal - Des"),
                  actions: [1,2,3].map<CupertinoActionSheetAction>((int i) => CupertinoActionSheetAction(
                    child: Text("Menu # $i"),
                    onPressed: (){},
                  )).toList(),
                  cancelButton: CupertinoActionSheetAction(
                    child: Text("Close"),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                )
              ),
            )

          ],
        ),
      )
    );
  }
}

