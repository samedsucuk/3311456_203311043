import 'package:flutter/material.dart';
import '../widgets/imaged_sized_box.dart';

class Activities extends StatefulWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            "ACTIVITIES",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  ImagedSizedBox(
                    title: "Camping",
                    target: "/camping",
                    imagetarget: "assets/images/camping.png",
                    topmargin: 25,
                  ),
                  ImagedSizedBox(
                    title: "Climbing",
                    target: "/climbing",
                    imagetarget: "assets/images/climbing.png",
                  ),
                  ImagedSizedBox(
                      title: "Trekking",
                      target: "/trekking",
                      imagetarget: "assets/images/trekking.png"),
                ],
              )
            ],
          ),
        ));
  }
}
