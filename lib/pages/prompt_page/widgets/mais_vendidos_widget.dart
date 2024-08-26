import 'package:brasa_hacks_stone/api/services/external/best_products/best_products_post.dart';
import 'package:brasa_hacks_stone/shared/themes/app_colors.dart';
import 'package:brasa_hacks_stone/shared/themes/app_text_styles.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MaisVendidosWidget extends StatelessWidget {
  final List<String> produtos;
  const MaisVendidosWidget({super.key, required this.produtos});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: PostBestProducts.fetch("7523807556076637323"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: LottieBuilder.asset(
                  'assets/lottie/loading.json',
                  height: 400,
                  width: 400,
                ),
              ),
            );
          }

          if (snapshot.hasData && snapshot.data!.isEmpty) {
            return Text(
              "Encontraremos as melhores informações para seu negócio",
              style: AppTextStyles.subtile.copyWith(color: Colors.white),
            );
          }

          if (snapshot.hasData) {
            List produtos = snapshot.data!;
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mais vendidos:",
                      style: AppTextStyles.subtile.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: produtos.length,
                      itemBuilder: (context, index) {
                        List<String> place = [
                          "🥇",
                          "🥈",
                          "🥉",
                          "",
                          "",
                          "",
                          "",
                        ];
                        final int quantidade = 10;
                        return ListTile(
                          leading: Text(
                            place[index],
                            style: TextStyle(fontSize: 22),
                          ),
                          title: Text(snapshot.data![index]["item"]!),
                          subtitle: Text(
                              "${snapshot.data![index]["total_quantity_sold"]!} itens vendidos"),
                          trailing: Text(
                            UtilBrasilFields.obterReal(
                                snapshot.data![index]["total_revenue_sold"]!),
                            style: AppTextStyles.button.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        });
  }
}
