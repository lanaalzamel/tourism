// import 'package:flutter/material.dart';

// import 'package:im_stepper/main.dart';
// import 'package:im_stepper/stepper.dart';

// void main() => runApp(DotStepperDemo());

// class DotStepperDemo extends StatefulWidget {
//   @override
//   _DotStepperDemo createState() => _DotStepperDemo();
// }

// class _DotStepperDemo extends State<DotStepperDemo> {
//   // REQUIRED: USED TO CONTROL THE STEPPER.
//   int activeStep = 0; // Initial step set to 0.

//   // OPTIONAL: can be set directly.
//   int dotCount = 5;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('DotStepper Example'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               DotStepper(
//                 // direction: Axis.vertical,
//                 dotCount: dotCount,
//                 dotRadius: 12,

//                 /// THIS MUST BE SET. SEE HOW IT IS CHANGED IN NEXT/PREVIOUS BUTTONS AND JUMP BUTTONS.
//                 activeStep: activeStep,
//                 shape: Shape.stadium,
//                 spacing: 10,
//                 indicator: Indicator.shift,

//                 /// TAPPING WILL NOT FUNCTION PROPERLY WITHOUT THIS PIECE OF CODE.
//                 onDotTapped: (tappedDotIndex) {
//                   setState(() {
//                     activeStep = tappedDotIndex;
//                   });
//                 },

//                 // DOT-STEPPER DECORATIONS
//                 fixedDotDecoration: FixedDotDecoration(
//                   color: Colors.red,
//                 ),

//                 indicatorDecoration: IndicatorDecoration(
//                   // style: PaintingStyle.stroke,
//                   // strokeWidth: 8,
//                   color: Colors.deepPurple,
//                 ),
//                 lineConnectorDecoration: LineConnectorDecoration(
//                   color: Colors.red,
//                   strokeWidth: 0,
//                 ),
//               ),

//               /// Jump buttons.
//               Padding(padding: const EdgeInsets.all(18.0), child: steps()),

//               // Next and Previous buttons.
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [previousButton(), nextButton()],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// Generates jump steps for dotCount number of steps, and returns them in a row.
//   Row steps() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: List.generate(dotCount, (index) {
//         return ElevatedButton(
//           child: Text('${index + 1}'),
//           onPressed: () {
//             setState(() {
//               activeStep = index;
//             });
//           },
//         );
//       }),
//     );
//   }

//   /// Returns the next button widget.
//   Widget nextButton() {
//     return ElevatedButton(
//       child: Text('Next'),
//       onPressed: () {
//         /// ACTIVE STEP MUST BE CHECKED FOR (dotCount - 1) AND NOT FOR dotCount To PREVENT Overflow ERROR.
//         if (activeStep < dotCount - 1) {
//           setState(() {
//             activeStep++;
//           });
//         }
//       },
//     );
//   }

//   /// Returns the previous button widget.
//   Widget previousButton() {
//     return ElevatedButton(
//       child: Text('Prev'),
//       onPressed: () {
//         // activeStep MUST BE GREATER THAN 0 TO PREVENT OVERFLOW.
//         if (activeStep > 0) {
//           setState(() {
//             activeStep--;
//           });
//         }
//       },
//     );
//   }
// }