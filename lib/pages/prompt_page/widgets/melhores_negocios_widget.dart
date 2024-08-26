import 'package:brasa_hacks_stone/api/services/external/mcc/best_mcc_per_states_post.dart';
import 'package:brasa_hacks_stone/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MelhoresNegociosPorEstado extends StatelessWidget {
  final String? estado;
  const MelhoresNegociosPorEstado({super.key, this.estado = "MG"});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> estadosBrasil = {
      "AC": "Acre",
      "AL": "Alagoas",
      "AP": "Amapá",
      "AM": "Amazonas",
      "BA": "Bahia",
      "CE": "Ceará",
      "DF": "Distrito Federal",
      "ES": "Espírito Santo",
      "GO": "Goiás",
      "MA": "Maranhão",
      "MT": "Mato Grosso",
      "MS": "Mato Grosso do Sul",
      "MG": "Minas Gerais",
      "PA": "Pará",
      "PB": "Paraíba",
      "PR": "Paraná",
      "PE": "Pernambuco",
      "PI": "Piauí",
      "RJ": "Rio de Janeiro",
      "RN": "Rio Grande do Norte",
      "RS": "Rio Grande do Sul",
      "RO": "Rondônia",
      "RR": "Roraima",
      "SC": "Santa Catarina",
      "SP": "São Paulo",
      "SE": "Sergipe",
      "TO": "Tocantins"
    };

    return FutureBuilder(
        future: PostBestMccPerState().fetch(estado!),
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
            List negocios = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${estadosBrasil[estado]!} tem principais os negócios:",
                  style:
                      AppTextStyles.description.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Image.asset(
                    "assets/images/estados/BR-$estado.png",
                    height: 200,
                  ),
                ),
                const SizedBox(height: 16),
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
                          itemCount: negocios.length,
                          itemBuilder: (context, index) {
                            List<String> place = ["🥇", "🥈", "🥉"];

                            return ListTile(
                              leading: Text(
                                place[index],
                                style: const TextStyle(fontSize: 22),
                              ),
                              title: Text(
                                negocios[index]["mcc_description"],
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
          return Container();
        });
  }
}
