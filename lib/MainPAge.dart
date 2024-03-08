import 'package:flutter/material.dart';

class line extends StatefulWidget {
  @override
  _lineState createState() => _lineState();
}

class _lineState extends State<line> {
  int _currentStep = 0;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Linear Progress Bar with Forms'),
      ),
      body: Column(
        children: [
          // LinearProgressWithStep(
          //   totalSteps: 3,
          //   currentStep: _currentStep,
          // ),
          Expanded(
            child: _currentStep == 0
                ? _buildStep1()
                : _currentStep == 1
                    ? _buildStep2()
                    : _buildStep3(),
          ),
        ],
      ),
    );
  }

  Widget _buildStep1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: _nameController,
          decoration: InputDecoration(labelText: 'Name'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _currentStep = 1;
            });
          },
          child: Text('Next'),
        ),
      ],
    );
  }

  Widget _buildStep2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentStep = 0;
                });
              },
              child: Text('Previous'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentStep = 2;
                });
              },
              child: Text('Next'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStep3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentStep = 1;
                });
              },
              child: Text('Previous'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle form submission
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ],
    );
  }
}
