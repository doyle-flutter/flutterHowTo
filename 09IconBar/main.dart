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

class _MainState extends State<Main> {

  int currentIndex = 0;

  List<IconData> horizontalIcons = [
    Icons.home,
    Icons.search,
    Icons.message,
    Icons.person
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter - HowTo"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            this._title("Vertical-Example"),
            Expanded(
              child: new IconBar(
                currentIndex: this.currentIndex,
                axis: Axis.vertical,
                icons: [
                  IconButton(
                    icon: Icon(Icons.home, color: Colors.white,),
                    onPressed: (){
                      setState(() {
                        this.currentIndex = 0;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.white,),
                    onPressed: (){
                      setState(() {
                        this.currentIndex = 1;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.message, color: Colors.white,),
                    onPressed: (){
                      setState(() {
                        this.currentIndex = 2;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.person, color: Colors.white,),
                    onPressed: (){
                      setState(() {
                        this.currentIndex = 3;
                      });
                    },
                  ),
                ],
              ),
            ),
            this._title("Horizontal-Example"),
            Expanded(
              child: new IconBar(
                currentIndex: this.currentIndex,
                axis: Axis.horizontal,
                icons: this.horizontalIcons.map<IconButton>(
                  (IconData icons) => IconButton(
                    icon: Icon(
                      icons,
                      color: Colors.white,
                    ),
                    onPressed: () => setState(() => this.currentIndex = this.horizontalIcons.indexOf(icons)),
                  )
                ).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _title(String data) => Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.all(30.0),
    child: Text(
      data,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),
    )
  );
}

// ignore: must_be_immutable
class IconBar extends StatelessWidget {
  final Axis axis;
  final List<IconButton> icons;
  int currentIndex;
  Color selectColor;
  Color unselectColor;
  IconBar({Key? key, required this.axis, required this.icons, this.currentIndex = 0, this.selectColor = Colors.green, this.unselectColor = Colors.grey }) : super(key: key);

  @override
  Widget build(BuildContext context) => this.axis == Axis.horizontal ? this._horizontal() : this._vertical();

  Widget _horizontal() => Container(
    child: Row(
      children: this.icons.map<Widget>(
        (IconButton iconBtn) => Expanded(
          child: Container(
            color: (this.currentIndex == this.icons.indexOf(iconBtn) ? this.selectColor : this.unselectColor),
            child: iconBtn
          )
        )
      ).toList(),
    ),
  );

  Widget _vertical() => Container(
    child: Column(
      children: this.icons.map<Widget>(
        (IconButton iconBtn) => Expanded(
          child: Container(
            color: (this.currentIndex == this.icons.indexOf(iconBtn) ? this.selectColor : this.unselectColor),
            child: iconBtn
          )
        )
      ).toList(),
    ),
  );
}

