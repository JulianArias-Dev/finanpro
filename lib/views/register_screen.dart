import 'package:flutter/material.dart';
import 'components/text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController secondNameController = TextEditingController();
    TextEditingController firstLastNameController = TextEditingController();
    TextEditingController secondLastNameController = TextEditingController();
    TextEditingController birthDateController = TextEditingController();
    TextEditingController idController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "FinanPro",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Color.fromARGB(255, 111, 183, 31),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField("Primer Nombre", firstNameController),
              buildTextField("Segundo Nombre", secondNameController),
              buildTextField("Primer Apellido", firstLastNameController),
              buildTextField("Segundo Apellido", secondLastNameController),
              buildTextField("Fecha de Nacimiento", birthDateController),
              buildTextField("Cédula", idController),
              buildTextField("Email", emailController),
              buildTextField("Teléfono", phoneController),
              buildTextField("Clave", passwordController),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String firstName = firstNameController.text;
                  String secondName = secondNameController.text;
                  String firstLastName = firstLastNameController.text;
                  String secondLastName = secondLastNameController.text;
                  String birthDate = birthDateController.text;
                  String id = idController.text;
                  String email = emailController.text;
                  String phone = phoneController.text;
                  String password = passwordController.text;

                  if (firstName.isEmpty ||
                      firstLastName.isEmpty ||
                      id.isEmpty ||
                      email.isEmpty ||
                      password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Los campos obligatorios no pueden estar vacíos.",
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  // Aquí puedes agregar la lógica para enviar los datos al backend
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Registro enviado con éxito."),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color.fromARGB(255, 111, 183, 31),
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  "Registrarse",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
