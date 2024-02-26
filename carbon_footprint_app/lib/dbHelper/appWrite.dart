import 'dart:convert';
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:carbon_footprint_app/dbHelper/dataModel.dart';

Client client = Client();

const DatabaseId = "65cb13a3230e21986535"; // Database ID
const Appliancedata = "65db9fc3255821077338"; // Appliancedata Collection Id
const Vehicledata = "65db9fb75eb8f7bd2658"; // Vehicledata Collection Id
const Userelectricitydata =
    "65db9f97c01670e31558"; // Userelectricitydata Collection Id
const Userdevicedata = "65db9f89c2b34374ca1c"; // Userdevicedata Collection Id
const Usersensordata = "65db9f7b44f4e5441723"; // Usersensordata Collection Id
const Userlocationdata =
    "65db9f2b7256b34038f8"; // Userlocationdata Collection Id
const Uservehicledata = "65db9f1acfa2c1740000"; // Uservehicledata Collection Id
const Usergeneraldata = "65db9edc4769f917b8dd"; // Usergeneraldata Collection Id

insertUserVehicleData(UserVehicleData doc) async {
  client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('65cb0fb9e3ef19f2e74f');

  final databases = Databases(client);
  var jsondata = doc.toJson();
  // log(jsondata.toString());
  // log(jsondata.runtimeType.toString());
  try {
    final document = databases.createDocument(
        databaseId: DatabaseId,
        collectionId: Uservehicledata,
        documentId: ID.unique(),
        data: jsondata);
  } on AppwriteException catch (e) {
    log(e.toString());
  }
}
