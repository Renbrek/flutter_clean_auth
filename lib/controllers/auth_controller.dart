import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_clean_auth/config.dart';
import 'package:flutter_clean_auth/screens/root.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var displayName = ''; // to show the user name when signed in

  FirebaseAuth auth = FirebaseAuth.instance;
  User? get userProfile => auth.currentUser;

  void signUp(String name, String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayName = name;
        auth.currentUser!.updateDisplayName(name);
      });
      update();
      Get.offAll(() => Root());
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = ('The account already exists for that email.');
      } else {
        message = e.message.toString();
      }

      Get.snackbar(
        title,
        message,
        backgroundColor: kPrimaryColor,
        colorText: kBackgroundColor,
      );
    } catch (e) {
      Get.snackbar(
        'Sign Up Error',
        e.toString(),
        backgroundColor: kPrimaryColor,
        colorText: kBackgroundColor,
      );
    }
  }
}
