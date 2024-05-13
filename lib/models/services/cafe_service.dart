import 'dart:async';
import 'package:coffee_spot/models/cafe_model.dart';
import 'package:coffee_spot/utils/firebase/firebase_database_reference.dart';
import 'package:firebase_database/firebase_database.dart';

class CafeService {
  Stream<List<CafeModel>> getAllCafesData() {
    StreamController<List<CafeModel>> controller = StreamController();

    Timer timer = Timer(const Duration(seconds: 10), () {
      if (!controller.isClosed) {
        controller.addError("Please check your internet connection and try again.");
      }
    });

    FirebaseDatabaseReference.cafes.onValue.listen(
      (DatabaseEvent event) {
        DataSnapshot snapshot = event.snapshot;
        if (snapshot.value != null) {
          Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
          List<CafeModel> cafesData = [];
          data.forEach((key, value) {
            cafesData.add(CafeModel.fromSnapshot(snapshot.child(key)));
          });
          controller.add(cafesData);
          timer.cancel();
        } else {
          timer.cancel();
          controller.addError("No data available");
        }
      },
    );

    return controller.stream;
  }
}