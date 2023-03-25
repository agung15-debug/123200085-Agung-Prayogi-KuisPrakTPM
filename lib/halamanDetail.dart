import 'package:flutter/material.dart';
import 'disease_data.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatefulWidget {
  const HalamanDetail({Key? key, required this.diseases}) : super(key: key);
  final Diseases? diseases;
  Future<void> _onImagePress() async {
    final url = diseases!.imgUrls;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Disease'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: isFavorited
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            tooltip: 'Favorite',
            onPressed: () {
              SnackBar snackBar = SnackBar(
                content: isFavorited
                    ? Text('Berhasil Menghapus dari Favorite')
                    : Text('Berhasil Menambahkan ke Favorite'),
                duration: const Duration(seconds: 1),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              setState(() {
                isFavorited = !isFavorited;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 3,
                  child: GestureDetector(
                    onTap: widget._onImagePress,
                    child: Image.network(
                      widget.diseases!.imgUrls,
                      fit: BoxFit.cover,
                    ),
                  )),
              Text(widget.diseases!.name,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              Text(
                'Disease Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.diseases!.name),
              SizedBox(
                height: 20,
              ),
              Text(
                'Plant Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.diseases!.plantName),
              SizedBox(
                height: 20,
              ),
              Text(
                'Ciri - Ciri',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              for (var i = 0; i < widget.diseases!.nutshell.length; i++)
                Text(widget.diseases!.nutshell[i]),
              SizedBox(
                height: 20,
              ),
              Text(
                'Disease ID',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.diseases!.id),
              SizedBox(
                height: 20,
              ),
              Text(
                'Symptom',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.diseases!.symptom),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget._onImagePress();
        },
        child: const Icon(Icons.image),
        backgroundColor: Colors.green,
      ),
    );
  }
}
