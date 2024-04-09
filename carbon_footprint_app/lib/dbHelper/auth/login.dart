import 'package:appwrite/appwrite.dart';
import 'package:carbon_footprint_app/dbHelper/appWrite.dart';
import 'package:flutter/material.dart';

userLogin(String email, String password) async {
  final account = Account(client);

  final session = await account.createEmailSession(
    email: email,
    password: password,
  );
}

userSmsLogin(String phoneNumber) {}
