import 'package:flutter/material.dart';

class BackgroundWave extends StatelessWidget {
  final double height;

  const BackgroundWave({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ClipPath(
          clipper:  BackgroundWaveClipper(),
            child: Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                        // gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xff71d28b), Color(0xff5fc37b)], ),
                        image: DecorationImage(
                          image: AssetImage('images/backgroundhome.png'),
                          fit: BoxFit.cover,
                        ),
                    ),
                ),
                
              ]
            ),
        ),
    );
  }
}

class BackgroundWaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double radius = 8.0;
    Path path = Path();

    // Draw the top container
    // path.moveTo(radius, 0);
    path.lineTo(size.width, 0);
    // path.arcToPoint(Offset(size.width, radius), radius: Radius.circular(radius), clockwise: false);
    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(Offset(size.width - radius, size.height - 2 * radius), radius: Radius.circular(radius), clockwise: false);

    // Draw the bottom container
    path.lineTo(radius, size.height - 2 * radius);
    path.arcToPoint(Offset(0, size.height - radius), radius: Radius.circular(radius), clockwise: false);
    path.lineTo(0, radius);
    // path.arcToPoint(Offset(radius, 0), radius: Radius.circular(radius), clockwise: false);

    return path;
  }

  @override
  bool shouldReclip(BackgroundWaveClipper oldClipper) => oldClipper != this;
}
