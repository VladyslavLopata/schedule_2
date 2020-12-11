import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_2/common_widgets/auth_header.dart';
import 'package:schedule_2/enums.dart';
import 'package:schedule_2/models/user_login_model.dart';
import 'package:schedule_2/services/navigation_service.dart';
import 'package:schedule_2/views/common/input_field.dart';

class SignInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserLoginModel model = Provider.of<UserLoginModel>(context);
    final NavigationService navigationService =
        Provider.of<NavigationService>(context);

    const headerSize = 60.0;
    final bodySize = MediaQuery.of(context).size.height - headerSize;
    final registrationContainerSize = MediaQuery.of(context).size.height / 3.0;

    return Column(
      children: [
        const AuthHeader(
          height: headerSize,
          routeTo: LoginState.register,
        ),
        Container(
          height: bodySize,
          alignment: Alignment.center,
          child: SizedBox(
            height: registrationContainerSize,
            width: MediaQuery.of(context).size.width / 3.0,
            child: Column(
              children: [
                Parent(
                  style: ParentStyle()
                    ..border(all: 1, color: Theme.of(context).accentColor)
                    ..borderRadius(all: 12)
                    ..alignment.center()
                    ..alignmentContent.center()
                    ..padding(all: 20),
                  child: Column(
                    children: [
                      Txt(
                        'Авторизація',
                        style: TxtStyle()..fontSize(25),
                      ),
                      ...['Email', 'Пароль'].map(
                        (e) => InputField(title: e),
                      ),
                      RaisedButton(
                        onPressed: () async {
                          await model.authenticate();
                          navigationService.renavigate(
                              model.userLoginState, context);
                        },
                        child: const Text("Увійти"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
