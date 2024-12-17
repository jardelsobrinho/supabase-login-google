import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  final SupabaseClient supabase;
  const LoginPage({super.key, required this.supabase});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                /// Web Client ID that you registered with Google Cloud.
                const webClientId =
                    '844085046517-ne0jmfqibv6c48d75gij5k4n4hs9ul5o.apps.googleusercontent.com';

                /// iOS Client ID that you registered with Google Cloud.
                const iosClientId = 'my-ios.apps.googleusercontent.com';

                // Google sign in on Android will work without providing the Android
                // Client ID registered on Google Cloud.

                final GoogleSignIn googleSignIn = GoogleSignIn(
                  clientId: iosClientId,
                  serverClientId: webClientId,
                );
                final googleUser = await googleSignIn.signIn();
                final googleAuth = await googleUser!.authentication;
                final accessToken = googleAuth.accessToken;
                final idToken = googleAuth.idToken;

                /*print("ID TOKEN:");
                print(idToken);

                print('ACCESS TOKEN:');
                print(accessToken);*/

                if (accessToken == null) {
                  throw 'No Access Token found.';
                }
                if (idToken == null) {
                  throw 'No ID Token found.';
                }

                await widget.supabase.auth.signInWithIdToken(
                  provider: OAuthProvider.google,
                  idToken: idToken,
                  accessToken: accessToken,
                );
              },
              child: const Text('Sign in with Google'),
            )
          ],
        ),
      ),
    );
  }
}
