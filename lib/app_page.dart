import 'package:flutter/material.dart';
import 'package:login_supabase/home_page.dart';
import 'package:login_supabase/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppPage extends StatefulWidget {
  final SupabaseClient supabase;
  const AppPage({super.key, required this.supabase});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.supabase.auth.onAuthStateChange,
      builder: (_, state) {
        if (state.data == null || state.data?.session == null) {
          return LoginPage(supabase: widget.supabase);
        }

        final user = state.data!.session!.user;
        return HomePage(
          supabase: widget.supabase,
          user: user,
        );
      },
    );
  }
}
