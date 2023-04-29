import 'package:apli_web/src/registro.dart';
import 'package:flutter/material.dart';

class MyAppForm extends StatefulWidget {
  @override
  State<MyAppForm> createState() => _MyAppFormState();
}

class _MyAppFormState extends State<MyAppForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Colors.purple,
            Colors.blue,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: EdgeInsets.all(35.0),
      child: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              _bienvenido(),
              const SizedBox(height: 10),
              _icon(),
              const SizedBox(height: 50),
              _inputField("Correo", usernameController),
              const SizedBox(height: 20),
              _inputField("Contraseña", passwordController, isPassword: true),
              const SizedBox(height: 40),
              _loginBtn(),
              const SizedBox(height: 25),
              _extraText(),
              const SizedBox(height: 0),
              _btnRegistra()
            ],
          ),
        ),
      ),
    );
  }

  Widget _bienvenido() {
    return const Text(
      "Bienvenido",
      textAlign: TextAlign.center,
      style:
          TextStyle(fontSize: 50, color: Colors.white, fontFamily: 'NerkoOne'),
    );
  }

  Widget _icon() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      CircleAvatar(
        radius: 110.0,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage('images/LogoGowPlay.png'),
      )
    ]);
    // decoration: BoxDecoration(
    //     border: Border.all(color: Colors.white, width: 2),
    //     shape: BoxShape.circle),
    // child: const Icon(Icons.person, color: Colors.white, size: 120));
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.white));

    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Usuario: " + usernameController.text);
        debugPrint("Contraseña: " + passwordController.text);
      },
      child: const SizedBox(
          width: double.infinity,
          child: Text(
            "Iniciar Sesion",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          )),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        primary: Color.fromARGB(255, 228, 226, 226),
        onPrimary: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _extraText() {
    return const Text(
      "¿No tienes una cuenta?",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, color: Colors.white),
    );
  }

  Widget _btnRegistra() {
    return TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyAppFormRegistro()));
        },
        child: Text(
          'Regístrate',
          style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
              fontSize: 17),
        ));
  }
}
