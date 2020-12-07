import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_2/enums.dart';
import 'package:schedule_2/models/user_login_model.dart';
import 'package:schedule_2/services/navigation_service.dart';

class AuthHeader extends StatelessWidget {
  final double height;
  final LoginState routeTo;

  const AuthHeader({
    Key key,
    @required this.height,
    @required this.routeTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserLoginModel model = Provider.of<UserLoginModel>(context);
    final NavigationService navigationService =
        Provider.of<NavigationService>(context);
    return Container(
      padding: EdgeInsets.all(16),
      height: height,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Rozklad+',
            style: TextStyle(fontSize: 30),
          ),
          RaisedButton(
            onPressed: () {
              model.userLoginState = routeTo;
              navigationService.renavigate(model.userLoginState, context);
            },
            child:
                routeTo == LoginState.auth ? Text('Sign In') : Text('Sign Up'),
          )
        ],
      ),
    );
  }
}
