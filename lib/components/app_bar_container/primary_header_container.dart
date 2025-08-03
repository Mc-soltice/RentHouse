// Importation de widgets personnalisés utilisés pour la mise en forme
import 'package:flutter/material.dart';
import '../curved_edges/curved_edge_widget.dart'; // Widget avec bords incurvés
import './circular_container.dart';       // Widget de conteneur circulaire
import './../../utiles/colors/color.dart';                                            // Couleurs personnalisées (TColors)


class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: kBlueColor, // Couleur de fond du conteneur principal
        // color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 250,
          child: Stack(
            children: [
              // Cercles décoratifs
              Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                  backgroundColor: TColors.textwhite.withAlpha(25),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  backgroundColor: TColors.textwhite.withAlpha(25),
                ),
              ),

              /// 👉 Nouvelle ligne pour afficher le contenu (AppBar personnalisée)
              if (child != null)
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30), // Marge en haut pour éviter les collisions
                    child: child,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

