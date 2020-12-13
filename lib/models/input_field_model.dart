class InputFieldModel {
  final String header;
  final String content;
  String changedField;

  InputFieldModel({this.header, this.content}) {
    changedField = content;
  }
}
