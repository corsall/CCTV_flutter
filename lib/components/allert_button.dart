import 'package:flutter/material.dart';

class AllertButton extends StatefulWidget {
  const AllertButton({super.key, required this.title, required this.onPressed});

  final String title;
  final Function onPressed;

  @override
  State<AllertButton> createState() => _AllertButtonState();
}

class _AllertButtonState extends State<AllertButton> {
  final ValueNotifier<bool> _isHovered = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _isHovered.value = true,
      onExit: (_) => _isHovered.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: _isHovered,
        builder: (context, isHovered, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isHovered ? 120 : 80, // Adjust the width based on hover state
            height: isHovered ? 120 : 80, // Adjust the height based on hover state
            child: FloatingActionButton(
              onPressed: () {
                widget.onPressed();
              },
              tooltip: widget.title,
              backgroundColor: isHovered ? Colors.red[700] : Colors.red[400], // Change color on hover
              foregroundColor: Colors.black,
              hoverColor: Colors.red[700],
              child: const Icon(Icons.add_alert),
            ),
          );
        },
      ),
    );
  }
}
