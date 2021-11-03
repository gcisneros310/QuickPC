import 'package:firebase_database/firebase_database.dart';
import 'package:quick_pc/models/PCPartClasses/CPU.dart';
import 'package:quick_pc/models/PCPartClasses/CompletePCBuild.dart';
import 'package:quick_pc/models/PCPartClasses/GPU.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';


final databaseReference = FirebaseDatabase.instance.reference();

getTest(){
  databaseReference.child('cpu/').get().then((DataSnapshot data){
    print(data.value);
    print(data.key);
  });
}

getCPU(){
  databaseReference.child('cpu/').get().then((DataSnapshot data){
  });
}

Future<void> sendListToDatabase(Map<String,dynamic> json) async {
  await databaseReference.child('build list/').push().update(json);
}


Future<List<CompletePCBuild>> getSavedUserBuilds(int userID) async {
  List<CompletePCBuild> savedBuildLists = [];

  DataSnapshot dataSnapshot = await databaseReference.child('build list/').get();
  if(dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value){
      CompletePCBuild temp =  CompletePCBuild.fromJson(value);
      //c.fromDatabase(value);
      //print(value);
      //print('CPU Name: ' + c.partName);
      savedBuildLists.add(temp);
    });

  }
  }

getBuilds(String id){

  //id = "8wWhlPnAeyQKQ5Dp2ZrdiQE5Ibc2";

  databaseReference.child('build list/').orderByChild("buildUserID").equalTo(id)
      .once().then((DataSnapshot data){

    data.value.forEach((key, value){

      print(key);
      print(value);

    });
  });
}

//PASS A STRING INDICATING THE TYPE
//RETURNS A LIST OF THAT TYPE OF PART
Future<List<Part>> getPart(String partType) async {

  List<Part> partList = [];

  print('Inside realtimeDatabase.dart, hello');


  switch (partType) {
    case 'cpu':
      return getCPUList();
    case 'gpu':
      return getGPUList();

  }

  return partList;
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
      //print('CPU Name: ' + c.partName);
      cpuList.add(c);
    });
  }

  return cpuList;
}

//Graphics-Cards list from realtime database
Future<List<Part>> getGPUList() async {

  DataSnapshot dataSnapshot = await databaseReference.child('parts/gpu/').get();
  List<Part> gpuList = [];

  if(dataSnapshot.value != null){

    dataSnapshot.value.forEach((key, value){
      GPU_Part g = GPU_Part().fromDatabase(value);
      gpuList.add(g);
    });
  }

  return gpuList;
}


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