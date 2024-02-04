import 'package:carxproje/cubit/anasayfa_cubit.dart';
import 'package:carxproje/entity/arabalar.dart';
import 'package:carxproje/views/arabaeklesayfa.dart';
import 'package:carxproje/views/arabagostersayfa.dart';
import 'package:carxproje/views/duzenlesayfa.dart';
import 'package:carxproje/widget/arabagrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().arabalarYukle();
  }

  void _selectArabaScreen(BuildContext context, Arabalar arabalar) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ArabaGoster(
        editaraba: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DuzenleAraba(araba: arabalar),
          ));
        },
        arabalar: arabalar,
        deletearaba: () {
          context.read<AnasayfaCubit>().sil(arabalar.arabaId);
          Navigator.of(context).pop();
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 199, 199),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 248, 84, 84),
        title: aramaYapiliyorMu
            ? TextField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: "Ara", hintStyle: TextStyle(color: Colors.white)),
                onChanged: (aramaSonucu) {
                  context.read<AnasayfaCubit>().ara(aramaSonucu);
                },
              )
            : const Text(
                'CarX Promotion',
                style: TextStyle(color: Colors.white),
              ),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = false;
                    });
                    context.read<AnasayfaCubit>().arabalarYukle();
                  },
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = true;
                    });
                  },
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                )
        ],
      ),
      body: BlocBuilder<AnasayfaCubit, List<Arabalar>>(
        builder: (context, arabalistesi) {
          if (arabalistesi.isNotEmpty) {
            return GridView.builder(
              itemCount: arabalistesi.length,
              itemBuilder: (context, index) {
                var araba = arabalistesi[index];
                return ArabaGridItem(
                  arabaTitle: "${araba.make} ${araba.model}",
                  arabaimage: araba.imageUrl,
                  onSelectAraba: () {
                    _selectArabaScreen(context, araba);
                  },
                );
              },
              padding: const EdgeInsets.all(24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ArabaEkle(),
              )).then((value) {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
