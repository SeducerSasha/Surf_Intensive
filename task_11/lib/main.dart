import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Card',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BusinessCard(),
    );
  }
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SingleChildScrollView(
          child: Column(
            /// Всю информацию выводим в колонке.
            children: [
              SizedBox(
                height: 5,
              ),

              /// Вывод аватара.
              Avatar(),
              SizedBox(
                height: 10,
              ),

              /// Вывод ФИО.
              Text(
                'Иванов Александр Валерьевич',
                style: TextStyle(fontFamily: 'Pacifico', fontSize: 24),
              ),

              /// Вывод блоков информации.
              Column(
                children: [
                  BlocCard(
                    headerText: 'О себе',
                    fontFamilyHeader: 'BadScript',
                    imageName: 'assets/dinosaur.svg',
                    isSVG: true,
                    blocText:
                        'Я динозавр! Да, да!\nТак и есть, ведь я уже разменял полвека :-)',
                    fontFamilyText: 'Amatic',
                    colorCard: Colors.white70,
                    fontSizeText: 24,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocCard(
                    headerText: 'Увлечения',
                    fontFamilyHeader: 'BadScript',
                    imageName: 'assets/hobby.png',
                    isSVG: false,
                    blocText:
                        'Обожаю программирование! Это моя самая любимая работа!',
                    fontFamilyText: 'HandJet',
                    colorCard: Colors.orange,
                    fontSizeText: 21,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocCard(
                    headerText: 'Опыт',
                    fontFamilyHeader: 'BadScript',
                    imageName: 'assets/practice.jpg',
                    isSVG: false,
                    blocText:
                        'Опыта с Flutter нет! Но дико хочется! К тому же, я хоть и динозавр, но жажда знаний не кончается. Для драконов сокровище - золото, для меня - знания!',
                    fontFamilyText: 'Kablammo',
                    colorCard: Colors.lime,
                    fontSizeText: 14,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Определяем шаблон декорирования, тень и цвет карточки информации.
BoxDecoration decorationCard(final color) {
  return BoxDecoration(
    color: color,
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  );
}

/// Блок вывода информации
class BlocCard extends StatelessWidget {
  final String headerText;
  final String imageName;
  final bool isSVG;
  final String blocText;
  final String fontFamilyHeader;
  final String fontFamilyText;
  final Color colorCard;
  final double fontSizeText;
  const BlocCard({
    super.key,
    required this.headerText,
    required this.imageName,
    required this.blocText,
    required this.isSVG,
    required this.fontFamilyHeader,
    required this.fontFamilyText,
    required this.colorCard,
    required this.fontSizeText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headerText,
            style: TextStyle(
                fontFamily: fontFamilyHeader,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: decorationCard(colorCard),
            child: Row(
              children: [
                isSVG
                    ? SvgPicture.asset(
                        imageName,
                        width: 100,
                        height: 80,
                      )
                    : Image.asset(
                        imageName,
                        width: 100,
                        height: 80,
                        fit: BoxFit.fitHeight,
                      ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    blocText,
                    style: TextStyle(
                      fontFamily: fontFamilyText,
                      fontSize: fontSizeText,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 100,
        height: 100,
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/avatar.png'),
        ),
      ),
    );
  }
}
