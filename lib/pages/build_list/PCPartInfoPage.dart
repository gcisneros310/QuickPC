
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/models/PCPartClasses/CPU.dart';
import 'package:quick_pc/presentation/p_c_part_info_icons_icons.dart';

class PCPartInfoPage extends StatefulWidget {
  PCPartInfoPage({Key key}) : super(key: key);

  @override
  _PCPartInfoPageState createState() => _PCPartInfoPageState();
}

class _PCPartInfoPageState extends State<PCPartInfoPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Color logoColor = Color(0xff66c290);

  CPU_Part cpuObj = CPU_Part.valueConstructors("Ryzen 5 5600X", "AMD", 299.99, 'https://c1.neweggimages.com/ProductImageCompressAll1280/19-113-666-V01.jpg', 3.6, 4.4, 8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: (Text("CPU Information Page")),
        backgroundColor: logoColor,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 15),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                    child: Image.network(
                      cpuObj.productImageURL,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Text(
                      cpuObj.partName,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ), // IMAGE AND TITLE
                  Divider(
                    thickness: 5,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Container(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      PCPartInfoIcons.dollar,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ),

                                  Text(
                                    'Price',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Text(
                            cpuObj.price.toString(),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                          )
                        ],
                      ),
                    ),
                  ), // CORE COUNT
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Container(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      PCPartInfoIcons.manufacturer,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ),

                                  Text(
                                    'Manufacturer',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Text(
                            cpuObj.manufacturerName.toString(),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                          )
                        ],
                      ),
                    ),
                  ), // CORE COUNT
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Container(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      PCPartInfoIcons.base_clock,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ),

                                  Text(
                                    'Base Clock',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Text(
                            cpuObj.base_clock.toString() + "MHz",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                          )
                        ],
                      ),
                    ),
                  ), // CORE COUNT
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Container(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      PCPartInfoIcons.boost_clock,
                                      color: Colors.black,
                                      size: 24,
                                    ),
                                  ),

                                  Text(
                                    'Boost Clock',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Text(
                            cpuObj.coreCount.toString(),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                          )
                        ],
                      ),
                    ),
                  ), // CORE COUNT
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: Container(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    PCPartInfoIcons.hashtag,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),

                                Text(
                                  'Core Count',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )
                          ),
                          Text(
                            cpuObj.coreCount.toString(),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                          )
                        ],
                      ),
                    ),
                  ), // CORE COUNT

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
