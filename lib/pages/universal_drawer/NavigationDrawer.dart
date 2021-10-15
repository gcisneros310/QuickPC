
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_pc/pages/bottom_navigation/bottom_navigation_bar.dart';
import 'package:quick_pc/pages/build_guide/build_guide_intro_page.dart';
import 'package:quick_pc/pages/home/home.dart';
import 'package:quick_pc/pages/search/pick_search.dart';

class NavigationDrawer extends StatelessWidget{
  final padding = EdgeInsets.symmetric(horizontal: 20);
  final Color logoColor = Color(0xFF464746);

  Widget build(BuildContext context) {
    final drawerTitle = 'QuickPC';
    final subTitle = 'Navigation Menu';
    final drawerImage = 'assets/images/QuickPCLogo.png';

    return Drawer(
      child: Material(
        color: logoColor,
        child: ListView(
          padding: padding,
          children: <Widget> [
            buildHeader(),
            Divider(color: Colors.white70),
            const SizedBox(height: 10),
            buildMenuItem(
              text: 'Home Page',
              icon: Icons.home,
              onClicked: () => selectedItem(context, -1),
            ),
            const SizedBox(height: 14,),
            buildMenuItem(
              text: 'Search Parts',
              icon: Icons.search,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 14,),
            buildMenuItem(
              text: 'Build PC',
              icon: Icons.build,
              onClicked: () => selectedItem(context, 1),

            ),
            const SizedBox(height: 14,),
            buildMenuItem(
              text: 'Suggest PC',
              icon: Icons.desktop_windows_rounded,
              onClicked: () => selectedItem(context, 2),

            ),
            const SizedBox(height: 14,),
            buildMenuItem(
              text: 'Build Guide',
              icon: Icons.file_copy_outlined,
              onClicked: () => selectedItem(context, 3),

            ),
            const SizedBox(height: 10),
            Divider(color: Colors.white70),
            const SizedBox(height: 10),
            const SizedBox(height: 14,),
            buildMenuItem(
              text: 'Account',
              icon: Icons.account_circle_outlined,
              onClicked: () => selectedItem(context, 4),
            ),
            const SizedBox(height: 14,),
            buildMenuItem(
              text: 'Contact Us',
              icon: Icons.email_outlined,
              onClicked: () => selectedItem(context, 5),
            ),
            const SizedBox(height: 14,),
            buildMenuItem(
              text: 'About Us',
              icon: Icons.info_outline,
              onClicked: () => selectedItem(context, 6),
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.white70),
            const SizedBox(height: 10),
            const SizedBox(height: 14,),
            buildMenuItem(
              text: 'Sign Out',
              icon: Icons.exit_to_app,
              onClicked: () => selectedItem(context, 7),
            ),

          ]
        ),
      )
    );
  }

  Widget buildHeader({
  Image image,
    String title,
    String subtitle,
}) => InkWell(
    child: Container(
      padding: padding.add(EdgeInsets.symmetric(vertical: 10)),
      child: Row(
        children: [
          Image(
            image: AssetImage('assets/images/QuickPCLogo.png'),
            height: 90,
              width: 90,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "QuickPC",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )
              ),
              Text(
                  "Navigation Tool",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )
              )
            ],
          )
        ],
      )
    )
  );
  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch(index) {
      case -1:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BottomNav(),
        ));
        break;
      case 0:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => PickSearch(),
        ));
        break;
      case 1:
        break;
      case 2:

        break;
      case 3:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BuildGuideIntro(),
        ));
        break;
      case 4:

        break;
      case 5:

        break;
      case 6:

        break;
      case 7:

        break;

    }
  }
}