import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: new Main(),);
  }
}

class Main extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LoginPage()
    );
  }
}

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TapGestureRecognizer? tap;
  bool check = true;

  @override
  void initState() {
    tap = new TapGestureRecognizer()
      ..onTap = () => print("CLICK");
    super.initState();
  }

  @override
  void dispose() {
    tap?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height-kToolbarHeight-MediaQuery.of(context).padding.top-60.0,
        padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: MediaQuery.of(context).size.width*0.30,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "UserName",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                ),
              )
            ),
            Container(
              child: TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.zero
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                ),
              )
            ),
            Container(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.zero
                  ),
                ),
              ),
            ),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Login"),
              onPressed: (){},
            ),
            Container(
              child: Row(
                children: [
                  Checkbox(
                    value: this.check,
                    onChanged: (bool? check){
                      setState(() {
                        this.check = check!;
                      });
                    },
                  ),
                  Text("Remember me")
                ],
              ),
            ),
            Divider(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    child: Text("Cancel"),
                    onPressed: (){},
                    color: Colors.red,
                    textColor: Colors.white,
                  ),
                  Container(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Forgot ",
                            style: TextStyle(color: Colors.black)
                          ),
                          TextSpan(
                            text: "password",
                            style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline
                            ),
                            recognizer: this.tap
                          ),
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
