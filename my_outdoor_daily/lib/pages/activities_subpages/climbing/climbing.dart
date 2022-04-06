import 'package:flutter/material.dart';

import '../../../widgets/imaged_sized_box.dart';

class Climbing extends StatefulWidget {
  const Climbing({Key? key}) : super(key: key);

  @override
  State<Climbing> createState() => _ClimbingState();
}

class _ClimbingState extends State<Climbing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            "CLIMBING",
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
                    title: "Places",
                    target: "/climbingplaces",
                    imagetarget: "assets/images/climbingplaces.png",
                    topmargin: 25,
                  ),
                  ImagedSizedBox(
                    title: "Equipments",
                    target: "/climbingequipments",
                    imagetarget: "assets/images/climbingequipments.png",
                  ),
                  ImagedSizedBox(
                      title: "Clothings",
                      target: "/climbingclothings",
                      imagetarget: "assets/images/climbingclothings.png"),
                ],
              )
            ],
          ),
        ));
  }
}
