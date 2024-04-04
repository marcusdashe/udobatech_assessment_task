import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/image_paths.dart';
import '../dashboard/blog/blog_post_screen.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> with TickerProviderStateMixin {


  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _fontSizeAnimation;

  @override
  void initState(){
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _sizeAnimation = Tween<double>(begin: 60.0, end: 200.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _fontSizeAnimation = Tween<double>(begin: 0.0, end: 28.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _startAnimations();
  }

  Future<void> _startAnimations() async {
    await Future.delayed(const Duration(seconds: 3));

    _animationController.forward();

    await Future.delayed(const Duration(seconds: 3));

    Navigator.of(context).pushReplacementNamed(BlogPostScreen.routeName);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: UdobaTechColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    final h = MediaQuery.of(context).size.height, w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          backgroundColor: UdobaTechColors.primaryColor,
          body: SizedBox(
            height: h,
            width: w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Positioned(
                //     child: Image.asset(
                //       SagamyImagePaths.bgFirstImage,
                //       fit: BoxFit.cover,
                //     )
                // ),
                //
                // // Transparent Layer
                // Positioned(
                //     child: Container(
                //       color:  SagamyBrandColors.secondaryColor,
                //     )
                // ),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return SizedBox(
                      height: _sizeAnimation.value,
                      width: _sizeAnimation.value,
                      child: Opacity(
                        opacity: _opacityAnimation.value,
                        child: Image.asset(
                          UdobaTechImages.logoPath,
                          width: _sizeAnimation.value,
                          height: _sizeAnimation.value,
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                    bottom: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Udoba Tech", style: TextStyle(fontSize: 12, color: Colors.white),)
                      ],
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}
