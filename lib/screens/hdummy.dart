import 'package:flutter/material.dart';

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class hdummy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(5, 9, 10, 225),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(212, 175, 55, 1),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Welcome Back!',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 24)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2)),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        backgroundColor: Theme.of(context).backgroundColor,
                        fontSize: 24),
                  )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextField(
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2)),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        backgroundColor: Theme.of(context).backgroundColor,
                        fontSize: 24),
                  ))
            ],
          ),
        ),
      ),

      /*about us without styling
      backgroundColor: Color.fromRGBO(5, 9, 10, 225),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(5, 9, 10, 225),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:
                Icon(Icons.arrow_back, color: Color.fromRGBO(212, 175, 55, 1)),
          ),
          title: Text('About Us',
              style: TextStyle(color: Color.fromRGBO(212, 175, 55, 1))),
        ),
        body: Text(
            'To lose fat, you need to consume fewer calories than you burn each day and exercise regularly. Frequent physical activity helps get rid of fat. If you lose weight without exercise. you are more likely to lose both muscle and fat.',
            style: TextStyle(color: Color.fromRGBO(212, 175, 55, 1)))*/
    );
  }
}
