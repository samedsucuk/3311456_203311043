import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImagedSizedBox extends StatefulWidget {
  String title;
  String target;
  String imagetarget;
  double topmargin;

  ImagedSizedBox(
      {Key? key,
      required this.title,
      required this.target,
      required this.imagetarget,
      this.topmargin = 10})
      : super(key: key);
  @override
  State<ImagedSizedBox> createState() => _ImagedSizedBoxState();
}

class _ImagedSizedBoxState extends State<ImagedSizedBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
            top: widget.topmargin, bottom: 15.0, left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: (() {
                Navigator.pushNamed(context, widget.target);
              }),
              child: Container(
                height: 165,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(widget.imagetarget),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Colors.black.withOpacity(0.6),
                            offset: const Offset(5, 5),
                            blurRadius: 15)
                      ],
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
