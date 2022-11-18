import 'package:flutter/material.dart';
import 'package:weathery/presentation/utils/colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
         width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: AppColors.c_060D26,
      ),
    );
  }
}