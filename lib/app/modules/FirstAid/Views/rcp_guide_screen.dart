
import 'package:felpus/app/common/Extension/extension.dart';
import 'package:felpus/app/modules/FirstAid/Widgets/firstaid_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/app_images/app_images.dart';


class RCPGuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: FirstAidAppBar(titleText: "RCP (Reanimación Cardiopulmonar)",)),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                'Paso 1: Evaluar la situación',
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
            SizedBox(
              width: double.infinity,
              child: Text.rich(
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
                      text: 'Asegúrate de que el entorno sea seguro para ti y para la mascota.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '2. Respuesta:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Intenta despertar a la mascota. Llama su nombre y toca suavemente. Si no hay respuesta, procede a verificar la respiración y el pulso.',
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
                textAlign: TextAlign.justify,
              ),
            ),
            6.height,
            SizedBox(
              width: double.infinity,
              child: Text(
                'Paso 2: Verificar respiración y pulso',
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
            SizedBox(
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '1. Respiración: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Observa el pecho de la mascota para ver si se mueve. Puedes colocar tu mano cerca de la nariz o boca para sentir el aliento.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '2. Pulso: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Para perros, verifica el pulso en la arteria femoral (parte interior del muslo). Para gatos, puedes hacer lo mismo o revisar en la base del corazón.',
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
                textAlign: TextAlign.justify,
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.rcp_screen_1,
                  scale: 2,
                ),
            ),
            6.height,
            SizedBox(
              width: double.infinity,
              child: Text(
                'Paso 5: Traslado urgente',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: double.infinity,
              child: Text(
                'Incluso si la mascota responde, es crucial llevarla al veterinario de inmediato para una evaluación completa.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            CustomTitleText(titleText: "Recuerda:"),
            DotRow(titleText: "Mantén la calma:",text: " Es fundamental que te mantengas calmado para poder realizar la RCP de manera efectiva.")
          ],
        ),
      ),
    );
  }
}
