
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/views/components/custom_text.dart';
import 'package:flutter/material.dart';
import '../../../../utils/app_images/app_images.dart';
import '../Widgets/firstaid_widgets.dart';

class ManejoScreen extends StatelessWidget {
  const ManejoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: FirstAidAppBar(titleText: "Manejo de Convulsiones".toUpperCase(),),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const CustomText(text: "Pasos a seguir para manejar convulsiones en perros y gatos:"),
            const CustomTitleText(titleText: "Durante la convulsión:", textAlignment: Alignment.center, isDecoration: false,),
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.manejo_1,
                  scale: 2,
                )
            ),
            6.height,
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
                      text: 'Es fundamental que te mantengas calmado para poder ayudar a tu mascota de manera adecuada. El pánico solo empeorará la situación.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '2. Aleja a otros animales y personas: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Para evitar lesiones durante la convulsión, aleja a otros animales y personas del área donde se encuentra tu mascota.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '3. Protege a la mascota: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Retira cualquier objeto cercano que pueda causarle daño a la mascota durante la convulsión.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '4. Anota la duración de la convulsión: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Es importante cronometrar la duración de la convulsión para informar al veterinario.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '5. No intentes detener la convulsión:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' No intentes sujetar a tu mascota ni meterle nada en la boca durante la convulsión, ya que esto podría causarle más daño.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '6. Coloca a tu mascota de lado:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Una vez que la convulsión haya terminado, coloca a tu mascota de lado en una posición cómoda para que pueda respirar con facilidad.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '7. Mantén la cabeza de tu mascota elevada:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Puedes colocar una almohada o una toalla debajo de la cabeza de tu mascota para mantenerla elevada.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '8. No le des agua ni comida a tu mascota hasta que esté completamente consciente:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Es importante esperar a que tu mascota esté completamente despierta y alerta antes de darle agua o comida, ya que podría atragantarse.',
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
            const CustomTitleText(titleText: "Después de la convulsión:", isDecoration: false, textAlignment: Alignment.center,),
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.manejo_2,
                  scale: 2,
                )
            ),
            6.height,
            const SizedBox(
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '1. Contacta a tu veterinario inmediatamente: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Incluso si la convulsión ha terminado, es importante que llames a tu veterinario de inmediato. El veterinario podrá evaluar a tu mascota, determinar la causa de las convulsiones y recomendar un tratamiento adecuado.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '2. Describe la convulsión al veterinario:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Al hablar con tu veterinario, debes describir la convulsión con la mayor cantidad de detalles posible, incluyendo:\n',
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
            DotRow(text: "La duración de la convulsión"),
            DotRow(text: "Los movimientos corporales que observaste"),
            DotRow(text: "Si tu mascota perdió el conocimiento o control de sus intestinos o vejiga"),
            DotRow(text: "Cualquier otro detalle relevante que hayas notado"),
            6.height,
            const SizedBox(
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '3. Lleva a tu mascota al veterinario lo antes posible: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Es importante que lleves a tu mascota al veterinario lo antes posible después de la convulsión, especialmente si es la primera vez que experimenta convulsiones o si las convulsiones fueron prolongadas o severas.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '4. Sigue las instrucciones del veterinario:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' El veterinario te proporcionará un plan de tratamiento específico para tu mascota, que puede incluir medicamentos, cambios en la dieta o pruebas adicionales. Es crucial seguir las instrucciones del veterinario al pie de la letra para controlar las convulsiones de tu mascota y prevenir futuras convulsiones.',
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
            const CustomTitleText(titleText: "Recuerda:"),
            DotRow(titleText: "Mantén la calma y actúa con seguridad:",text: " Es importante que te mantengas calmado durante la convulsión y tomes medidas para proteger a tu mascota."),
            DotRow(titleText: "No intentes detener la convulsión:",text: " No intentes sujetar a tu mascota ni meterle nada en la boca durante la convulsión."),
            DotRow(titleText: "Busca atención veterinaria inmediata:",text: " Es crucial que lleves a tu mascota al veterinario lo antes posible después de la convulsión."),
            DotRow(titleText: "Sigue las instrucciones del veterinario:",text: " El tratamiento adecuado para las convulsiones de tu mascota dependerá de la causa subyacente y del historial médico de tu mascota."),
            20.height,
          ],
        ),
      ),
    );
  }
}
