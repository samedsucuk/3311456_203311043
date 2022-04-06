import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BlackSizedBox extends StatefulWidget {
  String title;
  String target;
  BlackSizedBox({Key? key, required this.title, required this.target})
      : super(key: key);
  @override
  State<BlackSizedBox> createState() => _BlackSizedBoxState();
}

class _BlackSizedBoxState extends State<BlackSizedBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 7.0, bottom: 7.0, left: 15.0, right: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: (() {
                Navigator.pushNamed(context, widget.target);
              }),
              child: Container(
                height: 100,
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black,
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
