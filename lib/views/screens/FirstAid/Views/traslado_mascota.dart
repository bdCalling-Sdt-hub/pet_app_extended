
import 'package:felpus/extensions/extension.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_images/app_images.dart';
import '../Widgets/firstaid_widgets.dart';


class TrasladoMascota extends StatelessWidget {
  const TrasladoMascota({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
          child: FirstAidAppBar(
            titleText: "TRASLADO DE MASCOTA LESIONADA".toUpperCase(),
          ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [

            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.trasladoMascota,
                  scale: 2,
                ),
            ),
            6.height,
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Preparación:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(height: 3),
            const SizedBox(
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '1. Mantén la calma: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Tu tranquilidad ayudará a tranquilizar a tu mascota. Habla con voz suave y cariñosa.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '2. Evalúa la situación: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Determina la gravedad de la lesión. Si hay sangrado abundante, busca atención médica inmediata.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '3. Reúne los materiales necesarios:\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DotRow(titleText: "Caja transportadora:", text: " Elige una caja del tamaño adecuado donde tu mascota pueda estar cómoda acostada, sentada o girando."),
            DotRow(titleText: "Mantas o toallas:",text: " Para acolchar la caja y absorber líquidos corporales en caso de vómitos o diarrea."),
            DotRow(titleText: "Bozal y correa (solo para perros):", text: " Si es necesario controlar a tu mascota durante el transporte."),
            DotRow(titleText: "Bolsa de hielo:",text: " Útil para reducir la hinchazón en caso de lesiones musculares o articulares."),

            const SizedBox(
              width: double.infinity,
              child: Text(
                'Transporte de la mascota:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            6.height,
            const SizedBox(
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '1. Asegúrate de que la caja transportadora esté limpia y seca.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '2. Cubre el fondo de la caja con mantas o toallas.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '3. Si la lesión lo permite, anima a tu mascota a entrar en la caja por sí misma.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Puedes ofrecerle golosinas o juguetes para atraerla.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '4. Si tu mascota se resiste, no la fuerces.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Puedes intentar guiarla suavemente con la mano o utilizar una toalla para envolverla y levantarla con cuidado.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '5. Una vez dentro, cierra la caja de forma segura.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '6. Coloca la caja en el asiento trasero del vehículo, asegurada con cinturones de seguridad o correas. ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'No transportes a tu mascota en el regazo o sin sujeción adecuada.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '7. Durante el viaje, evita movimientos bruscos o frenadas. ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Mantén un ambiente tranquilo y habla con tu mascota en tono tranquilizador.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '8. Si tu mascota se muestra ansiosa, puedes cubrir la caja con una manta para crear un ambiente de oscuridad y seguridad.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            6.height,
            const SizedBox(
              width: double.infinity,
              child: Text(
                'En el veterinario:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(height: 3),
            const SizedBox(
              width: double.infinity,
              child: Text(
                '1. Al llegar al veterinario, informa al personal sobre la situación de tu mascota y la lesión que presenta.\n2. Muestra la caja transportadora y permite que el veterinario la abra con cuidado.\n3. Proporciona toda la información relevante sobre la salud de tu mascota, incluyendo historial médico, medicamentos que toma y posibles alergias.\n4. Sigue las instrucciones del veterinario para el cuidado y tratamiento de tu mascota.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),

            const CustomTitleText(titleText: "Recomendaciones adicionales:", isDecoration: false,),
            DotRow(titleText: "Si tu mascota tiene una lesión grave, consulta con el veterinario antes de transportarla.",text: " Es posible que requiera estabilización o atención médica previa al traslado."),
            DotRow(titleText: "Si tu mascota vomita o tiene diarrea durante el viaje,",text: " limpia la caja lo antes posible para evitar olores y molestias."),
            DotRow(titleText: "Ten a mano el número de teléfono de tu veterinario y de un centro de urgencias veterinarias por si acaso.", text: "",),
            20.height
          ],
        ),
      ),
    );
  }
}
