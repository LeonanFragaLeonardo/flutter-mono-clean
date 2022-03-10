import 'package:app/features/ui/pages/features_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.purple,
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(FeaturesPage.routeName);
          },
          child: Text(
            'Talk is cheap! Show me the Features',
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
        ));
  }
}
