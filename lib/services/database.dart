import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_pedia/model/coffee.dart';

class DatabaseService {
  final uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference coffeeCollection =
      Firestore.instance.collection('coffee');

  Future updateUserData(String sugars, String name, int strength) async {
    print('sugars == $sugars');
    return await coffeeCollection.document(uid).setData({
      'sugar': sugars,
      'name': name,
      'strength': strength,
    });
  }

  //coffee list from snapshot

  List<Coffee> _coffeeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Coffee(
        name: doc.data['name'] ?? '',
        sugar: doc.data['sugar'] ?? 0,
        strength: doc.data['strength'] ?? '0',
      );
    });
  }

  // get the coffee stream
  Stream<List<Coffee>> get coffee {
    return coffeeCollection.snapshots().map(_coffeeListFromSnapshot);
  }
}
