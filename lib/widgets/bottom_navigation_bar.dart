import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({
    Key? key,
    required this.onChange,
    required this.cIndex,
  }) : super(key: key);
  final Function(int) onChange;

  final int cIndex;

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.cIndex,
      onTap: widget.onChange,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: 'Register',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Lawyers',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dehaze),
          label: 'More',
        ),
      ],
      selectedItemColor: Color(0xff4F7344),
    );
  }
}
