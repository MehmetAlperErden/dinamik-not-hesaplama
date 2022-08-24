import 'dart:ffi';

import 'package:dinamik_ortalama_hesaplama/constanst/app_constanst.dart';
import 'package:dinamik_ortalama_hesaplama/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesaplama/model/dersler.dart';
import 'package:dinamik_ortalama_hesaplama/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrtalamaHesapla extends StatefulWidget {
  const OrtalamaHesapla({Key? key}) : super(key: key);

  @override
  State<OrtalamaHesapla> createState() => _OrtalamaHesaplaState();
}

class _OrtalamaHesaplaState extends State<OrtalamaHesapla> {
  double secilenHarfDeger = 4;
  double secilenKrediDeger = 1;
  String girilenDersAdi = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text(
              Sabitler.baslikText,
              style: Sabitler.baslikStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: _BuildForm(),
                    color: Colors.red.shade700,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: OrtalamaGoster(
                    dersSayisi: 4,
                    ortalama: 2.61111,
                  ),
                )
              ],
            ),
            Expanded(
                child: Container(
              child: Text('Kopenhagin anasini götünden sikiyim',
                  style: Sabitler.Kopenhag),
              color: Colors.blue,
            ))
          ],
        ));
  }

  Widget _BuildForm() {
    return Form(
      key: formKey,
      child: Column(children: [
        Padding(
          padding: Sabitler.yatay,
          child: _buildTextFormField(),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Padding(
              padding: Sabitler.yatay,
              child: _BuildHarfler(),
            )),
            Expanded(
                child: Padding(
              padding: Sabitler.yatay,
              child: _BuildKrediler(),
            )),
            IconButton(
              onPressed: _dersEkleveOrtalamaHesapla,
              icon: Icon(Icons.arrow_forward_ios),
              color: Sabitler.SabitRenk,
              iconSize: 20,
            ),
          ],
        )
      ]),
    );
  }
  

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Ders adi giriniz';
        } else
          return null;
      },
      decoration: InputDecoration(
        hintText: 'Anan',
        border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.ikinciRenk,
      ),
    );
  }

  _BuildHarfler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.SabitRenk.shade300.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
          value: secilenHarfDeger,
          elevation: 16,
          iconEnabledColor: Sabitler.SabitRenk.shade700,
          onChanged: (deger) {
            setState(() {
              secilenHarfDeger = deger!;
            });
          },
          underline: Container(),
          items: DataHelper.tumDersHarfleri()),
    );
  }

  _BuildKrediler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.SabitRenk.shade300.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
          value: secilenHarfDeger,
          elevation: 16,
          iconEnabledColor: Sabitler.SabitRenk.shade700,
          onChanged: (deger) {
            setState(() {
              secilenHarfDeger = deger!;
            });
          },
          underline: Container(),
          items: DataHelper.tumKrediler()),
    );
  }

  _dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.validate();
      var eklenecekDers =
          Ders(girilenDersAdi, secilenHarfDeger, secilenKrediDeger);
      DataHelper.dersEkle(eklenecekDers);
      print(DataHelper.ortalanaHesala());

    }
  }
}
