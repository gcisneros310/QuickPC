import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pc/models/PCPartClasses/Notifications.dart';
import 'package:quick_pc/pages/universal_drawer/NavigationDrawer.dart';
import 'package:quick_pc/shared/loading.dart';

final Color logoColor = Color(0xff66c290);

class Notifications2 extends StatefulWidget {
  @override
  _Notifications2State createState() => _Notifications2State();
}

Future<List<Notifications_Data>> getNotifications() async {
  List<Notifications_Data> notifications = [];
  final fb = FirebaseDatabase.instance;
  await fb
      .reference()
      .child("notifications")
      .orderByKey()
      .once().then((result) async {
    if (result.value != null) {
      result.value.forEach((key, childSnapshot) {
        notifications.add(Notifications_Data.fromJson(Map.from(childSnapshot)));
      });
    } else {
      print("get didn't work for reviews");
    }
  }).catchError((e) {
    print("error on reviews: $e");
  });

  return notifications;
}

class _Notifications2State extends State<Notifications2> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getNotifications(),
        builder: (context, projectSnap) {
          if (projectSnap.connectionState == ConnectionState.none &&
              projectSnap.hasData == null && projectSnap.data == null) {
            //print('project snapshot data is: ${projectSnap.data}');
            return Loading();
          }
          if(projectSnap.data == null) {
            print("IF PROJECTSNAP.HASDATA");
            print(projectSnap.data.runtimeType);
            print(projectSnap.data);
            return Loading();
          }
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
              title: const Text("Notifications"),
              backgroundColor: logoColor,
              centerTitle: true,
              elevation: 4,
          ),
          backgroundColor: Color(0xFFF5F5F5),

          drawer: SafeArea(child: NavigationDrawer()),
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: projectSnap.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(6, 0, 6, 0),
                      child: InkWell(
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 8.0,
                            child: Container(
                              width: 100,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,8,8,0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: Image.network(
                                              projectSnap.data[index].imageURL,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 200,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Color(0x4f4f4f),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  projectSnap.data[index].name,
                                                  style:
                                                  TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  projectSnap.data[index].message,
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ),
                    );
                  }
              ),
            ),
          ),
        );
      }
    );
  }


}
