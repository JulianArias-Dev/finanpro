import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart'; // Para autenticación biométrica
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String pin = "";
  final LocalAuthentication auth = LocalAuthentication();

  Future<void> _authenticate() async {
    final scaffoldMessenger = ScaffoldMessenger.of(
      context,
    ); // Obtener la referencia antes del método asíncrono
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: "Escanea tu huella para ingresar",
        options: const AuthenticationOptions(biometricOnly: true),
      );
      if (authenticated) {
        Get.to(() => const HomeScreen());
      }
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text('Error en autenticación biométrica: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _onKeyPressed(String value) {
    if (value == "backspace") {
      setState(() {
        if (pin.isNotEmpty) {
          pin = pin.substring(0, pin.length - 1);
        }
      });
    } else if (value == "fingerprint") {
      _authenticate();
    } else {
      if (pin.length < 4) {
        setState(() {
          pin += value;
        });
        if (pin.length == 4) {
          Get.to(() => const HomeScreen());
        }
      }
    }
  }

  Widget _buildKeypadButton(String value) {
    return GestureDetector(
      onTap: () => _onKeyPressed(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: 10,
        height: 10,
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:
              value == "backspace" || value == "fingerprint"
                  ? Colors.transparent
                  : Colors.white,
          shape: BoxShape.circle,
        ),
        child:
            value == "backspace"
                ? const Icon(Icons.backspace, size: 30, color: Colors.white)
                : value == "fingerprint"
                ? const Icon(Icons.fingerprint, size: 30, color: Colors.white)
                : Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(255, 111, 183, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 111, 183, 31),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      index < pin.length ? "●" : "",
                      style: const TextStyle(fontSize: 32, color: Colors.black),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ), // Ajusta el margen lateral
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  for (var i = 1; i <= 9; i++) _buildKeypadButton(i.toString()),
                  _buildKeypadButton("fingerprint"),
                  _buildKeypadButton("0"),
                  _buildKeypadButton("backspace"),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text(
                "¿Olvidó su contraseña?",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
