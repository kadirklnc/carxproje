import 'package:carxproje/cubit/araba_guncelle_cubit.dart';
import 'package:carxproje/entity/arabalar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class DuzenleAraba extends StatefulWidget {
  Arabalar araba;
  DuzenleAraba({super.key, required this.araba});

  @override
  State<DuzenleAraba> createState() => _DuzenleArabaState();
}

class _DuzenleArabaState extends State<DuzenleAraba> {
  var tfmake = TextEditingController();
  var tfmodel = TextEditingController();
  var tfsanziman = TextEditingController();
  var tfperformans = TextEditingController();
  var tfmakshiz = TextEditingController();
  var tfdetails = TextEditingController();
  var tfimageurl = TextEditingController();

  @override
  void initState() {
    super.initState();
    var araba = widget.araba;
    tfmake.text = araba.make;
    tfmodel.text = araba.model;
    tfsanziman.text = araba.sanziman;
    tfperformans.text = araba.performans;
    tfmakshiz.text = araba.maksimumHiz;
    tfdetails.text = araba.details;
    tfimageurl.text = araba.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 199, 199),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 248, 84, 84),
        title: const Text('Araba Düzenleme',
            style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                controller: tfmake,
                decoration: const InputDecoration(hintText: "Araba Marka"),
              ),
              TextField(
                controller: tfmodel,
                decoration: const InputDecoration(hintText: "Araba Model"),
              ),
              TextField(
                controller: tfsanziman,
                decoration: const InputDecoration(hintText: "Araba Şanzıman"),
              ),
              TextField(
                controller: tfperformans,
                decoration:
                    const InputDecoration(hintText: "Araba 0-100 Performans"),
              ),
              TextField(
                controller: tfmakshiz,
                decoration:
                    const InputDecoration(hintText: "Araba Maksimum hız"),
              ),
              TextField(
                controller: tfdetails,
                decoration: const InputDecoration(hintText: "Araba Detay"),
              ),
              TextField(
                controller: tfimageurl,
                decoration: const InputDecoration(hintText: "Araba Resim URL"),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<ArabaGuncelleCubit>().guncelle(
                          widget.araba.arabaId,
                          tfmake.text,
                          tfmodel.text,
                          tfsanziman.text,
                          tfperformans.text,
                          tfmakshiz.text,
                          tfdetails.text,
                          tfimageurl.text,
                        );
                    Navigator.of(context).popUntil(
                      (route) => route.isFirst,
                    );
                  },
                  child: const Text("Güncelle"))
            ],
          ),
        ),
      ),
    );
  }
}
