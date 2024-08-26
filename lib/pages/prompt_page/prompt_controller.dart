import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class PromptController {
  Future createTelas(String? text) async {
    const String primeiroContexto =
        "Caso o precise identificar quais produtos mais vendem, tipo_de_dashboard: mais_vendidos.";
    const String segundoContexto =
        "Caso o precise identificar quais negocios estão em alta no meu estado, tipo_de_dashboard: meu_estado.";
    const String terceiroContexto =
        "Caso o precise identificar quais produtos são recomendaveis para amanhã com base no tempo, tipo_de_dashboard: product_sugestion.";
    if (text == null || text.isEmpty) return [];

    await dotenv.load(fileName: ".env");
    // print(dotenv.env["gemini_key"]!);
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: dotenv.env["gemini_key"]!,
      systemInstruction: Content.text(
        '''
Com base no contexto da mensagem gere um json seguinte formato: {"tipo_de_dashboard": "dado"}, 
primeiro contexto: $primeiroContexto ou segundo: $segundoContexto ou terceiro: $terceiroContexto
''',
      ),
      generationConfig: GenerationConfig(
        temperature: 0,
      ),
    );
    final response = await model.generateContent(
      [
        Content.multi(
          [
            TextPart(text),
          ],
        ),
      ],
    );
    print(jsonDecode(
      response.text!
          .replaceAll(RegExp(r'```json\n'), "")
          .replaceAll(RegExp(r'```'), "")
          .replaceAll(RegExp(r'\n'), ""),
    ));
    return jsonDecode(
      response.text!
          .replaceAll(RegExp(r'```json\n'), "")
          .replaceAll(RegExp(r'```'), "")
          .replaceAll(RegExp(r'\n'), ""),
    );
  }
}
