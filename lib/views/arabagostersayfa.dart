import 'package:carxproje/entity/arabalar.dart';
import 'package:flutter/material.dart';

class ArabaGoster extends StatelessWidget {
  const ArabaGoster(
      {super.key,
      required this.arabalar,
      required this.deletearaba,
      required this.editaraba});

  final Arabalar arabalar;
  final void Function() deletearaba;
  final void Function() editaraba;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 199, 199),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: (const Color.fromARGB(255, 248, 84, 84)),
          title: Text(
            arabalar.make,
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(onPressed: deletearaba, icon: const Icon(Icons.delete)),
            IconButton(
              onPressed: editaraba,
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                arabalar.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 14),
              Text(
                'ÖNE ÇIKAN ÖZELLİKLERİ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                child: Column(
                  children: [
                    Text(
                      'MODEL',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      arabalar.model,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'ŞANZIMAN',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      arabalar.sanziman,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'PERFORMANS',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "0-100 : ${arabalar.performans} saniye",
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'MAKSİMUM HIZ',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      arabalar.maksimumHiz,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'AÇIKLAMA',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      arabalar.details,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
