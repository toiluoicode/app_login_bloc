import '../entitys/contact.dart';
import '../entitys/user.dart';

final mockUsers = [
  User(
    userName: "admin",
    passWord: "admin",
    listContact: [
      Contact(name: "Lan", phone: "0123456789"),
      Contact(name: "Nam", phone: "0987654321"),
      Contact(name: "Hùng", phone: "0112233445"),
    ],
  ),
  User(
    userName: "user1",
    passWord: "pass1",
    listContact: [
      Contact(name: "Minh", phone: "0998877665"),
      Contact(name: "Mai", phone: "0223344556"),
    ],
  ),
  User(
    userName: "user2",
    passWord: "pass2",
    listContact: [
      Contact(name: "Tuấn", phone: "0887766554"),
    ],
  ),
  User(
    userName: "user3",
    passWord: "pass3",
    listContact: [],
  ),
  User(
    userName: "user4",
    passWord: "pass4",
    listContact: [
      Contact(name: "Hoa", phone: "0334455667"),
      Contact(name: "Hạnh", phone: "0445566778"),
      Contact(name: "Quang", phone: "0556677889"),
      Contact(name: "Thảo", phone: "0667788990"),
    ],
  ),
  User(
    userName: "user5",
    passWord: "pass5",
    listContact: [],
  ),
];
