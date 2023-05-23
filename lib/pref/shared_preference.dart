import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  void setHistory(String word) async {
    SharedPreferences getPref = await _pref;
    getPref.setString('word', word);
  }

  Future<String> getHistory() async {
    SharedPreferences getPref = await _pref;
    String username = getPref.getString('word') ?? 'notFound';
    return username;
  }

}