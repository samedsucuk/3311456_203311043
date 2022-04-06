import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_outdoor_daily/model/veri_model.dart';
import 'package:my_outdoor_daily/pages/activities_subpages/camping/camping_clothings_detay.dart';
import 'package:http/http.dart' as http;



class CampingClothings extends StatefulWidget {
  const CampingClothings({Key? key}) : super(key: key);

  @override
  State<CampingClothings> createState() => _CampingClothingsState();
}

class _CampingClothingsState extends State<CampingClothings> {
  late Future<Kategori> kategori;
  Future<List<Kategori>> _kategoriListesi() async {
    try {
      var response = await http.get(Uri.parse(
          'https://raw.githubusercontent.com/samedsucuk/myoutdoordailyjson/main/myoutdoordaily.json'));
      List<Kategori> _kategoriList = [];
      if (response.statusCode == 200) {
        return kategoriFromMap(response.body);
      }
      return _kategoriList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    _kategoriListesi();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "CLOTHINGS",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Kategori>>(
            future: _kategoriListesi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var kategoriList = snapshot.data!;
                return ListView.builder(
                    itemCount: kategoriList[2].veri.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Card(
                              elevation: 4,
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CampingClothingsDetay(
                                                  kategoriList: kategoriList,
                                                  index: index),
                                        ),
                                      );
                                    },
                                    title:
                                        Text(kategoriList[2].veri[index].title),
                                  ))));
                    });
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
