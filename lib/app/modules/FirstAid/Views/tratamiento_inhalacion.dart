
import 'package:felpus/app/common/Extension/extension.dart';
import 'package:flutter/material.dart';

import '../../../common/app_images/app_images.dart';
import '../Widgets/firstaid_widgets.dart';

class TratamientoInhalacion extends StatelessWidget {
  const TratamientoInhalacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: FirstAidAppBar(titleText: "Tratamiento de inhalación de humo".toUpperCase())),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.tratamientoInhalacion_2,
                  scale: 2,
                ),
            ),
            6.height,
            Text(
              'Paso 1: Evaluar la situación',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '1. Seguridad: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'Asegúrate de que la fuente del humo esté controlada o que la mascota esté en un lugar seguro lejos del humo.\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: '2. Evaluar la condición de la mascota:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: ' Observa los síntomas de inhalación de humo, como:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            DotRow(text: "Dificultad para respirar"),
            DotRow(text: "Tos"),
            DotRow(text: "Secreción nasal o bucal"),
            DotRow(text: "Ojos irritados"),
            DotRow(text: "Letargo o debilidad"),
            DotRow(text: "Encías de color anormal (pálidas, azules o rojas)"),

            CustomTitleText(titleText: "Paso 2: Proveer primeros auxilios", isDecoration: false,),
            CustomTitleText(titleText: "1. Llevar a la mascota a un área bien ventilada:", isDecoration: false, fontSize: 14, leftPadding: 6,),
            DotRow(titleText: "Aire fresco:",text: " Traslada a la mascota a un lugar con aire fresco y limpio, preferiblemente al exterior."),

            CustomTitleText(titleText: "2. Evaluar la respiración:", isDecoration: false, fontSize: 14, leftPadding: 6,),
            DotRow(titleText: "Respiración normal:",text: " Observa si la mascota está respirando normalmente. Si no respira, prepárate para realizar RCP (Consulta la guía de RCP en mascotas)"),

            CustomTitleText(titleText: "3. Hidratación:", isDecoration: false, fontSize: 14, leftPadding: 6,),
            DotRow(titleText: "Ofrecer agua:",text: " Si la mascota está consciente y puede beber, ofrécele pequeñas cantidades de agua fresca."),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.tratamientoInhalacion_1,
                scale: 2,
              ),
            ),
            6.height,
            CustomTitleText(titleText: "Paso 3: Atender los ojos y la boca", isDecoration: false,),

            CustomTitleText(titleText: "1. Lavar los ojos:", isDecoration: false, fontSize: 14, leftPadding: 6,),
            DotRow(titleText: "Solución salina:",text: " Si los ojos están irritados, enjuágalos suavemente con solución salina o agua limpia."),

            CustomTitleText(titleText: "2. Limpiar la boca y nariz:", isDecoration: false, fontSize: 14, leftPadding: 6,),
            DotRow(titleText: "Paño húmedo:",text: " Usa un paño húmedo para limpiar cualquier residuo de humo o ceniza alrededor de la boca y la nariz de la mascota."),

            CustomTitleText(titleText: "Paso 4: Atención veterinaria urgente", isDecoration: false,),
            CustomTitleText(titleText: "1. Contactar al veterinario:", isDecoration: false, fontSize: 14, leftPadding: 6,),
            DotRow(titleText: "Consulta inmediata:",text: " Lleva a la mascota al veterinario lo antes posible, incluso si parece estar mejorando. La inhalación de humo puede causar daños internos no visibles de inmediato."),
            CustomTitleText(titleText: "2. Información al veterinario:", isDecoration: false, fontSize: 14, leftPadding: 6,),
            DotRow(titleText: "Detalles del incidente:",text: " Informa al veterinario sobre la exposición al humo, la duración y los síntomas observados."),


            CustomTitleText(titleText: "Paso 5: Monitoreo en el camino al veterinario", isDecoration: false,),
            CustomTitleText(titleText: "1. Lavar los ojos:", isDecoration: false, fontSize: 14, leftPadding: 6,),
            DotRow(titleText: "Solución salina:",text: " Si los ojos están irritados, enjuágalos suavemente con solución salina o agua limpia."),
            CustomTitleText(titleText: "1. Lavar los ojos:", isDecoration: false, fontSize: 14, leftPadding: 6,),
            DotRow(titleText: "Solución salina:",text: " Si los ojos están irritados, enjuágalos suavemente con solución salina o agua limpia."),

          ],
        ),
      ),
    );
  }
}
