import 'package:flutter/material.dart';

class AlertErrorDialogWidget extends StatelessWidget {
  const AlertErrorDialogWidget({
    Key? key,
    required this.titleMessage,
    required this.informationMessage,
    required this.icon,
  }) : super(key: key);

  final String titleMessage;
  final String informationMessage;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titleMessage),
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 2,
      titleTextStyle: Theme.of(context).primaryTextTheme.headline5,
      content: SizedBox(
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 5.0,
                ),
                Divider(
                  color: Colors.grey,
                  height: 4.0,
                ),
                Flexible(
                  child: Text(
                    informationMessage,
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: InkWell(
                radius: 80,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  clipBehavior: Clip.antiAlias,
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    animationDuration: Duration(seconds: 2),
                    primary: Colors.black,
                    backgroundColor: Colors.white,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(48.0),
                        bottomRight: Radius.circular(48.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Close',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // actions: <Widget>[],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.elliptical(48, 30),
              bottom: Radius.elliptical(150, 100))),
      // shape: CircleBorder(),
    );
  }
}
