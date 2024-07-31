
import 'package:felpus/app/common/Extension/extension.dart';
import 'package:felpus/app/modules/FirstAid/Widgets/firstaid_widgets.dart';
import 'package:flutter/material.dart';

import '../../../common/app_images/app_images.dart';

class TratamientoFracturas extends StatelessWidget {
  const TratamientoFracturas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
          child: FirstAidAppBar(titleText: "Tratamiento de Fracturas".toUpperCase()
          )
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.tratamientoFracturas,
                  scale: 2,
                )
            ),
            6.height,
            SizedBox(
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Como primera pauta en el caso de sospecha o evidencia de una fractura ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'es evitar, de forma general, cualquier movimiento del animal hasta que llegue a las manos del veterinario.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Sin embargo, no está de más atender al animal de forma inicial para evitar potenciales complicaciones y para ello intentar, ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'siempre que se tengan conocimientos de primeros auxilios, la inmovilización de la zona afectada.',
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
                textAlign: TextAlign.justify,
              ),
            ),
            const CustomTitleText(titleText: "Materiales necesarios:"),
            DotRow(titleText: "Férula:",text: " Puede ser una tablilla de madera, metal, plástico resistente u otro material rígido. En caso de no contar con una férula, se pueden utilizar objetos como ramas rectas, revistas enrolladas."),
            DotRow(titleText: "Tela o vendaje:",text: " Se utiliza para acolchar la férula y proteger la piel de la mascota accidentada."),
            DotRow(titleText: "Tijeras:",text: " Para cortar la tela o vendaje a la medida adecuada."),
            DotRow(titleText: "Cinta adhesiva o alfileres:",text: " Para asegurar la férula en su lugar."),
            DotRow(titleText: "Cinta adhesiva o alfileres:",text: " Para asegurar la férula en su lugar."),
            const CustomTitleText(titleText: "Pasos a seguir:"),
            const CustomTitleText(leftPadding: 8,titleText: "1. Evaluación inicial:", isDecoration: false, fontSize: 16,),
            DotRow(titleText: "Verificar la escena:",text: " Asegurarse de que el lugar sea seguro para realizar la intervención."),
            DotRow(titleText: "Evaluar la víctima:",text: " Comprobar si hay otras lesiones y si la mascota está consciente."),
            DotRow(titleText: "Controlar la hemorragia:",text: " Si hay sangrado, aplicar presión directa sobre la herida con un paño limpio."),
            const CustomTitleText(leftPadding: 8,titleText: "2. Posición de las manos:", isDecoration: false, fontSize: 16,),
            DotRow(titleText: "Colocar la extremidad en la posición más natural posible:", text: " Esto puede ayudar a reducir el dolor y la hinchazón."),
            DotRow(titleText: "Alinear los huesos rotos:", text: " Si es posible, intentar alinear los huesos rotos cuidadosamente. No intentar forzar la alineación si causa dolor intenso."),
            const CustomTitleText(leftPadding: 8, titleText: "3. Acolchado:", isDecoration: false, fontSize: 16,),
            DotRow(titleText: "Colocar tela o vendaje alrededor de la extremidad:",text: " Esto ayudará a proteger la piel y a evitar que la férula cause rozaduras."),
            DotRow(titleText: "Asegurar el acolchado:",text: " Fijar el acolchado con cinta adhesiva o vendaje."),
            const CustomTitleText(titleText: "4. Aplicación de la férula:", leftPadding: 8, isDecoration: false, fontSize: 16,),
            DotRow(titleText: "Seleccionar la férula adecuada:", text: " La férula debe ser lo suficientemente larga para inmovilizar la articulación por encima y por debajo de la fractura.",),
            DotRow(titleText: "Colocar la férula:", text: " Apoyar la férula a lo largo del hueso roto, manteniendo la alineación lograda en el paso 2.",),
            DotRow(titleText: "Ajustar la férula:", text: " La férula debe ajustarse firmemente, pero no debe apretar demasiado ni cortar la circulación.",),
            const CustomTitleText(titleText: "5. Fijación de la férula:", leftPadding: 8, isDecoration: false, fontSize: 16,),
            DotRow(titleText: "Asegurar la férula con cinta adhesiva o alfileres: ", text: "Se deben utilizar varias tiras de cinta o alfileres para garantizar una fijación segura.",),
            DotRow(titleText: "Evitar apretar demasiado:",text: "La férula debe estar firme, pero no debe causar dolor o molestia adicional."),
            const CustomTitleText(titleText: "6. Monitoreo y control de signos:", leftPadding: 8, isDecoration: false, fontSize: 16,),
            DotRow(titleText: "Observar la extremidad entablillada:",text: " Vigilar si hay signos de hinchazón, enrojecimiento, dolor intenso o entumecimiento."),
            DotRow(titleText: "Controlar la circulación:",text: " Asegurarse de que los dedos de la mano o del pie estén rosados ​​y sensibles al tacto."),
            DotRow(titleText: "Aflojar la férula si es necesario:",text: " Si se observa hinchazón o molestia significativa, aflojar ligeramente la férula."),

            20.height,
          ],
        ),
      ),
    );
  }
}
