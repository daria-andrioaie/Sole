import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sole/resources/colors.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed,
        icon: const Icon(Icons.my_location_sharp,
        color: AppColors.amethyst,));
  }
}
