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

  String txt = "안녕하세요, 제임쓰Dev입니다.";
  String viewTxt = '';
  int i = 0;

  Future<void> anim() async => await Future.delayed(Duration(milliseconds: 300), () async{
    if(i == this.txt.length) return;
    setState(() {
      this.viewTxt += txt[i];
      i+=1;
    });
    return await this.anim();
  });

  void after(BuildContext context) => Future.delayed(Duration(seconds: 3), anim);

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) => this.after(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter - HowTo"),),
      body: Center(
        child: Text(
          viewTxt.isEmpty ? "Typing Effect" : this.viewTxt,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0
          ),
        ),
      ),
    );
  }
}
