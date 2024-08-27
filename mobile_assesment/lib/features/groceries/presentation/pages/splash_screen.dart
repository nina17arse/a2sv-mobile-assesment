import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/home');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              // width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Image.asset('assets/images/welcome.jpeg',fit: BoxFit.cover,)),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Align(
                alignment: Alignment.bottomCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Welcome to',style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 22)),
                      Text('SPEEDY CHOW',style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 40),),
                    ],
                  ),
                ),
              )
            
            // const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}