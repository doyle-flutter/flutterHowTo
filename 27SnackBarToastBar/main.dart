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

class _MainState extends State<Main> with SingleTickerProviderStateMixin{

  Animation<double>? _animation;
  AnimationController? _animationController;
  bool check = false;

  @override
  void initState() {
    this._animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 400))
      ..addListener(() {
        if(!this.mounted) return;
        setState(() {});
      });
    this._animation = new Tween<double>(begin: -100.0, end: 30.0).animate(this._animationController!);
    super.initState();
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
      body: this._animation == null && this._animationController == null
        ? Center(child: Text("load...."),)
        : IgnorePointer(
        ignoring: this.check,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 300.0,
                      color: Colors.red,
                      child: Text("Contents", style: TextStyle(color: Colors.white),),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 200.0,
                      color: Colors.white,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.red,
                        textColor: Colors.white,
                        child: Text("Show SnackBar & ToastBar"),
                        onPressed: this._play,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 500.0,
                      color: Colors.blue,
                      child: Text("Contents", style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: this._animation!.value,
              left: 20.0,
              right: 20.0,
              child: Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Text(
                  "SnackBar & Toast",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _play() async{
    this.check = !this.check;
    await this._animationController!.forward();
    await Future.delayed(Duration(seconds: 1));
    await this._animationController!.reverse();
    this.check = !this.check;
    return;
  }

}
