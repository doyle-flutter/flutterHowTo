import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: new Main(),);
  }
}

class Main extends StatelessWidget {

  TextStyle _titleTxtSt = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold
  );

  TextStyle _subTitleTxtSt = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold
  );

  TextStyle _contentTitleTxtSt = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold
  );

  List<Map<String, String>> contents = [
    {
      'img' : 'https://www.w3schools.com/w3images/mountains.jpg',
      'title' : 'My Work',
      'des' : 'Lorem ipsum dolor sit amet, tempor prodesset eos no. Temporibus necessitatibus sea ei, at tantas oporteat nam. Lorem ipsum dolor sit amet, tempor prodesset eos no.'
    },
    {
      'img':'https://www.w3schools.com/w3images/lights.jpg',
      'title' : 'My Work',
      'des' : 'Lorem ipsum dolor sit amet, tempor prodesset eos no. Temporibus necessitatibus sea ei, at tantas oporteat nam. Lorem ipsum dolor sit amet, tempor prodesset eos no.'
    },
    {
      'img':'https://www.w3schools.com/w3images/nature.jpg',
      'title' : 'My Work',
      'des' : 'Lorem ipsum dolor sit amet, tempor prodesset eos no. Temporibus necessitatibus sea ei, at tantas oporteat nam. Lorem ipsum dolor sit amet, tempor prodesset eos no.'
    },
    {
      'img':'https://www.w3schools.com/w3images/mountains.jpg',
      'title' : 'My Work',
      'des' : 'Lorem ipsum dolor sit amet, tempor prodesset eos no. Temporibus necessitatibus sea ei, at tantas oporteat nam. Lorem ipsum dolor sit amet, tempor prodesset eos no.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter - HowTo"),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    left: 5,
                    top: 20.0,
                    bottom: 20.0
                  ),
                  child: Text(
                    "MYLOGO.com",
                    style: this._titleTxtSt,
                  )
                ),
                Divider(height: 2.0, color: Colors.black,),
                Container(
                  padding: EdgeInsets.only(
                    left: 10.0,
                    top: 20.0,
                    bottom: 10.0
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text("PORTFOLIO",style: this._subTitleTxtSt,)
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10.0,
                    bottom: 10.0
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text("Resize the browser window to see the responsive effect.")
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: this.contents.map<Widget>(
                      (Map<String, String> e) => Container(
                        width: MediaQuery.of(context).size.width > 760
                          ? MediaQuery.of(context).size.width *0.20
                          : MediaQuery.of(context).size.width *0.40,
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width > 760
                                ? MediaQuery.of(context).size.width *0.20
                                : MediaQuery.of(context).size.width *0.40,
                              height: MediaQuery.of(context).size.width > 760
                                ? (MediaQuery.of(context).size.width *0.20)*0.60
                                : (MediaQuery.of(context).size.width *0.40)*0.60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(e['img'].toString())
                                )
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.symmetric(vertical: 10.0),
                                    child: Text(
                                      e['title'].toString(),
                                      style: this._contentTitleTxtSt,
                                    ),
                                  ),
                                  Container(
                                    child: Text(e['des'].toString()),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ).toList(),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(20.0),
                  child: MediaQuery.of(context).size.width > 760
                    ? Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: this._viewSize(context),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://www.w3schools.com/w3images/p3.jpg")
                              )
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 10.0
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 20.0),
                                  child: Text("Some Other Work", style: this._contentTitleTxtSt,)
                                ),
                                Container(
                                  child: Text(
                                    '''Lorem ipsum dolor sit amet, tempor prodesset eos no. Temporibus necessitatibus sea ei, at tantas oporteat nam. Lorem ipsum dolor sit amet, tempor prodesset eos no.
                                    \nLorem ipsum dolor sit amet, tempor prodesset eos no. Temporibus necessitatibus sea ei, at tantas oporteat nam. Lorem ipsum dolor sit amet, tempor prodesset eos no.
                                    '''
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                    )
                  : Column(
                      children: [
                        Container(
                          width: this._viewSize(context),
                          height: this._viewSize(context),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("https://www.w3schools.com/w3images/p3.jpg")
                            )
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 10.0
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 20.0),
                                child: Text("Some Other Work", style: this._contentTitleTxtSt,)
                              ),
                              Container(
                                child: Text(
                                  '''Lorem ipsum dolor sit amet, tempor prodesset eos no. Temporibus necessitatibus sea ei, at tantas oporteat nam. Lorem ipsum dolor sit amet, tempor prodesset eos no.
                                  \nLorem ipsum dolor sit amet, tempor prodesset eos no. Temporibus necessitatibus sea ei, at tantas oporteat nam. Lorem ipsum dolor sit amet, tempor prodesset eos no.
                                  '''
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _viewSize(BuildContext context) => MediaQuery.of(context).size.width > 760
    ? MediaQuery.of(context).size.width *0.50
    : MediaQuery.of(context).size.width;
}
