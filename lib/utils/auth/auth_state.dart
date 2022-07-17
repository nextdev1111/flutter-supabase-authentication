import 'package:flutter/cupertino.dart';
import 'package:flutter_supabase_yt_1/screens/screens.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:flutter_supabase_yt_1/constants/constants.dart';

class AuthState<T extends StatefulWidget> extends SupabaseAuthState<T> {
  @override
  void onUnauthenticated() {
    if (mounted) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (route) => const LoginScreen()));
    }
  }

  @override
  void onAuthenticated(Session session) {
    if (mounted) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (route) => const HomeScreen()));
    }
  }

  @override
  void onPasswordRecovery(Session session) {}

  @override
  void onErrorAuthenticating(String message) {
    context.showErrorSnackBar(message: message);
    Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (route) => const LoginScreen()));
  }
}
