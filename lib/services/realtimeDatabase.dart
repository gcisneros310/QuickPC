import 'package:firebase_database/firebase_database.dart';
import 'package:quick_pc/models/PCPartClasses/CPU.dart';
import 'package:quick_pc/models/PCPartClasses/Case_Part.dart';
import 'package:quick_pc/models/PCPartClasses/CompletePCBuild.dart';
import 'package:quick_pc/models/PCPartClasses/Cooler_Part.dart';
import 'package:quick_pc/models/PCPartClasses/GPU.dart';
import 'package:quick_pc/models/PCPartClasses/Motherboard_Part.dart';
import 'package:quick_pc/models/PCPartClasses/Notifications.dart';
import 'package:quick_pc/models/PCPartClasses/PSU_Part.dart';
import 'package:quick_pc/models/PCPartClasses/Part.dart';
import 'package:quick_pc/models/PCPartClasses/RAM_Part.dart';
import 'package:quick_pc/models/PCPartClasses/Storage_Part.dart';


final databaseReference = FirebaseDatabase.instance.reference();

getTest(){
  databaseReference.child('cpu/').get().then((DataSnapshot data){
    print(data.value);
    print(data.key);
  });
}

Future<List<Part>> getPopCPU() async {

  DataSnapshot dataSnapshot = await databaseReference.child('parts/cpu/').limitToFirst(50).once();
  List<Part> cpuList = [];

  if(dataSnapshot.value != null){

    dataSnapshot.value.forEach((key, value){
      CPU_Part c =  CPU_Part.fromJson2(value);
      cpuList.add(c);
      c.loadMap(value);
    });
  }

  return cpuList;
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
    case 'ram':
      return getRamList();
    case 'motherboard':
      return getMoboList();
    case 'storage':
      return getStorageList();
    case 'psu':
      return getPSUList();
    case 'case':
      return getCaseList();
    case 'cooler':
      return getCoolerList();

  }

  return partList;
}



//CPU list from realtime database
Future<List<Part>> getCPUList() async {

  DataSnapshot dataSnapshot = await databaseReference.child('parts/cpu/').get();
  List<Part> cpuList = [];

  if(dataSnapshot.value != null){

    dataSnapshot.value.forEach((key, value){
      //print(value);
      CPU_Part c =  CPU_Part.fromJson2(value);
      cpuList.add(c);
      c.loadMap(value);
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
      print(value);
      GPU_Part g = GPU_Part.fromJson2(value);
      gpuList.add(g);
      g.loadMap(value);
    });
  }

  return gpuList;
}

//Ram
Future<List<Part>> getRamList() async {

  DataSnapshot dataSnapshot = await databaseReference.child('parts/ram/').get();
  List<Part> ramList = [];

  if(dataSnapshot.value != null){
    dataSnapshot.value.forEach((key, value){
      RAM_Part r = RAM_Part.fromJson2(value);
      ramList.add(r);
      r.loadMap(value);
    });
  }

  return ramList;
}

//Motherboard
Future<List<Part>> getMoboList() async {

  DataSnapshot dataSnapshot = await databaseReference.child('parts/motherboard/').get();
  List<Part> list = [];

  if(dataSnapshot.value != null){
    dataSnapshot.value.forEach((key, value){
      Motherboard_Part p = Motherboard_Part.fromJson2(value);
      list.add(p);
      p.loadMap(value);
    });
  }

  return list;
}

Future<List<Part>> getStorageList() async {

  DataSnapshot dataSnapshot = await databaseReference.child('parts/storage/').get();
  List<Part> list = [];

  if(dataSnapshot.value != null){
    dataSnapshot.value.forEach((key, value){
      Storage_Part p = Storage_Part.fromJson2(value);
      list.add(p);
      p.loadMap(value);
    });
  }

  return list;
}

Future<List<Part>> getPSUList() async {

  DataSnapshot dataSnapshot = await databaseReference.child('parts/psu/').get();
  List<Part> list = [];

  if(dataSnapshot.value != null){
    dataSnapshot.value.forEach((key, value){
      PSU_Part p = PSU_Part.fromJson2(value);
      list.add(p);
      p.loadMap(value);
    });
  }

  return list;
}

Future<List<Part>> getCaseList() async {

  DataSnapshot dataSnapshot = await databaseReference.child('parts/case/').get();
  List<Part> list = [];

  if(dataSnapshot.value != null){
    dataSnapshot.value.forEach((key, value){
      Case_Part p = Case_Part.fromJson2(value);
      list.add(p);
      p.loadMap(value);
    });
  }

  return list;
}

Future<List<Part>> getCoolerList() async {

  DataSnapshot dataSnapshot = await databaseReference.child('parts/cooler/').get();
  List<Part> list = [];

  if(dataSnapshot.value != null){
    dataSnapshot.value.forEach((key, value){
      Cooler_Part p = Cooler_Part.fromJson2(value);
      list.add(p);
      p.loadMap(value);
    });
  }

  return list;
}

