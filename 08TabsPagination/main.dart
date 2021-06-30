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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter - How To")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            this._tabs(),
            this._pagination()
          ],
        ),
      )
    );
  }

  Widget _title(String txt) => Container(
    margin: EdgeInsets.all(20.0),
    alignment: Alignment.centerLeft,
    child: Text(txt,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
  );

  List<Map<String, String>> data = [
    {'title':'Title1', 'des':'DES....'},
    {'title':'Title2', 'des':'DESDES........'},
    {'title':'Title3', 'des':'DESDESDESDES........'},
    {'title':'Title4', 'des':'DESDESDESDESDESDESDESDES........'},
  ];

  int menuIndex = 0;

  Widget _menus() => Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black)
    ),
    child: Row(
      children: this.data.map<Widget>(
        (Map<String, String> e) => Expanded(
          child: Container(
            child: TextButton(
              child: Text(
                e['title'].toString(),
                style: TextStyle(
                  color: this.menuIndex == this.data.indexOf(e) ? Colors.blue : Colors.grey
                ),
              ),
              onPressed: () => setState(() {
                this.menuIndex = this.data.indexOf(e);
              }),
            ),
          )
        )
      ).toList(),
    ),
  );

  Widget _content() => Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(30.0),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      border: Border.all(color: Colors.black)
    ),
    child: Text(
      this.data[this.menuIndex]['des'].toString(),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),
    ),
  );

  Widget _tabs() => Container(
    margin: EdgeInsets.all(20.0),
    child: Column(
      children: [
        this._title("@ Tabs"),
        this._menus(),
        this._content(),
      ],
    ),
  );

  List<Map<String, String>> data2 = [
    {'title':'Title1', 'des':'DES....'},
    {'title':'Title2', 'des':'DESDES........'},
    {'title':'Title3', 'des':'DESDESDESDES........'},
    {'title':'Title4', 'des':'DESDESDESDESDESDESDESDES........'},

    {'title':'Title11', 'des':'DES....'},
    {'title':'Title22', 'des':'DESDES........'},
    {'title':'Title33', 'des':'DESDESDESDES........'},
    {'title':'Title44', 'des':'DESDESDESDESDESDESDESDES........'},

    {'title':'Title111', 'des':'DES....'},
    {'title':'Title222', 'des':'DESDES........'},
    {'title':'Title333', 'des':'DESDESDESDES........'},
    {'title':'Title444', 'des':'DESDESDESDESDESDESDESDES........'},

    {'title':'Title1111', 'des':'DES....'},
    {'title':'Title2222', 'des':'DESDES........'},
    {'title':'Title3333', 'des':'DESDESDESDES........'},
    {'title':'Title4444', 'des':'DESDESDESDESDESDESDESDES........'},

    {'title':'22Title1', 'des':'DES....'},
    {'title':'22Title2', 'des':'DESDES........'},
    {'title':'22Title3', 'des':'DESDESDESDES........'},
    {'title':'22Title4', 'des':'DESDESDESDESDESDESDESDES........'},

    {'title':'333Title1', 'des':'DESDESDESDES........'},
    {'title':'333Title2', 'des':'DESDESDESDESDESDESDESDES........'},
  ];

  int paginationIndex = 0;
  int paginationEa = 4;

  Widget _content2() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 250.0,
      child: Column(
        children: this.data2.getRange(
          this.paginationIndex == 0
            ? 0
            : this.paginationIndex*this.paginationEa,
          this.paginationIndex == 0
            ? this.paginationEa
            : (this.paginationIndex+1)*this.paginationEa > this.data2.length
              ? this.data2.length
              : (this.paginationIndex+1)*this.paginationEa
        ).map<Widget>(
          (Map<String,String> e) => Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(e['title'].toString()),
                ),
                Expanded(
                  child: Text(e['des'].toString()),
                ),
              ],
            ),
          )
        ).toList(),
      ),
    );
  }

  Widget _menu2() {
    List<int> li = List<int>.generate((this.data2.length%this.paginationEa) > 0 ? (this.data2.length~/this.paginationEa)+1 : this.data2.length~/this.paginationEa, (int i) => i);
    return Container(
      child: Row(
        children: li.map<Widget>(
          (int e) => Expanded(
              child: Container(
                child: TextButton(
                    child: Text(
                      (e+1).toString(),
                      style: TextStyle(
                        color: this.paginationIndex == e ? Colors.red : Colors.grey
                      ),
                    ) ,
                    onPressed: (){
                      setState(() {
                        this.paginationIndex = e;
                        return;
                      });
                    }
                ),
              )
          )
        ).toList(),
      ),
    );
  }

  Widget _pagination() => Container(
    margin: EdgeInsets.all(20.0),
    child: Column(
      children: [
        this._title("@ Pagination"),
        this._content2(),
        this._menu2()
      ],
    ),
  );

}
