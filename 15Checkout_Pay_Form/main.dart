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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter - HowTo(Pay-Form)"),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 20.0),
            width: MediaQuery.of(context).size.width,
            child: this._payView(context),
          ),
        ),
      ),
    );
  }

  Widget _payView(BuildContext context) => Column(
    children: [
      Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.symmetric(horizontal: 40.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Cart",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.shopping_cart),
                        Text(
                          "3",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <String>[
                  'item 1',
                  'item 2',
                  'item 3',
                ].map<Widget>(
                    (String v) => Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            child: Text(v),
                            onPressed: (){},
                          ),
                          Text("\$10")
                        ],
                      ),
                    )
                ).toList(),
              ),
            ),
            Divider(color: Colors.black,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                    ),
                  ),
                  Text(
                    "\$ 30",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      Container(
        color: Colors.grey[200],
        margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Biling Address",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        labelText: "FullName",
                        hintText: "홍길동"
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        labelText: "E-Mail",
                        hintText: "example@naver.com"
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        labelText: "Address",
                        hintText: "서울시 백두구 한라동 111, 1호"
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top:20.0),
              child: Text(
                "Payment",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Accepted Card",
                      style: TextStyle(fontWeight: FontWeight.bold)
                    )
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      children: <String>[
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9xgC0lMLOKurgNoZhPt7ELxiv5LqHXxlw22BSzYidJXQHs77_ooe1aDwnFYoKX4nRHiM&usqp=CAU",
                        "http://www.businesskorea.co.kr/news/photo/201811/26647_37722_41.png"
                      ].map<Widget>(
                        (String url) => Container(
                          width: 50.0,
                          height: 25.0,
                          margin: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(url)
                            )
                          ),
                        )
                      ).toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        labelText: "Name on Card",
                        hintText: "홍길동"
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        labelText: "Credit card number",
                        hintText: "010-1234-5678"
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              labelText: "Month",
                              hintText: "12"
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text("/"),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              labelText: "Year",
                              hintText: "2021"
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                        labelText: "CVV",
                        hintText: "123"
                      ),
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 40.0),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          height: 80.0,
          color: Colors.blue,
          textColor: Colors.white,
          child: Text(
            "Continue to checkout",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
          ),
          onPressed: (){}
        ),
      )
    ],
  );
}
