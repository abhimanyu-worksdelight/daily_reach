import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dailyreach/Models/ArchiveModel.dart';
import 'package:dailyreach/network_api/api_interface.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/loader.dart';
import 'package:dailyreach/network_api/network_util.dart';
import 'package:dailyreach/utils/flash_Helper.dart';
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
  List<Banners> bannerList = [];
  NetworkUtil networkUtil = new NetworkUtil();
  int _index = 0;
  var htmlStr = "";

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
                    
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> Archive_screen()));
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
            padding: const EdgeInsets.only(top: 18, left: 14),
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
                    hintText: 'Search by name, date',
                    hintStyle: TextStyle(
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
                                          Constants.convertDateFormate(archieveList[index].createdAt!),
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
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: (){

                                            },
                                            child: Padding(
                                              padding:
                                              EdgeInsets.only(top: 7, left: 7),
                                              child: Container(
                                                  width: 44,
                                                  height: 17,
                                                  child: Padding(
                                                    padding: EdgeInsets.all(0),
                                                    child: ListView.builder(
                                                    itemCount: archieveList[index].categoriesData!.length ,
                                                    itemBuilder: (context, index){ 
                                                    return GestureDetector(
                                                    onTap: (){
                                                      print('clicked');
                                                    },
                                                    child: Center(
                                                      child: FittedBox(
                                                        fit: BoxFit.contain,
                                                        child: Text(
                                                          archieveList[index].categoriesData![index].name!
                                                        ),
                                                      ),
                                                    ),
                                                    );
                                                    }),
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Color.fromARGB(100, 214, 212, 212),                                                    borderRadius:
                                                    BorderRadius.circular(34),
                                                  )),
                                            ),
                                          ),
                                          
                                        ],
                                      ),
                                      InkWell(
                                        onTap: (){

                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 11, left: 7, right: 0),
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
    var token = Constants.token;

    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      FlashHelper.singleFlash(context, 'Check internet connection');
    } else {
      EasyLoader.showLoader();
      await networkUtil.getAuth(Constants.archiveUrl, token, this);
    }

  }

  @override
  void onFailure(message, code) {
    // TODO: implement onFailure
    EasyLoader.hideLoader();
  }

  @override
  void onSuccess(data, code) {
    // TODO: implement onSuccess
    EasyLoader.hideLoader();
    
    ArchievModel archievModel = new ArchievModel.fromJson(data);
    if (archievModel.status == 1) {
      archieveList.addAll(archievModel.data!.data!);
      print(archievModel.data!.data!);
      

    }
    setState(() {});

  }

  @override
  void onTokenExpire(message, code) {
    // TODO: implement onTokenExpire
    EasyLoader.hideLoader();
  }
}
