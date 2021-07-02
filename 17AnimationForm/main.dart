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

class _MainState extends State<Main> with TickerProviderStateMixin {

  Animation<double>? _anim;
  AnimationController? _animationController;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_)  => this._after(context));
    super.initState();
  }

  void _after(BuildContext context){
    this._animationController = new AnimationController(vsync: this, duration: Duration(seconds: 1))
      ..addListener(() {
        if(!this.mounted) return;
        setState(() {});
      });
    if(this._animationController == null) return;
    this._anim = new Tween<double>(begin: 140.0, end: MediaQuery.of(context).size.width).animate(this._animationController!);
    if(!this.mounted) return;
    setState(() {});
  }

  @override
  void dispose() {
    this._animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter - HowTo"),),
      body: this._isCheck(context),
    );
  }

  Widget _isCheck(BuildContext context) => this._animationController == null && this._anim == null
    ? this._load(context)
    : this._content(context);

  Widget _load(BuildContext context) => Center(
    child: Container(
      child: Text("Load..."),
    ),
  );

  Widget _platformTextField() => Platform.isAndroid
    ? TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: "Search",
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
        ),
      )
    : CupertinoTextField(
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
      );

  Widget _content(BuildContext context) => Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Container(
          width: this._anim!.value,
          margin: EdgeInsets.all(10.0),
          child: this._platformTextField()
        ),
        MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          minWidth: 100.0,
          child: Text("Animation"),
          onPressed: () async{
            if(this._animationController!.isAnimating) return;
            if(this._animationController!.isCompleted) return this._animationController!.reset();
            return await this._animationController!.forward();
          },
        ),
        MaterialButton(
          color: Colors.red,
          textColor: Colors.white,
          minWidth: 100.0,
          child: Text("Reset"),
          onPressed: (){
            if(this._animationController!.isAnimating) return;
            this._animationController!.reset();
          },
        ),
      ],
    ),
  );
}
