// Importation du package Flutter nécessaire pour créer des interfaces utilisateur
import 'package:flutter/material.dart';

/// Classe personnalisée pour découper un widget avec des bords inférieurs incurvés.
/// Utilisée avec le widget `ClipPath` pour appliquer une forme spécifique à un conteneur ou à une image.
///
/// Cette classe hérite de `CustomClipper<Path>` et redéfinit la méthode `getClip`
/// pour définir le chemin (path) à utiliser pour découper le widget cible.
class TCustomCurvedEdges extends CustomClipper<Path> {

  /// Définit la forme personnalisée à appliquer.
  /// Cette méthode est appelée automatiquement pour créer un `Path` (chemin) utilisé pour découper le widget.
  @override
  Path getClip(Size size) {
    // Création d'un nouveau chemin de découpe
    var path = Path();

    // Commence en haut à gauche, descend verticalement jusqu'en bas à gauche
    path.lineTo(0, size.height);

    // Première courbe : légère bosse vers la droite (effet de vague)
    final firstCurve = Offset(0, size.height - 20);       // Point de contrôle
    final lastCurve = Offset(30, size.height - 20);       // Point d'arrivée
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    // Deuxième courbe : ligne horizontale courbée jusqu'à presque l'extrémité droite
    final secondCurve = Offset(0, size.height - 20);       // Point de contrôle
    final secondLastCurve = Offset(size.width, size.height - 20); // Point d'arrivée
    path.quadraticBezierTo(secondCurve.dx, secondCurve.dy, secondLastCurve.dx, secondLastCurve.dy);

    // Ligne droite vers le coin supérieur droit
    path.lineTo(size.width, 0);


    // Ferme le chemin pour former une zone fermée
    path.close;

    // Retourne la forme définie
    return path;
  }

  /// Indique s’il faut re-clipper (recalculer la forme) lorsque le widget est reconstruit.
  /// Ici, `true` signifie que la forme sera recalculée à chaque fois.
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
