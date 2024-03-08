import 'package:flutter/material.dart';

class LinearProgressWithStep extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const LinearProgressWithStep({
    required this.totalSteps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          LinearProgressIndicator(
            minHeight: 26,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            value: (currentStep + 1) / totalSteps,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              totalSteps,
              (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 3),
                child: Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index <= currentStep ? Colors.blue : Colors.white,
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      size: 15,
                      color: index <= currentStep ? Colors.white : Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
