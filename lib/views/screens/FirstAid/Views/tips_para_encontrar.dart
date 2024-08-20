
import 'package:felpus/extensions/extension.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_images/app_images.dart';
import '../Widgets/firstaid_widgets.dart';



class TipsParaEncontrar extends StatelessWidget {
  const TipsParaEncontrar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
          child: FirstAidAppBar(titleText: "TIPS PARA ENCONTRAR TU MASCOTA PERDIDA")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppImages.tipsParaEncontrar,
                  scale: 2,
                )
            ),
            6.height,
            const Text(
              'Inmediatamente después de la pérdida:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '1. Mantén la calma:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Es fundamental no entrar en pánico, ya que esto puede dificultar la búsqueda racional.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '2. Revisa la zona:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Camina por el área donde se perdió tu mascota, prestando atención a lugares donde le guste ir o donde haya podido quedarse atrapada.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '3. Pregunta a los vecinos y transeúntes:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Si alguien la ha visto, es probable que te pueda dar pistas sobre su paradero.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '4. Crea carteles:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Elabora carteles con la foto de tu mascota, su nombre, tu número de teléfono y cualquier otra información relevante. Colócalos en postes, negocios locales y parajes frecuentados por la zona.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '5. Contacta a refugios y protectoras de animales:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Comunícate con los refugios y protectoras de la zona para informar sobre la pérdida y proporcionarles una descripción detallada de tu mascota.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '6. Revisa nuestra sección de “Mascotas Encontradas”:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Publica la información sobre la pérdida en nuestra sección de “mascotas perdidas” y pide a tus contactos que compartan la publicación. Luego revisa la sección de “Mascotas Encontradas”.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '7. Notifica a las autoridades:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Informa a la policía local y al departamento de control animal sobre la pérdida de tu mascota.',
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
              'Acciones continuas:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '1. Peina la zona:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Dedica tiempo a buscar en tu vecindario, parques, áreas boscosas y cualquier lugar donde tu mascota pueda estar escondida.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '2. Ofrece una recompensa:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' Considera ofrecer una recompensa por el regreso seguro de tu mascota. Esto puede motivar a las personas a buscarla con mayor ahínco.\n',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '3. No te rindas:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' La búsqueda de una mascota perdida puede tomar tiempo y esfuerzo. No te desanimes y continúa buscando con persistencia.',
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
              'Consejos adicionales:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),

            DotRow(titleText: "Deja un poco de comida y agua familiar para tu mascota en el lugar donde la viste por última vez.",text: " El olor conocido puede atraerla de regreso."),
            DotRow(titleText: "Utiliza ropa o mantas con tu olor para crear un rastro que tu mascota pueda seguir.",text: ""),
            DotRow(titleText: "Recorre la zona en diferentes horarios, incluyendo la noche.",text: " Algunas mascotas pueden ser más visibles en determinados momentos del día."),
            DotRow(titleText: "Mantén la esperanza y la positividad.",text: " Tu actitud positiva puede contagiar a quienes te ayudan en la búsqueda y aumentar las posibilidades de encontrar a tu mascota."),
            20.height,
          ],
        ),
      ),
    );
  }
}
