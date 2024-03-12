import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TestScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TestAppColors.background,
      appBar: AppBar(
        title: const Text(
          TestAppStrings.appBar,
          style: TextStyle(color: TestAppColors.text),
        ),
        backgroundColor: TestAppColors.background,
        centerTitle: true,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: TestAppColors.accent,
        ),
      ),
      body: const SingleChildScrollView(
        //padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: MainPersonalDataSection(
                  name: TestAppMocks.name,
                  imgPath: TestAppMocks.avatarPath,
                  status: TestAppMocks.status),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ControlButtonsPanel(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: MainCategoriesPanel(),
            ),
            SizedBox(height: 20),
            CustomImageSlider(images: TestAppMocks.galleryImages),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: FeedList(
                items: [
                  FeedItem(
                    avatarPath: TestAppMocks.avatarPath,
                    name: TestAppMocks.name,
                    when: TestAppMocks.feedWhen,
                    content: TestAppMocks.feedContent,
                    contentImgPath: TestAppMocks.feedExamplePath,
                  ),
                  FeedItem(
                    avatarPath: TestAppMocks.avatarPath,
                    name: TestAppMocks.name,
                    when: TestAppMocks.feedWhen,
                    content: TestAppMocks.feedContent,
                    contentImgPath: TestAppMocks.feedExamplePath,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(
        background: TestAppColors.secondary,
      ),
    );
  }
}

class FeedList extends StatelessWidget {
  final List<FeedItem> items;

  const FeedList({
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header(TestAppStrings.headerNewsLbl),
        const SizedBox(height: 15),
        ...items,
      ],
    );
  }
}

class FeedItem extends StatelessWidget {
  final String avatarPath;
  final String name;
  final String when;
  final String content;
  final String contentImgPath;

