import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';

import 'widgets/custom_stepper.dart';

class AccountRegistScreen extends StatefulWidget {
  const AccountRegistScreen({Key? key}) : super(key: key);

  @override
  _AccountRegistScreenState createState() => _AccountRegistScreenState();
}

class _AccountRegistScreenState extends State<AccountRegistScreen> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 52.5),
          child: CustomStepper(
            currentStep: currentStep,
            type: StepperType.horizontal,
            onStepContinue: () => setState(() {
              ++currentStep;
            }),
            onStepCancel: () => setState(() {
              --currentStep;
            }),
            steps: [
              Step(
                title: SizedBox.shrink(),
                isActive: 0 == currentStep,
                state: 0 == currentStep
                    ? StepState.editing
                    : 0 < currentStep
                        ? StepState.complete
                        : StepState.disabled,
                content: Container(
                  color: Colors.amber,
                  child: Column(),
                ),
              ),
              Step(
                title: SizedBox.shrink(),
                isActive: 1 == currentStep,
                state: 1 == currentStep
                    ? StepState.editing
                    : 1 < currentStep
                        ? StepState.complete
                        : StepState.disabled,
                content: Center(child: Text('step 2')),
              ),
              Step(
                title: SizedBox.shrink(),
                isActive: 2 == currentStep,
                state: 2 == currentStep
                    ? StepState.editing
                    : 2 < currentStep
                        ? StepState.complete
                        : StepState.disabled,
                content: Center(child: Text('step 3')),
              ),
              Step(
                title: SizedBox.shrink(),
                isActive: 3 == currentStep,
                state: 3 == currentStep
                    ? StepState.editing
                    : 3 < currentStep
                        ? StepState.complete
                        : StepState.disabled,
                content: Center(child: Text('step 4')),
              ),
              Step(
                title: SizedBox.shrink(),
                isActive: 4 == currentStep,
                state: 4 == currentStep
                    ? StepState.editing
                    : 4 < currentStep
                        ? StepState.complete
                        : StepState.disabled,
                content: Center(child: Text('step 5')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
