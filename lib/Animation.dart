/// Flutter code sample for AnimatedAlign

// The following code implements the [AnimatedAlign] widget, using a [curve] of
// [Curves.fastOutSlowIn].

import 'package:flutter/material.dart';
import 'dart:math';

/// This is the stateful widget that the main application instantiates.
// class MyAnimation extends StatefulWidget {
//   const MyAnimation({Key? key}) : super(key: key);
//
//   @override
//   State<MyAnimation> createState() => _MyAnimationState();
// }
//
// /// This is the private State class that goes with MyStatefulWidget.
// class _MyAnimationState extends State<MyAnimation> {
//   bool selected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selected = !selected;
//         });
//       },
//       child: Center(
//         child: Container(
//           width: 250.0,
//           height: 250.0,
//           color: Colors.red,
//           child: AnimatedAlign(
//             alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
//             duration: const Duration(seconds: 1),
//             curve: Curves.fastOutSlowIn,
//             child: const FlutterLogo(size: 50.0),
//           ),
//         ),
//       ),
//     );
//   }
// }
// //---------------------------------------------------------------------------------
// class MyAnimation extends StatefulWidget {
//   const MyAnimation({Key? key}) : super(key: key);
//
//   @override
//   State<MyAnimation> createState() => _MyAnimationState();
// }
//
// /// This is the private State class that goes with MyStatefulWidget.
// class _MyAnimationState extends State<MyAnimation>
//     with TickerProviderStateMixin {
//   late final AnimationController _controller = AnimationController(
//     duration: const Duration(seconds: 10),
//     vsync: this,
//   )..repeat();
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       child: Container(
//         width: 200.0,
//         height: 200.0,
//         color: Colors.green,
//         child: const Center(
//           child: Text('Whee!'),
//         ),
//       ),
//       builder: (BuildContext context, Widget? child) {
//         return Transform.rotate(
//           angle: _controller.value * 2.0 * pi,
//           child: child,
//         );
//       },
//     );
//   }
// }
///---------------------------------------------------------------------

// class MyAnimation extends StatefulWidget {
//   const MyAnimation({Key? key}) : super(key: key);
//
//   @override
//   State<MyAnimation> createState() => _MyAnimationState();
// }
//
// /// This is the private State class that goes with MyStatefulWidget.
// class _MyAnimationState extends State<MyAnimation> {
//   bool selected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selected = !selected;
//         });
//       },
//       child: Center(
//         child: AnimatedContainer(
//           width: selected ? 400.0 : 200.0,
//           height: selected ? 200.0 : 400.0,
//           color: selected ? Colors.red : Colors.blue,
//           alignment:
//           selected ? Alignment.center : AlignmentDirectional.topCenter,
//           duration: const Duration(seconds: 1),
//           curve: Curves.fastOutSlowIn,
//           child: const FlutterLogo(size: 75),
//         ),
//       ),
//     );
//   }
// }
//---------------------------------------------------------------
//
//
// class MyAnimation extends StatefulWidget {
//   const MyAnimation({Key? key}) : super(key: key);
//
//   @override
//   State<MyAnimation> createState() => _MyAnimationState();
// }
//
// /// This is the private State class that goes with MyStatefulWidget.
// class _MyAnimationState extends State<MyAnimation> {
//   double opacityLevel = 1.0;
//
//   void _changeOpacity() {
//     setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Expanded(
//           child: AnimatedOpacity(
//             opacity: opacityLevel,
//             duration: const Duration(seconds: 3),
//             child: const FlutterLogo(size: 200,),
//           ),
//         ),
//         ElevatedButton(
//           child: const Text('Fade Logo'),
//           onPressed: _changeOpacity,
//         ),
//       ],
//     );
//   }
// }