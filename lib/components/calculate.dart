import 'package:calories_counter_app/service/share_preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Plec { male, female }

class Calculate extends StatefulWidget {
  const Calculate({Key? key}) : super(key: key);

  @override
  State<Calculate> createState() => _Calculate();
}

class _Calculate extends State<Calculate> {
  Plec? _plec = Plec.male;
  final weight = TextEditingController();
  final age = TextEditingController();
  final height = TextEditingController();
  final List<String> items = <String>[
    'Wybierz twój tryb życia',
    'Siedzący tryb życia',
    'Umiarkowana aktywność fizyczna',
    'Średnia aktywność fizyczna',
    'Wysoka aktywność fizyczna'
  ];
  String selectedItem = 'Wybierz twój tryb życia';
  final List<String> Cele = <String>[
    'Wybierz cel diety',
    'Chce schudnąć',
    'Chce Utrzymać wagę',
    'Chcę przytyć '
  ];
  String selectCel = 'Wybierz cel diety';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    weight.dispose();
    age.dispose();
    height.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Theme(
        data: ThemeData(unselectedWidgetColor: Colors.white),
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            const Text(
              'Oblicz zapotrzebowanie Kaloryczne',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text(
                'Mężczyzna',
                style: TextStyle(color: Colors.white),
              ),
              leading: Radio<Plec>(
                value: Plec.male,
                groupValue: _plec,
                activeColor: Colors.white,
                onChanged: (Plec? value) {
                  setState(() {
                    _plec = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text(
                'Kobieta',
                style: TextStyle(color: Colors.white),
              ),
              leading: Radio<Plec>(
                value: Plec.female,
                groupValue: _plec,
                activeColor: Colors.white,
                onChanged: (Plec? value) {
                  setState(() {
                    _plec = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(),
                  labelStyle:  TextStyle(color: Colors.white),
                  labelText: 'Waga',
                  hintText: 'Podaj Wage',
                  hintStyle:  TextStyle(color: Colors.white),
                ),
                controller: weight,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(),
                  labelStyle:  TextStyle(color: Colors.white),
                  labelText: 'Wiek',
                  hintText: 'Podaj Wiek',
                  hintStyle:  TextStyle(color: Colors.white),
                ),
                controller: age,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(),
                  labelStyle:  TextStyle(color: Colors.white),
                  labelText: 'Wzrosta',
                  hintText: 'Podaj Wzrost',
                  hintStyle:  TextStyle(color: Colors.white),
                ),
                controller: height,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: DropdownButton<String>(
                dropdownColor: Colors.white,
                value: selectedItem,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                onChanged: (String? string) =>
                    setState(() => selectedItem = string!),
                selectedItemBuilder: (BuildContext context) {
                  return items.map<Widget>((String item) {
                    return Text(item,
                        style: const TextStyle(color: Colors.black),
                    );
                  }).toList();
                },
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    child: Text(item),
                    value: item,
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: DropdownButton<String>(
                dropdownColor: Colors.white,
                value: selectCel,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                onChanged: (String? string) =>
                    setState(() => selectCel = string!),
                selectedItemBuilder: (BuildContext context) {
                  return Cele.map<Widget>((String Cele) {
                    return Text(Cele,
                        style: const TextStyle(color: Colors.black),
                    );
                  }).toList();
                },
                items: Cele.map((String Cele) {
                  return DropdownMenuItem<String>(
                    child: Text(Cele),
                    value: Cele,
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: FlatButton(
                textColor: Colors.white, // foreground
                onPressed: () async {
                  int kaloryka = 0;
                  double a = double.parse(weight.text);
                  double b = double.parse(age.text);
                  double c = double.parse(height.text);
                  if (_plec == Plec.male) {
                    kaloryka = (66.47 + 13.7 * a + 5.0 * c - 6.76 * b).toInt();
                  }
                  if (_plec == Plec.female) {
                    kaloryka =
                        (655.1 + (9.567 * a) + (1.85 * c) - (4.68 * b)).toInt();
                  }
                  if (selectedItem == 'Siedzący tryb życia') {
                    kaloryka = (kaloryka * 1.3).toInt();
                  }
                  if (selectedItem == 'Umiarkowana aktywność fizyczna') {
                    kaloryka = (kaloryka * 1.5).toInt();
                  }
                  if (selectedItem == 'Średnia aktywność fizyczna') {
                    kaloryka = (kaloryka * 1.7).toInt();
                  }
                  if (selectedItem == 'Wysoka aktywność fizyczna') {
                    kaloryka = (kaloryka * 1.9).toInt();
                  }
                  if (selectedItem == 'Wysoka aktywność fizyczna') {
                    kaloryka = (kaloryka * 1.9).toInt();
                  }
                  if (selectCel == 'Chce Utrzymać wagę') {}
                  if (selectCel == 'Chce schudnąć') {
                    double x = a / 100 * 7000 / 7;
                    kaloryka = (kaloryka - x).toInt();
                  }
                  if (selectCel == 'Chcę przytyć') {
                    double x = a / 100 * 7000 / 7;
                    kaloryka = (kaloryka + x).toInt();
                  }
                  await SharePreferenceService().setWaga(weight.text);
                  await SharePreferenceService().setWzrost(height.text);
                  await SharePreferenceService()
                      .setKaloryka(kaloryka.toString());
                  int bialko = (2 * a).toInt();
                  int tluszcze = (30 / 100 * kaloryka / 9).toInt();
                  int wegle =
                      ((kaloryka - (a * 4 + 30 / 100 * kaloryka)) / 4).toInt();
                  _showMyDialog(bialko, tluszcze, wegle, kaloryka);
                },

                child: const Text('Sprawdź swoje zapotrzebowanie'),
              ),
            )
          ],
        )));
  }

  Future<void> _showMyDialog(
      int bialko, int tluszcze, int wegle, int kaloryka) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Kaloryka i Makroskładniki'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Twoje zapotrzebowanie to $kaloryka kcal\n'
                    'białko:$bialko g\n'
                    'tluszcze:$tluszcze g\n'
                    'węglowodany:$wegle g'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
