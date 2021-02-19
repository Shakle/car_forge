import 'package:flutter/material.dart';

class OvalButton extends StatelessWidget {

  final Function function;
  final String title;

  const OvalButton({
    @required this.function, 
    @required this.title
  }) : assert(function != null && title != null, 'Button must have title and function');

  @override
  Widget build(BuildContext context) {
    return outlineButton();
  }

  Widget outlineButton() {
    return OutlinedButton(
      onPressed: function,
      child: titleText(),
    );
  }

  Widget titleText() {
    return Text(title);
  }

}
