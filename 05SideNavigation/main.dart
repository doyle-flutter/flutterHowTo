import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: new Main(),);
  }
}

class Main extends StatefulWidget {

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with TickerProviderStateMixin {
  bool sideCheck1 = false;

  Animation<double>? anim;
  AnimationController? animationController;

  Animation<double>? anim3;
  AnimationController? animationController3;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_){
      this.buildAfter(context);
      this.buildAfter3(context);
      return;
    });
    super.initState();
  }

  void buildAfter(BuildContext context){
    this.animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    if(this.animationController == null) return;
    this.anim = new Tween<double>(begin: MediaQuery.of(context).size.width, end: 0).animate(this.animationController!);
    if(this.anim == null) return;
    anim!.addListener(() {
      if(!this.mounted) return;
      setState(() {});
    });
  }

  void buildAfter3(BuildContext context){
    this.animationController3 = new AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    if(this.animationController3 == null) return;
    this.anim3 = new Tween<double>(begin: MediaQuery.of(context).size.width, end: 0).animate(this.animationController3!);
    if(this.anim3 == null) return;
    anim3!.addListener(() {
      if(!this.mounted) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter - How To"),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    "Side Navigation BTN # 1",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: (){
                    setState(() {
                      this.sideCheck1 = !this.sideCheck1;
                    });
                  },
                ),
                TextButton(
                  child: Text(
                    "Side Navigation BTN # 2(Anim)",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: (){
                    if(this.anim == null && this.animationController == null) return;
                    if(this.animationController!.isCompleted) return;
                    this.animationController!.forward();
                  },
                ),
                TextButton(
                  child: Text(
                    "Side Navigation BTN # 3\n(Anim & Transform.translate)",
                    style: TextStyle(color: Colors.pink),
                  ),
                  onPressed: (){
                    if(this.anim3 == null && this.animationController3 == null) return;
                    if(this.animationController3!.isCompleted) return;
                    this.animationController3!.forward();
                  },
                ),
              ],
            ),
          ),
          this.sideCheck1
            ? Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              ListTile(title: Text("MENU #1"),),
                              ListTile(title: Text("MENU #2"),),
                              ListTile(title: Text("MENU #3"),),
                              ListTile(title: Text("MENU #4"),)
                            ],
                          ),
                        )
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => this.sideCheck1 = !this.sideCheck1),
                          child: Opacity(
                            opacity: 0.1,
                            child: Container(
                              color: Colors.grey[200],
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: this.anim?.value ?? MediaQuery.of(context).size.width,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.white,
                      child: (this.anim?.isCompleted ?? false)
                        ? Column(
                            children: [
                              ListTile(title: Text("MENU #1"),),
                              ListTile(title: Text("MENU #2"),),
                              ListTile(title: Text("MENU #3"),),
                              ListTile(title: Text("MENU #4"),)
                            ],
                          )
                        : Container(),
                    )
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        this.animationController?.reset();
                      },
                      child: Container(
                        color: Colors.transparent,
                      )
                    )
                  ),
                ],
              ),
            )
          ),
          Positioned(
            top: 0,
            bottom: 0,
            child: Transform.translate(
              offset: Offset(-(this.anim3?.value ?? MediaQuery.of(context).size.width),0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListTile(title: Text("MENU #1"),),
                            ListTile(title: Text("MENU #2"),),
                            ListTile(title: Text("MENU #3"),),
                            ListTile(title: Text("MENU #4"),)
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => this.animationController3!.reset(),
                        child: Opacity(
                          opacity: 0.1,
                          child: Container(
                            color: Colors.grey[100],
                          ),
                        ),
                      )
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}

