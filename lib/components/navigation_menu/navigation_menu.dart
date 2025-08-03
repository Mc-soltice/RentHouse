// Importation des packages nécessaires
// Importation des packages nécessaires
import 'package:renthouse/screens/search/search_creen.dart';
import '../../screens/home/home_screen.dart'; // Écran d'accueil de l'application
import '../../screens/user/user_screen.dart'; // Écran de profil de l'utilisateur
import 'package:flutter/material.dart';           // Interface utilisateur Flutter
import 'package:iconsax/iconsax.dart';            // Bibliothèque d'icônes modernes
import 'package:get/get.dart';                    // Package de gestion d'état (GetX)


/// Widget principal représentant le menu de navigation de l'application.
/// Ce widget affiche une `NavigationBar` en bas de l'écran et
/// change dynamiquement le contenu de l'écran selon l'élément sélectionné.
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // Injection du contrôleur NavigationController via GetX
    final controller = Get.put(NavigationController());

    // Vérifie si l'application est en mode sombre (dark mode)
    final darkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      // Affiche une barre de navigation en bas de l'écran
      bottomNavigationBar: Obx( // Obx() réagit automatiquement aux changements d'état de GetX
        () => NavigationBar(
          height: 80,
          selectedIndex: controller.selectedIndex.value, // Index actuellement sélectionné
          onDestinationSelected: (index) => controller.selectedIndex.value = index, // Mise à jour de l'index sélectionné

          // Couleur de fond de la barre en fonction du mode sombre ou clair
          backgroundColor: darkMode ? Colors.black : Colors.white,

          // Couleur de l'indicateur de sélection (avec transparence)
          indicatorColor: darkMode
              ? Colors.black.withAlpha(125)
              : Colors.white.withAlpha(125),

          // Liste des destinations de navigation (icône + texte)
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.search_normal_1), label: 'Search'),
            NavigationDestination(icon: Icon(Iconsax.notification), label: 'Notifications'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),

      // Corps principal de la page qui change selon l'onglet sélectionné
      body: Obx(
        () => controller.screens[controller.selectedIndex.value], // Affiche l'écran sélectionné
      ),
    );
  }
}

/// Contrôleur GetX pour gérer la navigation entre les onglets.
/// Contient un index observable et une liste des écrans à afficher.
class NavigationController extends GetxController {
  /// Index de l'onglet sélectionné, observable avec `.obs`
  final RxInt selectedIndex = 0.obs;

  /// Liste des écrans associés aux différentes sections de la navigation
  final List<Widget> screens = [
    const MyHomePage(title: "Welcome to RentHouse",), // Écran d'accueil
    const SearchScreen(), // Écran de recherche
    Container(color: Colors.green, child: Center(child: Text('Store'))),   // Écran du magasin
    const MyUserScreen(),// Écran de profil
  ];
}