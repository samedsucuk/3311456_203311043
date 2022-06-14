import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_outdoor_daily/service/file_store.dart';

class CampDateTime extends StatefulWidget {
  const CampDateTime({Key? key}) : super(key: key);

  @override
  State<CampDateTime> createState() => _CampDateTime();
}

class _CampDateTime extends State<CampDateTime> {
  String date = "Select Date";
  String fileDate = "";
  late FileStorageServices _file;
  @override
  void initState() {
    super.initState();
    _file = FileStorageServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "CAMP DATE",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {
                      DateTime nowDate = DateTime.now();
                      showDatePicker(
                              context: context,
                              initialDate: nowDate,
                              firstDate:
                                  DateTime(nowDate.year, nowDate.month - 7),
                              lastDate:
                                  DateTime(nowDate.year, nowDate.month + 4))
                          .then((value) {
                        setState(() {});
                        date =
                            "${value!.day.toString()}/${value.month.toString()}/${value.year.toString()}";
                        print(date);
                        _file.dataInsert(date);
                      });
                    },
                    child: Text(date)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () async {
                      await _file.dataRead().then((value) => fileDate = value);
                      print(fileDate);
                      setState(() {});
                    },
                    child: Text("Your select : " + fileDate)),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Lottie.asset('assets/animations/campdate.json'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
