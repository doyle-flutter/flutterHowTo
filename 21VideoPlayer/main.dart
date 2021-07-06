import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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

class _MainState extends State<Main> {
  List<Map<String, dynamic>> datas = [
    {
      'thumbnail' : 'https://cdn.pixabay.com/photo/2012/03/01/00/55/garden-19830__480.jpg',
      'url' : 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      'check' : false,
    },
    {
      'thumbnail' : 'https://cdn.pixabay.com/photo/2013/06/30/18/56/butterfly-142506__340.jpg',
      'url' : 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      'check' : false,
    },
    {
      'thumbnail' : 'https://cdn.pixabay.com/photo/2018/04/10/08/14/nature-3306655__340.jpg',
      'url' : 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      'check' : false,
    },
  ];

  int? prevClickIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter-HowTo"),),
      body: ListView.builder(
        itemCount: this.datas.length,
        itemBuilder: (BuildContext context, int index) => Views(
          thumbnail: this.datas[index]['thumbnail'].toString(),
          url: this.datas[index]['url'].toString(),
          check: this.datas[index]['check'],
          onPressed: (VideoPlayerController ct) async{
            if(prevClickIndex != null) this.datas[prevClickIndex!]['check'] = true;
            ct.value.isPlaying ? await ct.pause() : await ct.play();
            this.setState(() {
              this.datas[index]['check'] = false;
              prevClickIndex = index;
            });
            return;
          },
        )
      ),
    );
  }
}

class Views extends StatefulWidget {
  final String url;
  final String thumbnail;
  bool check;
  void Function(VideoPlayerController ct) onPressed;
  Views({Key? key, required this.url, required this.check, required this.thumbnail, required this.onPressed}) : super(key: key);

  @override
  _ViewsState createState() => _ViewsState();
}

class _ViewsState extends State<Views> {

  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    Future.microtask(()async{
      _controller = VideoPlayerController.network(widget.url);
      await _controller!.initialize();
      if(!this.mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    this._controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.check){
      if(_controller != null){
        _controller!.pause();
      }
    }
    return (this._controller == null)
      ? Center(child: Text("Controller Load..."),)
      : _controller!.value.isInitialized
        ? Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            color: Colors.grey,
            child: AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.thumbnail),
                    fit: BoxFit.cover
                  )
                ),
                child: this._controller!.value.isPlaying ? VideoPlayer(_controller!) : Container()
              )
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              alignment: Alignment.centerRight,
              child: this._videoCt()
            ),
          )
        ],
      ),
    )
    : Container(child: Text("Await..."),);
  }

  Widget _videoCt() => Container(
    width: 50.0,
    height: 50.0,
    margin: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(50.0)
    ),
    child: IconButton(
        color: Colors.white,
        icon: Icon(this._controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,),
        onPressed: () => widget.onPressed(this._controller!)
    ),
  );
}

