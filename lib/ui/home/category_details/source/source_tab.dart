import 'package:flutter/material.dart';
import 'package:news_app/api/model/source_response/source.dart';

class SourceTab extends StatelessWidget {
  final Source source;
  final bool isSeleccted;
  const SourceTab({super.key, required this.source, required this.isSeleccted});

  @override
  Widget build(BuildContext context) {
    return Text(
      source.name ?? "",
      style: isSeleccted
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.labelMedium,
    );
  }
}
