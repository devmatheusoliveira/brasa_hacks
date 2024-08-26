import 'package:brasa_hacks_stone/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class SucessPage extends StatefulWidget {
  const SucessPage({super.key});

  @override
  State<SucessPage> createState() => _SucessPageState();
}

class _SucessPageState extends State<SucessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2ecc71),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.white,
                size: 50,
              ),
              SizedBox(height: 20),
              Text(
                "Sucesso",
                style: AppTextStyles.title.copyWith(color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                "ART emitida com sucesso, verifique na pasta Download",
                style: AppTextStyles.subtile.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
