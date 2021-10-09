import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_pc/models/cpu.dart';

class DatabaseService{
  String searchTerm;


  /*final CollectionReference cpuCollection = FirebaseFirestore.instance.collection('cpus');


  Query searchData(){
    return FirebaseFirestore.instance.collection('cpus')
        .where('name',isGreaterThanOrEqualTo:  searchTerm)
        .where('name',isLessThanOrEqualTo: searchTerm + '\uF7FF');
  }


  List<CPU> _cpuListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return CPU(
        name: (doc.data() as dynamic)['name'] ?? '',
        price: (doc.data() as dynamic)['price'] ?? 0,
        coreClock: (doc.data() as dynamic)['coreClock'] ?? 0,
        features: doc.data()
      );
    }).toList();
  }


  Stream<List<CPU>> get cpus{

    if (searchTerm != null){
      return searchData().snapshots()
          .map(_cpuListFromSnapshot);
    }
    else{
      return cpuCollection.snapshots()
          .map(_cpuListFromSnapshot);
    }
  }*/

  doSearch(term){
    searchTerm = term;
  }
  DatabaseService({this.searchTerm});
}