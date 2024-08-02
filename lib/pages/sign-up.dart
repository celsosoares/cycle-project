import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cycle_project/firebase/firebase_auth.dart';
import 'package:cycle_project/firebase/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'package:uuid/uuid.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final FirebaseService firebaseService = FirebaseService();
  FirebaseFirestore db = FirebaseFirestore.instance;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _checkPasswordController = TextEditingController();

  final TextEditingController _password = TextEditingController();
  final TextEditingController _checkPassword = TextEditingController();

  bool _passVis = true;
  AuthService authService = AuthService();

  Widget _buildTextName() {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 25,
      vertical: 10,
    ),
    child: TextFormField(
      controller: _nameController,
      autofocus: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 22,
        ),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: "Seu nome e sobrenome",
        labelStyle: const TextStyle(
          color: Color.fromRGBO(30, 30, 30, 100),
          fontSize: 15,
        ),
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "O nome é obrigatório";
        } else if (value != null && value.length > 18) {
          return "O nome pode ter no máximo 18 caracteres";
        }
        return null;
      },
    ),
  );
}

  Widget _buildTextEmail() {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 25,
      vertical: 10,
    ),
    child: TextFormField(
      controller: _emailController,
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 22,
        ),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: "Seu endereço de email",
        labelStyle: const TextStyle(
          color: Color.fromRGBO(30, 30, 30, 100),
          fontSize: 15,
        ),
      ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "O email é obrigatório";
        } else if (value != null &&
            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
          return "Insira um email valido";
        }
        return null;
      },
    ),
  );
}

  
  Widget _buildPassword() {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 25,
      vertical: 10,
    ),
    child: TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 22,
        ),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: "Sua melhor senha",
        hintStyle: const TextStyle(
          color: Color.fromRGBO(30, 30, 30, 100),
          fontSize: 19,
        ),
        suffixIcon: IconButton(
          icon: _passVis ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
          onPressed: () {
            setState(() {
              _passVis = !_passVis;
            });
          },
          color: Colors.grey,
        ),
      ),
      autofocus: true,
      keyboardType: TextInputType.text,
      obscureText: _passVis,
    ),
  );
}

  Widget _buildRewritePassword() {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 25,
      vertical: 10,
    ),
    child: TextFormField(
      controller: _checkPasswordController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 22,
        ),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: "Sua melhor senha",
        hintStyle: const TextStyle(
          color: Color.fromRGBO(30, 30, 30, 100),
          fontSize: 19,
        ),
        suffixIcon: IconButton(
          icon: _passVis ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
          onPressed: () {
            setState(() {
              _passVis = !_passVis;
            });
          },
          color: Colors.grey,
        ),
      ),
      autofocus: true,
      keyboardType: TextInputType.text,
      obscureText: _passVis,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Reinsira a senha";
        } else if (_password.text != _checkPassword.text) {
          return "A confirmação de senha não confere";
        }
        return null;
      },
    ),
  );
}

  void sendData(nome, email) async {
    String id = Uuid().v4();
    Map<String, dynamic> userData = {
      'id': id,
      'nome': nome,
      'email': email,
    };

    await firebaseService.addUser(userData);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
        ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              backgroundColor5,
              backgroundColor5,
              backgroundColor5,
            ],
          ),
        ),
        child: SafeArea(
            child: ListView(
          children: [
            SizedBox(height: size.height * 0.03),
            Text(
              "Crie sua conta!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 37,
                color: textColor1,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Seja bem vindo",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 27, color: textColor2, height: 1.2),
            ),
            SizedBox(height: size.height * 0.04),
            _buildTextName(),
            _buildTextEmail(),
            _buildPassword(),
            _buildRewritePassword(),
            const SizedBox(height: 10),
            SizedBox(height: size.height * 0.04),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () async {
                            String name = _nameController.text.trim();
                            String email = _emailController.text.trim();
                            String password = _passwordController.text.trim();

                            sendData(name, email);

                            User? user = await authService.signUpWithEmailAndPassword(email, password);

                            if (user != null) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Registro bem-sucedido'),
                                    content: const Text(
                                        'Seu registro foi concluído com sucesso!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Erro de Registro'),
                                    content: Text(
                                        'O registro falhou. Tente novamente mais tarde.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                      child: const Center(
                        child: Text(
                          "Cadastre-se",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 235, 235, 235),
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 2,
                        width: size.width * 0.2,
                        color: Colors.black12,
                      ),
                      Text(
                        "  Ou entre com   ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor2,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        height: 2,
                        width: size.width * 0.2,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      socialIcon("images/google.png"),
                      socialIcon("images/apple.png"),
                      socialIcon("images/facebook.png"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  Container socialIcon(image) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Image.asset(
        image,
        height: 35,
      ),
    );
  }
}
