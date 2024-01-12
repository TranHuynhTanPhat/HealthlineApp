import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:healthline/util/log_data.dart';

class AuthService {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        // Once signed in, return the UserCredential
        return await FirebaseAuth.instance.signInWithCredential(credential);
      }
      return null;
    } on FirebaseAuthException catch (e) {
      logPrint(e);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  /// create user
  // Future<AuthResponse?> registerWithEmail(
  //     {required String email, required String password}) async {
  //   try {
  //     final UserCredential userCredential =
  //         await _firebaseAuth.createUserWithEmailAndPassword(
  //       email: email.trim(),
  //       password: password.trim(),
  //     );
  //     final User? firebaseUser = userCredential.user;
  //     var x = userCredential.credential;
  //     logPrint(userCredential.additionalUserInfo);
  //     logPrint(userCredential.credential);
  //     logPrint(userCredential.user);
  //     logPrint(userCredential.toString());
  //     if (firebaseUser != null) {
  //       return AuthResponse(
  //         localId: firebaseUser.uid,
  //         email: firebaseUser.email,
  //         displayName: firebaseUser.displayName,
  //         accessToken: x?.accessToken,
  //         refreshToken: firebaseUser.refreshToken,
  //       );
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     throw e.code;
  //   }
  //   return null;
  // }

  /// authorizing user
  // Future<AuthResponse?> loginWithEmail(
  //     {required String email, required String password}) async {
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(
  //             email: email.trim(), password: password.trim());
  //     final User? firebaseUser = userCredential.user;
  //     FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(firebaseUser?.uid)
  //         .set({
  //       "fullName": "Tran Huynh Tan Phat",
  //       "age": 20,
  //       "phone": "+84389052819",
  //       "email": email
  //     });

  //     var x = userCredential.credential;
  //     if (firebaseUser != null) {
  //       return AuthResponse(
  //         localId: firebaseUser.uid,
  //         email: firebaseUser.email,
  //         displayName: firebaseUser.displayName,
  //         accessToken: x?.accessToken,
  //         refreshToken: firebaseUser.refreshToken,
  //       );
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     throw e.code;
  //   } catch (e) {
  //     logPrint(e);
  //     rethrow;
  //   }
  //   return null;
  // }
  // Future<AuthResponse?> registerWithPhone(AuthRequest authRequest) async {
  //   try {
  //     final UserCredential userCredential =
  //         await _firebaseAuth.createUserWithEmailAndPassword(
  //       email: authRequest.email!.trim(),
  //       password: authRequest.password!.trim(),
  //     );
  //     final User? firebaseUser = userCredential.user;
  //     if (firebaseUser != null) {
  //       return AuthResponse(
  //         localId: firebaseUser.uid,
  //         email: firebaseUser.email ,
  //         displayName: firebaseUser.displayName,
  //         idToken:await firebaseUser.getIdToken(),
  //         refreshToken: firebaseUser.refreshToken,
  //       );
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     logPrint(e.toString());
  //   }
  //   return null;
  // }

  ///signOutUser
  Future<void> signOutUser() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }
  // ... (other methods)}
}
