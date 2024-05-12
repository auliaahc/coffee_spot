import 'dart:async';
import 'package:coffee_spot/utils/firebase/firebase_database_reference.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:coffee_spot/models/cafe_model.dart';

class CafeService {
  Stream<List<CafeModel>> getAllCafesData() {
    StreamController<List<CafeModel>> controller = StreamController();
    FirebaseDatabaseReference.cafes.onValue.listen((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
      List<CafeModel> cafesData = [];
      data.forEach((key, value) {
        cafesData.add(CafeModel.fromSnapshot(snapshot.child(key)));
      });
      controller.add(cafesData);
    });
    return controller.stream;
  }
}