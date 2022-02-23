import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dailyreach/Archive_Detail.dart';
import 'package:dailyreach/Models/ArchiveModel.dart';
import 'package:dailyreach/PostDetail.dart';
import 'package:dailyreach/network_api/Toast.dart';
import 'package:dailyreach/network_api/api_interface.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/loader.dart';
import 'package:dailyreach/network_api/network_util.dart';
import 'package:dailyreach/network_api/shared_preference.dart';
import 'package:flutter/material.dart';
import 'archive_screen.dart';

class Archive_list extends StatefulWidget {


  @override
  State<Archive_list> createState() {
    return _Archive_list();
  }
}

class _Archive_list extends State<Archive_list> implements ApiInterface {

  List<ArchievData> archieveList = [];
  var _isfromSearch = false;
  List<ArchievData> selectedArchiveList = [];

  List<Banners> bannerList = [];
  List<CategoriesData>categoryList = [];
  NetworkUtil networkUtil = new NetworkUtil();
  int _index = 0;
  var htmlStr = "";

  var selectedString = "";

  @override
  void initState() {
    super.initState();
    showArchiveListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 64, left: 93),
                child: Image.asset(
                  'assets/images/daily_reach_logo.png',
                  width: 190,
                  height: 42,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65, right: 23, left: 29),
                child: GestureDetector(
                  onTap: (){
                    _awaitReturnValueFromSecondScreen(context);
                  //  final result =  Navigator.push(context,MaterialPageRoute(builder: (context)=> Archive_screen()));


                  },
                  child: Image.asset(
                    'assets/images/group.png',
                    height: 20,
                    width: 25,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 12),
            child: Text(
              "Archived Posts",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
                padding: const EdgeInsets.only(top: 18, left: 10),
                child: Container(
                  height: 40,
                  width: 320,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search by name',
                        hintStyle: TextStyle(
                            fontFamily: "segoe",
                            fontSize: 14, fontWeight: FontWeight.w400),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        
                        ),
                  ),
                ),
              ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 0,right: 0,left: 0),
                child: ListView.separated(separatorBuilder: (Context, Index){
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      height: 1.6,
                      color: Color.fromARGB(100, 214, 212, 212),                    ),
                  );
                },

                    itemCount: archieveList.length,
                    itemBuilder: (BuildContext, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArchiveDetail(
                                
                                bodyStr: archieveList[index].body!, 
                                titleStr: archieveList[index].title!,
                                dateStr: archieveList[index].date!,
                                bannerImageArr: archieveList[index].banners!,
                              )));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:
                                   EdgeInsets.only(top: 27, left: 21,bottom: 6),
                                  child: (archieveList[index].banners!.length > 0)
                            ? CachedNetworkImage(
                                imageUrl: archieveList[index].banners![index].banner!,
                                width: 116,
                                height: 104,
                                placeholder: (context, url) => Container(
                                    height: 2.0,
                                    width: 2.0,
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                    fit: BoxFit.fitWidth,
                        
                            
                              ) :Image.asset(
                                "assets/images/photoo.png",
                                height: 169,
                                fit: BoxFit.fill,
                              ), 
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 20, left: 7, right: 0),
                                        child: Text(
                                          Constants.convertDateFormate(archieveList[index].date!),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: "segoe",
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 0, left: 7, right: 19,),
                                        child: Text(
                                         Constants.parseHtmlString(archieveList[index].body!),
                                         maxLines: 2,
                                          style: TextStyle(
                                            letterSpacing: -0.6,
                                              fontFamily: "segoe",
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Container(
                                        // color: Colors.red,
                                        height:50,
                                        padding: EdgeInsets.fromLTRB(21, 0,26, 7),
                                        width: MediaQuery.of(context).size.width,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: archieveList[index].categoriesData!.length ,
                                              itemBuilder: (context, c_index){ 
                                              return GestureDetector(
                                              onTap: (){
                                                print('clicked');
                                              },
                                              child: Container(
                                              margin: EdgeInsets.all(2),
                                              width: 70,
                                              height: 20,
                                              child: Center(
                                                child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text(
                                                    archieveList[index].categoriesData![c_index].name!
                                                  ),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                            color: Color.fromARGB(100, 214, 212, 212),                                                    borderRadius:
                                            BorderRadius.circular(34),
                                            )),
                                            
                                              );
                                              }),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                          
                                        ),
                                         
                                      ),
                                      InkWell(
                                        onTap: (){

                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 0, left: 7, right: 0),
                                          child: Text(
                                            'Read More',
                                            style: TextStyle(
                                                color: Color.fromARGB(228, 189, 20, 20),
                                                fontSize: 12,
                                                fontFamily: "segoe",
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                ),
              )
          ),


        ],
      ),
    );
  }


  void showArchiveListApi() async{

    var token = "";
    Future<String> loginToken = SharedPreference.getStringValuesSF(Constants.token);
    loginToken.then(
        (value) => {
               token = value
            }, onError:(err) {
      print("Error occured :: $err");
    });

    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      // FlashHelper.singleFlash(context, 'Check internet connection');
      ToastManager.errorToast('Check internet connection');
    } else {
      EasyLoader.showLoader();
      await networkUtil.getAuth(Constants.archiveUrl, token, this);
    }

  }

  @override
  void onFailure(message, code) {
    // TODO: implement onFailure
    EasyLoader.hideLoader();
    ToastManager.errorToast('error');
  }

  @override
  void onSuccess(data, code) {
    // TODO: implement onSuccess
    EasyLoader.hideLoader();
    
    ArchievModel archievModel = new ArchievModel.fromJson(data);
    if (archievModel.status == 1) {
      archieveList.addAll(archievModel.data!.data!);
      print(archievModel.data!.data!);

      for (var i = 0;i < archieveList.length; i++){
        categoryList.addAll(archieveList[i].categoriesData!);
      }
      print('categoryList------------$categoryList');

      print('categoryListLength------------${categoryList.length}');

      

    }
    setState(() {});

  }

  @override
  void onTokenExpire(message, code) {
    // TODO: implement onTokenExpire
    EasyLoader.hideLoader();
    ToastManager.errorToast('token expired');
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {

    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(context,MaterialPageRoute(builder: (context)=> Archive_screen()));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      selectedString = result;
      // categoryList.where((item) => item.contains(selectedString));
      // categoryList.where((w) => w == selectedString).map((w)());
    });
  }

  onSearchTextChanged(String text) async {
    _isfromSearch = true;
    selectedArchiveList.clear();
    if (text.isEmpty) {
      _isfromSearch = false;
      selectedArchiveList.clear();
      setState(() {});
      return;
    }

    selectedArchiveList.forEach((userDetail) {
      if (text == "") {
        print("empty");
      } else {
        if (userDetail.title!.toLowerCase().contains(text.toLowerCase())) selectedArchiveList.add(userDetail);
        print(selectedArchiveList);
      }
    });

    setState(() {});
  }
}
