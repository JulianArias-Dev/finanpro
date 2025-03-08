import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String pin = "";

  void _onKeyPressed(String value) {
    if (value == "backspace") {
      setState(() {
        if (pin.isNotEmpty) {
          pin = pin.substring(0, pin.length - 1);
        }
      });
    } else {
      if (pin.length < 4) {
        setState(() {
          pin += value;
        });
        if (pin.length == 4) {
          // Navegar a HomeScreen cuando el PIN tenga 4 dígitos
          Get.to(() => const HomeScreen());
        }
      }
    }
  }

  Widget _buildKeypadButton(String value) {
    return GestureDetector(
      onTap: () => _onKeyPressed(value),
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        /* decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle), */
        child:
            value == "backspace"
                ? const Icon(Icons.backspace, size: 28, color: Colors.white)
                : value == "fingerprint"
                ? const Icon(Icons.fingerprint, size: 28, color: Colors.white)
                : Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 111, 183, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 111, 183, 31),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Ingrese su Clave...",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    index < pin.length ? "●" : "",
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: [
              for (var i = 1; i <= 9; i++) _buildKeypadButton(i.toString()),
              _buildKeypadButton("fingerprint"),
              _buildKeypadButton("0"),
              _buildKeypadButton("backspace"),
            ],
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              // Acción al olvidar la clave
            },
            child: const Text(
              "¿Olvidó su contraseña?",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
