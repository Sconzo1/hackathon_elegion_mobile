import 'package:e_legion_hackaton/app/top_level_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends ConsumerWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  final pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w400),
    bodyTextStyle: TextStyle(fontSize: 18.0),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );

  Widget _buildImage(String assetName, [double height = 500]) {
    return Image.asset('images/$assetName', height: height);
  }

  @override
  Widget build(BuildContext context, watch) {
    final userCompleteIntroduction = watch(userCompleteIntroductionProvider);

    void _onIntroEnd(context) {
      userCompleteIntroduction.state = true;
    }

    return Scaffold(
      // Make sure the fringe isn't covered
      body: SafeArea(
        // take the whole empty space
        child: Container(
          //
          child: IntroductionScreen(
              globalBackgroundColor: Colors.white,
              pages: [
                PageViewModel(
                    title: "Добро пожаловать в\ne-Legion!",
                    body:
                        "Ты вступаешь в ряды настоящих легионеров, но перед этим тебе нужно неплохо так подлутаться",
                    image: _buildImage('intro_img_welcome.png'),
                    decoration: pageDecoration),
                PageViewModel(
                    title: "Выполняй миссии от нашего легиона",
                    body:
                        "Тебе будут назначаться задания, с которыми можешь справиться только ты",
                    image: _buildImage('intro_img_todo.png'),
                    decoration: pageDecoration),
                PageViewModel(
                    title: "Миссия - это злодей. Одолей его!",
                    body:
                        "На каждом из этих заданий тебя ждет мини-монстр или баг, ты должен его одолеть!",
                    image: _buildImage('intro_img_bug.png'),
                    decoration: pageDecoration),
                PageViewModel(
                    title: "Не бойся, ты не один!",
                    body:
                        "Для решения задач тебе понадобится помощь твоих товарищей, так что вперед собирай команду!",
                    image: _buildImage('intro_img_co_work.png'),
                    decoration: pageDecoration),
                PageViewModel(
                    title: "Доспехи - это твое все",
                    body:
                        "Победив монстра, вытащи все, что с него выпало, может пригодится)",
                    image: _buildImage('intro_img_loot.png'),
                    decoration: pageDecoration),
                PageViewModel(
                    title: "Победи всех монстров\nи стань легионером!",
                    body:
                        "Как только ты получил свои доспехи, только тогда станешь полноценным членом легиона",
                    image: _buildImage('intro_img_superhero.png'),
                    decoration: pageDecoration),
              ],
              dotsFlex: 2,
              onDone: () => _onIntroEnd(context),
              done: const Text('Вперед!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              showSkipButton: true,
              skip: const Text(' Все\nзнаю!', style: TextStyle(fontSize: 18,),),
              next: const Icon(Icons.arrow_forward)),
        ),
      ),
    );
  }
}
