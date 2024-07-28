import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseReference {
  static DatabaseReference cafes = FirebaseDatabase.instance.ref('cafes');
}