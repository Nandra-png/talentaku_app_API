import 'package:flutter/material.dart';
import 'package:talentaku_app/widgets/welcome_sign.dart';

class KelasScreen extends StatelessWidget {
  const KelasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          const WelcomeSign(),
          const SizedBox(height: 200),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/abc.png',
                  width: 200,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 320,
                  child: Text(
                    'ANDA BELUM \nBERGABUNG DALAM KELAS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF333D6B),
                      fontSize: 20,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                      height: 1,
                      letterSpacing: -0.60,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
