import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/constants.dart';

class UserModel {
  final int id;
  final String username;
  final String email;
  final String token;
  final String image;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.token,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      token:
          json['accessToken'] ??
          "", // dummyjson sometimes returns 'token' or 'accessToken'
      image: json['image'],
    );
  }
}
