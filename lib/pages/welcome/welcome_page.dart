import 'package:brasa_hacks_stone/shared/widgets/button_widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WellcomePage extends StatefulWidget {
  const WellcomePage({super.key});

  @override
  State<WellcomePage> createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Image.asset(
              "assets/images/wellcome.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.95),
                  Colors.black.withOpacity(0.0),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                  onPressed: () {},
                  text: "Tenho Cadastro",
                ),
                const SizedBox(height: 16),
                ButtonWidget(
                  color: Colors.white,
                  isOutlined: true,
                  onPressed: () {},
                  text: "Registrar-se",
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
