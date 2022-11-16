import 'dart:developer';
import 'package:crowd/util/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static connect() async {
    var db = await Db.create(MONGO_URI);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
  }

  static create(String collectionName) async {
    var db = await Db.create(MONGO_URI);
    await db.open();
    db.collection(collectionName);
  }

  static insert(Map<String, dynamic> object, String collectionName) async {
    var db = await Db.create(MONGO_URI);
    await db.open();
    var collection = db.collection(collectionName);
    collection.insertOne(object);
  }

  static insertMany(
      String collectionName, List<Map<String, dynamic>> object) async {
    var db = await Db.create(MONGO_URI);
    await db.open();
    var collection = db.collection(collectionName);
    collection.insertMany(object);
  }

  static Future<Map<String, dynamic>?> retriveOne(
      String collectionName, Object object) async {
    var db = await Db.create(MONGO_URI);
    await db.open();
    var collection = db.collection(collectionName);
    var result = collection.findOne(object);
    print(result);
    return result;
  }

  static Future<List<Map<String, dynamic>>> retrieveMany(
      String collectionName, Object object) async {
    var db = await Db.create(MONGO_URI);
    await db.open();
    var collection = db.collection(collectionName);
    var result = collection.find(object);
    print(result);
    return result.toList();
  }

  static updateOne(
      String collectionName, Object selectObject, Object object) async {
    var db = await Db.create(MONGO_URI);
    await db.open();
    var collection = db.collection(collectionName);
    collection.updateOne(selectObject, object);
    print("updated");
  }

  static updateMany(
      String collectionName, Object selectObject, Object object) async {
    var db = await Db.create(MONGO_URI);
    await db.open();
    var collection = db.collection(collectionName);
    collection.updateMany(selectObject, object);
    print("updated many");
  }

  static deleteOne(String collectionName, Object object) async {
    var db = await Db.create(MONGO_URI);
    await db.open();
    var collection = db.collection(collectionName);
    collection.deleteOne(object);
    print("deleted");
  }

  static deleteMany(String collectionName, Object object) async {
    var db = await Db.create(MONGO_URI);
    await db.open();
    var collection = db.collection(collectionName);
    collection.deleteMany(object);
    print("deleted");
  }
}
