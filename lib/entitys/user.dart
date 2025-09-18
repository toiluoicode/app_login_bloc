import 'package:login_app_bloc/entitys/contact.dart';
class User {
  final String userName;
  final String passWord;
  List<Contact> listContact;
  User({
    required this.userName,
    required this.passWord,
    List<Contact>? listContact,
  }) : listContact = listContact ?? [];

  Map<String, dynamic> toJson() {
    return {
      'username' : userName,
      'password' : passWord,
      'listContact' : listContact?.map((c) => c.toJson()).toList(),
    };
  }

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      userName: json['username'] as String,
       passWord: json['password'] as String,
       listContact: (json['listContact'] as List<dynamic>?)
          ?.map((c)=> Contact.fromJson(c as Map<String, dynamic>)).toList(),
    );
  }
  User coppyWithList({List<Contact>? listContact }){
      return User(
          userName: userName,
          passWord: passWord,
          listContact: listContact ?? List<Contact>.from(this.listContact),
      );
  }
}
