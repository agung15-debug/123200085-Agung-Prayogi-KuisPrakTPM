import 'package:flutter/material.dart';
import 'disease_data.dart';
import 'HalamanDetail.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plant Disease'),
          centerTitle: true,
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7),
          itemCount: listDisease.length,
          itemBuilder: (context, index) {
            final Diseases diseases = listDisease[index];
            return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HalamanDetail(diseases: diseases);
                  }));
                },
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.network(
                        diseases.imgUrls,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      diseases.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ]),
                )));
          },
        ));
  }
}
