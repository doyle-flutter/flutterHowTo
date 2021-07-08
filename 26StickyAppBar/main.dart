import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: new Main(),
  );
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  ScrollController? scrollController;

  @override
  void initState() {
    this.scrollController = new ScrollController()
      ..addListener(() {
        if(!this.mounted) return;
        print("offset : ${this.scrollController!.offset}");
        print("maxScrollExtent : ${this.scrollController!.position.maxScrollExtent}");
        if(this.scrollController!.offset > 250.0) {
          if(!this.check) {
            setState(() => this.check = true);
          }
        }
        else {
          if(this.check) {
            setState(() => this.check = false);
          }
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    this.scrollController?.dispose();
    super.dispose();
  }

  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: this.scrollController,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  this.check
                      ? Container(
                          height: kToolbarHeight+MediaQuery.of(context).padding.top,
                        )
                      : this._sticky(context),
                  Container(
                    height: 300.0,
                    color: Colors.white,
                    child: Center(
                      child: Text("AppBar - Sticky")
                    ),
                  ),
                  Container(
                    height: 300.0,
                    color: Colors.red,
                  ),
                  Container(
                    height: 300.0,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 300.0,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 300.0,
                    color: Colors.purple,
                  ),
                  Container(
                    height: 300.0,
                    color: Colors.white,
                  ),
                  Container(
                    height: 300.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          this.check
            ? Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: this._sticky(context),
            )
            : Container(),
        ],
      ),
    );
  }

  Widget _sticky(BuildContext context) => Container(
    color: Colors.white,
    child: AppBar(
      title: Text("Flutter-HowTo"),
    ),
    alignment: Alignment.center,
  );
}
