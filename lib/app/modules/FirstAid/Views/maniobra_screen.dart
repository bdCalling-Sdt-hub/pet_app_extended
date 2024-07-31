import 'package:felpus/app/common/Extension/extension.dart';
import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../Widgets/firstaid_widgets.dart';

class Maniobra extends StatelessWidget {
  const Maniobra({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: FirstAidAppBar(
            titleText: "MANIOBRA DE HEIMLICH PARA AHOGOS",
          )),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.maniobra_1,
                  scale: 2,
                )),
            8.height,
            const SizedBox(
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'La primera opción será explorar la boca del animal en busca del objeto, una vez comprobado que la tos no ha conseguido la expulsión. Si la tos no ha funcionado hay que ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'colocar al animal boca abajo y sacudirle.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' Puede que no resulte, por lo que se puede recurrir a unas palmadas entre los hombros, el último recurso antes de la maniobra de Heimlich, que no difiere prácticamente de la que se ejecuta en humanos.',
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
            CustomTitleText(titleText: "Pasos para realizar la maniobra de Heimlich:"),
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.maniobra_2,
                  scale: 2,
                )),
            const SizedBox(
              width: 331,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '1. Coloca a tu mascota boca abajo:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' coloca el pecho lo más cerca posible de la espalda de la mascota. Después rodea el pecho del animal con los brazos. \n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '2. Localiza el punto de presión:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Ubica la zona blanda del abdomen, justo debajo del diafragma.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '3. Realiza compresiones abdominales:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Presiona firmemente hacia adentro y arriba con el puño cerrado, de 5 a 10 veces, con movimientos rápidos y bruscos.',
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
                  AppImages.maniobra_3,
                  scale: 2,
                )),
            const SizedBox(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '4. Revisa si el objeto ha sido expulsado:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Observa si el objeto que causa la obstrucción ha sido expulsado por la boca. Si no es así, repite las compresiones.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '5. Busca atención veterinaria inmediata:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Incluso si el objeto ha sido expulsado, es importante llevar a tu mascota al veterinario de inmediato para descartar cualquier daño interno.',
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
            16.height,
            CustomTitleText(titleText: "Recuerda:"),
            6.height,
            DotRow(titleText: "Mantén la calma:",text: " Es fundamental que te mantengas calmado para poder actuar con claridad y salvar a tu mascota."),
            DotRow(titleText: "Actúa rápido:",text: " El tiempo es crucial en casos de atragantamiento. Cuanto antes realices la maniobra de Heimlich, mayor será la probabilidad de salvar a tu mascota."),
            DotRow(titleText: "No intentes meter los dedos en la boca de tu mascota:",text: " Esto podría empeorar la obstrucción y causar más daño."),
            DotRow(titleText: "Si no estás seguro de qué hacer:",text: " Si no estás seguro de si tu mascota se está ahogando o cómo realizar la maniobra de Heimlich, no dudes en llamar a tu veterinario o buscar ayuda profesional de inmediato."),
            20.height
          ],
        ),
      ),
    );
  }
}
