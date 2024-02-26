import 'dart:developer';

import 'package:carbon_footprint_app/dbHelper/dataModel.dart';
import 'package:mongo_dart/mongo_dart.dart';

const dbName = 'Ecofy';

const String defaultUri =
    "mongodb+srv://majhiaryan13:TPK4jb57idXbdRsJ@cluster0.bkeqf8e.mongodb.net/Ecofy?retryWrites=true&w=majority&appName=Cluster0";

var db;

Future<void> initDb() async {
  try {
    db = await Db.create(defaultUri);
    await db.open();
    // inspect(db);
    log("db OPENED");
  } catch (e) {
    log(e.toString());
  }
  // return db;
}

closeDb() async {
  await db!.close();
}

search(
  String collection,
) async {
  var coll = db!.collection(collection);
  closeDb();
}

findOne(
  String collection,
) async {
  var coll = db!.collection(collection);
  closeDb();
}

findAll(
  String collection,
) async {
  var coll = db!.collection(collection);
  closeDb();
}

insertData(
  String collection,
) async {
  var coll = db!.collection(collection);
  closeDb();
}

insertVehicleData(String collection, UserVehicleData document) async {
  initDb();
  var coll = db!.collection(collection);
  var response = await coll.insert(document.toJson());
  closeDb();
}

updateData(String collection, var value) async {
  var coll = db!.collection(collection);
  coll.updateOne("vehicle", value);
  closeDb();
}

deleteData(String collection) async {
  var coll = db!.collection(collection);
  closeDb();
}
