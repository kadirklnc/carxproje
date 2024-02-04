import 'package:flutter/material.dart';

class ArabaGridItem extends StatelessWidget {
  const ArabaGridItem({
    super.key,
    required this.arabaTitle,
    required this.arabaimage,
    required this.onSelectAraba,
  });

  final String arabaTitle;
  final String arabaimage;
  final void Function() onSelectAraba;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onSelectAraba,
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            image: DecorationImage(
                opacity: 0.8,
                fit: BoxFit.fill,
                image: NetworkImage(arabaimage)),
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
                colors: [Colors.black12, Colors.white24],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: <Widget>[
                      // Stroked text as border.
                      Text(
                        arabaTitle,
                        style: TextStyle(
                          fontSize: 20,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 6
                            ..color = Colors.black,
                        ),
                      ),
                      // Solid text as fill.
                      Text(
                        arabaTitle,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ));
  }
}
