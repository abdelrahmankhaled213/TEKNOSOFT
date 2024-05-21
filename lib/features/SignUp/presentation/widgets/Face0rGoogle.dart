import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/core/routes/router.dart';
import 'package:ecommerce_app/features/SignUp/presentation/widgets/CustomCircleAvatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class FaceOrGoogle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
         Text("- OR CONTINUE WITH -",style: Styles.Montserratgrey16w300,),
        SizedBox(
          height:MediaQuery.of(context).size.height/23,
        ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCircleAvatar(img: "assets/Images/google 1.png",ontap: ()async {
               try {
                   final GoogleSignInAccount? googleUser = await GoogleSignIn(
                       scopes: [
                         'email', 'https://www.googleapis.com/auth/drive',
                       ]
                   ).signIn();

                   // Obtain the auth details from the request
                   final GoogleSignInAuthentication? googleAuth = await googleUser
                       ?.authentication;

                   // Create a new credential
                   final credential = GoogleAuthProvider.credential(
                     accessToken: googleAuth?.accessToken,
                     idToken: googleAuth?.idToken,
                   );
                   // Once signed in, return the UserCredential
                 final email=  await FirebaseAuth.instance.signInWithCredential(
                       credential).then((value) => value.user!.email);

    goPushReplacement("/BottomNavigationView", context);
                 }on FirebaseAuthException
               catch(e){
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.code)));
               }
                }
                )
              ]

    )
    ]);
  }
}