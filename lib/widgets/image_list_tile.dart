import 'package:flutter/material.dart';

class ImageListTile extends StatelessWidget {
  const ImageListTile({
    Key key,
    @required this.width,
    @required this.height,
    @required this.image,
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  final double width;
  final double height;
  final Image image;
  final Widget title;
  final Widget subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: Container(
          constraints: BoxConstraints(
            maxWidth: 0.25 * width,
            minWidth: 0.25 * width,
            minHeight: 0.2 * height,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: image,
          ),
        ),
        title: title,
        subtitle: subtitle,
      ),
    );
  }
}
