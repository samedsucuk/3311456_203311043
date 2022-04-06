import 'package:flutter/material.dart';
import 'package:my_outdoor_daily/widgets/black_sized_box.dart';
import 'package:my_outdoor_daily/widgets/slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            "WELCOME",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.arrowRightToBracket,
                size: 17,
                color: Colors.white,
              ),
              onPressed: (() {
                Navigator.pushReplacementNamed(context, "/loginpage");
              }),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250, child: CarouselWithIndicatorDemo()),
              BlackSizedBox(title: "ACTIVITIES", target: "/activities"),
              BlackSizedBox(title: "MY NOTES", target: "/mynotes"),
              BlackSizedBox(title: "MAP", target: "/googlemap"),
            ],
          ),
        ));
  }
}
