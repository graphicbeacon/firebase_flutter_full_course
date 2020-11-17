import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'auth_provider_base.dart';

class AuthProvider implements AuthProviderBase {
  @override
  Future<FirebaseApp> initialize() {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
}
