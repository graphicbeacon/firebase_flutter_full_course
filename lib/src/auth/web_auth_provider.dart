import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_provider_base.dart';

class _WebAuthProvider implements AuthProviderBase {
  @override
  Future<FirebaseApp> initialize() async {
    return Firebase.apps[0];
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    // Create a new provider
    final provider = GoogleAuthProvider();

    provider.addScope('https://www.googleapis.com/auth/userinfo.email');
    provider.addScope('https://www.googleapis.com/auth/userinfo.profile');
    provider.setCustomParameters({'login_hint': 'user@example.com'});

    // sign in and return user credential
    return await FirebaseAuth.instance.signInWithPopup(provider);
  }
}

class AuthProvider extends _WebAuthProvider {}
