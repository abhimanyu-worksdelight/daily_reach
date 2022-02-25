import 'dart:io';
import 'dart:typed_data';

import 'package:connectivity/connectivity.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dailyreach/Models/Edit_ProfileModel.dart';
import 'package:dailyreach/Privacy_Policy.dart';
import 'package:dailyreach/Terms_and_Condition.dart';
import 'package:dailyreach/network_api/Toast.dart';
import 'package:dailyreach/network_api/api_interface.dart';
import 'package:dailyreach/network_api/const.dart';
import 'package:dailyreach/network_api/loader.dart';
import 'package:dailyreach/network_api/network_util.dart';
import 'package:dailyreach/network_api/shared_preference.dart';
import 'package:dailyreach/Profile_Screen.dart';
import 'package:dailyreach/utils/commonmethod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'login_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';


class EditProfile extends StatefulWidget {
  String name;
  String email;
  String phone;

  EditProfile({required this.name, required this.email, required this.phone,});

  @override
  State<EditProfile> createState() => _EditProfile();
}


class _EditProfile extends State<EditProfile> implements ApiInterface {
  bool _ischecked = false;
  bool _isObscure = true;
  bool _isObscureConfirm = true;
  var passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isClick = false;
  NetworkUtil _networkUtil = new NetworkUtil();
TextEditingController   nameController =   TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final createPasswordctrl = TextEditingController();
  final confirmpsdctrl = TextEditingController();

  PickedFile? imageFile = null;


  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    emailController.text = widget.email;
    phoneController.text = widget.phone;

