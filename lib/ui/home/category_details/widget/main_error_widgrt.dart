import 'package:flutter/material.dart';
import 'package:news_app/utils/size_utils.dart';

class MainErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onPressed;
  const MainErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.height * 0.02,
      children: [
        Text(errorMessage, style: Theme.of(context).textTheme.labelMedium),
        ElevatedButton(
          onPressed: onPressed,

          child: Text(
            "Try Again",
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}
