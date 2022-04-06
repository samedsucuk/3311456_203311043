import 'package:flutter/material.dart';
import '../../../widgets/imaged_sized_box.dart';

class Trekking extends StatefulWidget {
  const Trekking({Key? key}) : super(key: key);

  @override
  State<Trekking> createState() => _TrekkingState();
}

class _TrekkingState extends State<Trekking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            "TREKKING",
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
                    target: "/trekkingplaces",
                    imagetarget: "assets/images/trekkingplaces.png",
                    topmargin: 25,
                  ),
                  ImagedSizedBox(
                    title: "Equipments",
                    target: "/trekkingequipments",
                    imagetarget: "assets/images/trekkingequipments.png",
                  ),
                  ImagedSizedBox(
                      title: "Clothings",
                      target: "/trekkingclothings",
                      imagetarget: "assets/images/trekkingclothings.png"),
                ],
              )
            ],
          ),
        ));
  }
}
