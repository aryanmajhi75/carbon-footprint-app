import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:carbon_footprint_app/dbHelper/appWrite.dart';

findUserGeneralData(String userid) async {
  client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('65cb0fb9e3ef19f2e74f');

  final databases = Databases(client);
  try {
    final document = await databases.listDocuments(
        databaseId: DatabaseId,
        collectionId: Usergeneraldata,
        queries: [Query.equal('id', userid)]);
    log(document.toString());
    print(document.documents.length);
    print(document.total);
    if (document.total > 0) {
      return true;
    }
    return false;
  } on AppwriteException catch (e) {
    log(e.toString());
  }
}
