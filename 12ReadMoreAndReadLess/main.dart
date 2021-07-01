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

  bool examCheck1 = false;
  bool examCheck2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              this._example1(),
              this._example2(),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _exampleTitleSt = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20.0
  );

  Widget _exampleTitle(String txt) => Container(
    margin: EdgeInsets.symmetric(vertical: 10.0),
    child: Text(txt, style: this._exampleTitleSt,),
  );

  Widget _example1() => Container(
    margin: EdgeInsets.all(20.0),
    child: Column(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              this._exampleTitle("ExampleTitle 01"),
              Container(
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus imperdiet, nulla et dictum interdum, nisi lorem egestas vitae scelerisque enim ligula venenatis dolor. Maecenas nisl est, ultrices nec congue eget, auctor vitae massa. Fusce luctus vestibulum augue ut aliquet. Nunc sagittis dictum nisi, sed ullamcorper ipsum dignissim ac. In at libero sed nunc venenatis imperdiet sed ornare turpis. Donec vitae dui eget tellus gravida venenatis. Integer fringilla congue eros non fermentum. Sed dapibus pulvinar nibh tempor porta.",
                  overflow: this.examCheck1 ? TextOverflow.visible : TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          child: Text(
            this.examCheck1 ? "Read less" : "Read More"
          ),
          onPressed: () => setState(() => this.examCheck1 = !this.examCheck1),
        )
      ],
    ),
  );
  
  Widget _example2() => Container(
    margin: EdgeInsets.all(20.0),
    child: Column(
      children: [
        Container(
          height: this.examCheck2 ? null : 200.0 ,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: this._exampleTitle("ExampleTitle 02")
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width*0.60,
                  decoration: BoxDecoration(color: Colors.red),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width*0.60,
                  decoration: BoxDecoration(color: Colors.yellow),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width*0.60,
                  decoration: BoxDecoration(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
        this.examCheck2
          ? Container()
          : Container(
              child: ElevatedButton(
                child: Text("More"),
                onPressed: () => setState(() => this.examCheck2 = !this.examCheck2),
              ),
            ),
      ],
    ),
  );
}
