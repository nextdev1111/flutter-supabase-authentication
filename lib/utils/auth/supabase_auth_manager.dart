import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_supabase_yt_1/constants/constants.dart';

class SupabaseAuthManager {
  Future<GotrueSessionResponse> signInWithEmail(BuildContext context,
      {required String email}) async {
    var trimmedEmail = email.trim();

    var res = await Supabase.instance.client.auth.signIn(
        email: trimmedEmail,
        options: AuthOptions(
            redirectTo: 'io.supabase.fluttertutorial://login-callback/'));

    if (res.error != null) {
      // ignore: use_build_context_synchronously
      context.showErrorSnackBar(message: res.error!.message);
    }

    if (res.user != null) {
      // ignore: use_build_context_synchronously
      context.showSnackBar(message: 'Email sent for confimation');
    }

    return res;
  }
}
