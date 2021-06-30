import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: new Main(),);
  }
}

class Main extends StatefulWidget {
  Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  final List<String> imgs = [
    "https://cdn.pixabay.com/photo/2021/05/29/07/06/shiba-6292660__340.jpg",
    "https://cdn.pixabay.com/photo/2021/06/10/19/03/sea-6326812__340.jpg",
    "https://cdn.pixabay.com/photo/2021/06/17/05/14/city-6342765__340.jpg",
    "https://cdn.pixabay.com/photo/2021/06/06/09/04/bridge-6314795__340.jpg",
    "https://cdn.pixabay.com/photo/2020/06/02/06/34/home-studios-5249651__340.jpg",
    "https://cdn.pixabay.com/photo/2021/06/22/17/24/torres-del-paine-6356782__340.jpg",
    "https://cdn.pixabay.com/photo/2021/06/24/12/27/elephants-6361065__340.jpg"
  ];

  final List<int> gridCounts = [1,2,4];

  int gridCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutteer - HowTo"),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: this.gridCounts.map<Widget>(
                (int i) => Expanded(
                  child: TextButton(
                    child: Text(
                      i.toString(),
                      style: TextStyle(
                        color: this.gridCount == i ? Colors.red : Colors.grey[400],
                      ),
                    ),
                    onPressed: () => setState(() => this.gridCount = i),
                  ),
                )
              ).toList(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  children: this.imgs.map<Widget>(
                    (String e) => Container(
                      width: MediaQuery.of(context).size.width/gridCount,
                      height: MediaQuery.of(context).size.width/gridCount,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(e)
                        )
                      ),
                    )
                  ).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
