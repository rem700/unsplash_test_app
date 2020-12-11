import 'package:flutter/material.dart';

class LoadIndicator extends StatelessWidget {
  final Color color;

  const LoadIndicator(this.color);

  @override
  Widget build(BuildContext context) => Center(
          child: Padding(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
        padding: const EdgeInsets.all(14.0),
      ));
}
