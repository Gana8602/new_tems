import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/style.dart';

class TextParameters extends StatefulWidget {
  const TextParameters({super.key});

  @override
  State<TextParameters> createState() => _TextParametersState();
}

class _TextParametersState extends State<TextParameters> {
  bool _showParamters = false;

  void _toggleParametersVisibility() {
    setState(() {
      _showParamters = !_showParamters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _toggleParametersVisibility();
      },
      child: Center(
        child: Stack(
          children: [
            Center(
              child: Text(
                'Click to Show Parameters',
                style: GoogleFonts.ubuntu(color: Colors.white),
              ),
            ),
            Visibility(
              visible: _showParamters,
              child: Positioned(
                top: 20,
                left: 20,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Parameter 1: Value',
                        style: GoogleFonts.ubuntu(fontSize: 16),
                      ),
                      Text(
                        'Parameter 2: Value',
                        style: GoogleFonts.ubuntu(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          _toggleParametersVisibility();
                        },
                        child: Text(
                          'Hide Parameters',
                          style: GoogleFonts.ubuntu(
                            fontSize: 16,
                            color: AppColor.Blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
