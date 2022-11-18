import 'package:flutter/material.dart';
import 'package:weathery/core/service/service.dart';

class FutereBuilderWidget extends StatefulWidget {
  FutereBuilderWidget({super.key, required this.widgets});
  Widget widgets;

  @override
  State<FutereBuilderWidget> createState() => _FutereBuilderWidgetState();
}

class _FutereBuilderWidgetState extends State<FutereBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Service.getWeatherData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          );
        }
        if (snapshot.hasData) {
          return widget.widgets;
        }
        return const Center(
          child: Text(
            "You Are Loser! XA-XA-XA",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.red),
          ),
        );
      },
    );
  }
}
