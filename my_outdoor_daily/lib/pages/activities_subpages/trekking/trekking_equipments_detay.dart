import 'package:flutter/material.dart';
import '../../../model/veri_model.dart';

class TrekkingEquipmentsDetay extends StatelessWidget {
  const TrekkingEquipmentsDetay(
      {Key? key, required this.kategoriList, required this.index})
      : super(key: key);
  final List<Kategori> kategoriList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              backgroundColor: Colors.black,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(kategoriList[7].veri[index].title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                centerTitle: true,
                background: Image.network(
                  kategoriList[7].veri[index].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Text(kategoriList[7].veri[index].text),
                ),
              ),
            ),
          ],
        ));
  }
}
