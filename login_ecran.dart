import 'package:atelier5-majida-boutayeb-iir5g6/admin.dart';
import 'package:atelier5-majida-boutayeb-iir5g6/utilisateur.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen();
        }

        User? user = snapshot.data;
        if (user == null) {
          return Text('No user data available');
        }
         bool isAdmin = user =='admin';
        if (isAdmin) {
          return AdminDashboard();
        } else {
          return UserDashboard();
        }
      },
    ); // StreamBuilder
  }
}

Widget customBuilder(BuildContext context, AsyncSnapshot<User?> snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    // While data is loading
    return CircularProgressIndicator();
  } else if (snapshot.hasError) {
    // If there's an error with the stream
    return Text('Error: ${snapshot.error}');
  } else {
    // If the data has been received successfully
    User? user = snapshot.data;

    if (user == null) {
      // If the user is null, display a placeholder or handle accordingly
      return Text('No user data available');
    } else {
      // Build your widget based on the user data
      return buildContainerWithUserData(user, context);
    }
  }
}

Widget buildContainerWithUserData(User user, BuildContext context) {
  return Container(
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('User Email: ${user.email}'),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Sign out the user
            FirebaseAuth.instance.signOut();
          },
          child: Text('Sign Out'),
        ),
      ],
    ),
  );
}
