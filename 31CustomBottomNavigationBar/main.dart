import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Exam1(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Exam1 extends StatefulWidget{
  @override
  _Exam1State createState() => _Exam1State();
}

class _Exam1State extends State<Exam1> {

  int exam1Index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My BottomNavigationBar"),
        actions: [
          IconButton(
            icon: Icon(Icons.navigate_next_rounded),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => Exam2())
            ),
          )
        ]
      ),
      body: Center(child: Text("Example1 - Function")),
      /// (1)
      bottomNavigationBar: this.btmFunction(
        index: exam1Index,
        items: [
          this.btmFunctionItem(
            icon: Icons.home,
            title: "home"
          ),
          this.btmFunctionItem(
            icon: Icons.person,
            title: "person"
          ),
        ],
        onTap: (int i) => setState(() => exam1Index = i),
      )
    );
  }

  Map<String, dynamic> btmFunctionItem({
    required IconData icon,
    required String title,
  }) => {"icon": icon, "title": title};

  Widget btmFunction({
    required List<Map<String, dynamic>> items,
    int index = 0,
    required void Function(int) onTap,
  }){
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 1.0))
          ),
          child: Opacity(
            opacity: 0.1,
            child: Container(
              height: 60.0,
              margin: EdgeInsets.only(bottom: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
              )
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top:0,
          bottom: 20.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: items.map<Widget>(
              (Map<String, dynamic> i) => InkWell(
                hoverColor: Colors.grey[100],
                borderRadius: BorderRadius.circular(34.0),
                onTap: () => onTap(items.indexOf(i)),
                child: CircleAvatar(
                  radius: 34.0,
                  backgroundColor: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(i['icon'], color: items.indexOf(i) == index ? Colors.red : Colors.grey),
                      Text(i['title'], style: TextStyle(color: items.indexOf(i) == index ? Colors.red : Colors.grey))
                    ]
                  )
                )
              ),
            ).toList()
          )
        ),
      ],
    );
  }
}


/// (2)
class BtmClassItem {
  final IconData icon;
  final String title;
  const BtmClassItem({required this.icon, required this.title});
}

class BtmClass extends StatelessWidget{
  final List<BtmClassItem> items;
  final void Function(int) onTap;
  int index = 0;
  BtmClass({
    required this.items,
    required this.onTap,
    this.index = 0
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 1.0))
          ),
          child: Opacity(
            opacity: 0.1,
            child: Container(
              height: 60.0,
              margin: EdgeInsets.only(bottom: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
              )
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top:0,
          bottom: 20.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: items.map<Widget>(
              (BtmClassItem i) => InkWell(
                hoverColor: Colors.grey[100],
                borderRadius: BorderRadius.circular(34.0),
                onTap: () => onTap(items.indexOf(i)),
                child: CircleAvatar(
                  radius: 34.0,
                  backgroundColor: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(i.icon, color: items.indexOf(i) == index ? Colors.blue : Colors.grey),
                      Text(i.title, style: TextStyle(color: items.indexOf(i) == index ? Colors.blue : Colors.grey))
                    ]
                  )
                )
              ),
            ).toList()
          )
        ),
      ],
    );
  }
}

class Exam2 extends StatefulWidget{
  @override
  _Exam2State createState() => _Exam2State();
}

class _Exam2State extends State<Exam2> {
  int exam2Index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Example2 - Class")),
      bottomNavigationBar: BtmClass(
        index: this.exam2Index,
        items: [
          BtmClassItem(
            icon: Icons.home,
            title: "home2"
          ),
          BtmClassItem(
            icon: Icons.person,
            title: "person2"
          ),
        ],
        onTap: (int i) => setState(() => exam2Index = i),
      )
    );
  }
}
