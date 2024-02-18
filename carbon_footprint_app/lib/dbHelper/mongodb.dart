import 'package:mongo_dart/mongo_dart.dart';

const dbName = 'Ecofy';

const defaultUri =
    'mongodb+srv://majhiaryan13:TPK4jb57idXbdRsJ@cluster0.bkeqf8e.mongodb.net/?retryWrites=true&w=majority';

void initDb() async {
  var db = Db(defaultUri);
  await db.open();
}

void find() async {}

void findAll() async {}

void insertData() async {}

void updateData() async {}

void deleteData() async {}

// void main() async {

//   Future cleanupDatabase() async {
//     await db.close();
//   }

//   if (!db.masterConnection.serverCapabilities.supportsOpMsg) {
//     return;
//   }

//   var collectionName = 'testCollection';
//   await db.dropCollection(collectionName);
//   var collection = db.collection(collectionName);

//   var ret = await collection.insertOne(<String, dynamic>{
//     'name': 'Tom',
//     'age': 23,
//     'num_of_members': 3,
//   });

//   if (!ret.isSuccess) {
//     print('Error detected in record insertion');
//   }

//   var res = await collection.findOne();

//   print('Fetched ${res?['name']}');
//   // Tom

//   await cleanupDatabase();
// }