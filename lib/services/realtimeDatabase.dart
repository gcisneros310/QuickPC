import 'package:firebase_database/firebase_database.dart';
import 'package:quick_pc/models/PCPartClasses/CPU.dart';
import 'package:quick_pc/models/PCPartClasses/GPU.dart';
import 'package:quick_pc/models/PCPartClasses/PCPart.dart';



final databaseReference = FirebaseDatabase.instance.reference();

getTest(){
  databaseReference.child('cpu/').get().then((DataSnapshot data){
    print(data.value);
    print(data.key);
  });
}

Future<List<Part>> getPart(String partType) async {

  List<Part> partList = [];

  print('Inside realtimeDatabase.dart, hello');

  switch (partType) {
    case 'gpu':
      return getGPUList();
    case 'cpu':
      return getCPUList();


  }


  return partList;

  /*DataSnapshot dataSnapshot = await databaseReference.child('cpu/').get();
  List<Part> parts = [];

  if(dataSnapshot.value != null){

    //print(dataSnapshot.value['test2']['name']);

    //each value is a map of the data for this part. value['attribute']

    Part p;
    dataSnapshot.value.forEach((key, value){
      //p = createPart(value);
      parts.add(p);
    });
  }
  //print(parts);
  return parts;*/
}

//CPU list from realtime database
Future<List<Part>> getCPUList() async {

  DataSnapshot dataSnapshot = await databaseReference.child('parts/cpu/').get();
  List<Part> cpuList = [];

  if(dataSnapshot.value != null){

    dataSnapshot.value.forEach((key, value){
      CPU_Part c =  CPU_Part().fromDatabase(value);
      //c.fromDatabase(value);
      //print(value);
      //print('Cores: ');
      //print(c.coreCount);
      cpuList.add(c);
    });
  }

  return cpuList;
}

//graphics cards list from realtime database
Future<List<Part>> getGPUList() async {

  DataSnapshot dataSnapshot = await databaseReference.child('parts/gpu/').get();
  List<Part> gpuList = [];

  if(dataSnapshot.value != null){

    dataSnapshot.value.forEach((key, value){
      GPU_Part g = new GPU_Part();
      g.fromDatabase(value);
      gpuList.add(g);
    });
  }

  return gpuList;
}


