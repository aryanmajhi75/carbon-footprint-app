import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:carbon_footprint_app/dbHelper/appWrite.dart';
import 'package:carbon_footprint_app/dbHelper/dataModel.dart';

getUserApplianceUsage(String userid) async {
  client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('65cb0fb9e3ef19f2e74f');

  List<ApplianceUsage> someData = [];
  final databases = Databases(client);
  try {
    final document = await databases.listDocuments(
        databaseId: DatabaseId,
        collectionId: Userapplianceusage,
        queries: [Query.equal('id', userid)]);
    // log(document.toString());
    print("Runtime Type : ${document.runtimeType}");
    someData.addAll(document.documents
        .map((e) => ApplianceUsage.fromJson(e.data))
        .toList());
    return someData;
  } on AppwriteException catch (e) {
    log(e.toString());
  }
}
