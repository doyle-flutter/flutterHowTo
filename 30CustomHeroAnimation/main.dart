// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main(),
    );
  }
}

class Main extends StatefulWidget{

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter - How To"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(50),
                child: Text(
                  "Custom Hero Animation",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.all(50),
                child: new View(
                  width: 100.0,
                  height: 200.0,
                  img: "https://cdn.pixabay.com/photo/2021/06/22/16/04/beauty-6356536__480.jpg",
                ),
              ),
              Container(
                margin: EdgeInsets.all(50),
                child: new View(
                  width: 200.0,
                  height: 200.0,
                  img: "https://cdn.pixabay.com/photo/2020/09/25/16/50/portrait-5601950__480.jpg",
                ),
              ),
              Container(
                margin: EdgeInsets.all(50),
                child: new View(
                  width: 400.0,
                  height: 400.0,
                  img: "https://cdn.pixabay.com/photo/2020/12/23/17/24/cat-5855647__480.jpg",
                ),
              ),
            ]
          )
        ),
      )
    );
  }
}


class View extends StatelessWidget {
  double width;
  double height;
  String img;

  View({required this.width, required this.height, required this.img,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        NavigatorState navigator = Navigator.of(context);
        final RenderBox itemBox = context.findRenderObject()! as RenderBox;
        final Rect itemRect = itemBox.localToGlobal(Offset.zero, ancestor: navigator.context.findRenderObject()) & itemBox.size;
        navigator.push(
          PageRouteBuilder(
            barrierDismissible: false,
            opaque: false,
            pageBuilder: (BuildContext context, _, __){
              return Content(
                top: itemRect.top,
                bottom: itemRect.bottom,
                left: itemRect.left,
                right: itemRect.right,
                width: itemBox.size.width,
                height: this.height,
                img: this.img,
              );
            }
          )
        );
      },
      child: Container(
          width: this.width,
          height: this.height,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(this.img)
            )
          )
      ),
    );
  }
}

class Content extends StatefulWidget {
  double width;
  double top;
  double bottom;
  double left;
  double right;
  double height;
  String img;
  Content({required this.width, required this.top, required this.left, required this.height, required this.img, required this.bottom, required this.right});

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> with TickerProviderStateMixin{

  Animation<double>? _anim;
  AnimationController? _aCt;

  Animation<double>? _anim2;
  AnimationController? _aCt2;

  Animation<double>? _animWidth;
  AnimationController? _aCtWidth;

  Animation<double>? _animHeight;
  AnimationController? _aCtHeight;

  Duration _duration = new Duration(milliseconds: 600);

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) => _after(this.context));
    super.initState();
  }

  void _after(BuildContext context){
    _aCt = new AnimationController(vsync: this, duration: _duration)
      ..addListener(() {
        if(!this.mounted) return;
        setState(() {});
      });
    if(_aCt != null) _anim = new Tween<double>(begin: widget.top, end:0).animate(_aCt!);

    _aCt2 = new AnimationController(vsync: this, duration: _duration);
    if(_aCt2 != null) _anim2 = new Tween<double>(begin: this.widget.left, end: 0).animate(_aCt2!);

    _aCtWidth = new AnimationController(vsync: this, duration: _duration);
    if(_aCtWidth != null) _animWidth = new Tween<double>(begin: this.widget.width, end: MediaQuery.of(context).size.width).animate(_aCtWidth!);

    _aCtHeight = new AnimationController(vsync: this, duration: _duration);
    if(_aCtHeight != null) _animHeight = new Tween<double>(begin: this.widget.height, end: MediaQuery.of(context).size.height).animate(_aCtHeight!);

    _aCt!.forward();
    _aCt2!.forward();
    _aCtWidth!.forward();
    _aCtHeight!.forward();

  }

  @override
  void dispose() {
    this._aCt?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: this._anim?.value ?? widget.top,
          left: this._anim2?.value ?? widget.left,
          width: this._animWidth?.value ?? widget.width,
          height: this._animHeight?.value ?? widget.height,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  image: NetworkImage(this.widget.img),
                  fit: BoxFit.cover
                )
              )
            ),
          ),
        ),
      ],
    );
  }
}
