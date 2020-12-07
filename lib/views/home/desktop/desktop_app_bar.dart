import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_2/models/user_login_model.dart';
import 'package:schedule_2/services/navigation_service.dart';

class DesktopAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserLoginModel>(context);
    final navigator = Provider.of<NavigationService>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Parent(
              style: ParentStyle()..alignment.centerLeft(),
              child: Txt(
                'Rozklad+',
                style: TxtStyle()
                  ..fontSize(30)
                  ..fontWeight(FontWeight.bold)
                  ..padding(all: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: RaisedButton(
                    onPressed: () async {
                      await model.signOut();
                      navigator.renavigate(model.userLoginState, context);
                    },
                    child: Text('Вийти'),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/user');
                  },
                  child: Text('В кабінет'),
                )
              ],
            )
          ],
        ),
        Divider(
          thickness: 1,
          color: Colors.black,
        ),
      ],
    );
  }
}
