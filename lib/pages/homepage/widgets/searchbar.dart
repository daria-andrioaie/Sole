import 'package:flutter/material.dart';
import 'package:sole/resources/colors.dart';
import 'package:sole/resources/themes.dart';

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({super.key, required this.onSubmittedLocality});

  final Function(String locality) onSubmittedLocality;
  @override
  State<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: (tap) {
        setState(() {
          _expanded = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: _expanded ? MediaQuery.of(context).size.width : 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: AppThemes.borderRadius30,
          color: _expanded ? AppColors.lightBlue : Colors.transparent,
        ),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
                icon: Icon(_expanded ? Icons.arrow_back_ios : Icons.search)),
            Expanded(
                child: Container(child: _expanded ? TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search for another location', border: InputBorder.none),
                  onSubmitted: (String locality) => widget.onSubmittedLocality(locality),
                  ) : null,
                )),
          ],
        ),
      ),
    );
  }
}
