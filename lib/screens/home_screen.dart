import 'package:flutter/material.dart';
import 'package:flutter_supabase_yt_1/utils/utils.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends AuthRequiredState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.new_label),
          onPressed: () {
            Supabase.instance.client.auth.signOut();
          },
        ),
        title: Text('Home'),
      ),
    );
  }
}
