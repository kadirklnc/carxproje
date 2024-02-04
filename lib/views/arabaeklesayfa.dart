import 'package:carxproje/cubit/araba_kayit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArabaEkle extends StatefulWidget {
  const ArabaEkle({super.key});

  @override
  State<ArabaEkle> createState() => _ArabaEkleState();
}

class _ArabaEkleState extends State<ArabaEkle> {
  var tfmake = TextEditingController();
  var tfmodel = TextEditingController();
  var tfsanziman = TextEditingController();
  var tfperformans = TextEditingController();
  var tfmakshiz = TextEditingController();
  var tfdetails = TextEditingController();
  var tfimageurl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 199, 199),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 248, 84, 84),
        title:
            const Text('Araba Ekleme', style: TextStyle(color: Colors.white)),
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
                    context.read<ArabaKayitCubit>().kayit(
                          tfsanziman.text,
                          tfperformans.text,
                          tfmakshiz.text,
                          tfmake.text,
                          tfdetails.text,
                          tfimageurl.text,
                          tfmodel.text,
                        );
                    Navigator.of(context).pop();
                  },
                  child: const Text("KAYDET"))
            ],
          ),
        ),
      ),
    );
  }
}
