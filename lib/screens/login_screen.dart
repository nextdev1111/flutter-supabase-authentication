import 'package:flutter/material.dart';
import 'package:flutter_supabase_yt_1/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends AuthState<LoginScreen> {
  // controllers
  final TextEditingController _emailController = TextEditingController();

  SupabaseAuthManager supabaseAuthManager = SupabaseAuthManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      hintText: 'Email', labelText: 'Email'),
                ),
                TextButton(
                    onPressed: () {
                      supabaseAuthManager.signInWithEmail(context,
                          email: _emailController.text);
                    },
                    child: Text('Login')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
