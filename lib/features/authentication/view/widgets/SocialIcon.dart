import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocailIcon extends StatelessWidget {
  String path;
  VoidCallback onSocailIconTap;
   SocailIcon({super.key,required this.path,required this.onSocailIconTap});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
radius: 20.r,
      backgroundImage: AssetImage(path)
    );
  }
}
