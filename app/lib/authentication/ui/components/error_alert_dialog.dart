import 'package:app/authentication/ui/components/error_alert_dialog_widget.dart';
import 'package:flutter/material.dart';

Future<void> showErrorDialog(BuildContext context, String error) async {
  await showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return AlertErrorDialogWidget(
        key: Key('keyAlertErrrorDialog'),
        icon: Icon(Icons.error),
        informationMessage: error,
        titleMessage: 'Do`h',
      );
    },
  );
}
