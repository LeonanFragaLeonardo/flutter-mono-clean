import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class FeatureCardWidget extends StatelessWidget {
  final Feature feature;
  const FeatureCardWidget({
    Key? key,
    required this.feature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Theme.of(context).shadowColor.withOpacity(0.5),
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(feature.name),
                Switch(
                  value: feature.enabled,
                  onChanged: (value) => {},
                ),
              ],
            )),
      ),
    );
  }
}
