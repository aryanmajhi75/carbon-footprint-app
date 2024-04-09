import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:carbon_footprint_app/dbHelper/appWrite.dart';

getUserBodySensorData(String userid) async {
  client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('65cb0fb9e3ef19f2e74f');

  final databases = Databases(client);
  try {
    final document = await databases.listDocuments(
        databaseId: DatabaseId,
        collectionId: Usersensordata,
        queries: [Query.equal('id', userid)]);
    log(document.toString());
  } on AppwriteException catch (e) {
    log(e.toString());
  }
}
