import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_pc/models/PCPartClasses/CPU.dart';
import 'package:quick_pc/models/PCPartClasses/CompletePCBuild.dart';
import 'package:quick_pc/models/PCPartClasses/GPU.dart';
import 'package:quick_pc/models/PCPartClasses/Motherboard_Part.dart';
import 'package:quick_pc/models/PCPartClasses/PCPart.dart';
import 'package:quick_pc/models/PCPartClasses/RAM_Part.dart';
import 'package:quick_pc/pages/build_list/PCPartInfoPage.dart';
import 'package:quick_pc/pages/home/trending_popular.dart';

class PopularFields extends StatefulWidget {
  @override
  _PageNotImplemented createState() => _PageNotImplemented();
}

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
  CPU_Part.valueConstructors(
      'AMD Ryzen 7 5700G 3.8 GHz 8-Core Processor - 100-100000263BOX',
      'AMD',
      324.99,
      'https://www.newegg.com/amd-ryzen-7-5700g-ryzen-7-5000-g-series/p/N82E16819113682',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/19-113-682-V01.jpg',
      3.8,
      4.6,
      8
  ),
  CPU_Part.valueConstructors(
      'AMD Threadripper 3990X 2.9 GHz 64-Core Processor - 100-100000163WOF',
      'AMD',
      3964.99,
      'https://www.newegg.com/amd-ryzen-threadripper-3990x/p/N82E16819113620',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/19-113-620-V02.jpg',
      2.9,
      4.3,
      64
  ),
  CPU_Part.valueConstructors(
      'AMD Ryzen 7 3800X 3.9 GHz 8-Core Processor - Ryzen 7 3800X100-100000025BOX',
      'AMD',
      348.75,
      'https://www.newegg.com/amd-ryzen-7-3800x/p/N82E16819113104',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/19-113-104-V03.jpg',
      3.9,
      4.5,
      8
  ),
  CPU_Part.valueConstructors(
      'Intel Core i7-9700K 3.6 GHz 8-Core Processor - BX80684I79700K',
      'Intel',
      308.88,
      'https://www.newegg.com/core-i7-9th-gen-intel-core-i7-9700k/p/N82E16819117958',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/19-117-958-V22.jpg',
      3.6,
      4.9,
      8
  ),
  CPU_Part.valueConstructors(
      'Intel Core i9-9900K 3.6 GHz 8-Core Processor - BX80684I99900K',
      'Intel',
      465.86,
      'https://www.newegg.com/core-i9-9th-gen-intel-core-i9-9900k/p/N82E16819117957',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/19-117-957-01.jpg',
      3.6,
      5,
      8
  ),
  GPU_Part.demoConstructor(
      'ASUS TUF Gaming NVIDIA GeForce RTX 3080 V2 OC Edition Graphics Card (PCIe 4.0, 10GB GDDR6X, LHR, HDMI 2.1, DisplayPort 1.4a)',
      'ASUS',
      1532.99,
      'https://www.newegg.com/asus-geforce-rtx-3080-tuf-rtx3080-o10g-v2-gaming/p/N82E16814126525?Item=9SIAPMXFGT6270',
      'https://c1.neweggimages.com/ProductImageCompressAll1280/14-126-525-V01.jpg'
  ),
];

class _PageNotImplemented extends State<PopularFields> {
  final Color logoColor = Color(0xff66c290);
  final Color greyout = Colors.grey;
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerMessage = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget testWidget(int partIndex, String partType ){
    CompletePCBuild buildObj = new CompletePCBuild.demoConstructor();
    //buildObj = widget.buildObject;
    buildObj.partList = demoList;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => PCPartInfoPage.loadPartInfo(buildObj, buildObj.partList[partIndex], partType)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SizedBox(height:5),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity((0.5)),
                    offset: Offset(0,3),
                  ),
                ],
              ),
              child: Container(
                width: 190,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 142,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image:DecorationImage(
                              //fit: BoxFit.fill,
                              image: NetworkImage(demoList[partIndex].productImageURL),
                          ),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal:20, vertical: 10),
                      width: 190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  child: Text(demoList[partIndex].partName, style: GoogleFonts.exo2(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,)),
                              //Icon(Icons.add_circle)
                            ],
                          ),
                          Text("\$${demoList[partIndex].price.toString()}", style: GoogleFonts.exo2(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Popular"),
        titleTextStyle: GoogleFonts.exo2(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        backgroundColor: Colors.grey[500],
        centerTitle: true,
        // title: Text("Contact Us"),
        elevation: 0.0,
      ),
      body: Container(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 2,
          ),
          children: [
            testWidget(0, "cpu"),
            testWidget(1, "cpu"),
            testWidget(2, "cpu"),
            testWidget(3, "cpu"),
            testWidget(4, "cpu"),
            testWidget(5, "cpu"),
            testWidget(3, "cpu"),
            testWidget(3, "cpu"),
          ],
        ),
      ),
    );
  }


}