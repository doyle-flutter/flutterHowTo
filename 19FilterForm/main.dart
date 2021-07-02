import 'dart:io';

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
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  List<String> datas = [
    "Adele",
    "Agnes",
    "Billy",
    "Bob",
    "Calvin",
    "Christina",
    "Cindy"
  ];

  TextEditingController? _textEditingController;
  List<String> _searchResult = [];

  @override
  void initState() {
    this._textEditingController = new TextEditingController()
      ..addListener(this._search);
    super.initState();
  }

  @override
  void dispose() {
    this._textEditingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter - HowTo"),),
      body: this._loading(context),
    );
  }

  Widget _loading(BuildContext context) => this._textEditingController == null
    ? Container(child: Center(child: Text("loading..."),),)
    : _view(context);

  Widget _view(BuildContext context) => Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        this._platformTextField(),
        this._filterAndSearchView(context)
      ],
    ),
  );

  void _search(){
    String _value = this._textEditingController!.text.toUpperCase();
    if(_value.isEmpty) return this.setState(() => this._searchResult = this.datas);
    List<String> _values = this.datas.where((String element) => element.toUpperCase().indexOf(_value) > -1).toList();
    if(!this.mounted) return;
    this.setState(() => this._searchResult = _values);
    return;
  }

  Widget _platformTextField() => Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.all(20.0),
    child: Platform.isAndroid
      ? TextField(
          controller: this._textEditingController!,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Search",
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
          ),
        )
      : CupertinoTextField(
          controller: this._textEditingController!,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0)
          ),
          placeholder: "Search",
          clearButtonMode: OverlayVisibilityMode.always,
          prefix: Container(
            child: Icon(Icons.search),
            padding: EdgeInsets.only(left: 10.0),
          ),
          padding: EdgeInsets.all(14.0),
        ),
  );

  Widget _filterAndSearchView(BuildContext context) => Expanded(
    child: Container(
      child: this._textEditingController!.text.isEmpty
        ? ListView.builder(
            itemCount: this.datas.length,
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: (){},
              child: Container(
                height: 60.0,
                padding: EdgeInsets.only(left: 20.0),
                alignment: Alignment.centerLeft,
                child: Text(this.datas[index]),
              ),
            ),
          )
        : ListView.builder(
            itemCount: this._searchResult.isEmpty ? 1 : this._searchResult.length,
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: this._searchResult.isEmpty ? null : (){},
              child: Container(
                height: 60.0,
                padding: EdgeInsets.only(left: 20.0),
                alignment: Alignment.centerLeft,
                child: this._searchResult.isEmpty
                  ? Container(child: Text("NULL"),)
                  : Text(this._searchResult[index]),
              ),
            ),
          ),
    ),
  );
}
