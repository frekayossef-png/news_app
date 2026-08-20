import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCubit extends Cubit<String> {
  LanguageCubit() : super("") {
    loadLanguage();
  }

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();

    final language = prefs.getString("language") ?? "en";

    emit(language);
  }

  Future<void> changeLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("language", language);

    emit(language);
  }
}
