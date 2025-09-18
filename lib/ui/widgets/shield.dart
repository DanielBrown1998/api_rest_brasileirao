import 'package:flutter/material.dart';

class ShieldWidget extends StatelessWidget {
  final String urlShield;
  final double? width;
  final double? height;
  const ShieldWidget({
    super.key,
    required this.urlShield,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return (urlShield.isNotEmpty)
        ? Image.network(
            urlShield,
            filterQuality: FilterQuality.medium,
            fit: BoxFit.contain,
            height: height ?? size.height * 0.05,
            width: width ?? size.height * 0.05,
            errorBuilder: (context, error, stackTrace) {
              return CircleAvatar(
                backgroundColor: Colors.grey[200],
                maxRadius: 30,
                minRadius: 15,
                child: Text("no-logo", textAlign: TextAlign.center),
              );
            },
          )
        : CircleAvatar();
  }
}
