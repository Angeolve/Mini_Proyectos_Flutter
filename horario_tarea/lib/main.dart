import 'package:flutter/material.dart';

void main() {
  runApp(const HorarioApp());
}

class HorarioApp extends StatelessWidget {
  const HorarioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HorarioScreen(),
    );
  }
}

class Clase {
  final String dia;
  final int inicio;
  final int fin;
  final String nombre;
  final String maestro;
  final Color color;

  Clase(this.dia, this.inicio, this.fin, this.nombre, this.maestro, this.color);
}

class HorarioScreen extends StatelessWidget {
  HorarioScreen({super.key});

  final List<String> dias = [
    "Lunes",
    "Martes",
    "Miércoles",
    "Jueves",
    "Viernes",
  ];

  final List<Clase> clases = [
    Clase(
      "Lunes",
      14,
      16,
      "Inteligencia Artificial",
      "LARISSA JANETTE PENICHE",
      Colors.green,
    ),
    Clase(
      "Lunes",
      16,
      18,
      "Admin. de Redes",
      "BRAULIO AZAAF PAZ GARCIA",
      Colors.deepPurple,
    ),
    Clase(
      "Martes",
      12,
      14,
      "Taller Inv. I",
      "PEDRO ALFONSO GUADALUPE",
      Colors.lime,
    ),
    Clase(
      "Martes",
      14,
      17,
      "Prog. Aplic. Móvil",
      "SARA NELLY MORENO CIMÉ",
      Colors.orange,
    ),
    Clase(
      "Miércoles",
      9,
      11,
      "Des. Back-End",
      "RODRIGO FIDEL GAXIOLA SO",
      Colors.blue,
    ),
    Clase(
      "Miércoles",
      11,
      13,
      "Inteligencia Artificial",
      "LARISSA JANETTE PENICHE",
      Colors.green,
    ),
    Clase(
      "Jueves",
      12,
      14,
      "Taller Inv. I",
      "PEDRO ALFONSO GUADALUPE",
      Colors.lime,
    ),
    Clase(
      "Jueves",
      14,
      16,
      "Prog. Aplic. Móvil",
      "SARA NELLY MORENO CIMÉ",
      Colors.orange,
    ),
    Clase(
      "Viernes",
      10,
      13,
      "Des. Back-End",
      "RODRIGO FIDEL GAXIOLA SO",
      Colors.blue,
    ),
    Clase(
      "Viernes",
      15,
      17,
      "Admin. de Redes",
      "BRAULIO AZAAF PAZ GARCIA",
      Colors.deepPurple,
    ),
  ];

  void mostrarDialogo(BuildContext context, Clase clase) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(clase.nombre),
        content: Text("Maestro: ${clase.maestro}"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cerrar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double alturaHora = 80;

    return Scaffold(
      appBar: AppBar(title: const Text("Mi Horario"), centerTitle: true),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SizedBox(
              width: constraints.maxWidth * 0.9,
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Horas
                    Column(
                      children: List.generate(11, (index) {
                        int hora = 9 + index;
                        return Container(
                          height: alturaHora,
                          width: 70,
                          alignment: Alignment.center,
                          child: Text("${hora}:00"),
                        );
                      }),
                    ),

                    // Días
                    ...dias.map((dia) {
                      return Expanded(
                        child: SizedBox(
                          height: alturaHora * 11,
                          child: Stack(
                            children: [
                              Column(
                                children: List.generate(11, (_) {
                                  return Container(
                                    height: alturaHora,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),

                              ...clases.where((c) => c.dia == dia).map((clase) {
                                double top = (clase.inicio - 9) * alturaHora;
                                double height =
                                    (clase.fin - clase.inicio) * alturaHora;

                                return Positioned(
                                  top: top,
                                  left: 8,
                                  right: 8,
                                  child: GestureDetector(
                                    onTap: () => mostrarDialogo(context, clase),
                                    child: Container(
                                      height: height,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: clase.color,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        clase.nombre,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
