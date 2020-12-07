import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:schedule_2/models/user_login_model.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final UserLoginModel model = Provider.of<UserLoginModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      child: Observer(builder: (_) {
        return TextField(
          controller: TextEditingController(),
          obscureText: title.contains('ароль'),
          decoration: InputDecoration(
            labelText: '$title',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: model.authenticationError
                      ? Colors.red
                      : Colors.blueAccent),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: model.authenticationError
                      ? Colors.red
                      : Colors.blueAccent),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
          onChanged: (String text) {
            switch (title) {
              case 'Ім\'я':
                model.name = text;
                break;
              case 'Пароль':
                model.password = text;
                break;
              case 'Повторіть пароль':
                model.passwordCheck = text;
                break;
              case 'Email':
                model.email = text;
                break;
            }
          },
        );
      }),
    );
  }
}
