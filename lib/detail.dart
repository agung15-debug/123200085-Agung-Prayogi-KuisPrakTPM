import 'package:flutter/material.dart';
import 'disease_data.dart';

class HalamanDetail extends StatelessWidget {
  const HalamanDetail({Key? key, required this.diseases}) : super(key: key);
  final Diseases? diseases;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Disease'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite_border),
            tooltip: 'Favorite',
            onPressed: () {
              SnackBar snackBar = const SnackBar(
                content: Text('Berhasil Menambahkan ke Favorite'),
                duration: Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 3,
              child: Image.network(
                diseases!.imgUrls,
                fit: BoxFit.cover,
              ),
            ),
            Text(diseases!.name,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            Text(
              'Disease Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(diseases!.name),
            SizedBox(
              height: 20,
            ),
            Text(
              'Plant Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(diseases!.plantName),
            SizedBox(
              height: 20,
            ),
            Text(
              'Ciri - Ciri',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            for (var i = 0; i < diseases!.nutshell.length; i++)
              Text(diseases!.nutshell[i]),
            SizedBox(
              height: 20,
            ),
            Text(
              'Disease ID',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(diseases!.id),
            SizedBox(
              height: 20,
            ),
            Text(
              'Symptom',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(diseases!.symptom),
          ],
        ),
      ),
    );
  }
}
