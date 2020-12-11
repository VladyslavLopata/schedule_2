import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_2/models/user_login_model.dart';

class UserBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserLoginModel>(context);
    final CollectionReference users =
        FirebaseFirestore.instance.collection('Users');

    return Center(
      child: FutureBuilder(
        future: users.doc(model.getEmail()).get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text(
              "User Error",
              style: TextStyle(color: Colors.red),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            final Map<String, dynamic> data =
                snapshot.data.data() as Map<String, dynamic>;
            return Text('Особистий кабінет користувача ${data["Full Name"]}');
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
