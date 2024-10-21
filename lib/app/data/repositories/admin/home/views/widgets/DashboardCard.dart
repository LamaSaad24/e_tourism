import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  DashboardCard({
    required this.color,
    required this.icon,
    required this.label,
    required this.value,
    required this.route,
  });
  final Color color;
  final IconData icon;
  final String label;
  final int value;
  final String route;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 40,
      margin: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset.zero)
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 50,
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
              color: color,
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  value.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
