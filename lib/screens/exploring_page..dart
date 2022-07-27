import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanbeen_zedital/screens/begin_posting.dart';
import 'package:sanbeen_zedital/screens/buy_prop_page.dart';
import 'package:sanbeen_zedital/screens/rentals_page.dart';

class ExploringPage extends StatefulWidget {
  const ExploringPage({Key? key}) : super(key: key);

  @override
  State<ExploringPage> createState() => _ExploringPageState();
}

class _ExploringPageState extends State<ExploringPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
              size: MediaQuery.of(context).size.width * 0.08,
            )),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Start Exploring',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).primaryColor,
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Wrap(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BuyingPropPage()));
                      },
                      child: ExploringCards(
                        textreq: 'Buying a house',
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmiLo-UH7EZCj0O_dYCoHj6pDhv3YAM4Flfw&usqp=CAU',
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.06,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BeginPosting()));
                      },
                      child: ExploringCards(
                        textreq: 'Selling your property',
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmiLo-UH7EZCj0O_dYCoHj6pDhv3YAM4Flfw&usqp=CAU',
                      )),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RentalsPage()));
                      },
                      child: ExploringCards(
                        textreq: 'Renting property',
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmiLo-UH7EZCj0O_dYCoHj6pDhv3YAM4Flfw&usqp=CAU',
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.06,
                  ),
                  GestureDetector(
                      child: ExploringCards(
                    textreq: 'Commercial Projects',
                    image:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmiLo-UH7EZCj0O_dYCoHj6pDhv3YAM4Flfw&usqp=CAU',
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExploringCards extends StatelessWidget {
  ExploringCards({
    Key? key,
    required this.image,
    required this.textreq,
  }) : super(key: key);
  String image;
  String textreq;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.27,
        child: Stack(
          children: <Widget>[
            Image.network(
                fit: BoxFit.fill,
                image,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    color: Theme.of(context).backgroundColor,
                    child: Center(
                      child: Text(
                        textreq,
                        style: GoogleFonts.inter(
                            color: Theme.of(context).hintColor,
                            fontSize: MediaQuery.of(context).size.width * 0.03),
                      ),
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
