import 'package:brasa_hacks_stone/shared/themes/app_colors.dart';
import 'package:brasa_hacks_stone/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProductSugestionWidget extends StatelessWidget {
  const ProductSugestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          surfaceTintColor: Colors.white,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 16),
                  Image.asset(
                    'assets/images/cloudy.png',
                    height: 50,
                    width: 50,
                  ),
                  Spacer(flex: 1),
                  Text(
                    "18°",
                    style: AppTextStyles.contador
                        .copyWith(fontSize: 50, color: AppColors.secondary),
                  ),
                  SizedBox(width: 8),
                  Image.asset(
                    'assets/images/hot.png',
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(width: 16),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 16),
        Text(
          "Com base no tempo, poderá ter um aumento em vendas de:",
          style: AppTextStyles.description.copyWith(color: Colors.white),
        ),
        SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  // itemCount: produtos.length,
                  itemBuilder: (context, index) {
                    List<String> place = ["🥇", "🥈", "🥉"];
                    List teste = [
                      {
                        "mcc_description": "Café",
                      },
                      {
                        "mcc_description": "Sopas",
                      },
                      {
                        "mcc_description": "Chocolate quente",
                      }
                    ];
                    return ListTile(
                      leading: Text(
                        place[index],
                        style: const TextStyle(fontSize: 22),
                      ),
                      title: Text(
                        teste[index]["mcc_description"],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
