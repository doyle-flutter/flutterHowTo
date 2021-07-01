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
  bool check = false;

  @override
  void initState() {
    sc = new ScrollController()
      ..addListener(() {
        if(!this.mounted) return;
        if(!sc!.hasClients)  return;
        print("maxScrollExtent : ${sc!.position.maxScrollExtent}");
        print("offset: ${sc!.offset}");
        if(sc!.offset > (sc!.position.maxScrollExtent/2).floor()){
          setState(() {
            this.check = true;
          });
        }
        else{
          setState(() {
            this.check = false;
          });
        }
        return;
      });
    super.initState();
  }

  @override
  void dispose() {
    sc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter - HowTo"),),
      body: SafeArea(
        child: ((this.sc == null) && !this.sc!.hasClients)
        ? Center(child: Text("Load..."),)
        : SingleChildScrollView(
          controller: this.sc!,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Text("TOP"),
                Container(
                  height: 1000.0,
                  color: Colors.red
                ),
                Container(
                  height: 1000.0,
                  color: Colors.blue
                ),
                Container(
                  height: 1000.0,
                  color: Colors.yellow
                ),
                Text("Bottom")
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: this.check
        ? FloatingActionButton(
            child: Icon(Icons.arrow_drop_up),
            onPressed: (){
              sc!.animateTo(Offset.zero.dy, duration: Duration(milliseconds: 400), curve: Curves.linear);
            }
          )
        : null,
    );
  }
}

