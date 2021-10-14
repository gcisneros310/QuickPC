import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_pc/models/cpu.dart';

class DatabaseService{

  final CollectionReference cpuCollection = Firestore.instance.collection('cpus');

  List<CPU> _cpuListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return CPU(
        name: doc.data['name'] ?? '',
        price: doc.data['price'] ?? 0,
        coreClock: doc.data['coreClock'] ?? 0,
        features: doc.data
      );
    }).toList();
  }

  Stream<List<CPU>> get cpus {
    return cpuCollection.snapshots()
    .map(_cpuListFromSnapshot);
  }
}