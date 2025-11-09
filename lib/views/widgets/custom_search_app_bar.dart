import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_Icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text('Notes' , style: TextStyle(
          fontSize: 32,
          ),
        ),
        Spacer(),
        CustomSearchIcon(),
      ],
    );
  }
}

