import 'package:flutter/material.dart';
import 'package:renthouse/screens/profile/edit_profile.dart';
import 'package:renthouse/screens/setting/setting_screen.dart';
import 'package:renthouse/utiles/colors/color.dart';
import 'package:iconsax/iconsax.dart';
import 'package:renthouse/widgets/container_tiles.dart';
import 'package:renthouse/widgets/custom_list_tyle.dart';
import 'package:renthouse/widgets/rounded_container_button.dart';

class MyUserScreen extends StatefulWidget {
  const MyUserScreen({super.key});

  @override
  State<MyUserScreen> createState() => _MyUserScreenState();
}

class _MyUserScreenState extends State<MyUserScreen> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PreferredSize(
              preferredSize: const Size.fromHeight(250),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    // Bouton à droite
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.settings_outlined,
                                color: Colors.black,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => const MySettingScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Avatar au centre
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Column(
                        children: [
                          // 1. Nom du user
                          Text(
                            'Jean Dupont',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // 2. Contact du user
                          Text(
                            '+237 690000000',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // 3. Bouton éditer le profil
                          RoundedContainerButton(
                            width: 130,
                            height: 50,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => const EditProfileScreen(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  "Éditer",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                // SizedBox(width: 8),
                                // Icon(
                                //   Iconsax.edit_25,
                                //   color: Colors.white,
                                //   size: 20,
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // 4. Liste des actions du profil
            CustomContainerTtyle(
              title: 'Iventories',
              items: [
                MyListTile(
                  icon: Iconsax.shop,
                  title: "Publications",
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  indent: 30,
                  endIndent: 30,
                ),
                MyListTile(
                  icon: Iconsax.bookmark,
                  title: "Wishlist",
                  onTap: () {},
                ),
              ],
            ),
            CustomContainerTtyle(
              title: 'Settings',
              items: [
                MyListTile(
                  icon: Iconsax.message_question,
                  title: "Supports",
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  indent: 30,
                  endIndent: 30,
                ),
                MyListTile(icon: Iconsax.logout, title: "Logout", onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
