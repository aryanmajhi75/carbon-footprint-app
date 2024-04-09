import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:carbon_footprint_app/dbHelper/appWrite.dart';
import 'package:carbon_footprint_app/dbHelper/dataModel.dart';

getUserVehicleData(String userid) async {
  client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('65cb0fb9e3ef19f2e74f');

  List<UserVehicleData> someData = [];
  final databases = Databases(client);
  try {
    final document = await databases.listDocuments(
        databaseId: DatabaseId,
        collectionId: Uservehicledata,
        queries: [Query.equal("id", userid)]);
    log(document.toString());
    someData.addAll(document.documents
        .map((e) => UserVehicleData.fromJson(e.data))
        .toList());
    print(someData.runtimeType);
    return someData;
    // document.then((value) {
    //   someData =
    //       value.documents.map((e) => UserVehicleData.fromJson(e.data)).toList();
    //   someData.forEach((element) {
    //     print(element.id);
    //   });
    // return someData;
    // });
  } on AppwriteException catch (e) {
    log(e.toString());
  }
}
