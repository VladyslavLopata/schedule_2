import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:provider/provider.dart';
import 'package:schedule_2/models/card.dart';
import 'package:schedule_2/models/day_convert.dart';
import 'package:schedule_2/models/input_field_model.dart';
import 'package:schedule_2/models/user_login_model.dart';

class EditFieldBody extends StatelessWidget {
  const EditFieldBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments != null
        ? ModalRoute.of(context).settings.arguments as Map
        : null;
    final LessonCard lessonData =
        arguments != null ? arguments['card'] as LessonCard : null;
    final UserLoginModel model = Provider.of<UserLoginModel>(context);
    final InputFieldModel titleModel = InputFieldModel(
      content: lessonData == null ? '' : lessonData.name,
      header: 'Назва предмету',
    );
    final InputFieldModel linkModel = InputFieldModel(
      content: lessonData == null ? '' : lessonData.link,
      header: 'Посилання',
    );
    model.lessonName = lessonData?.name;
    model.day = lessonData?.day.toString();
    model.link = lessonData?.link.toString();
    model.group = '';
    model.number = lessonData?.number.toString();
    model.teacher = lessonData?.teacher;
    model.week = lessonData?.week.toString();

    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LessonInputField(
              model: titleModel,
            ),
            LessonInputField(
              model: linkModel,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Номер пари: '),
                  DropDown(
                    items: const ['1', '2', '3', '4', '5'],
                    hint: Text((lessonData != null ? lessonData.number + 1 : 1)
                        .toString()),
                    onChanged: (String change) {
                      model.number = (int.parse(change) - 1).toString();
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('День тижня: '),
                  DropDown(
                    items: const [
                      'Понеділок',
                      'Вівторок',
                      'Середа',
                      'Четвер',
                      "П'ятниця",
                      'Субота'
                    ],
                    hint: Text(
                      DayConvert.getStringFromIndex(
                          lessonData != null ? lessonData.day : 1),
                    ),
                    onChanged: (String change) {
                      model.day =
                          DayConvert.getIndexFromString(change).toString();
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () async {
                    model.lessonName = titleModel.changedField;
                    model.link = linkModel.changedField;
                    lessonData != null
                        ? await model.saveChangedData(lessonData)
                        : await model.saveLesson();
                    if (!model.lessonAddError) {
                      Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      BotToast.showNotification(
                          backgroundColor: Colors.red,
                          title: (_) => const Text(
                              'Вже існує заняття з таким номером, днем та тижнем!'));
                    }
                  },
                  child: const Text('Застосувати зміни'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Text('Скасувати зміни'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LessonInputField extends StatelessWidget {
  const LessonInputField({
    Key key,
    @required this.model,
  }) : super(key: key);

  final InputFieldModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (String text) {
          model.changedField = text;
        },
        controller: TextEditingController(text: model.content),
        decoration: InputDecoration(
          labelText: model.header,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
