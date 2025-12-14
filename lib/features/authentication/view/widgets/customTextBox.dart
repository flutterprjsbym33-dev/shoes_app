import 'package:flutter/material.dart';

class CustomTextBox extends StatefulWidget {
  String hint;
  VoidCallback callback;
  IconData iconData;
   CustomTextBox({super.key,required this.hint,required this.callback,required this.iconData});

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  late String hint;
  late VoidCallback callback;
  late IconData iconData;

  @override
  void initState() {
    super.initState();
    hint = widget.hint;
    callback = widget.callback;
    iconData = widget.iconData;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (context,constraints) {
        return SizedBox(
          height: height*0.08,
          width: constraints.maxWidth,
          child: Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                label: Text(hint),
                prefixIcon: Icon(iconData)
              ),
            
            ),
          ),
        );
      }
    );
  }
}
