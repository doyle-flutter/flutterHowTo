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

class _MainState extends State<Main>{

  TextStyle _titleTxtSt = new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0);
  String img = "https://www.w3schools.com/howto/img_snow.jpg";
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter - How To")),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text("1. ImageModal(PageRoute)", style: this._titleTxtSt,)
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (BuildContext context, Animation<double> anim1, Animation<double> anim2) => Scaffold(
                          backgroundColor: Colors.black,
                          body: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: NetworkImage(img)
                                )
                              ),
                            ),
                          ),
                        )
                      )
                    ),
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(img)
                        )
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text("2. ImageModal(MaterialPageRoute)", style: this._titleTxtSt,)
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => Scaffold(
                          body: GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage(img)
                                  )
                                ),
                              ),
                            ),
                        )
                      )
                    ),
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(img)
                        )
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text("3. ImageModal(Stack Widget)", style: this._titleTxtSt,)
                  ),
                  GestureDetector(
                    onTap: () => this.setState(() => this.check = !this.check),
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(img)
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            !this.check ? Container() : Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () => this.setState(() => this.check = !this.check),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(img)
                    )
                  ),
                ),
              ),
            )

          ],
        ),
      )
    );
  }
}

