import 'package:appwrite/appwrite.dart';
import 'package:carbon_footprint_app/dbHelper/appWrite.dart';
import 'package:flutter/material.dart';

final account = Account(client);

userSignin(String email, String password) async {
  final user = await account.create(
    userId: ID.unique(),
    email: email,
    password: password,
  );
}
