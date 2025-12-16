import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextBox extends StatefulWidget {
  String hint;
  VoidCallback callback;
  IconData iconData;
  TextEditingController controller;
   CustomTextBox({super.key,required this.hint,required this.callback,required this.iconData,required this.controller});

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  late TextEditingController controller;
  late String hint;
  late VoidCallback callback;
  late IconData iconData;

  @override
  void initState() {
    super.initState();
    hint = widget.hint;
    callback = widget.callback;
    iconData = widget.iconData;
    controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (context,constraints) {
        return SizedBox(
          height: 60.h,
          width: constraints.maxWidth,
          child:  TextField(controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                label: Text(hint),
                prefixIcon: Icon(iconData)
              ),
            
            ),

        );
      }
    );
  }
}
