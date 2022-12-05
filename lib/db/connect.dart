import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:crowd/util/constant.dart';

class MongoDatabase {
  static connect() async {
    var db = await Db.create(AppConstant.MONGO_URI);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
  }

  static insert(Map<String, dynamic> object, String collectionName) async {
    var db = await Db.create(AppConstant.MONGO_URI);
    await db.open();
    var collection = db.collection(collectionName);
    var result = collection.insertOne(object);
    print(result);
  }

  static insertMany(
      String collectionName, List<Map<String, dynamic>> object) async {
    var db = await Db.create(AppConstant.MONGO_URI);
    await db.open();
    var collection = db.collection(collectionName);
    var result = collection.insertMany(object);
    print(result);
  }

  static Future<Map<String, dynamic>?> retriveOne(
      String collectionName, Map<String, dynamic> object) async {
    var db = await Db.create(AppConstant.MONGO_URI);
    await db.open();
    var collection = db.collection(collectionName);
    var result = collection.findOne(object);
    print(result);
    return result;
  }

  static Future<List<Map<String, dynamic>>> retrieveMany(
      String collectionName, Map<String, dynamic> object) async {
    var db = await Db.create(AppConstant.MONGO_URI);
    await db.open();
    var collection = db.collection(collectionName);
    var result = collection.find(object);
    print(result);
    return result.toList();
  }

  static Future<List<Map<String, dynamic>>> retrieveAll(
      String collectionName) async {
    var db = await Db.create(AppConstant.MONGO_URI);
    await db.open();
    var collection = db.collection(collectionName);
    var result = collection.find();
    print(result);
    return result.toList();
  }

  static updateOne(String collectionName, Map<String, dynamic> selectObject,
      Map<String, dynamic> object) async {
    var db = await Db.create(AppConstant.MONGO_URI);
    await db.open();
    var collection = db.collection(collectionName);
    collection.updateOne(selectObject, object);
    print("updated");
  }

  static updateMany(String collectionName, Map<String, dynamic> selectObject,
      Map<String, dynamic> object) async {
    var db = await Db.create(AppConstant.MONGO_URI);
    await db.open();
    var collection = db.collection(collectionName);
    collection.updateMany(selectObject, object);
    print("updated many");
  }

  static deleteOne(String collectionName, Map<String, dynamic> object) async {
    var db = await Db.create(AppConstant.MONGO_URI);
    await db.open();
    var collection = db.collection(collectionName);
    collection.deleteOne(object);
    print("deleted");
  }

  static deleteMany(String collectionName, Map<String, dynamic> object) async {
    var db = await Db.create(AppConstant.MONGO_URI);
    await db.open();
    var collection = db.collection(collectionName);
    collection.deleteMany(object);
    print("deleted");
  }
}
