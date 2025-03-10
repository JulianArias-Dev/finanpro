import 'package:flutter/material.dart';
import 'components/text_field.dart';

class AnualidadesScreen extends StatefulWidget {
  const AnualidadesScreen({super.key});

  @override
  _AnualidadesScreenState createState() => _AnualidadesScreenState();
}

class _AnualidadesScreenState extends State<AnualidadesScreen> {
  TextEditingController capitalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController resultController = TextEditingController();
  bool isPresentValue = false;
  bool isFutureValue = false;

  @override
  Widget build(BuildContext context) {
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
              "Anualidades",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Las anualidades son pagos periódicos iguales que no necesariamente tienen que ser anuales como lo indica su nombre; un ejemplo de este tipo de pagos son las pensiones, seguros, deudas pactadas con abonos iguales, etc.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            buildTextField("Capital (\$)", capitalController),
            buildTextField("Tasa de anualidad (%)", rateController),
            buildTextField("Periodos de Capitalizacion", timeController),
            buildTextField(
              "Valor Final/Actual (\$)",
              resultController,
              readOnly: true,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: isPresentValue,
                  onChanged: (bool? value) {
                    setState(() {
                      isPresentValue = value!;
                    });
                  },
                ),
                const Text("Valor Actual"),
                const SizedBox(width: 15),
                Checkbox(
                  value: isFutureValue,
                  onChanged: (bool? value) {
                    setState(() {
                      isFutureValue = value!;
                    });
                  },
                ),
                const Text("Valor Final"),
              ],
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
