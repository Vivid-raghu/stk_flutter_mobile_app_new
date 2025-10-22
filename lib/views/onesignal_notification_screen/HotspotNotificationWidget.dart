// import 'package:flutter/material.dart';
// import 'package:overlay_support/overlay_support.dart';
//
//
// class HotspotNotificationWidget extends StatelessWidget {
//   // final String vehicleNumber;
//   // final String location;
//   // final String dateTime;
//   // final String batteryCapacity;
//   // final String driverName;
//
//   final String title;
//   final String body;
//
//   const HotspotNotificationWidget({
//     super.key,
//     // required this.vehicleNumber,
//     // required this.location,
//     // required this.dateTime,
//     // required this.batteryCapacity,
//     // required this.driverName,
//     required this.body,
//     required this.title,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Material(
//       color: Colors.red.shade50,
//       elevation: 10,
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Row(
//           children: [
//             Image.asset(
//               'assets/icons/on_trip.png',
//               width: 24,
//               height: 24,
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: theme.textTheme.titleMedium?.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.lightBlue.shade800,
//                     ),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     body,
//                     style: theme.textTheme.bodyMedium?.copyWith(
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//
//                 ],
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.arrow_drop_down_outlined, color: Colors.grey.shade700),
//               onPressed: () {
//                 OverlaySupportEntry.of(context)?.dismiss();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }