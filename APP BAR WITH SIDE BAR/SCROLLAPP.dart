 class _AppState extends State<App> {
 .............///////////////////put these lines code inside state....................
  final controller = ScrollController();

  bool notification;

  @override
  void initState() {
    super.initState();
    notification = false;
  }
  ..........................end................................................

  @override
  //////////////................................
  1.in dependency put :   scroll_app_bar: ^1.0.2
  2. import 'package:BOARDING/main_drawer.dart';----->>>>> location of maindrawer.dart

      import 'package:scroll_app_bar/scroll_app_bar.dart';----->>>>>>>libraray
      
 3.just put all our code inside snap like this and add line 88 debug waala line code
 ////.................................////////////////////////////
   Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ScrollAppBar(
          controller: controller, // Note the controller here
          
          // actions: [
            // IconButton(
          // Icon(
          //       notification ? Icons.notifications : Icons.notifications_off,
          //     ),
              // onPressed: () {
              //   setState(() => notification = !notification);
              // },
            // ),
          // ],
          title: Text("Neon"),
        ),
        drawer: MainDrawer(),
        body: 
       
        Snap(
          controller: controller.appBar,
          child: ListView(
            controller: controller,
            children: <Widget>[
              Container(
                height: 200,
                color: Colors.black,
              ),
               Container(
                height: 200,
                color: Colors.white,
              ),
               Container(
                height: 200,
                color: Colors.yellow,
              ),
               Container(
                height: 200,
                color: Colors.red,
              ),
               Container(
                height: 200,
                color: Colors.blue,
              ),
               Container(
                height: 200,
                color: Colors.pink,
              ),
               Container(
                height: 200,
                color: Colors.black,
              ),
               Container(
                height: 200,
                color: Colors.black,
              ),
              
            ], 
            
            // Controller is also here
            // itemBuilder: _listBuildItem,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
