import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: new Main(),);
  }
}

class Main extends StatelessWidget {

  TextStyle _txtField = new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0);

  Set<String> _dropItems = {
    "서울",
    "인천",
    "경기",
    "대전",
    "대구",
    "울산",
    "부산",
    "광주",
    "세종",
    "제주",
    "강원",
    "충북",
    "충남",
    "전북",
    "전남",
    "전북",
    "경북",
    "경남",
    "서울"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter - HowTo"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Text("First Name",style: this._txtField,)
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Your name",
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Text("Last Name",style: this._txtField,)
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Your last name",
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Text("Country",style: this._txtField,)
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: DropdownButton<String>(
                        onTap: (){},
                        onChanged: (String? s){},
                        underline: Container(
                          height: 1.0,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xFFBDBDBD),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        isExpanded: true,
                        value: this._dropItems.toList()[0],
                        items: _dropItems.toList().map<DropdownMenuItem<String>>(
                          (String s) => DropdownMenuItem<String>(
                            child: Text(s),
                            value: s,
                          )
                        ).toList(),
                      ),
                    ),
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Text("Subject",style: this._txtField,)
                    ),
                    TextField(
                      minLines: 10,
                      maxLines: 100,
                      decoration: InputDecoration(
                        hintText: "Write something...",
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                      ),
                    ),
                  ],
                )
              ),
              ElevatedButton(
                child: Text("Submit"),
                onPressed: (){},
              )
            ],
          ),
        ),
      )
    );
  }
}
