import 'package:flutter/material.dart';
import 'package:sanbeen_zedital/screens/begin_posting.dart';

class exploring_page extends StatefulWidget {
  const exploring_page({Key? key}) : super(key: key);

  @override
  State<exploring_page> createState() => _exploring_pageState();
}

class _exploring_pageState extends State<exploring_page> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Theme.of(context).primaryColor,)),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24,8,8,8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text('Start Exploring',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width*0.05,fontWeight: FontWeight.w600),),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                Wrap(
                  children: [
                GestureDetector(
                 
                  child: exploring_cards(textreq: 'Buying a house',image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmiLo-UH7EZCj0O_dYCoHj6pDhv3YAM4Flfw&usqp=CAU',)),
                SizedBox(width: MediaQuery.of(context).size.width*0.04,),    
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => begin_posting()));
                  }, 
                  child: exploring_cards(textreq: 'Selling your property',image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmiLo-UH7EZCj0O_dYCoHj6pDhv3YAM4Flfw&usqp=CAU',)),    
                GestureDetector(
                  
                  child: exploring_cards(textreq: 'Renting propery',image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmiLo-UH7EZCj0O_dYCoHj6pDhv3YAM4Flfw&usqp=CAU',)),    
                SizedBox(width: MediaQuery.of(context).size.width*0.04,),    
                GestureDetector(
                  
                  child: exploring_cards(textreq: 'Commercial Projects',image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmiLo-UH7EZCj0O_dYCoHj6pDhv3YAM4Flfw&usqp=CAU',)),    
                  ],
                )
            ],
          ),
        ),
      ),
   );
  }
}

class exploring_cards extends StatelessWidget {
  exploring_cards({
    required this.image,
    required this.textreq,
  });
  String image;
  String textreq;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: MediaQuery.of(context).size.width*0.4,
        height: MediaQuery.of(context).size.height*0.27,
        child: Stack(
          children: <Widget>[
            Image.network(
             fit: BoxFit.fill, 
              image,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width),
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height *0.2,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.07,
                    color: Theme.of(context).backgroundColor,
                    child: Center(
                      child: Text(textreq,style: TextStyle(color: Theme.of(context).hintColor),),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}