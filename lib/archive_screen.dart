import 'package:connectivity/connectivity.dart';
import 'package:dailyreach/Models/ArchiveModel.dart';
import 'package:dailyreach/Models/categoryModel.dart';
import 'package:dailyreach/network_api/Toast.dart';
import 'package:dailyreach/network_api/api_interface.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/loader.dart';
import 'package:dailyreach/network_api/network_util.dart';
import 'package:dailyreach/network_api/shared_preference.dart';
import 'package:flutter/material.dart';

class Archive_screen extends StatefulWidget {
  const Archive_screen({Key? key}) : super(key: key);

  @override
  State<Archive_screen> createState() {
    return _Archive_screen();
  }
}

class _Archive_screen extends State<Archive_screen> implements ApiInterface{
  var arr = [
    'Entertainment',
    'Painting',
    'News',
    'Technology',
    'Software',
    'Real estate',
    'Fun',
    'Explore',
    'Gym'
  ];
  var _isfromSearch = false;
  var selectedText = '';
  var isclicked = false;
  var idStr = "";
  var apiType = rqgetCategoryList;
  var nextTimehit = false;
  
  List<CategoryData> selectedItemArr = [];
  List<CategoryData> searchItemArr = [];
  List<ArchievData> archieveList = [];

  
  TextEditingController searchTextController = new TextEditingController();
  NetworkUtil networkUtil = new NetworkUtil();

@override
  void initState() {
    super.initState();
    ShowCategoryList();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          margin:  EdgeInsets.only(top: 50),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Column(
            children: [
               Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  'Choose a category for search post ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: "segoe",
                    color: Color.fromARGB(200, 0, 0, 0),
                  ),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    highlightColor: Colors.transparent,
                    onTap: () {
                      List<int> selectedIntList = []; 
                     if (searchItemArr.length != 0) { 
                       for (var i=0;i<searchItemArr.length;i++){
                         if(searchItemArr[i].isselected!){
                           selectedIntList.add(searchItemArr[i].id!);
                         }
                     }
                      }
                      else{
                        for (var i=0;i<selectedItemArr.length;i++){
                         if(selectedItemArr[i].isselected!){
                           selectedIntList.add(selectedItemArr[i].id!);
                         }
                     }
                      }
                      idStr = selectedIntList.join(', ');
                      showFilterredList();
                    },
                    child:  Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        'Done ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: "segoe",
                          color: Color.fromARGB(200, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.only(top: 20, left: 80),
                    child: Text(
                      'Category ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "segoe",
                        color: Color.fromARGB(200, 0, 0, 0),
                      ),
                    ),
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 20, left: 70),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'Cancel ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "segoe",
                              color: Color.fromRGBO(66, 103, 176, 1.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(top: 18, left: 10,right: 10),
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
                  child: TextField(
                    controller: searchTextController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            fontFamily: "segoe",
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        suffixIcon: Icon(
                          Icons.mic,
                          color: Colors.grey,
                        )),
                    onChanged: (value) {
                      
                      if (value != "") {
                        onSearchTextChanged(
                        searchTextController.text.toString());
                      } else {
                        nextTimehit = true;
                        _isfromSearch = false;
                        searchItemArr.clear();
                        Future.delayed( Duration(seconds: 1), () {
                          ShowCategoryList();
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
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      
                      child: ListView.separated(
                          separatorBuilder: (context, index1) {
                            return Padding(
                              padding:  EdgeInsets.only(
                                  top: 5, left: 17, right: 5),
                              child: Container(
                                height: 1,
                                color: Color.fromARGB(100, 214, 212, 212),
                              ),
                            );
                          },
                          itemCount: (_isfromSearch == true) ? searchItemArr.length:selectedItemArr.length,
                          itemBuilder: (BuildContext, index) {
                            return InkWell(
                              highlightColor: Colors.transparent,
                              onTap: () {
                                selectedItemArr[index].isselected = ! selectedItemArr[index].isselected!;
                                setState(() {});
                              },
                              child: Container(
                                
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 25, left: 20, bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            (_isfromSearch == true) ? searchItemArr[index].name!:selectedItemArr[index].name!,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.only(right: 10),
                                              child: (selectedItemArr[index].isselected == true) ? 
                                              Icon(
                                                Icons.check,
                                                color: Colors.grey,
                                              ) : Container()
                                              )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  )),
              Container(
                height: 50,
              )
            ],
          ),
        ));
  }

  onSearchTextChanged(String text) async {
    _isfromSearch = true;
    searchItemArr.clear();
    if (text.isEmpty) {
      _isfromSearch = false;
      searchItemArr.clear();
      setState(() {});
      return;
    }

    selectedItemArr.forEach((userDetail) {
      if (text == "") {

        print("empty");
      } else {
        if (userDetail.name!.toLowerCase().contains(text.toLowerCase())) searchItemArr.add(userDetail);
        print(searchItemArr);
      }
    });

    setState(() {});
  }


  void ShowCategoryList() async{
    apiType = rqgetCategoryList;
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      ToastManager.errorToast('please check your internet connection');
    } else {
      
      (nextTimehit == false)?EasyLoader.showLoader():EasyLoader.hideLoader();
      await networkUtil.get(Constants.categoryUrl, this);
    }

  }

  void showFilterredList() async{
    apiType = rqFilterList;
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
      ToastManager.errorToast('please check your internet connection');
    } else {
      EasyLoader.showLoader();
      await networkUtil.getAuth(Constants.archivePostUrl+'?search_keyword=&categories=$idStr', token, this);
    }

  }

  @override
  void onFailure(message, code) {
    ToastManager.errorToast('Failed...please check');
  }

  @override
  void onSuccess(data, code) {
    EasyLoader.hideLoader();
    switch (apiType){
      case rqgetCategoryList:{
    CategoryModel catModel = new CategoryModel.fromJson(data);
    var message = catModel.message;

    if (catModel.status == 1) {
      selectedItemArr.addAll(catModel.data!);
      print(catModel.data);

    }
    else{
        ToastManager.errorToast('$message');
      }
    setState(() {});

      }
      
      break;

      case rqFilterList:{
        
      ArchievModel archievModel = new ArchievModel.fromJson(data);
      var message = archievModel.message;
      
      if (archievModel.status == 1) {
        archieveList.addAll(archievModel.data!.data!);
        print(archievModel.data!.data!);
        Navigator.pop(context,archieveList);
      }else{
        ToastManager.errorToast('$message');
      }

        
      }

    }
    

  }

  @override
  void onTokenExpire(message, code) {
    ToastManager.errorToast('Token expired');
  }


}

const int rqgetCategoryList = 0;
const int rqFilterList = 1;

