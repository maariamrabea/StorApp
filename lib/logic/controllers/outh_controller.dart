import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../routes/routes.dart';

class AuthController extends GetxController {
  bool isVisibilty = false;
  bool isCheckBox = false;
  var displayUsername = ''.obs;
  var auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();
  var disPlayPhoto = ''.obs;
  var disPlayEmail = ''.obs;
  var isSignIn = false;
  final GetStorage authBox = GetStorage();

  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
   displayUsername.value =
   (userProfile != null ? userProfile!.displayName : "")!;
    disPlayPhoto.value =
    (userProfile != null ? userProfile!.photoURL : "")!;
    disPlayEmail.value = (userProfile != null ? userProfile!.email : "")!;

    super.onInit();
  }


  void visibilty() {
    isVisibilty = !isVisibilty;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  void signUpFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUsername.value = name;
        auth.currentUser!.updateDisplayName(name);
      });
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), '').capitalize!;
      String massege = '';

      if (error.code == 'weak-password') {
        massege = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        massege = 'The account already exists for that email.';
      } else {
        massege = error.message.toString();
      }

      Get.snackbar(title, massege,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar('Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void logInFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              displayUsername.value = auth.currentUser!.displayName!);
      isSignIn = true;
      authBox.write('auth', isSignIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), '').capitalize!;
      String massege = '';
      if (error.code == 'user-not-found') {
        massege = 'No user found for that email.';
      } else if (error.code == 'wrong-password') {
        massege = 'Wrong password provided for that user.';
      } else {
        error.message.toString();
      }
      Get.snackbar(title, massege,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar('Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void googleSignApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUsername.value = googleUser!.displayName!;
      disPlayPhoto.value = googleUser.photoUrl!;
      disPlayEmail.value = googleUser.email!;

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await auth.signInWithCredential(credential);
      authBox.write('auth', isSignIn);

      isSignIn = true;
      update();

      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar('Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void facebookSignUp() {}

  void resetPassword(
    String email,
  ) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), '').capitalize!;
      String massege = '';
      if (error.code == 'user-not-found') {
        massege = 'No user found for that email.';
      } else {
        error.message.toString();
      }
      Get.snackbar(title, massege,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar('Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      displayUsername.value = '';
      disPlayPhoto.value = '';
      disPlayEmail.value = '';

      update();
      isSignIn = false;
      authBox.remove("auth");

      Get.offNamed(Routes.welcomeScreen);
    } catch (error) {
      Get.snackbar('Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