  const FeedItem({
    required this.avatarPath,
    required this.name,
    required this.when,
    required this.content,
    required this.contentImgPath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomCircleAvatar(
              radius: 20,
              showIcon: false,
              imgPath: avatarPath,
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(color: TestAppColors.accent),
                ),
                const SizedBox(height: 5),
                Text(
                  when,
                  style: const TextStyle(color: TestAppColors.secondaryText),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          content,
          style: const TextStyle(color: TestAppColors.text),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            contentImgPath,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class CustomImageSlider extends StatelessWidget {
  final List<String> images;

  const CustomImageSlider({
    required this.images,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Header(TestAppStrings.headerPhotosLbl),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 20),
              ...images.map(
                (e) => SizedBox(
                  height: 140,
                  width: 140,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(e),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class MainCategoriesPanel extends StatelessWidget {
  const MainCategoriesPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomCard(
                title: TestAppStrings.categoryFriendsLbl,
                icon: Icons.people,
                iconColor: TestAppColors.friends,
                background: TestAppColors.secondary,
                count: 24,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: CustomCard(
                title: TestAppStrings.categoryMusicLbl,
                iconColor: TestAppColors.music,
                icon: Icons.music_note,
                background: TestAppColors.secondary,
                count: 777,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: CustomCard(
                title: TestAppStrings.categoryVideoLbl,
                iconColor: TestAppColors.video,
                icon: Icons.video_library,
                background: TestAppColors.secondary,
                count: 4,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: CustomCard(
                title: TestAppStrings.categoryChatLbl,
                icon: Icons.message,
                iconColor: TestAppColors.chat,
                background: TestAppColors.secondary,
                count: 45,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  final Color? background;
  final String title;
  final IconData icon;
  final Color iconColor;
  final int count;

  const CustomCard({
    required this.title,
    required this.icon,
    required this.count,
    required this.iconColor,
    this.background,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '$title($count)',
              softWrap: false,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                color: TestAppColors.secondaryText,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  const Header(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        color: TestAppColors.text,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class ControlButtonsPanel extends StatelessWidget {
  const ControlButtonsPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CustomButton(
            title: TestAppStrings.editBtnLbl,
            background: TestAppColors.accent,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: CustomButton(
            title: TestAppStrings.logoutBtnLbl,
            background: TestAppColors.secondary,
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final Color? background;
  final String title;

  const CustomButton({
    required this.title,
    this.background,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(color: TestAppColors.text),
      ),
    );
  }
}

class CustomCircleAvatar extends StatelessWidget {
  final double radius;
  final bool showIcon;
  final String imgPath;

  const CustomCircleAvatar({
    required this.radius,
    required this.showIcon,
    required this.imgPath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: radius * 2,
      child: Stack(
        children: [
          Container(
            width: radius * 2,
            height: radius * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: TestAppColors.avatarBorder,
                width: 2.5,
              ),
              image: DecorationImage(
                image: NetworkImage(imgPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (showIcon)
            Positioned(
              right: 7,
              bottom: 7,
              child: Container(
                width: 25,
                height: 25,
                decoration: const BoxDecoration(
                  color: TestAppColors.accent,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.edit,
                  size: 17,
                  color: TestAppColors.text,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class MainPersonalDataSection extends StatelessWidget {
  final String name;
  final String imgPath;
  final String status;

  const MainPersonalDataSection({
    required this.name,
    required this.imgPath,
    required this.status,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCircleAvatar(
          radius: 60,
          showIcon: true,
          imgPath: imgPath,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 22,
                  color: TestAppColors.text,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                status,
                style: const TextStyle(
                  fontSize: 13,
                  color: TestAppColors.secondaryText,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CustomNavBar extends StatelessWidget {
  final Color background;
  const CustomNavBar({Key? key, required this.background}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: background,
        boxShadow: [
          BoxShadow(
            color: TestAppColors.shadow,
            offset: const Offset(0, -2),
            blurRadius: 4,
          )
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Icons.search,
            Icons.home,
            Icons.settings,
            Icons.logout,
          ]
              .map(
                (e) => Expanded(
                  child: Icon(
                    e,
                    color: TestAppColors.accent,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

abstract class TestAppColors {
  static const secondary = Color(0xff292929);
  static const accent = Colors.blue;
  static const music = Colors.red;
  static const friends = Colors.blue;
  static const chat = Colors.green;
  static const video = Colors.purple;
  static const text = Colors.white;
  static const secondaryText = Colors.grey;
  static const background = Color(0xff222222);
  static const avatarBorder = Colors.white24;
  static final shadow = Colors.black.withOpacity(0.1);
}

abstract class TestAppStrings {
  static const appBar = 'Ваша страница';
  static const editBtnLbl = 'Редактировать';
  static const logoutBtnLbl = 'Выйти';
  static const categoryFriendsLbl = 'Друзья';
  static const categoryMusicLbl = 'Музыка';
  static const categoryVideoLbl = 'Видео';
  static const categoryChatLbl = 'Чат';
  static const headerPhotosLbl = 'Фотографии';
  static const headerNewsLbl = 'Новости';
}

abstract class TestAppMocks {
  static const name = 'Джейсон Стетхем';
  static const status = 'Это не я и я этого не говорил\n© Джейсон Стетхем';
  static const feedContent =
      'Нужно искать возможности, а не находить причины © Стив Бушеми';
  static const feedWhen = '10 минут назад';

  static const avatarPath =
      'https://avatars.mds.yandex.net/get-kinopoisk-image/1773646/18699b50-b382-48d5-9b73-54478887aba5/3840x';

  static const galleryImages = [
    'https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/3fe195e1-244d-41be-b39e-0ca8edda6dc0/3840x',
    'https://avatars.mds.yandex.net/get-kinopoisk-image/1777765/3c2a1e64-0a37-4179-b472-6a7d07b72716/3840x',
    'https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/fb99d701-e898-4931-8efc-e91d6e626ab8/3840x',
    'https://avatars.mds.yandex.net/get-kinopoisk-image/1629390/7975528e-6bd2-4f42-8209-b79e9a241357/3840x',
    'https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/3154e73f-891f-477c-9907-94ed28e6647d/3840x',
    'https://avatars.mds.yandex.net/get-kinopoisk-image/1773646/b02dc134-1044-4c82-a88f-c568a1ef56d7/3840x',
    'https://avatars.mds.yandex.net/get-kinopoisk-image/1946459/a5f15008-22cf-40fe-ac06-1645a14fae55/3840x',
    'https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/3b1810c5-3e27-4b22-88f6-8d22284eeb79/3840x',
  ];
  static const feedExamplePath =
      'https://cs4.pikabu.ru/post_img/big/2016/05/20/5/1463724336112342654.jpg';
}
