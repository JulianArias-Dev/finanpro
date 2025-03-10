import 'package:flutter/material.dart';
import 'components/text_field.dart';

class InteresCompuestoScreen extends StatelessWidget {
  const InteresCompuestoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController capitalController = TextEditingController();
    TextEditingController rateController = TextEditingController();
    TextEditingController yearController = TextEditingController();
    TextEditingController monthController = TextEditingController();
    TextEditingController dayController = TextEditingController();
    TextEditingController resultController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FinanPro",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Color.fromARGB(255, 111, 183, 31),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Interés Compuesto",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Es aquel que se va sumando al capital inicial y sobre el que se van generando nuevos intereses. El dinero, en este caso, tiene un efecto multiplicador porque los intereses producen nuevos intereses.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            buildTextField("Capital (\$)", capitalController),
            buildTextField("Tasa de interés (%)", rateController),
            const SizedBox(height: 5),
            const Text('Tiempo'),
            Row(
              children: [
                Expanded(child: buildTextField("Años", yearController)),
                Expanded(child: buildTextField("Meses", monthController)),
                Expanded(child: buildTextField("Días", dayController)),
              ],
            ),
            buildTextField(
              "Interés total (\$)",
              resultController,
              readOnly: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                /* double capital = double.tryParse(capitalController.text) ?? 0;
                double rate = double.tryParse(rateController.text) ?? 0;
                double time = double.tryParse(timeController.text) ?? 0;
                double interest = (capital * rate * time) / 100;
                resultController.text = interest.toStringAsFixed(2); */
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(80, 55),
                backgroundColor: const Color.fromARGB(255, 111, 183, 31),
                foregroundColor: Colors.white, // Text color
              ),
              child: const Text("Calcular", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
