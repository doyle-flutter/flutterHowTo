import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Main(),
    );
  }
}

class Main extends StatelessWidget{

  final List<String> imgs = [
    "https://cdn.pixabay.com/photo/2020/10/14/19/49/santorini-5655299__480.jpg",
    "https://cdn.pixabay.com/photo/2021/06/21/11/30/grass-6353411__480.jpg",
    "https://cdn.pixabay.com/photo/2020/07/03/20/39/couple-5367555__480.jpg",
    "https://cdn.pixabay.com/photo/2020/10/14/19/49/santorini-5655299__480.jpg",
    "https://cdn.pixabay.com/photo/2021/06/21/11/30/grass-6353411__480.jpg",
    "https://cdn.pixabay.com/photo/2020/07/03/20/39/couple-5367555__480.jpg",
    "https://cdn.pixabay.com/photo/2020/10/14/19/49/santorini-5655299__480.jpg",
    "https://cdn.pixabay.com/photo/2021/06/21/11/30/grass-6353411__480.jpg",
    "https://cdn.pixabay.com/photo/2020/07/03/20/39/couple-5367555__480.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter-HowTo")),
      body: SlideShow(imgUrls: this.imgs)
    );
  }

}

class SlideShow extends StatefulWidget {
  final List<String> imgUrls;
  final double? width;
  final double? height;
  final double? leftBtnTop;
  final double? rightBtnTop;
  const SlideShow({
    required this.imgUrls,
    this.width,
    this.height,
    this.leftBtnTop,
    this.rightBtnTop
  });

  @override
  _SlideShowState createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {

  int imgIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    this._pageController = new PageController()
      ..addListener(() {
        if(!this.mounted) return;
        this.setState(() {});
        return;
      });
    super.initState();
  }

  @override
  void dispose() {
    this._pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    double wrapperHeight = this.widget.height ?? MediaQuery.of(context).size.height*0.50;
    return Stack(
        children: [
          Container(
            width: this.widget.width ?? MediaQuery.of(context).size.width,
            height: wrapperHeight,
            child: PageView.builder(
              controller: this._pageController,
              onPageChanged: _onPageChanged,
              itemCount: this.widget.imgUrls.length,
              itemBuilder: (BuildContext context, int index)
                => this._items(
                  imgUrls: this.widget.imgUrls,
                  index: index,
                )
            ),
          ),
          this.imgIndex == 0 ? Container() : this._leftBtn(leftBtnTop: this._btnTopSize(this.widget.leftBtnTop, wrapperHeight), controller: _pageController, imgIndex: this.imgIndex),
          this.imgIndex == this.widget.imgUrls.length-1 ? Container() : this._rightBtn(rightBtnTop: this._btnTopSize(this.widget.rightBtnTop, wrapperHeight), controller: _pageController, imgIndex: this.imgIndex),
        ]
    );
  }

  void _onPageChanged(int index) => this.setState(() {
    this.imgIndex = index;
  });

  double _btnTopSize(double? top, double wrapperHeight) => top == null ? ((wrapperHeight*0.50)-12.0) : top;

  Widget _leftBtn({required double leftBtnTop, required PageController? controller, required int imgIndex}) => Positioned(
    top: leftBtnTop,
    left: 20.0,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0)
      ),
      child: IconButton(
        icon: Icon(Icons.keyboard_arrow_left),
        onPressed: (){
          if(controller == null) return;
          imgIndex-=1;
          controller.jumpToPage(imgIndex);
        },
      ),
    )
  );

  Widget _rightBtn({required double rightBtnTop, required PageController? controller, required int imgIndex}) => Positioned(
    top: rightBtnTop,
    right: 20.0,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0)
      ),
      child: IconButton(
        icon: Icon(Icons.keyboard_arrow_right),
        onPressed: (){
          if(controller == null) return;
          imgIndex+=1;
          controller.jumpToPage(imgIndex);
        },
      )
    )
  );

  Widget _items({required List<String> imgUrls, required int index}) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(imgUrls[index]),
        fit: BoxFit.cover
      )
    ),
  );

}
