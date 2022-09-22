import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pubg/infromation.dart';

import 'model.dart';

class homescreen extends StatelessWidget {
  List<Model> list = [
    Model("", ""), //empty item will be replaced by title
    Model("assets/images/vector.png", "Vector"),
    Model("assets/images/carlo.png", "Carlo"),
    Model("assets/images/Sara.png", "Sara"),
    Model("assets/images/Andy-Pro.png", "Andy\nPro"),
    Model("assets/images/Anna.png", "Anna"),
    Model("assets/images/buggy.png", "Buggy"),
    Model("assets/images/uaz.png", "UAZ"),
    Model("assets/images/uaz (2).png", "UAZ 2"),
    Model("assets/images/M24.png", "M24"),
    Model("assets/images/M249.png", "M249"),
    Model("assets/images/M416GLACIER.png", "M416\nGLACIER"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('assets/images/bg1.jpeg'),
              fit: BoxFit.cover,
              opacity: 0.5),
        ),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                child: Image.asset(
                  "assets/images/logo_text.png",
                ),
                padding: EdgeInsets.all(24),
              );
            }
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => infro(list[index], 'imageHero$index'),
                    ));
              },
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                      child: Image.asset(
                        "assets/images/container.png",
                        color: Colors.brown.withOpacity(0.4),
                        colorBlendMode: BlendMode.modulate,
                      ),

                    padding: EdgeInsets.all(15),
            ),

                  Container(
                    child: Positioned(
                      top: 20,
                      child:Hero(
                       child: Image.asset(list[index].image, height: 180, width: 180),
                        tag: 'imageHero$index',
                      ),

                    ),
                  ),
                  Positioned(
                      left: 35,
                      child: Text(
                        list[index].name,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.russoOne(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 21,
                        ),
                      )),
                  Positioned(
                      right: 30,
                      child: Column(
                        children: [
                          Image.asset("assets/images/splash.png",
                              height: 45, width: 45,),
                          Image.asset("assets/images/heart.png",
                              height: 45, width: 45),
                          Image.asset("assets/images/pencil.png",
                              height: 45, width: 45),
                        ],
                      ))
                ],
              ),
            );
          },
          itemCount: list.length,
        ),
        //margin: EdgeInsets.all(30),
      ),
    );
  }
}
