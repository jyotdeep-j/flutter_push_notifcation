import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB6Jf3aFFJQT61lxKUKKtM7ySDETdTP550",
            authDomain: "davids-parts-v1-9rstyy.firebaseapp.com",
            projectId: "davids-parts-v1-9rstyy",
            storageBucket: "davids-parts-v1-9rstyy.appspot.com",
            messagingSenderId: "518728667927",
            appId: "1:518728667927:web:f19aecd693bd31b8d51d52"));
  } else {
    await Firebase.initializeApp();
  }
}
