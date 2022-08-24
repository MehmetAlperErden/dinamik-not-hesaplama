import 'package:dinamik_ortalama_hesaplama/constanst/app_constanst.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/ortalama_hesapla.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinamik ortalama hesaplama',
      theme: ThemeData(primarySwatch: Sabitler.SabitRenk,
      visualDensity: VisualDensity.adaptivePlatformDensity),
      home: OrtalamaHesapla(),
    );
  }
}
