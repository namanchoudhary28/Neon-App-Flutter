import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart' as material;
import 'package:BOARDING/pdf_view.dart';
import 'package:printing/printing.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
Container commu_image(PdfImage image){
  return Container(
    height: 30.0,
    width: 30.0,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(image: image)
    )
  );
}

Container skill_card(String name){
  return Container(
    padding: EdgeInsets.all(10.0),
   
    decoration: BoxDecoration(
       color:PdfColor(0.004, 0.8, 0.98),
       borderRadius: 15,


            
      
    ),
    child: Text(name, textAlign: TextAlign.center, style:TextStyle(fontSize: 15.0,color: PdfColor(1, 1, 1)))

  );
}
List<Widget> skills_children(List skills){
  List<Widget>children = List<Widget>();
       for(int i=0;i<skills.length;i++){
         children.add(skill_card(skills[i]['name']));
         
       }
       return children;
}
reportView(context,List list_about,List list_communications, List skills) async {
  final Document pdf = Document();
  
  final PdfImage profile_image = await pdfImageFromImageProvider(pdf: pdf.document, image: const material.AssetImage('assets/images/man.png'));
  final List<Widget>social_icons = List<Widget>();
    PdfImage social_icon;
    String medium;
  for(int i=0;i<list_communications.length;i++){
       medium = list_communications[i]['medium'];
      
       social_icon = await pdfImageFromImageProvider(pdf: pdf.document, image: material.AssetImage('assets/social_icons/$medium.png'));
       social_icons.add(commu_image(social_icon));
       social_icons.add(SizedBox(width:18.0));
  }


  pdf.addPage(MultiPage(
      pageFormat:
          PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        if (context.pageNumber == 1) {
          return null;
        }
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const BoxDecoration(
                border:
                    BoxBorder(bottom: true, width: 0.5, color: PdfColors.grey)),
            child: Text('Resume',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      footer: (Context context) {
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (Context context) => <Widget>[
           /* Header(
                level: 0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Resume', textScaleFactor: 2),
                      PdfLogo()
                    ]))*/


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[


               Container(
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: PdfColor(1,0,1),

                   ),
                  height: 100.0,
                  width: 100.0,
                  child: Image(profile_image),
                  
               ),
         Padding(padding: EdgeInsets.all(15.0),
      
             child:Column(

               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: <Widget>[

                Text(

                  list_about[0]['name'].toString().toUpperCase(),
                  style: TextStyle(
                    fontSize: 20.0,

                  )
                ),
                Text(

                  list_about[0]['location'],
                  style: TextStyle(
                    fontSize: 20.0,

                  )
                ),
               Container(
                 width:400.0,
                 child: Text(
                

                  'here is the short description about me. a single line or sentence or a couple of words explaining who i am , what i likes, in which field i am interested in',
                  textAlign: TextAlign.left,
                  
                  style: TextStyle(
                    fontSize: 15.0,
                    fontStyle: FontStyle.italic,
                    

                  ),
                  
                ),

               ),
               Container(
                 padding :EdgeInsets.all(10.0),
                 child:Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: social_icons
                 )
               )
                


             ])
          
         )



                

             
              
              


            ] ),

            Row(
            
              
              
              children: <Widget>[
                Expanded(

              

                 flex: 2,
                 child: Container(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(text: "Skills"),
                      Wrap(
                       direction: Axis.horizontal,
                       spacing: 10.0,
                       runSpacing: 10.0,
                       children: skills_children(skills)
                      
                     )


                    ]
                  )      
                  

                 )


                ),
                Expanded(
                  flex: 3,
                  child: Container(
                   

                  )
                )
              ]


            ),

           
           
          ]));

       final String dir = (await getApplicationDocumentsDirectory()).path;
       print(dir);
  final String path = '$dir/report.pdf';
  print(path);
  final File file = File(path);
  await file.writeAsBytes(pdf.save());
  material.Navigator.of(context).push(
    material.MaterialPageRoute(
      builder: (_) => PdfViewerPage(path: path),
    ),
  );   
  
final String dirs = (await getExternalStorageDirectory()).path;
       print(dirs);
  final String paths = '$dirs/report.pdf';
  print(paths);
  final File files = File(paths);
  await files.writeAsBytes(pdf.save());
  final Email email = Email(
    body: "nothing",
    subject: "no subject",
    recipients: ['sanskarj@iitbhilai.ac.in'],
    attachmentPaths: [paths],
    isHTML: false
  );
   await FlutterEmailSender.send(email);

 

  //save PDF

}