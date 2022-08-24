import 'package:dinamik_ortalama_hesaplama/constanst/app_constanst.dart';
import 'package:dinamik_ortalama_hesaplama/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final double dersSayisi;
  const OrtalamaGoster(
      {Key? key, required this.ortalama, required this.dersSayisi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? '$dersSayisi ders girildi' : 'ders seciniz',
          style: Sabitler.dersSayisiStyle,
        ),
        Text(
          ortalama >= 0 ? '${ortalama.toStringAsFixed(2)}' : '0.0',
          style: Sabitler.OrtalamaStyle,
        ),
        Text(
          'Ortalama',
          style: Sabitler.dersSayisiStyle,
        ),
      ],
    );
  }
}
