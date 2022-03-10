import 'package:app/features/ui/components/feature_card_widget.dart';
import 'package:app/features/ui/components/feature_list_widget.dart';
import 'package:app/main.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeaturesPage extends StatefulWidget {
  static const routeName = '/features';
  final FeaturesPresenter featuresPresenter;
  const FeaturesPage({Key? key, required this.featuresPresenter})
      : super(key: key);

  @override
  State<FeaturesPage> createState() => _FeaturesPageState();
}

class _FeaturesPageState extends State<FeaturesPage> {
  @override
  Widget build(BuildContext context) {
    const emptyListWidget = FeatureListWidget(features: []);
    return StreamBuilder<List<Feature>?>(
        stream: widget.featuresPresenter
            .onFeatureChanges(serviceName: MainApp.serviceToUse),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const _LoadingFeatures();
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return emptyListWidget;
          }
          if (snapshot.hasData) {
            final result = snapshot.data!;
            return FeatureListWidget(features: result);
          }
          return emptyListWidget;
        });
  }
}

class _LoadingFeatures extends StatelessWidget {
  const _LoadingFeatures({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 100,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
            baseColor: Theme.of(context).disabledColor,
            period: const Duration(seconds: 1),
            highlightColor: Theme.of(context).colorScheme.background,
            child: FeatureCardWidget(
              feature: Feature(
                name: '....',
                enabled: false,
              ),
            ),
          ),
        );
      },
    );
  }
}
