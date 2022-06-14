import 'package:flutter/material.dart';
import 'package:my_outdoor_daily/service/file_store.dart';
import 'package:my_outdoor_daily/widgets/black_sized_box.dart';
import 'package:my_outdoor_daily/widgets/slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late FileStorageServices _file;
  String date = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _file = FileStorageServices();
    readData();
  }

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
              Text(
                "Planned camp date : " + date,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              BlackSizedBox(title: "ACTIVITIES", target: "/activities"),
              BlackSizedBox(title: "MY NOTES", target: "/mynotes"),
              BlackSizedBox(title: "DONT FORGET", target: "/dontforget"),
              BlackSizedBox(title: "MAP", target: "/googlemap"),
              BlackSizedBox(title: "WEATHER", target: "/weather"),
              BlackSizedBox(title: "CAMP DATE", target: "/campdatetime"),
            ],
          ),
        ));
  }

  void readData() async {
    await _file.dataRead().then((value) {
      if (value.isEmpty) {
        date = "Date is not set.";
      } else {
        date = value;
      }
    });
    setState(() {});
  }
}
