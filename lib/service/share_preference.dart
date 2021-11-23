import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceService{
  Future<bool> setKaloryka(String kaloryka) async{
    final prefs=await SharedPreferences.getInstance();
    return  prefs.setString('kaloryka', kaloryka);;
  }
  Future<bool> setWaga(String waga) async{
    final prefs=await SharedPreferences.getInstance();
    return prefs.setString('waga', waga);
  }
  Future<bool> setWzrost(String wzrost) async{
    final prefs=await SharedPreferences.getInstance();
    return prefs.setString('wzrost', wzrost);
  }
  Future<String> getKaloryka()async{
    final prefs= await SharedPreferences.getInstance();
    String a= prefs.getString('kaloryka')??'';
    return a;
  }
  Future<String> getWaga()async{
    final prefs= await SharedPreferences.getInstance();
    String a= prefs.getString('waga')??'';
    return a;
  }
  Future<String> getWzrost()async{
    final prefs= await SharedPreferences.getInstance();
    String a= prefs.getString('wzrost')?? '';
    return a;
  }
}