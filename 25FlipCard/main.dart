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

class _MainState extends State<Main> with TickerProviderStateMixin{

  Animation? _hAnim;
  AnimationController? _hCt;

  @override
  void initState() {
    this._hCt = new AnimationController(vsync: this, duration: Duration(milliseconds: 600))
      ..addListener(() {
        if(!this.mounted) return;
        this.setState(() {});
      });
    this._hAnim = new Tween<double>(begin: 0, end: 3 ).animate(this._hCt!);
    super.initState();
  }

  @override
  void dispose() {
    this._hCt?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter - HowTo"),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async{
                if(this._hCt!.isCompleted) return await this._hCt!.reverse();
                this._hCt!.forward();
              },
              child: Transform(
                transform: Matrix4(
                  1,0,0,0,
                  0,1,0,0,
                  0,0,1,0,
                  0,0,0,1,
                )..rotateY(this._hAnim!.value),
                alignment: FractionalOffset.center,
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: this._hAnim!.value < 1.5
                    ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 50.0,
                            backgroundColor: Colors.blue,
                            backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/56661529?v=4"),
                          ),
                          Text("James Dev", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),)
                        ],
                      )
                    : Transform(
                        alignment: FractionalOffset.center,
                        transform: Matrix4(
                          1,0,0,0,
                          0,1,0,0,
                          0,0,1,0,
                          0,0,0,1,
                        )..rotateY(-this._hAnim!.value),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("JamesDev", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            Text("Dart & Flutter", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            Text("JS & RN / NodeJS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
