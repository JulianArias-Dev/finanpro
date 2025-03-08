import 'package:flutter/material.dart';
import 'interes_simple_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 111, 183, 31),
            child: Column(
              children: [
                const SizedBox(height: 35),
                const Text(
                  "Bienvenido Robert",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Saldo",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const Text(
                  "\$ 35 890.45",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Educación Financiera",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildOptionButton(
                        "Interés Simple",
                        context,
                        const InterestScreen(),
                      ),
                      _buildOptionButton("Interés Compuesto", context, null),
                      _buildOptionButton("Anualidades", context, null),
                      _buildOptionButton("Gradientes", context, null),
                      _buildOptionButton(
                        "Sistemas de Amortización",
                        context,
                        null,
                      ),
                      _buildOptionButton(
                        "Sistemas de Capitalización",
                        context,
                        null,
                      ),
                      _buildOptionButton("TIR", context, null),
                      _buildOptionButton("UVR", context, null),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Gestión de Préstamos",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildOptionButton("Nuevo Préstamo", context, null),
                      _buildOptionButton("Préstamos Vigentes", context, null),
                      _buildOptionButton("Pagar Préstamo", context, null),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton(String title, BuildContext context, Widget? page) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed:
            page != null
                ? () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page),
                )
                : null,
        child: Text(title, textAlign: TextAlign.center),
      ),
    );
  }
}
