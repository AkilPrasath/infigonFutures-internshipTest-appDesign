import 'package:flutter/material.dart';

class LegendRow extends StatelessWidget {
  const LegendRow({
    Key key,
    @required this.height,
    @required this.color,
    @required this.text,
  }) : super(key: key);

  final double height;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 0.02 * height,
          height: 0.02 * height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Text(
            "$text",
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
