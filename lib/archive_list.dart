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
  List<ArchievData> searchArchiveArr = [];

  List<Banners> bannerList = [];
  List<CategoriesData>categoryList = [];
  NetworkUtil networkUtil = new NetworkUtil();
  int _index = 0;
  var htmlStr = "";
  var nextTimehit = false;

  var selectedString = "";
  var scrollcontroller = ScrollController();
  var total = 0;
  var currentPage = 1;
  
  TextEditingController searchTextController = new TextEditingController();

  

  @override
  void initState() {
    super.initState();
    showArchiveListApi();
    scrollcontroller.addListener(pagination);
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
                  child:  TextField(
                    controller: searchTextController,
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
                        onChanged: (value) {
                      
                      if (value != "") {
                        onSearchTextChanged(
                        searchTextController.text.toString());
                      } else {
                        nextTimehit = true;
                        _isfromSearch = false;
                        searchArchiveArr.clear();
                        Future.delayed( Duration(seconds: 1), () {
                          showArchiveListApi();
                        });
                        
                      }
                    },

                    onSubmitted: (value){
                      
                      FocusScope.of(context).unfocus();
                    },
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
                    controller: scrollcontroller,
                    itemCount: (_isfromSearch == true)?searchArchiveArr.length:archieveList.length,
                    itemBuilder: (BuildContext, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArchiveDetail(
                                
                                bodyStr: (_isfromSearch == true)?searchArchiveArr[index].body!:archieveList[index].body!, 
                                titleStr: (_isfromSearch == true)?searchArchiveArr[index].title!:archieveList[index].title!,
                                dateStr: (_isfromSearch == true)?searchArchiveArr[index].date!:archieveList[index].date!,
                                bannerImageArr: (_isfromSearch == true)?searchArchiveArr[index].banners!:archieveList[index].banners!,
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
                                imageUrl: archieveList[index].banners![0].banner!,
                                width: 116,
                                height: 104,
                                placeholder: (context, url) => SizedBox(
                                    height: 2.0,
                                    width: 2.0,
                                    child: Container(
                                      height:20,
                                      child: Image.asset('assets/images/daily_reach_logo.png')
                                      )
                                      ),
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

                                      Container(
                            padding: EdgeInsets.fromLTRB(18, 7, 24, 7),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              archieveList[index].title!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 19,
                                  fontFamily: "assets/fonts/segui.TTf",
                                  color: Colors.black),
                            )),

                                      Container(
                                        padding: EdgeInsets.fromLTRB(20, 7, 24, 0),
                                        width: MediaQuery.of(context).size.width,
                                        child: Text(
                                         (_isfromSearch == true)?Constants.parseHtmlString(searchArchiveArr[index].body!):Constants.parseHtmlString(archieveList[index].body!),
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
                          height:30,
                          padding: EdgeInsets.fromLTRB(21, 5, 26, 7),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: (_isfromSearch == true)?archieveList[index].categories!.length:archieveList[index].categories!.length ,
                                itemBuilder: (context, c_index){ 
                                return InkWell(
                                  highlightColor: Colors.transparent,
                                onTap: (){
                                   
                                },
                                child: Container(
                                  padding:EdgeInsets.fromLTRB(10, 2, 10, 2) ,
                                  
                                  width: 50,
                                  height: 17,
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                       (_isfromSearch == true)?searchArchiveArr[index].categoriesData![c_index].name!: archieveList[index].categoriesData![c_index].name!,
                                        style: TextStyle(fontSize: 10,fontFamily:"segoe",fontWeight: FontWeight.w600,color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                            color: AppColors.CatBackColor.withOpacity(0.38),                                                    borderRadius:
                                            BorderRadius.circular(34),
                                            )
                                ),
                                
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
                                        highlightColor: Colors.transparent,
                                        onTap: (){
                                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArchiveDetail(
                                
                                bodyStr: (_isfromSearch == true)?searchArchiveArr[index].body!:archieveList[index].body!, 
                                titleStr: (_isfromSearch == true)?searchArchiveArr[index].title!:archieveList[index].title!,
                                dateStr: (_isfromSearch == true)?searchArchiveArr[index].date!:archieveList[index].date!,
                                bannerImageArr: (_isfromSearch == true)?searchArchiveArr[index].banners!:archieveList[index].banners!,
                              )));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 0, left: 21, right: 0),
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
      (nextTimehit == false)?EasyLoader.showLoader():EasyLoader.hideLoader();
      await networkUtil.getAuth(Constants.archiveUrl+'?page=$currentPage', token, this);
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
    var message = archievModel.message;

    if (archievModel.status == 1) {
      print('success archieve');
      archieveList.addAll(archievModel.data!.data!);
      print(archievModel.data!.data!);

      for (var i = 0;i < archieveList.length; i++){
        categoryList.addAll(archieveList[i].categoriesData!);
      }
      print('categoryList------------$categoryList');

      print('categoryListLength------------${categoryList.length}');


      total = archievModel.data!.total!;
      currentPage = archievModel.data!.currentPage!;
      

    }
    else{
      ToastManager.errorToast('$message');
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
      archieveList = result;
    });
  }

  onSearchTextChanged(String text) async {
    _isfromSearch = true;
    searchArchiveArr.clear();
    if (text.isEmpty) {
      _isfromSearch = false;
      searchArchiveArr.clear();
      setState(() {});
      return;
    }

    archieveList.forEach((userDetail) {
      if (text == "") {

        print("empty");
      } else {
        if (userDetail.title!.toLowerCase().contains(text.toLowerCase())) searchArchiveArr.add(userDetail);
        print('search---------------${searchArchiveArr.length}');
      }
    });

    setState(() {});
  }

  void pagination() {
      if ((scrollcontroller.position.pixels ==
          scrollcontroller.position.maxScrollExtent) && (archieveList.length == total)) {
        setState(() {
          
          currentPage += 1;
          //add api for load the more data according to new page
          showArchiveListApi();
        });
      }
  }
}
