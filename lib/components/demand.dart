import 'package:calories_counter_app/widget/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
enum Plec { male, female }
class Demend extends StatefulWidget{
  const Demend({Key? key}) : super(key: key);

  State<Demend> createState()=> _Demend();
}
class _Demend extends State<Demend> {
  Plec? _plec = Plec.male;
  final weight = TextEditingController();
  final age = TextEditingController();
  final height = TextEditingController();
  final List<String> items = <String>['Wybierz twój tryb życia','Siedzący tryb życia', 'Umiarkowana aktywność fizyczna', 'Średnia aktywność fizyczna'
    ,'Wysoka aktywność fizyczna'];
  String selectedItem = 'Wybierz twój tryb życia';
  final List<String> Cele = <String>['Wybierz cel diety','Chce schudnąć','Chce Utrzymać wagę','Chcę przytyć '];
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
  Widget build(BuildContext context ) {
    // TODO: implement build
    return Theme(
        data: ThemeData(
            unselectedWidgetColor: Colors.white),
        child:
        SingleChildScrollView(
            child:Column(
              children: <Widget>[
                Text(
                  'Oblicz zapotrzebowanie Kaloryczne',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: const Text('Mężczyzna',style: TextStyle(color:Colors.white),),
                  leading: Radio<Plec>(
                    value: Plec.male,
                    groupValue: _plec,
                    activeColor: Colors.white,
                    onChanged: (Plec? value) {
                      setState(() { _plec = value; });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Kobieta',style: TextStyle(color:Colors.white),),
                  leading: Radio<Plec>(
                    value: Plec.female,
                    groupValue: _plec,
                    activeColor: Colors.white,
                    onChanged: (Plec? value) {
                      setState(() { _plec = value; });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),

                      border: OutlineInputBorder(),
                      labelStyle: new TextStyle(color: Colors.white),
                      labelText: 'Waga',
                      hintText: 'Podaj Wage',
                      hintStyle: new TextStyle(color: Colors.white),
                    ),controller: weight,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),

                      border: OutlineInputBorder(),
                      labelStyle: new TextStyle(color: Colors.white),
                      labelText: 'Wiek',
                      hintText: 'Podaj Wiek',
                      hintStyle: new TextStyle(color: Colors.white),
                    ),controller: age,
                    style: TextStyle(color: Colors.white),
                  ),
                ),Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),

                      border: OutlineInputBorder(),
                      labelStyle: new TextStyle(color: Colors.white),
                      labelText: 'Wzrost',
                      hintText: 'Podaj Wzrost',
                      hintStyle: new TextStyle(color: Colors.white),
                    ),controller: height,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: DropdownButton<String>(
                    dropdownColor: Colors.black,
                    value: selectedItem,style: TextStyle(color: Colors.white,fontSize: 20),
                    onChanged: (String? string) => setState(() => selectedItem = string!),
                    selectedItemBuilder: (BuildContext context) {
                      return items.map<Widget>((String item) {
                        return Text(item);
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
                  padding: EdgeInsets.all(10),
                  child: DropdownButton<String>(
                    dropdownColor: Colors.black,
                    value: selectCel,style: TextStyle(color: Colors.white,fontSize: 20),
                    onChanged: (String? string) => setState(() => selectCel = string!),
                    selectedItemBuilder: (BuildContext context) {
                      return Cele.map<Widget>((String Cele) {
                        return Text(Cele);
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
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                    textColor: Colors.white, // foreground
                    onPressed: () {
                      int kaloryka=0;
                      double a=double.parse(weight.text);
                      double b=double.parse(age.text);
                      double c=double.parse(height.text);
                      if(_plec==Plec.male){
                        kaloryka=(66.47+13.7*a+5.0*c-6.76*b).toInt();
                        print(kaloryka);
                      }
                      if(_plec==Plec.female){
                        kaloryka=(655.1+(9.567*a)+(1.85*c)-(4.68*b)).toInt();
                        print(kaloryka);
                      }
                      if(selectedItem=='Siedzący tryb życia')
                      {
                        kaloryka=(kaloryka*1.3).toInt();
                        print(kaloryka);
                      }
                      if(selectedItem=='Umiarkowana aktywność fizyczna')
                      {
                        kaloryka=(kaloryka*1.5).toInt();
                      }
                      if(selectedItem=='Średnia aktywność fizyczna')
                      {
                        kaloryka=(kaloryka*1.7).toInt();
                      }
                      if(selectedItem=='Wysoka aktywność fizyczna')
                      {
                        kaloryka=(kaloryka*1.9).toInt();
                      }
                      if(selectedItem=='Wysoka aktywność fizyczna')
                      {
                        kaloryka=(kaloryka*1.9).toInt();
                      }
                      if(selectCel=='Chce Utrzymać wagę')
                      {
                        print(kaloryka);
                      }
                      if(selectCel=='Chce schudnąć')
                      {
                        double x=a/100*7000/7;
                        kaloryka=(kaloryka-x).toInt();
                        print(kaloryka);
                      }
                      if(selectCel=='Chcę przytyć')
                      {
                        double x=a/100*7000/7;
                        kaloryka=(kaloryka+x).toInt();
                        print(kaloryka);
                      }
                      int bialko=(2*a).toInt();
                      int tluszcze=(30/100*kaloryka/9).toInt();
                      int wegle=((kaloryka-(a*4+30/100*kaloryka))/4).toInt();
                      print(bialko);
                      print(tluszcze);
                      print(wegle);
                      _showMyDialog(bialko,tluszcze,wegle,kaloryka);
                    },

                    child: Text('Sprawdź swoje zapotrzebowanie'),
                  ),

                )
              ],
            )
        ));
  }
  Future<void> _showMyDialog(int bialko,int tluszcze,int wegle,int kaloryka) async {
    assert(kaloryka != null);
    assert(bialko != null);
    assert(tluszcze != null);
    assert(wegle != null);
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('Kaloryka i Makroskładniki'),
          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[
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