import 'dart:io';
import 'package:flutter/cupertino.dart';
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

  List<Map<String, dynamic>> _todoData = [
    {
      'title' : 'Example1',
      'check': false,
    },
    {
      'title' : 'Example2',
      'check': true,
    },
    {
      'title' : 'Example3',
      'check': false,
    },
  ];

  TextEditingController? _ct;

  @override
  void initState() {
    this._ct = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    this._ct?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Flutter - HowTo")),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Platform.isIOS
                  ? CupertinoTextField(
                      controller: this._ct,
                      placeholder: "Memo",
                      padding: EdgeInsets.all(20.0),
                    )
                  : TextField(
                      controller: this._ct,
                      decoration: InputDecoration(
                        hintText: "Memo"
                      ),
                    )
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[200],
                  child: ListView.builder(
                    itemCount: this._todoData.length,
                    itemBuilder: (BuildContext context, int index) => GestureDetector(
                      onTap: () => setState(() => this._todoData[index]['check'] = !this._todoData[index]['check']),
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: !this._todoData[index]['check'] ? Colors.white : null,
                          borderRadius: BorderRadius.circular(10.0),
                          border: !this._todoData[index]['check'] ? Border.all(color: Colors.black) : Border.all(color: Colors.grey)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              this._todoData[index]['title'].toString(),
                              style: TextStyle(decoration: !this._todoData[index]['check'] ? null : TextDecoration.lineThrough),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => setState(() => this._todoData.removeAt(index)),
                            )
                          ],
                        ),
                      ),
                    )
                  ),
                ),
              )
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: (){
          if(this._ct!.text.isEmpty) return;
          setState(() {
            this._todoData.add({'title':this._ct!.text, 'check': false});
          });
          this._ct!.clear();
        },
      ),
    );
  }
}
