import 'package:flutter/material.dart';
import 'package:simollu_front/widgets/route_widget.dart';

class PathRecommended extends StatelessWidget {
  final Map<String, List<String>> routes;
  const PathRecommended({super.key, required this.routes});

  @override
  Widget build(BuildContext context) {
    print(routes);
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: routes.entries.map((entry) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: RouteWidget(routes: entry.value, name: entry.key),
            );
          }).toList()),
    );
  }
}
