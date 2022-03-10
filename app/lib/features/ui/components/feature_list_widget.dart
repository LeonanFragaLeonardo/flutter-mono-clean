import 'package:app/features/ui/components/feature_card_widget.dart';
import 'package:app/features/ui/components/feature_not_found_widget.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class FeatureListWidget extends StatefulWidget {
  final List<Feature> features;
  const FeatureListWidget({
    Key? key,
    required this.features,
  }) : super(key: key);

  @override
  State<FeatureListWidget> createState() => _FeatureListWidgetState();
}

class _FeatureListWidgetState extends State<FeatureListWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.features.isEmpty) {
      return const FeatureNotFoundWidget();
    }
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 100,
            child: FeatureCardWidget(
              feature: widget.features[index],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 1,
            height: 4,
            color: Colors.transparent,
          );
        },
        itemCount: widget.features.length,
      ),
    );
  }
}
