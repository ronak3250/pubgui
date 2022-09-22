import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pubg/model.dart';

class infro extends StatefulWidget {
  Model model;
  String tag;

  infro(this.model,this.tag);

  @override
  State<infro> createState() => _infroState();
}

class _infroState extends State<infro> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('assets/images/bg2.jpg'),
                fit: BoxFit.cover,
                opacity: 0.5),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/images/arrow.png",
                    width: 70,
                    height: 100,
                  ),
                ),
                CircleAvatar(
                  radius: 200,
                  backgroundColor: Colors.white60,
                  child: ClipRRect(
                    child: Hero(
                      child: Image.asset(widget.model.image, height: 280),
                      tag: widget.tag,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Column(children: [
                      Text(
                        widget.model.name,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.russoOne(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                      ),
                      Text(
                        ' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.play(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ])),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.brown,
                          side: BorderSide(color: Colors.black, width: 2),
                          elevation: 20,
                          minimumSize: Size(150, 50),
                          shadowColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        child: Row(
                          children: [
                            Text('Favourite ',
                                style: GoogleFonts.kanit(
                                  fontSize: 18,
                                )),

                          Icon(! widget.model.selected ? Icons.favorite_border : Icons.favorite,color: Colors.red,),



                          ],
                        ),
                        onPressed: () {

                          setState(() {
                            widget.model.selected =!widget.model.selected ;

                          });
                        },

                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.brown,
                          side: BorderSide(color: Colors.black, width: 2),
                          elevation: 20,
                          minimumSize: Size(150, 50),
                          shadowColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        child: Row(
                          children: [
                            Text('Buy ',
                                style: GoogleFonts.kanit(
                                  fontSize: 18,
                                )),
                            Icon( !widget.model.buy ? Icons.shopping_bag : Icons.gpp_good,color:Colors.green),




                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            widget.model.buy =!widget.model.buy ;
                          });
                        },

                      ),
                    ]),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
          //margin: EdgeInsets.all(30),
          ),
    );
  }
}
