import 'package:flutter/material.dart';

class InterestScreen extends StatelessWidget {
  const InterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController capitalController = TextEditingController();
    TextEditingController rateController = TextEditingController();
    TextEditingController timeController = TextEditingController();
    TextEditingController resultController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("FinanPro")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Interés Simple",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "El interés simple se genera sobre un capital inicial con una tasa fija sobre el saldo original de la inversión o préstamo.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            _buildTextField("Capital (\$)", capitalController),
            _buildTextField("Tasa de interés (%)", rateController),
            _buildTextField("Tiempo (años)", timeController),
            _buildTextField(
              "Interés total (\$)",
              resultController,
              readOnly: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double capital = double.tryParse(capitalController.text) ?? 0;
                double rate = double.tryParse(rateController.text) ?? 0;
                double time = double.tryParse(timeController.text) ?? 0;
                double interest = (capital * rate * time) / 100;
                resultController.text = interest.toStringAsFixed(2);
              },
              child: const Text("Calcular"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool readOnly = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        readOnly: readOnly,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
