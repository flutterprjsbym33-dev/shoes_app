
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class Animatedtextwidget extends StatefulWidget {

  String title,subTitle;

   Animatedtextwidget({super.key,required this.title,required this.subTitle});

  @override
  State<Animatedtextwidget> createState() => _AnimatedtextwidgetState();
}

class _AnimatedtextwidgetState extends State<Animatedtextwidget> {

  bool showTitle = false;
  bool showSubtitle = false;

 late  String title,subTitle;


  @override
  void initState() {

    super.initState();
    title = widget.title;
    subTitle = widget.subTitle;

    // Text slides first
    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() => showTitle = true);
    });

    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() => showSubtitle = true);
    });

    // Card scales after

  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSlide(
          offset: showTitle ? Offset.zero : const Offset(-1, 0),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInBack,
          child: AnimatedOpacity(
            opacity: showTitle ? 1 : 0,
            duration: const Duration(seconds: 1),
            child:
                 Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 27.sp,
                  ),
                ),
            ),
          ),



        AnimatedSlide(
          offset: showSubtitle ? Offset.zero:Offset(-1, 0),
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: AnimatedOpacity(
            opacity: showSubtitle ? 1 : 0,
            duration: Duration(seconds: 1),
            child: Text(
             subTitle,
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 16.sp,
              ),
            ),),

        )
      ],
    );

  }
}
