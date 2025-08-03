import 'package:flutter/material.dart';
import 'package:renthouse/widgets/rounded_container_button.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // Variables de filtre
  String selectedType = 'Studio';
  double selectedBudget = 250000;
  int selectedRooms = 1;

  final List<String> houseTypes = ['Studio', 'Appartement', 'Villa', 'Duplex'];

  void _applyFilters() {
    Navigator.pop(context, {
      'type': selectedType,
      'budget': selectedBudget,
      'rooms': selectedRooms,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filtres"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Type de maison", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              children: houseTypes.map((type) {
                final bool isSelected = type == selectedType;
                return ChoiceChip(
                  label: Text(type),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() => selectedType = type);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            const SizedBox(height: 8),

            Text("Prix maximum: ${selectedBudget.toInt()} FCFA", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Slider(
              min: 50000,
              max: 2000000,
              value: selectedBudget,
              divisions: 40,
              label: "${selectedBudget.toInt()}",
              onChanged: (val) {
                setState(() => selectedBudget = val);
              },
            ),


            const SizedBox(height: 20),
            const Text("Nombre de chambres", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: List.generate(5, (index) {
                final int room = index + 1;
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ChoiceChip(
                    label: Text('$room'),
                    selected: selectedRooms == room,
                    onSelected: (_) {
                      setState(() => selectedRooms = room);
                    },
                  ),
                );
              }),
            ),
            const Spacer(),

            // Bouton Appliquer
            SizedBox(
              child: RoundedContainerButton(
                width: double.infinity, 
                height: 50, 
                onTap: _applyFilters,
                child: Text("Apply Filters", style: TextStyle(color:Colors.white,fontSize: 18, fontWeight: FontWeight.bold)), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
