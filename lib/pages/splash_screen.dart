import 'dart:async';

import 'package:be_talent_test/pages/home_page.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Após 800ms, inicia a animação de opacidade
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() {
          _opacity = 1.0;
        });
      }
    });

    // Aguarda 800ms + 300ms de animação antes de navegar (Total: 1.1s)
    Future.delayed(const Duration(milliseconds: 1100), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 300), // ease-in, 300ms
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0500FF),
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 300), // Duração da animação (300ms)
          curve: Curves.easeIn, // Suavização (ease-in)
          child: Image.asset('assets/images/logo.png'), // Verifique se o caminho está correto
        ),
      ),
    );
  }
}
