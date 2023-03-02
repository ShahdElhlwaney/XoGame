import 'package:flutter/material.dart';
import '../GeneralWidgets/button.dart';
import '../GeneralWidgets/text.dart';
import '../constants.dart';
class PlayScreen extends StatefulWidget {
  const PlayScreen();
  @override
  State<PlayScreen> createState() => _PlayScreenState();
}
class _PlayScreenState extends State<PlayScreen> {
  int xWins=0;
  int oWins=0;
  int draws=0;
  int count=0;
  bool isIndex=true;
   List<String> symbols=['','','','','','','','',''];
  @override
  Widget build(BuildContext context) {
    var names=ModalRoute.of(context)!.settings.arguments as Map<String,String?>;
    String namePlayer1=names["namePlayer1"]!;
    String namePlayer2=names["namePlayer2"]!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.0), // here the desired height
          child: AppBar(
            elevation: 3,
            backgroundColor: Colors.white,
            title: Row(
              children: [
                text("XO",mainColor,fontSize: 40,),
                SizedBox(width: 8,),
                text("Game",Colors.black,fontSize: 40,),
              ],
            ),
            centerTitle: true ,
          )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    text(namePlayer1+"(X)", mainColor, fontSize: 30),
                    text(xWins.toString()+" wins", mainColor, fontSize: 20),
                  ],
                ),
                Column(
                  children: [
                    text("=", Colors.grey, fontSize: 30),
                    text(draws.toString()+ "draws", Colors.grey, fontSize: 20),
                  ],
                ),
                Column(
                  children: [
                    text(namePlayer2+"(O)", Colors.black, fontSize: 30),
                    text(oWins.toString()+" wins", Colors.black, fontSize: 20),
                  ],
                )
              ],
            ),
           SizedBox(height: 40,),
            Container(
              height:300,
              width: 300,
              color: Colors.grey,
              child: GridView.builder(
                 physics: NeverScrollableScrollPhysics(),
                  gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1/1,
                  crossAxisCount: 3,crossAxisSpacing: 5,mainAxisSpacing: 5),
                  itemCount: 9,
                  itemBuilder: (BuildContext context,index){
                return GestureDetector(
                  onTap: (){
                    count++;
                    if(count==9)
                      {
                        draws++;
                        restart();
                      }
                    setSymbol(index);
                    win();
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: text(symbols[index],symbols[index]=='X'?mainColor:Colors.black,fontSize: 40,),
                  ),
                );
                  }),
            ),
            SizedBox(height: 30,),
            InkWell(onTap: (){
              restart();
              setState(() {});
            },child: Button("Restart"))
          ],
        ),
      ),
    );
  }
  void setSymbol(int index){
    if(symbols[index].isNotEmpty)
      {
        return;
      }
    if(isIndex)
      {
        symbols[index]='X';
      }
    else
      {
        symbols[index]='O';
      }
    isIndex=!isIndex;
  }
  void restart()
  {
        symbols=['','','','','','','','',''];
        isIndex=true;
        count=0;
  }
  void win()
  {
      if((symbols[0]==symbols[1]&&symbols[1]==symbols[2]&&symbols[2]=='X')
      || (symbols[3]==symbols[4]&&symbols[4]==symbols[5]&&symbols[5]=='X')
      || (symbols[6]==symbols[7]&&symbols[7]==symbols[8]&&symbols[8]=='X')
      || (symbols[0]==symbols[3]&&symbols[3]==symbols[6]&&symbols[6]=='X')
      || (symbols[1]==symbols[4]&&symbols[4]==symbols[7]&&symbols[7]=='X')
      || (symbols[2]==symbols[5]&&symbols[5]==symbols[8]&&symbols[8]=='X')
      || (symbols[2]==symbols[4]&&symbols[4]==symbols[6]&&symbols[6]=='X')
      || (symbols[0]==symbols[4]&&symbols[4]==symbols[8]&&symbols[8]=='X'))
        {
          xWins++;
          restart();
        }
     else if((symbols[0]==symbols[1]&&symbols[1]==symbols[2]&&symbols[2]=='O')
          || (symbols[3]==symbols[4]&&symbols[4]==symbols[5]&&symbols[5]=='O')
          || (symbols[6]==symbols[7]&&symbols[7]==symbols[8]&&symbols[8]=='O')
          || (symbols[0]==symbols[3]&&symbols[3]==symbols[6]&&symbols[6]=='O')
          || (symbols[1]==symbols[4]&&symbols[4]==symbols[7]&&symbols[7]=='O')
          || (symbols[2]==symbols[5]&&symbols[5]==symbols[8]&&symbols[8]=='O')
          || (symbols[2]==symbols[4]&&symbols[4]==symbols[6]&&symbols[6]=='O')
          || (symbols[0]==symbols[4]&&symbols[4]==symbols[8]&&symbols[8]=='O'))
      {
        oWins++;
        restart();
      }
  }
}
