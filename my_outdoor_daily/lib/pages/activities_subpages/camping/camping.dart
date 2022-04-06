import 'package:flutter/material.dart';

import '../../../widgets/imaged_sized_box.dart';

class Camping extends StatefulWidget {
  const Camping({Key? key}) : super(key: key);

  @override
  State<Camping> createState() => _CampingState();
}

class _CampingState extends State<Camping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            "CAMPING",
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
                    target: "/campingplaces",
                    imagetarget: "assets/images/campingplaces.png",
                    topmargin: 25,
                  ),
                  ImagedSizedBox(
                    title: "Equipments",
                    target: "/campingequipments",
                    imagetarget: "assets/images/campingequipments.png",
                  ),
                  ImagedSizedBox(
                      title: "Clothings",
                      target: "/campingclothings",
                      imagetarget: "assets/images/campingclothings.png"),
                ],
              )
            ],
          ),
        ));
  }
}
