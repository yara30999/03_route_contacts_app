import 'dart:io';

class UserModel {
  final String name, email, number;
  final File? img;

  UserModel(
      {required this.name,
      required this.email,
      required this.number,
      this.img});
}
