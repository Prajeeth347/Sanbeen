import 'package:flutter/material.dart';
import 'package:sanbeen_zedital/models/properties_model(20).dart';
import 'package:sanbeen_zedital/screens/profilepage.dart';
import 'package:sanbeen_zedital/screens/properties(20).dart';
import 'package:sanbeen_zedital/screens/property_display.dart';
import 'package:sanbeen_zedital/services/properties_20_helper.dart';

class rentals_page extends StatefulWidget {
  const rentals_page({Key? key}) : super(key: key);

  @override
  State<rentals_page> createState() => _rentals_pageState();
}

class _rentals_pageState extends State<rentals_page> {
    ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
                actions: [
                  IconButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>profile_page()));
                  }, icon: Icon(Icons.person,color: Theme.of(context).primaryColor,))
                ],
                elevation: 0,
                backgroundColor: Theme.of(context).backgroundColor,
                pinned: true,
                expandedHeight: 190,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  title:  Container(
                    width: _isShrink ? MediaQuery.of(context).size.width * 0.75 : MediaQuery.of(context).size.width * 0.5,
                    child: GestureDetector(
                      onTap: () {print("Search");},
                      child: searchField())
                    ),
                  centerTitle: true,
                  background: SafeArea(
                    child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_ezKQ7JACM7cfswq9o1FRdQ8QerKO-Yqtgw&usqp=CAU",
                              fit: BoxFit.cover,
                            )
                  ),
                  
                )
              ),
            ];
          },
          body: CustomScrollView(
            scrollBehavior: const ScrollBehavior(),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return rental_body();
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
        ),
    drawer: Drawer(),
    );
  }
  Widget searchField() {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
          hintText: "search cities, localities, etc",
          hintStyle: TextStyle(
            fontSize: _isShrink? MediaQuery.of(context).size.width * 0.040 :MediaQuery.of(context).size.width * 0.025),
          enabled: false,
          suffixIcon: Icon(Icons.search),
          fillColor: Theme.of(context).hintColor,
          filled: true),
    );
  }
}

class rental_body extends StatefulWidget {
  const rental_body({
    Key? key,
  }) : super(key: key);

  @override
  State<rental_body> createState() => _rental_bodyState();
}

class _rental_bodyState extends State<rental_body> {
  List<Properties>? property;
  var _prop_20_loaded = false;
  @override
  void initState() {
    super.initState();
    getProfileData();
  }
  getProfileData() async{
    property = await property_services().getprofiles();
    if (property != null) {
      setState(() {
        _prop_20_loaded = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.fromLTRB(24, 15, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recently Posted Properties",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width * 0.05),),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>properties_20()));
                  },
                  child: Text("View all",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width * 0.04,decoration: TextDecoration.underline)),)
              ],
            ),
          ),
          SizedBox(height: 20,),
          if(_prop_20_loaded == false)
           CircularProgressIndicator(color: Theme.of(context).primaryColor),
          if(_prop_20_loaded == true)
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: property?.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => property_display(id: property![index].id)));
                    },
                    child: Column(
                      children: [
                        Padding(
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: 170,
                                  height: 120,
                                  child: Image.network(
                                    property![index].images[0],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(120,0,0,0),
                                  child: IconButton(onPressed: (){

                                  }, icon: Icon(Icons.favorite_outline,size: MediaQuery.of(context).size.width*0.09,)),
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.fromLTRB(10,8,10,12)),
                    Text(property![index].name,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: MediaQuery.of(context).size.width * 0.04)),
                        
                      ],
                    ),
                  );
                })
                ),
            )
            ]
        
      ),
    );
  }
}