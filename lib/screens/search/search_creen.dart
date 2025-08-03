import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:renthouse/screens/search/filter_screen.dart';
import 'package:renthouse/utiles/colors/color.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _openFilterPage() {
  Navigator.of(context).push(
    PageRouteBuilder(
      opaque: false, // important pour voir derrière
      barrierColor: Colors.black.withAlpha(50), // flou semi-transparent derrière
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return const _FilterModalWrapper();
      },
      transitionsBuilder: (_, animation, __, child) {
        final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeOut);
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1), // depuis le bas
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );
      },
    ),
  );
}


 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: kBackgroundColor,
    body: SafeArea(
      child: Stack(
        children: [
          // Contenu principal
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Text(
                'Search',
                style: TextStyle(
                  color:buttonColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
              // Search Bar
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(30),
                    borderRadius: BorderRadius.circular(15),
                   
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      icon: const Icon(Iconsax.search_normal_1),
                      hintText: "Search",
                      border: InputBorder.none,
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                setState(() {
                                  _searchController.clear();
                                });
                              },
                            )
                          : null,
                    ),
                    onChanged: (value) {
                      setState(() {}); // pour afficher/masquer la croix
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Filtre Icone
              // GestureDetector(
              //   onTap: _openFilterPage,
              //   child: Container(
              //     padding: const EdgeInsets.all(10),
              //     decoration: BoxDecoration(
              //       color:Colors.grey.withAlpha(30),
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //     child: const Icon(
              //       Iconsax.setting_4,
              //       color: Colors.black,
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: _openFilterPage,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Iconsax.setting_4,
                    color: Colors.white,
                  ),
                ),
              )
            ],
                ),
              ),
              // Tu pourras ajouter ici d'autres blocs comme : sliders, dropdown, bouton "Appliquer"
            ],
          ),
        ],
      ),
    ),
  );
}

}
class _FilterModalWrapper extends StatelessWidget {
  const _FilterModalWrapper();
  // const _FilterModalWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.66, // 2/3 de l'écran
        widthFactor: 1,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: const FilterScreen(), // ton écran de filtre
        ),
      ),
    );
  }
}
