import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool hidePassword = true;

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Text(
              "Login",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            usernameInput(),
            passwordInput(),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    handleLogin();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
              ],
            )
          ],
        ),
      )),
    );
  }

  Widget usernameInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text("Username"),
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            hintText: "Masukan username",
            border: OutlineInputBorder(),
          ),
        )
      ],
    );
  }

  Widget passwordInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text("Password: "),
        TextField(
          obscureText: hidePassword,
          controller: _passwordController,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "*******",
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  icon: Icon(
                      hidePassword ? Icons.visibility : Icons.visibility_off))),
        )
      ],
    );
  }

  void handleLogin() {
    if (_usernameController.text == '089' &&
        _passwordController.text == '089') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Login Berhasil! Mengalihkan!",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ));

      Navigator.of(context).pushReplacementNamed("/");

      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Username atau password salah"),
        backgroundColor: Colors.red,
      ));
    }
  }
}
