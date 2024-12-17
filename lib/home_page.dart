import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  final SupabaseClient supabase;
  final User user;
  const HomePage({
    super.key,
    required this.supabase,
    required this.user,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await widget.supabase.auth.signOut();
          },
          child: Text('Logoff de ${widget.user.email}'),
        ),
      ),
    );
  }
}
