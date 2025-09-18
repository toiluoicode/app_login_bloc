// import 'dart:convert';
//
// import 'package:login_app_bloc/entitys/user.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class UserStorage {
//   static const String keyUsers = "users";
//   static Future<void> saveData (List<User> users) async{
//     final pref = await SharedPreferences.getInstance();
//     String jsonString = jsonEncode(users.map((u)=> u.toJson()).toList());
//     await pref.setString(keyUsers, jsonString);
//   }
//   static Future<List<User>> loadUsers () async{
//     final pref = await SharedPreferences.getInstance();
//     String?  jsonStr =  pref.getString(keyUsers);
//     if (jsonStr == null) return [];
//     List<dynamic> jsonList = jsonDecode(jsonStr);
//     // List<User> users = [];
//     // for (var userJson in jsonList) {
//     //   User user = User.fromJson(userJson);
//     //   users.add(user);
//     // }
//     return  jsonList.map((e) => User.fromJson(e)).toList();
//   }
// }