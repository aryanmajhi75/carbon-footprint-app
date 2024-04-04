import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:carbon_footprint_app/dbHelper/appWrite.dart';
import 'package:carbon_footprint_app/dbHelper/dataModel.dart';

insertUserLocationData(UserBodySensorData doc) async {
  client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('65cb0fb9e3ef19f2e74f');

  final databases = Databases(client);
  var jsondata = doc.toJson();
  try {
    final document = databases.createDocument(
        databaseId: DatabaseId,
        collectionId: Usersensordata,
        documentId: ID.unique(),
        data: jsondata);
  } on AppwriteException catch (e) {
    log(e.toString());
  }
}
