import 'package:brasa_hacks_stone/pages/prompt_page/prompt_controller.dart';
import 'package:brasa_hacks_stone/pages/prompt_page/widgets/mais_vendidos_widget.dart';
import 'package:brasa_hacks_stone/pages/prompt_page/widgets/melhores_negocios_widget.dart';
import 'package:brasa_hacks_stone/pages/prompt_page/widgets/product_sugestion_widget.dart';
import 'package:brasa_hacks_stone/shared/themes/app_colors.dart';
import 'package:brasa_hacks_stone/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PromptPage extends StatefulWidget {
  const PromptPage({super.key});

  @override
  State<PromptPage> createState() => _PromptPageState();
}

class _PromptPageState extends State<PromptPage> {
  PromptController controller = PromptController();
  double height = 0;
  String? text;

  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dashboards",
                style: AppTextStyles.title.copyWith(color: Colors.white),
              ),
              FutureBuilder(
                future: controller.createTelas(text),
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
                      style:
                          AppTextStyles.subtile.copyWith(color: Colors.white),
                    );
                  }
                  print(snapshot.data);

                  if (snapshot.hasData) {
                    switch (snapshot.data["tipo_de_dashboard"]) {
                      case "mais_vendidos":
                        return MaisVendidosWidget(produtos: ["produtos"]);
                      case "meu_estado":
                        return MelhoresNegociosPorEstado();
                      case "product_sugestion":
                        return ProductSugestionWidget();
                      default:
                        return Text(
                          "Encontraremos as melhores informações para seu negócio",
                          style: AppTextStyles.subtile
                              .copyWith(color: Colors.white),
                        );
                    }
                  }
                  // if (true) {
                  //   final dados = snapshot.data;
                  //   return const MaisVendidosWidget(
                  //       produtos: ["produtos", "queijo", "presunto"]);
                  // }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.white,
        child: SizedBox(
          width: 300,
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: TextField(
                  controller: editingController,
                  decoration: const InputDecoration(
                    hintText: 'Descreva sobre qual insight você deseja',
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        text = editingController.text;
                        editingController.text = "";
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.send,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
