import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: new Main(),
  );
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  List<Map<String, dynamic>> treeDatas = [
    {
      'title':'title1',
      'datas':[
        {
          'title':'title11',
          'datas':[]
        },
      ]
    },
    {
      'title':'title2',
      'datas':[
        {
          'title':'title22',
          'datas':[
            {
              'title':'title222',
              'datas':[]
            },
          ]
        },
      ]
    },
    {
      'title':'title3',
      'datas':[
        {
          'title':'title33-1',
          'datas':[]
        },
        {
          'title':'title33-2',
          'datas':[]
        },
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter-HowTo"),),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(children: this._view(this.treeDatas),),
        ),
      ),
    );
  }


  List<Widget> _view(List<Map<String, dynamic>> datas) => datas.map<Widget>(
    (Map<String, dynamic> e) => Item(title: e['title'].toString(), datas: new List.of(e['datas']),)
  ).toList();
}

class Item extends StatefulWidget {
  final String title;
  final List datas;
  const Item({Key? key, required this.title, required this.datas}) : super(key: key);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {

  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red)
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => setState(() => this.check = !this.check),
            child: Container(
              color: widget.datas.isNotEmpty ? this.check ? Colors.red : Colors.white : null,
              padding: EdgeInsets.all(10.0),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: widget.datas.isNotEmpty ? this.check ? Colors.white : Colors.black : null,
                ),
              ),
            ),
          ),
          Container(
            child: widget.datas.isNotEmpty
              ? Container(
                child: this.check
                  ? Column(
                      children: widget.datas.map<Widget>(
                        (e) => new Item(title: e['title'].toString(), datas: new List.from(e['datas']),)
                      ).toList(),
                    )
                  : Container(),
              )
              : Container(),
          )
        ],
      ),
    );
  }
}

