import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:carbon_footprint_app/dbHelper/appWrite.dart';
import 'package:carbon_footprint_app/dbHelper/dataModel.dart';

getUserElectricityData(String userid) async {
  client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('65cb0fb9e3ef19f2e74f');

  final databases = Databases(client);
  try {
    final document = databases.listDocuments(
        databaseId: DatabaseId,
        collectionId: Userelectricitydata,
        queries: [Query.equal("id", userid)]);
    log(document.toString());
  } on AppwriteException catch (e) {
    log(e.toString());
  }
}
