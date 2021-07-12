import 'package:flutter/material.dart';
import 'dart:html' as Web;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/web",
      onGenerateRoute: (RouteSettings routeSettings) {
        if (routeSettings.name == '/web') return MaterialPageRoute(
          settings: RouteSettings(name: '/web'),
          builder: (BuildContext context) => new WebExample()
        );
        return MaterialPageRoute(
          settings: RouteSettings(name: '/'),
          builder: (BuildContext context) => new Main()
        );
      },
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_right_alt_rounded),
            onPressed: () => Navigator.of(context).pushNamed('/web'),
          ),
        ],
      ),
      body: Center(
        child: Text("James Dev - Flutter Web"),
      ),
    );
  }
}

class WebExample extends StatelessWidget {
  const WebExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Flutter-WEB"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: MediaQuery.of(context).size.width > 800
            ? this._wideSize(context)
            : this._smallSize(context),
        ),
      ),
    );
  }

  Widget _wideSize(BuildContext context){
    double size = MediaQuery.of(context).size.width;
    double wideWidthSize = size * 0.6;
    double smallWidthSize = size * 0.4;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: wideWidthSize,
              child: Column(
                children: [
                  this._title(context, widthSize: wideWidthSize),
                  this._des(context, widthSize: wideWidthSize),
                ],
              ),
            ),
            Container(
              width: smallWidthSize,
              child: Column(
                children: [
                  this._follow(context),
                  this._post(context),
                  this._about(context, widthSize: smallWidthSize),
                ],
              ),
            ),
          ],
        ),
        this._footer(context),
      ],
    );
  }

  Widget _smallSize(BuildContext context) => Column(
    children: [
      this._title(context),
      this._des(context),
      this._about(context),
      this._post(context),
      this._follow(context),
      this._footer(context),
    ],
  );

  Widget _title(BuildContext context, {double? widthSize}) => Container(
    padding: EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "TITLE HEADING",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "Title description",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          width: widthSize == null ? MediaQuery.of(context).size.width : widthSize,
          height: widthSize == null ? MediaQuery.of(context).size.width : widthSize,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://cdn.pixabay.com/photo/2021/07/05/11/05/pink-beach-6388864__480.jpg"),
              fit: BoxFit.cover
            )
          ),
        )
      ],
    ),
  );

  Widget _des(BuildContext context, {double? widthSize}) => Container(
    padding: EdgeInsets.all(10.0),
    color: Colors.grey[100],
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "DesDes",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "description...",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          width: widthSize == null ? MediaQuery.of(context).size.width : widthSize,
          height: widthSize == null ? MediaQuery.of(context).size.width : widthSize,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://cdn.pixabay.com/photo/2020/01/18/10/31/flower-4774929__480.jpg"),
              fit: BoxFit.cover
            )
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Text("description description description description description description description description description description description description description description description description description description description description description...",),
        )
      ],
    ),
  );

  Widget _about(BuildContext context, {double? widthSize}) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(10.0),
    child: Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "About Me",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        Container(
          width: widthSize == null ? MediaQuery.of(context).size.width : widthSize,
          height: widthSize == null ? MediaQuery.of(context).size.width*0.30 : widthSize*0.50,
          margin: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://cdn.pixabay.com/photo/2019/07/30/18/26/surface-4373559__480.jpg"),
              fit: BoxFit.cover
            )
          ),
        ),
      ],
    ),
  );

  Widget _post(BuildContext context) => Container(
    padding: EdgeInsets.only(top:10.0, bottom: 20.0),
    width: double.infinity,
    height: 200.0,
    color: Colors.grey[100],
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Post",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(10.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0
            ),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) => Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Text(
                index.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          )
        )
      ],
    ),
  );

  Widget _follow(BuildContext context) {

    List<String> datas = [
      "https://mcea.co.kr/wp-content/uploads/2020/10/YouTube-Logo.png",
      "data:image/png;base64,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",
      "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAmVBMVEX///8AvxgAvQDY9eJP2ISN4KIAvgQAwSPb+u7N9Nyq784AwR259NuW3JkAvhH8//9W0nIAwyslyUrz/vrB8tay5rhq25CG35276sLN9+VZ1X0AxDXr+/NHzmN725TB7s2B4qUgxj+h57Y0ylOx68Wq5LJ757KG5rK99d/i+e6n6b1m1oFr2YzJ89uY5bAzzV43xkNQ1Xlg0nJ9EnlhAAADxUlEQVR4nO3da1faQBCH8d1BA166GLFC5WaqvaACrd//w5WcQ6lo2GQWLTNz/s/7LPwOgTUx2TiHEEIIIYQQQgghhBBCqHHdq8/XR+LqD768k+/kJiOhDfujd/CNiYIXWiCa9PbzdftEh2bEo3y6F3As3OfLz/F2D2AhH7iKrpOFFyqAK+LXROCxEqAPWSsJ2MrE/oa+LrtLEmrZR8voPgHYUQT0oUgQTjQJPc35wlzNt7CMJmygqp10tZvyf2umyoRD9t/g35QJfYcrVDPdr+NP+hBKC0II5QchhPKDEEL5QQih/CCEUH4QQig/CCGUH4QQyg9CCOUH4X7CEL+CMLZp+pb/Uxja56eRbiMj0ffYlj8YxI8V5vGhIhfm0M/YhidihO34ULP2zss66NyE0D3sHMuKcPd+akbY27WfmhG6+x2j2RG6x+rhDAl7w8r91JDQXVWOZ0nonqoGNCXsFhX7qSmhm1fce2NLWHXVsTFhxX5qTFhx3bE14dtBzQnd8tWo9oStsP1VtCd0i+1hDQpf7acWhaOt+8UsCrdPaZgUbp3SsCkcvTilYVP48pSGUaG72YxtVdjb3PlnVfjvxjizws2pN7vCv4eKdoVuTtaF61NvloXuMrMunJd/gpsWuj5ZF7oisy7sUDAuXL2GdaFb2hBGFuOa2RB+irz24tSEMLYoR3Q1CzVCOua+uDphyvI4uoRh2DUu9PRoXZi2FpcqYThLWYZTk9DT0rrQp0wZuoSe+GsbKhOGgr1arDKhpyfrQk/c9XDVCQMx91N1Qk9j60JPC+tC5nK4CoU+KzhHGRqFvClDpZB1lKFTGPLmRxk6hZ4urAsZK6hrFQaaGRf67LLhlKFW2Hhpar1CT1fWhSFvdJShWNhwytAsbDZlqBYG32DKUC30dFc/ZegWeupbF3o6sS4Mw7opQ7uw/n9u6oWeHqwL66YMOcL46i27hXXPaRIj9P4sVvR9Rbc8YzzM54OFIVb6lpynFWElLAjlByGE8oMQQvlBCKH8IIRQfhBCKD8IIZQfhBDKD0II5QchhPLjCxfmhQNdwpB3uMLqNdTFFn5xga6bcf4De/DoN1sYezqMwGjAF041CUNg36C6qvp5DTLj359atuu5IgILWcrt/s6N1RCZ9zVu6nCu2Dlk9JwGLK+6UkGky5SfmTUxyw799uujprfgVBML6d/FQM/pn2BZ74kk76qB2jXXqDao9ZitkBJbva/8eL8PcN1ocHRXtKWVF8tJs9unmtXrSGu2z+8LQgghhBBCCCGEEEIIvekPP5Cn33NBThsAAAAASUVORK5CYII=",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEyxSpvEQwN94VpRx-RxjvD0ZRma8OKK12gsZBQYAR4MDtL6h-Lo7n0N1Vq3AcvMzGFz0&usqp=CAU"
    ];

    return Container(
      width: double.infinity,
      height: 200.0,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Follow Me",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20.0),
              child: GridView.builder(
                itemCount: datas.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 30.0,
                  crossAxisSpacing: 30.0
                ),
                itemBuilder: (BuildContext context, int index) => InkWell(
                  onTap: () => Web.window.alert(index.toString()),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(datas[index].toString(),),
                        fit: BoxFit.contain
                      )
                    ),
                  ),
                )
              )
            ),
          )
        ],
      ),
    );
  }

  Widget _footer(BuildContext context){
    TextStyle _boldTxt = new TextStyle(fontWeight: FontWeight.bold);
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      color: Colors.grey[200],
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <String>["LOGO","이용안내","개인정보처리방침","이용약관"].map(
                (String e) => InkWell(
                  onTap: () => Web.window.alert(e),
                  child: Container(
                    child: Text(e, style: _boldTxt,),
                  ),
                ),
              ).toList(),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text("JamesDev"),
                  ),
                  Container(
                    child: Text("James"),
                  ),
                  Container(
                    child: Text("Address. "),
                  ),
                ],
              )
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text("PERMIT NUMBER. 00-0000"),
                  ),
                  Container(
                    child: Text("E-Mail. abc@email.com"),
                  ),
                  Container(
                    child: Text("Tel. 010-0000-0000"),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}
