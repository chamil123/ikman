import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../utils/constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenNewState();
}

class _ProfileScreenNewState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  var top = 0.0;
  late ScrollController _scrolController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrolController = ScrollController();

    // Provider.of<UserProvider>(context, listen: false).checkUserUpdate(context);
    _scrolController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrolController,
            slivers: [
              SliverAppBar(
                backgroundColor: HexColor("#283890"),
                pinned: true,
                leading: AnimatedOpacity(
                  opacity: top <= 130 ? 0.2 : 1.0,
                  // child: IconButton(
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //   },
                  //   icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  //   color: Colors.black,
                  // ),
                  duration: const Duration(milliseconds: 300),
                ),
                expandedHeight: 250,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    top = constraints.biggest.height;
                    return FlexibleSpaceBar(
                      centerTitle: true,
                      title: AnimatedOpacity(
                        opacity: top <= 140 ? 1.0 : 0.0,
                        
                        duration: const Duration(milliseconds: 300),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 12,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(55),
                                child: Image.asset(
                                  'assets/images/avatar.jpg', // Replace with your image path
                                  fit: BoxFit.fitWidth,
                                  scale: 1,
                                ),
                                //  Image.asset(value.getImageFile!.path),
                              ),
                        
                              const SizedBox(
                                width: 12,
                              ),
                              // Text(
                              //   value.getTotal.toString(),
                              //   style: GoogleFonts.poppins(fontSize: 12),
                              // ),
                              // Text(
                              //   value.getuserModel.email,
                              //   style: GoogleFonts.poppins(fontSize: 12),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      background: Image.asset(
                        'assets/images/avatar.jpg', // Replace with your image path
                        fit: BoxFit.fitWidth,
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: const Color(0xFFECF3F9),
                  // height: size.height,
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                     
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Basic details",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  customTextField(
                                    MaterialCommunityIcons.account_outline,
                                    "First Name",
                                    "First Name",
                                    false,
                                    false,
                                    // value.fnameController,
                                    (value) {
                                      if (value!.isEmpty) {
                                        return ("Please enter first name");
                                      }
                                      return null;

                                      // return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  customTextField(
                                    MaterialCommunityIcons.account_outline,
                                    "Last Name",
                                    "Last name",
                                    false,
                                    true,
                                    // value.lnameController,
                                    (value) {
                                      if (value!.isEmpty) {
                                        return ("Please enter email");
                                      }
                                      return null;

                                      // return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  customTextField(
                                    MaterialCommunityIcons.email_outline,
                                    "Email Address",
                                    "Email Address",
                                    false,
                                    true,
                                    // value.emailController,
                                    (value) {
                                      if (value!.isEmpty) {
                                        return ("Please enter your email");
                                      } else if (!RegExp(
                                              r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                          .hasMatch(value)) {
                                        return ("Please Enter a valid email");
                                      }
                                      return null;
                                      // return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  customTextField(
                                    MaterialCommunityIcons.phone_outline,
                                    "Mobile Number",
                                    "Mobile Number",
                                    true,
                                    false,
                                    // value.phoneController,
                                    (value) {
                                      if (value!.isEmpty) {
                                        return ("Please enter mobile number");
                                      }
                                      if (!RegExp(r'(^(?:[+0]9)?[0-9]{10}$)')
                                          .hasMatch(value)) {
                                        return ("Please Enter a valid phone number");
                                      }
                                      return null;
                                      // return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  customTextField(
                                    MaterialCommunityIcons.phone_outline,
                                    "Home Number",
                                    "Home Number",
                                    true,
                                    false,
                                    // value.homenumberController,
                                    (value) {
                                      if (value!.isEmpty) {
                                        return ("Please enter Home number");
                                      }
                                      if (!RegExp(r'(^(?:[+0]9)?[0-9]{10}$)')
                                          .hasMatch(value)) {
                                        return ("Please Enter a valid phone number");
                                      }
                                      return null;
                                      // return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  customTextField(
                                    MaterialCommunityIcons.home_outline,
                                    "Address",
                                    "Address",
                                    true,
                                    false,
                                    // value.addressController,
                                    (value) {
                                      if (value!.isEmpty) {
                                        return ("Please enter address");
                                      }
                                      // if (!RegExp('^(?:[+0]9)?[0-9]{10}')
                                      //     .hasMatch(value)) {
                                      //   return ("Please Enter a valid phone number");
                                      // }
                                      return null;
                                      // return null;
                                    },
                                  ),
                                  // Text(">>>> ${value.isLoading}"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Update",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.redAccent,
                                      onPrimary: Colors.white,
                                      shape: const StadiumBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        
                          const SizedBox(
                            height: 20,
                          ),
                          // value.isLoading
                          //     ? Container(
                          //         height: 52,
                          //         width: double.infinity,
                          //         decoration: BoxDecoration(
                          //           color: Colors.blue.withOpacity(.3),
                          //           borderRadius: BorderRadius.circular(10),
                          //         ),
                          //         child: Center(
                          //           child: CustomLoader(loadertype: false),
                          //         ),
                          //       )
                          //     : ElevatedButton(
                          //         style: ElevatedButton.styleFrom(
                          //           padding: const EdgeInsets.all(0.0),
                          //           elevation: 3,
                          //           shape: RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.circular(30),
                          //           ),
                          //         ),
                          //         onPressed: () {
                          //           if (_formKey.currentState!.validate()) {
                          //             value.UpdateUser(context, _formKey,
                          //                 value.getuserModel!.uid);
                          //           }
                          //         },
                          //         child: Ink(
                          //           width: double.infinity,
                          //           decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(10),
                          //             color: Colors.blue,
                          //             // gradient: const LinearGradient(
                          //             //     colors: [Colors.red, Colors.orange]),
                          //           ),
                          //           child: Container(
                          //             padding: const EdgeInsets.all(18),
                          //             child: const Text('Update Now',
                          //                 textAlign: TextAlign.center),
                          //           ),
                          //         ),
                          //       ),
                          const SizedBox(
                            height: 20,
                          ),

                          // ElevatedButton(
                          //   onPressed: () {
                          //     value.gelLastId(context);
                          //   },
                          //   child: Text(
                          //     "getLastId",
                          //     style: GoogleFonts.poppins(
                          //       fontSize: 12,
                          //     ),
                          //   ),
                          //   style: ElevatedButton.styleFrom(
                          //     primary: Colors.redAccent,
                          //     onPrimary: Colors.white,
                          //     shape: StadiumBorder(),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          _buildFab(),
        ],
      ),
    );
  }

  Widget _buildFab() {
    final size = MediaQuery.of(context).size;
    const double defaultMargin = 265;
    const double defaultStart = 220;
    const double defaultEnd = defaultStart / 2;
    double top = defaultMargin;
    double scale = 1.0;
    if (_scrolController.hasClients) {
      double offset = _scrolController.offset;
      top -= offset;
      if (offset < defaultMargin - defaultStart) {
        scale = 1.0;
      } else if (offset < defaultStart - defaultEnd) {
        scale = (defaultMargin - defaultEnd - offset) / defaultEnd;
      } else {
        scale = 0.0;
      }
    }
    return Positioned(
      top: top,
      right: 16,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(scale),
        child: SizedBox(
          width: 40,
          height: 40,
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.camera_alt_outlined,color: Colors.white,),
            backgroundColor: Colors.red,
            splashColor: Colors.yellow,
          ),
        ),
      ),
    );
  }

  Padding customTextField(
    IconData icon,
    String hintText,
    String labelText,
    bool isPassword,
    bool isEmail,
    // TextEditingController controller,
    String? Function(String?)? validator,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   hintText,
          //   style: const TextStyle(fontSize: 13, color: Constants.labelText),
          // ),
          // const SizedBox(
          //   height: 8,
          // ),
          TextFormField(
              obscureText: false,
              // controller: controller,
              keyboardType:
                  isEmail ? TextInputType.emailAddress : TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 243, 245, 247),
                prefixIcon: Icon(
                  icon,
                  color: Constants.iconColor,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                contentPadding: const EdgeInsets.all(10),
                hintText: hintText,
                labelText: hintText,
                hintStyle:
                    const TextStyle(fontSize: 14, color: Constants.textColor1),
              ),
              validator: validator),
        ],
      ),
    );
  }
}
