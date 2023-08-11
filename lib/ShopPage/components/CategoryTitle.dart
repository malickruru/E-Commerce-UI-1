// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  final String title;
  final String buttonText;
  var  link;
  CategoryTitle({super.key, required this.title, required this.buttonText , required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 22,
              shadows: [
                Shadow(
                  blurRadius: 2,
                  color: Colors.black,
                  offset: Offset(0, 0),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: link,
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
