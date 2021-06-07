import 'package:flutter/material.dart';

class BackgroundImg extends StatefulWidget {
  BackgroundImg({this.wigetChild, @required this.bgimg});
  final Widget wigetChild;
  final String bgimg;
  @override
  _BackgroundImgState createState() => _BackgroundImgState();
}

class _BackgroundImgState extends State<BackgroundImg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.wigetChild,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/${widget.bgimg}.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3), BlendMode.dstATop),
        ),
      ),
      //constraints: BoxConstraints.expand(),
      padding: EdgeInsets.all(20),
    );
  }
}
