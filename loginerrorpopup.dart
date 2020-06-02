           // import 'package:giffy_dialog/giffy_dialog.dart';   import this where u want to use
// .....................add below in dependency too.............................
            //dependencies:
                //giffy_dialog: ^1.7.0
//..............................................
          onPressed: (){
                  showDialog(
                      context: context,
                      builder: (_) => NetworkGiffyDialog(
                        
                            // key: keys[1],
                            image: Image.network(
                              "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
                              fit: BoxFit.cover,
                            ),
                            entryAnimation: EntryAnimation.TOP_LEFT,
                            title: Text(
                              'Login Failed',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.w600),
                            ),
                            description: Text(
                              'Your password or email is incorrect.               Please try again',
                              textAlign: TextAlign.center,
                            ),
                            onOkButtonPressed: () {},
                          ));
                }