    getToken();
  }
  getToken() {
    Future<String> loginToken =
        SharedPreference.getStringValuesSF(Constants.token);
    loginToken.then((value) => {Constants.tokenStr = value,setState(() {
    
  })}, 
    onError: (err) {
      print("Error occured :: $err");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(children: [
          Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/subtract.png',
                    height: 100,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 30, left: 182),
                    child: Image.asset(
                      'assets/images/vector.png',
                      height: 54,
                      width: 90,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: 60, left: 30),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/images/arrow.png',
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 60, left: 30),
                        child: Image.asset(
                          'assets/images/daily_reach_logo.png',
                          height: 42,
                          width: 190,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(left: 30, right: 25, top: 27),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
               Text(
                'Update your profile',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "segoe",
                  fontSize: 22,
                  color: Colors.black
                ),
              ),
              Center(
                child: Padding(
                  padding:  EdgeInsets.only(top:30),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    onTap: (){
                      _showPicker(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                  
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        shape:BoxShape.circle 
                        ,color: AppColors.ImageBackColor) ,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Column(
                          children: [
                            (imageFile == null) ? Padding(
                              padding:  EdgeInsets.only(top: 40),
                              child: Image.asset(
                                 'assets/images/camera.png',
                                 width:60,
                                 height: 60,
                                 color: AppColors.CameraIconColor,
                               ),
                            ):ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                               child: Image.file(
                                                        File(imageFile!.path),
                                                        height: 160,
                                                        width: 160,
                                                        fit: BoxFit.fill,
                                                    ),
                             ),
                        Center(
                                          child:(imageFile == null) ? Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Upload photo',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            fontFamily: "segoe",
                            color: AppColors.CameraIconColor
                          ),
                        ),
                                          ):Container(height: 0,),
                                  ),
                          ],
                          
                        ),
                      ) 
                      
                      
                    ),
                  ),
                ),
              ),
              
              Padding(
                padding:  EdgeInsets.only(top: 20),
                child: Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration:  InputDecoration(
                            labelText: 'Full Name',
                            contentPadding:
                                EdgeInsets.only(left: 0, top: 12, bottom: 12),
                            labelStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: "segoe",
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:  BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:  BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                            border: UnderlineInputBorder(
                              borderSide:  BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide:  BorderSide(
                                  color: Colors.red, width: 0.0),
                            ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide:  BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter name';
                            }

                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp("[a-zA-Z]")),
                          ]),
                      Padding(
                        padding:  EdgeInsets.only(top: 15),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration:  InputDecoration(
                            labelText: 'Email Address',
                            contentPadding:
                                EdgeInsets.only(left: 0, top: 12, bottom: 12),
                            labelStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: "segoe",
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:  BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:  BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                            border: UnderlineInputBorder(
                              borderSide:  BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide:  BorderSide(
                                  color: Colors.red, width: 0.0),
                            ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide:  BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Enter a valid email!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 15),
                            child: Container(
                              margin:  EdgeInsets.only(
                                  top: 12, bottom: 12, left: 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      CountryCodePicker(
                                        onChanged: print,
                                        initialSelection: 'US',
                                        favorite:  ['+1', 'US'],
                                        flagWidth: 25,
                                        textStyle:  TextStyle(
                                          fontSize: 13,
                                          color: Colors.black
                                        ),
                                        showCountryOnly: false,
                                        showOnlyCountryWhenClosed: false,
                                        alignLeft: false,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin:
                                         EdgeInsets.only(top: 0, left: 0),
                                    height: 1.1,
                                    width: 80,
                                    color: Color.fromARGB(174, 146, 142, 142),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:  EdgeInsets.only(top: 15),
                              child: TextFormField(
                                controller: phoneController,
                                decoration:  InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 0, top: 0, bottom: 12),
                                  labelText: 'Phone Number',
                                  labelStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "segoe",
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:  BorderSide(
                                        color: Colors.grey, width: 0.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:  BorderSide(
                                        color: Colors.grey, width: 0.0),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide:  BorderSide(
                                        color: Colors.grey, width: 0.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide:  BorderSide(
                                        color: Colors.red, width: 0.0),
                                  ),
                                  disabledBorder: UnderlineInputBorder(
                                    borderSide:  BorderSide(
                                        color: Colors.grey, width: 0.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter a valid Phone Number!';
                                  } else if (value.length < 7) {
                                    return 'Enter valid Phone Number!';
                                  }
                                  return null;
                                },
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(15)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          _submit();
                        },
                        child: Padding(
                          padding:  EdgeInsets.only(top: 150),
                          child: Container(
                              width: 325,
                              height: 50,
                              child:  Padding(
                                padding: EdgeInsets.only(top: 14, bottom: 15),
                                child: Text(
                                  'Update',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: "segoe",
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.editBackColor,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow:  [
                                    BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 3.0,
                                        spreadRadius: 1.0)
                                  ])),
                        ),
                      ),
                    ])),
              )
            ]),
          ),
        ])));
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == false) {
      ToastManager.errorToast('Please check your data');
      return;
    } else {
      // editProfileApi();
      testCompressFile(imageFile!);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => Profile_screen()));

    }
    _formKey.currentState?.save();
  }

  void editProfileApi() async {
    String imagePath = "";
    if (imageFile != null) {
        imagePath = imageFile!.path;
        print('imagePath$imagePath');
      } else {
        imagePath = "";
      }
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      ToastManager.errorToast('Check internet connection');
    } else {
      EasyLoader.showLoader();
      _networkUtil.uploadMultipartImage(Constants.editProfileUrl, this, Constants.tokenStr, 
      nameController.text, 
      emailController.text, 
      phoneController.text, 
      imagePath);
      
    }
  }

  @override
  void onFailure(message, code) {
    EasyLoader.hideLoader();
    ToastManager.errorToast('error');
  }

  @override
  void onSuccess(data, code) {
    EasyLoader.hideLoader();

    EditProfileModel editProfileModel = new EditProfileModel.fromJson(data);

    var message = data['message'];
    // ToastManager.successToast('success');
    if (data['status'] == 1) {
      print('successfully edited profile');
      Constants.emailStr = editProfileModel.data!.email!;
      Constants.nameStr = editProfileModel.data!.name!;
      Constants.phoneStr = editProfileModel.data!.phone!;
      var photo = editProfileModel.data!.photo;

      Navigator.pop(context,{"name":editProfileModel.data!.name!,"email":editProfileModel.data!.email!,"phone":phoneController.text.toString(),"photo":'$photo'});
    } else {
      print('error while login');
      ToastManager.errorToast('$message');
    }
  }

  @override
  void onTokenExpire(message, code) {
    EasyLoader.hideLoader();
    ToastManager.errorToast('token expired');
  }



  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile!;
    });

    print('imageGallery--------------${File(imageFile!.path)}');

    // Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile!;
    });

    print('imageFromCamera--------------${File(imageFile!.path)}');
    
  }

  
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _openGallery(context);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _openCamera(context);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }


  Future<Uint8List?> testCompressFile(PickedFile file) async {
    final result = await FlutterImageCompress.compressWithFile(
      file.path,
      minWidth: 320,
      minHeight: 290,
      quality: 20,
    );
    uintToFileCompress(result);

    return result;
  }

  Future<void> uintToFileCompress(var inUnit8List) async {
    final now = DateTime.now().millisecond;
    Uint8List imageInUnit8List = inUnit8List; // store unit8List image here ;
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/$now.png').create();
    file.writeAsBytesSync(imageInUnit8List);
   
    
    editProfileApi();
    print('file ${file.path}');
    
    setState(() {});
  }
}
