
import 'package:felpus/extensions/extension.dart';
import 'package:flutter/material.dart';
import '../../../../utils/app_images/app_images.dart';
import '../Widgets/firstaid_widgets.dart';

class Monitorizacion extends StatelessWidget {
  Monitorizacion({super.key});

  List perros = [
    "Ubica la mano en el pecho del animal, cerca del corazón.",
    "Cuenta las pulsaciones durante 15 segundos.",
    "Multiplica el número por 4 para obtener las pulsaciones por minuto.",
    "Valores normales: 60 a 140 latidos por minuto."
  ];

  List gatos = [
    "Sujeta la pata delantera del gato con suavidad.",
    "Presiona con el dedo pulgar la almohadilla plantar.",
    "Cuenta las pulsaciones durante 15 segundos.",
    "Multiplica el número por 4 para obtener las pulsaciones por minuto.",
    "Valores normales: 110 a 200 latidos por minuto."
  ];

  List respiratoria = [
    "Observa al animal en reposo durante un minuto.",
    "Cuenta las veces que se expande el pecho.",
    "Valores normales:",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
          child: FirstAidAppBar(titleText: "MONITORIZACIÓN DE SIGNOS VITALES",)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTitleText(titleText: "Materials:"),
            DotRow(text: "Reloj con segundero o cronómetro"),
            DotRow(text: "Termómetro digital (rectal o de oído)"),
            const CustomTitleText(
              titleText: "Comprueba el ritmo cardíaco:",
              textAlignment: Alignment.center,
            ),
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.monitorizacion3,
                  scale: 2,
                )),
            const CustomTitleText(titleText: "Perros:"),
            NumberedList(list: perros),
            const CustomTitleText(titleText: "Gatos:"),
            NumberedList(list: gatos),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: CustomTitleText(
                titleText: "Comprueba la frecuencia respiratoria:",
                textAlignment: Alignment.center,
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.monitorizacion2,
                  scale: 2,
                )),
            NumberedList(list: respiratoria),
            DotRow(text: "Perros: 12 a 24 respiraciones por minuto."),
            DotRow(text: "Gatos: 15 a 30 respiraciones por minuto."),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomTitleText(
                  titleText: "Comprueba la temperatura corporal",
                  textAlignment: Alignment.center,
                )),
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.monitorizacion1,
                  scale: 2,
                )),
            20.height,
            const CustomTitleText(titleText: "1.Vía rectal:"),
            DotRow(
                text:
                    "Introduce el termómetro suavemente en el ano del animal a una profundidad de 1-2 cm."),
            DotRow(text: "Espera 1 minuto."),
            DotRow(text: "Retira el termómetro y lee la temperatura."),

            const CustomTitleText(titleText: "2.Vía auditiva (solo gatos):"),
            DotRow(text: "Utiliza un termómetro específico para oídos de animales."),
            DotRow(text: "Introduce el termómetro suavemente en el canal auditivo."),
            DotRow(text: "Espera 1 minuto."),
            DotRow(text: "Retira el termómetro y lee la temperatura."),
            const CustomTitleText(titleText: "3. Valores normales:"),

            DotRow(text: "Perros: 38,1°C a 39,2°C (100,5°F a 102,5°F)"),
            DotRow(text: "Gatos: 38°C a 39°C (100,4°F a 102,2°F)"),
            const CustomTitleText(titleText: "Consejos:"),
            DotRow(text: "Si el animal está agitado o ansioso, repite la medición después de unos minutos de calma."),
            DotRow(text: "Si detectas valores fuera del rango normal, consulta con un veterinario de inmediato."),

            20.height,
          ],
        ),
      ),
    );
  }
}

