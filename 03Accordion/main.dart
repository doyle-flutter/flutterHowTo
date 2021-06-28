import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: new Main(),);
  }
}

class Main extends StatelessWidget {

  List<Map<String, String>> _datas = [
    {
      'title':'Section 1',
      'des':'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
    },
    {
      'title':'Section 2',
      'des':'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
    },
    {
      'title':'Section 3',
      'des':'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        children: this._datas.map<Widget>((Map<String, String> e) => Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Accordion(
            title: e['title'].toString(),
            des: e['des'].toString(),
            check: this._datas.indexOf(e) == 0 ? true : false
          ),
        )).toList(),
      )
    );
  }
}

// ignore: must_be_immutable
class Accordion extends StatefulWidget {
  final String title;
  final String des;
  bool check;
  Accordion({required this.title, required this.des, this.check = false});

  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  final TextStyle _titleStyle = new TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
              height: 50.0,
              color: this.widget.check ? Colors.grey : Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(this.widget.title,style: this._titleStyle,),
                  Icon(!this.widget.check ? Icons.add : Icons.minimize)
                ],
              ),
            ),
            onTap: (){
              setState(() {
                this.widget.check = !this.widget.check;
              });
            }
          ),
          this.widget.check
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(this.widget.des)
              )
            : Container(),
        ],
      ),
    );
  }
}

