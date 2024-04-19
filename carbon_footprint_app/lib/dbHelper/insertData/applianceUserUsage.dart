import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:carbon_footprint_app/dbHelper/appWrite.dart';
import 'package:carbon_footprint_app/dbHelper/dataModel.dart';

insertUserApplianceUsage(ApplianceUsage doc) async {
  client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('65cb0fb9e3ef19f2e74f');

  final databases = Databases(client);
  // log(doc.id);
  // log(doc.brandName);
  // log(doc.type);
  // log(doc.hours.toString());
  var jsondata = doc.toJson();
  // log(jsondata.toString());
  try {
    final document = databases.createDocument(
        databaseId: DatabaseId,
        collectionId: Userapplianceusage,
        documentId: ID.unique(),
        data: jsondata);
  } on AppwriteException catch (e) {
    log(e.toString());
  }
}
