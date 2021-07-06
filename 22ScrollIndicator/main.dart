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

  ScrollController? sc;
  double? _vWidth;

  @override
  void initState() {
    sc = new ScrollController()
    ..addListener(() {
      if(!this.mounted) return;
      _vWidth = double.parse((sc!.offset/sc!.position.maxScrollExtent).abs().toStringAsFixed(2));
      this.setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    this.sc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter - HowTo"),),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: this.sc,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <String>[
                    "Example1",
                    "Example2",
                    "Example3",
                    "Example4",
                    "Example11",
                    "Example22",
                    "Example33",
                    "Example44",
                    "Example111",
                    "Example222",
                    "Example333",
                    "Example444",
                  ].map<Widget>(
                    (String e) => Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300.0,
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      alignment: Alignment.center,
                      child: Text(e),
                    )
                  ).toList(),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              height: 20,
              child: Container(
                width: (_vWidth ?? 0)*MediaQuery.of(context).size.width,
                color: Colors.red,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              height: 20,
              child: Container(
                child: Text("Scroll Indicator",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
