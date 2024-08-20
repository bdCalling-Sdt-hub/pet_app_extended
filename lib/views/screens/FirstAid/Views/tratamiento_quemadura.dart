
import 'package:felpus/extensions/extension.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_images/app_images.dart';
import '../Widgets/firstaid_widgets.dart';


class TratamientoQuemadura extends StatelessWidget {
  const TratamientoQuemadura({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
          child: FirstAidAppBar(titleText: "TRATAMIENTO QUEMADURA Y GOLPE DE CALOR")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.tratamientoQuemadura,
                  scale: 2,
                ),
            ),
            6.height,
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Tratamiento de Quemaduras en Mascotas',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),

            const Text(
              'Paso 1: Evaluar la situación',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            const SizedBox(height: 3),
            const SizedBox(
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
                      text: 'Asegúrate de que la fuente de la quemadura esté eliminada o apagada.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '2. Evaluar la quemadura: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Determina la gravedad de la quemadura. Las quemaduras de primer grado afectan solo la capa externa de la piel, las de segundo grado afectan la capa externa y la subyacente, y las de tercer grado afectan todas las capas de la piel.',
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
            ),

            6.height,
            const Text(
              'Paso 2: Primeros auxilios para quemaduras',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            const CustomTitleText(titleText: "1. Enfriar la quemadura:", fontSize: 14, isDecoration: false,),
            DotRow(titleText: "Agua fría:", text: " Enfría la quemadura con agua fría (no helada) durante al menos 10-15 minutos. No uses hielo ya que puede causar más daño.",),
            DotRow(titleText: "Compresas frías:", text: " Si no puedes usar agua corriente, aplica compresas frías y húmedas.",),
            const CustomTitleText(titleText: "2. Cubrir la quemadura:", fontSize: 14, isDecoration: false,),
            DotRow(titleText: "Material estéril:",text: "Cubre la quemadura con un paño limpio y húmedo o una gasa estéril. No uses algodón o materiales que puedan pegarse a la herida."),
            const CustomTitleText(titleText: "3. No aplicar cremas o ungüentos:", fontSize: 14, isDecoration: false,),
            DotRow(titleText: "Evitar productos caseros:",text: "No apliques cremas, ungüentos, aceites o mantequilla en la quemadura. Esto puede empeorar la situación."),
            const CustomTitleText(titleText: "Paso 3: Atención veterinaria", isDecoration: false,),
            const CustomTitleText(titleText: "1. Contactar al veterinario:", fontSize: 14, isDecoration: false,),
            DotRow(titleText:"Consulta inmediata:", text: " Lleva a la mascota al veterinario lo antes posible, especialmente si la quemadura es grave."),
            DotRow(titleText:"Información:", text: " Informa al veterinario sobre la causa y extensión de la quemadura."),
            6.height,
            const Text(
              'Tratamiento de Golpes de Calor en Mascotas',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            const CustomTitleText(titleText: "Paso 1: Evaluar la situación", isDecoration: false,),
            const CustomTitleText(titleText: "1. Reconocer los síntomas:", fontSize: 14, isDecoration: false,),
            DotRow(titleText: "Signos de golpe de calor:",text: " Jadeo excesivo, salivación excesiva, encías rojas o pálidas, lengua roja brillante, letargo, debilidad, vómitos, diarrea, colapso o inconsciencia."),
            const Text(
              'Paso 2: Primeros auxilios para golpes de calor',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            const CustomTitleText(titleText: "1. Mover a la mascota a un lugar fresco:", fontSize: 14, isDecoration: false,),
            DotRow(titleText: "Sombra o interior:",text: " Lleva a la mascota a un área sombreada o con aire acondicionado."),

            const CustomTitleText(titleText: "2. Enfriar a la mascota:", fontSize: 14, isDecoration: false,),
            DotRow(titleText: "Agua tibia:",text: " Usa agua tibia (no fría) para mojar su cuerpo. Puedes usar una manguera, toallas húmedas o sumergirla en agua."),
            DotRow(titleText: "Evitar el agua helada:",text: " No uses agua helada ya que puede causar un shock."),
            const CustomTitleText(titleText: "3. Hidratación:", fontSize: 14, isDecoration: false,),
            DotRow(titleText: "Ofrecer agua:",text: " Deja que la mascota beba pequeñas cantidades de agua fresca. No la fuerces a beber si no puede."),

            const CustomTitleText(titleText: "4. Uso de ventiladores:", fontSize: 14, isDecoration: false,),
            DotRow(titleText: "Acelerar el enfriamiento:",text: " Coloca un ventilador cerca de la mascota para ayudar a bajar su temperatura."),

            const Text(
              'Paso 3: Atención veterinaria',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),

            const CustomTitleText(titleText: "1. Contactar al veterinario:", fontSize: 14, isDecoration: false,),
            DotRow(titleText: "Consulta inmediata:",text: " Lleva a la mascota al veterinario lo antes posible, incluso si parece recuperarse. El golpe de calor puede causar daños internos que no son inmediatamente aparentes."),

            const SizedBox(
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '2. Información:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Informa al veterinario sobre la duración y gravedad del golpe de calor.',
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
            ),
            20.height
          ],
        ),
      ),
    );
  }
}
