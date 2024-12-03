import 'dart:io';

class UserModer {
  final String name, email, number;
  final File? img;

  UserModer(
      {required this.name,
      required this.email,
      required this.number,
      this.img});
}
