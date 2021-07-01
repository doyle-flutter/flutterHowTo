import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: new Main(),);
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter - HowTo"),
        toolbarHeight: 100.0,
        actions: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () async => await this._showPopup(context),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    maxRadius: 12.0,
                    backgroundColor: Colors.red,
                    child: Text(
                      "11",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                )
              ]
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () async => await this._showPopup(context),
                    child: Container(
                      color: Colors.yellowAccent,
                      padding: EdgeInsets.all(20.0),
                      child: Container(
                        color: Colors.grey,
                        padding: EdgeInsets.all(20.0),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      alignment: Alignment.center,
                      child: Text(
                        "1",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future _showPopup(BuildContext context) async => await showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text("Notification"),
    )
  );

}
