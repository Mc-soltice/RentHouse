// Importation des packages nécessaires
import 'package:flutter/material.dart';

// Importation des couleurs personnalisées (TColors)
import '../../utiles/colors/color.dart';

/// Widget personnalisable qui représente un conteneur circulaire ou arrondi.
/// Il peut servir d'élément décoratif ou de conteneur pour un autre widget (`child`).
/// La forme du conteneur est définie par un `borderRadius` (par défaut très arrondi).
///
/// Exemple d’utilisation :
/// ```dart
/// TCircularContainer(
///   backgroundColor: TColors.primary,
///   child: Icon(Icons.star),
/// )
/// ```
class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,

    // Contenu interne du conteneur
    this.child,

    // Largeur du conteneur (par défaut 400)
    this.width = 400,

    // Hauteur du conteneur (par défaut 400)
    this.height = 400,

    // Rayon de courbure des coins (par défaut 400 pour un effet très arrondi)
    this.radius = 400,

    // Marge intérieure du conteneur (padding) — par défaut aucun
    this.padding = 0,

    // Couleur de fond du conteneur (par défaut blanc)
    this.backgroundColor = TColors.white,
  });

  final double? width;              // Largeur personnalisable du conteneur
  final double? height;             // Hauteur personnalisable du conteneur
  final double radius;              // Rayon pour les coins arrondis
  final double padding;             // Espace intérieur
  final Widget? child;              // Widget contenu dans le conteneur
  final Color? backgroundColor;     // Couleur de fond

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,                              // Applique la largeur donnée
      height: height,                            // Applique la hauteur donnée
      padding: EdgeInsets.all(padding),          // Ajoute le padding autour du child
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius), // Coins arrondis selon le rayon
        color: backgroundColor,                       // Applique la couleur de fond
      ),
      child: child,                             // Affiche le contenu (s'il y en a)
    );
  }
}
