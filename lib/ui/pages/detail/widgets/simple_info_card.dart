import 'package:flutter/material.dart';



class SimpleInfoCard extends StatelessWidget {

  final String title;
  final String value;

  const SimpleInfoCard({
    super.key, 
    required this.title, 
    required this.value,
  });


  @override
  Widget build(BuildContext context) {

    final textStylesTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: textStylesTheme.titleMedium?.copyWith(
                color: Theme.of(context).primaryColor
              )
            ),
            const SizedBox(width: 5),
            Text(
              value,
              style: textStylesTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}