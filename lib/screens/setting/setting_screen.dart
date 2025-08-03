import 'package:flutter/material.dart';
import 'package:renthouse/utiles/colors/color.dart';
import 'package:iconsax/iconsax.dart';
import 'package:renthouse/widgets/container_tiles.dart';
import 'package:renthouse/widgets/custom_list_tyle.dart';

class MySettingScreen extends StatefulWidget {
  const MySettingScreen({super.key});

  @override
  State<MySettingScreen> createState() => _MySettingScreenState();
}

class _MySettingScreenState extends State<MySettingScreen> {
  bool isThemeDark = false;
  bool isPushNotificationEnabled = true;

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: kBackgroundColor,
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top:50), // <-- Ajout du padding ici
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ]
            ),

            const SizedBox(height: 30),

            CustomContainerTtyle(
              title: 'Iventories',
              items: [
                MyListTile(
                  icon: Iconsax.global,
                  title: "Language",
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  indent: 30,
                  endIndent: 30,
                ),
                MyListTile(
                  icon: Iconsax.message_question,
                  title: "Supports",
                  onTap: () {},
                ),
              ],
            ),
            CustomContainerTtyle(
              title: 'Settings',
              items: [
                MyListTile(
                  icon: Iconsax.moon,
                  title: "Theme",
                  switchValue: isPushNotificationEnabled,
                  onSwitchChanged: (value) {
                    setState(() {
                      isPushNotificationEnabled = value;
                    });
                  },
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  indent: 30,
                  endIndent: 30,
                ),
                MyListTile(
                  icon: Iconsax.notification,
                  title: "Push Notifications",
                  switchValue: isThemeDark,
                  onSwitchChanged: (value) {
                    setState(() {
                      isThemeDark = value;
                    });
                  },
                  onTap: () {},
                ),
                // const Divider(
                //   color: Colors.grey,
                //   thickness: 0.5,
                //   indent: 30,
                //   endIndent: 30,
                // ),
                // MyListTile(
                //   icon: Iconsax.logout,
                //   title: "Logout",
                //   onTap: () {},
                // ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

}
