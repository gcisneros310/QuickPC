import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/models/PCPartClasses/CPU.dart';
import 'package:quick_pc/models/PCPartClasses/Case_Part.dart';
import 'package:quick_pc/models/PCPartClasses/CompletePCBuild.dart';
import 'package:quick_pc/models/PCPartClasses/Cooler_Part.dart';
import 'package:quick_pc/models/PCPartClasses/GPU.dart';
import 'package:quick_pc/models/PCPartClasses/Motherboard_Part.dart';
import 'package:quick_pc/models/PCPartClasses/PCPart.dart';
import 'package:quick_pc/models/PCPartClasses/PSU_Part.dart';
import 'package:quick_pc/models/PCPartClasses/RAM_Part.dart';
import 'package:quick_pc/models/PCPartClasses/Storage_Part.dart';
import 'package:quick_pc/pages/build_list/SavedListInfoPage.dart';

List<Part> demoList = [
  CPU_Part.valueConstructors(
      'Intel Core i9-10940X - Core i9 10th Gen Cascade Lake 14-Core 3.3 GHz LGA 2066 165W Desktop Processor - BX8069510940X',
      'Intel',
      799.99,
      'https://www.newegg.com/intel-core-i9-10th-gen-core-i9-10940x/p/N82E16819118109',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/19-118-109-V01.jpg',
      3.3,
      4.8,
      12
  ),
  Motherboard_Part.demoConstructor(
      'GIGABYTE Z590 AORUS PRO AX LGA 1200 Intel Z590 ATX Motherboard',
      'Gigabyte',
      259.99,
      'https://www.newegg.com/p/N82E16813145268',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/13-145-268-V01.jpg'
  ),
  RAM_Part.demoConstructor(
      'G.SKILL Ripjaws V Series 32GB (2 x 16GB) 288-Pin DDR4 SDRAM DDR4 3200 (PC4 25600) Desktop Memory',
      'G.Skill',
      119.99,
      'https://www.newegg.com/g-skill-32gb-288-pin-ddr4-sdram/p/N82E16820232091?Item=N82E16820232091&quicklink=true',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/20-232-091-04.jpg'
  ),
  GPU_Part.demoConstructor(
      'ASUS TUF Gaming NVIDIA GeForce RTX 3080 V2 OC Edition Graphics Card (PCIe 4.0, 10GB GDDR6X, LHR, HDMI 2.1, DisplayPort 1.4a)',
      'ASUS',
      1532.99,
      'https://www.newegg.com/asus-geforce-rtx-3080-tuf-rtx3080-o10g-v2-gaming/p/N82E16814126525?Item=9SIAPMXFGT6270',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/14-126-525-V01.jpg'
  ),
  PSU_Part.demoConstructor(
      'EVGA SuperNOVA 850 GT, 80 Plus Gold 850W, Auto Eco Mode with FDB Fan, 7 Year Warranty, Power Supply 220-GT-0850-Y1',
      'EVGA',
      129.90,
      'https://www.newegg.com/evga-supernova-850-gt-220-gt-0850-y1-850w/p/N82E16817438199?Item=N82E16817438199&quicklink=true',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/17-438-199-01.jpg'
  ),
  Cooler_Part.demoConstructor(
      'be quiet! 250W TDP Dark Rock Pro 4 CPU Cooler with Silent Wings - PWM Fan - 135 mm',
      'be quiet!',
      89.99,
      'https://www.newegg.com/be-quiet-dark-rock-pro-4-bk022/p/13C-001F-00027',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/13C-001F-00027-S01.jpg'
  ),
  Storage_Part.demoConstructor(
      'SAMSUNG 870 EVO Series 2.5" 500GB SATA III V-NAND Internal Solid State Drive (SSD) MZ-77E500B/AM',
      'Samsung',
      79.99,
      'https://www.newegg.com/samsung-500gb-870-evo-series/p/N82E16820147792?Item=N82E16820147792',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/20-147-792-V01.jpg'
  ),
  Case_Part.demoConstructor(
      'Phanteks Enthoo Pro Series PH-ES614P_BK Black Steel / Plastic ATX Full Tower Computer Case',
      'Phanteks',
      119.99,
      'https://www.newegg.com/black-phanteks-enthoo-pro-atx-full-tower/p/N82E16811854003?Item=N82E16811854003&quicklink=true',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/11-854-003-01.jpg'
  ),
];

class SavedListsPage extends StatefulWidget {
  SavedListsPage({Key key}) : super(key: key);

  @override
  _SavedListsPageState createState() => _SavedListsPageState();
}

class _SavedListsPageState extends State<SavedListsPage> {
  List<CompletePCBuild> savedBuilds = [];
  CompletePCBuild tempBuild = new CompletePCBuild();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    tempBuild.partList = demoList;
    tempBuild.buildName = "TEST BUILD NAME";
    tempBuild.updatePrice();
    tempBuild.buildBudget = 3000.00;
    
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: true,
        title: Text(
          'Saved Builds',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: InkWell(
                  onTap: (){
                    print("THIS GOT CLICKED");
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SavedListInfoPage.sendListInfo(tempBuild))
                    );
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Color(0xFFC8C8C8),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFC8C8C8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 320,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFC8C8C8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tempBuild.buildName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  Text(
                                    'Price Total: \$' + tempBuild.price.toStringAsFixed(2),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    'BudgetTotal: \$' + tempBuild.buildBudget.toStringAsFixed(2),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                              size: 32,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
