import 'package:login_app_bloc/mock/mock_data.dart';
import 'package:login_app_bloc/storage/user_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entitys/user.dart';

class AppData  {
  static Future<void>  initData() async {
    final prefs = await SharedPreferences.getInstance();
    final existingData = prefs.getString(UserStorage.keyUsers);
    if (existingData == null){
        await UserStorage.saveData(mockUsers);
    }
  }
}