import 'package:flutter/material.dart';
import '../GeneralWidgets/button.dart';
import '../GeneralWidgets/text.dart';
import '../constants.dart';
import 'Widgets/text_form_field.dart';
class StartScreen extends StatelessWidget {
   StartScreen();
  @override
  String? namePlayer1,namePlayer2;
   GlobalKey<FormState> formKey = GlobalKey();

   Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                SizedBox(height: 50,)
                ,Container(
               width: 180,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  color: mainColor
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text("XO",Colors.white,fontSize: 70,),
                    text("G  A  M  E",Colors.white,fontSize: 18,),
                  ],
                ),
              ),
                SizedBox(height: 40,),
                text("XO", mainColor, fontSize: 40),
                text("Game", Colors.black, fontSize: 40),
                SizedBox(height: 50,),
                textFormField(onChanched: (name){
                  namePlayer1=name;
                },validator: (value){
                  if(namePlayer1==null)
                    {
                      return"* required";
                    }
                }, namePlayer: "Enter the player1 name"),
               SizedBox(height: 25,),
                textFormField(onChanched: (name){
                  namePlayer2=name;
                },validator: (value){
                  if(namePlayer2==null)
                    {
                      return"* required";
                    }
                },namePlayer: "Enter the player2 name"),
                SizedBox(height: 30,),
                InkWell(onTap: (){
                  if(formKey.currentState!.validate()){
                    Navigator.pushNamed(context, "PlayScreen",arguments: {
                      "namePlayer1":namePlayer1,
                      "namePlayer2":namePlayer2
                    });
                  }
                },child: Button("Play"))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
