import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';

class ViewCert extends StatefulWidget {
  const ViewCert({Key? key, required this.title}) : super(key: key);
  static const String routeName = '/deathcert-viewcert';

  final String title;

  @override
  State<ViewCert> createState() => _ViewCertState();
}

class _ViewCertState extends State<ViewCert> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.indigo[100],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network('https://www.ica.gov.sg/images/default-source/media-releases/2022/05/220505-04.jpg?sfvrsn=7691f3a0_4'),
            SizedBox(height: 20,),
            Center(
            child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width - 50.0,
            height: 50.0,
            child: ElevatedButton(
              onPressed: () async {
                String url = 'https://www.ica.gov.sg/images/default-source/media-releases/2022/05/220505-04.jpg?sfvrsn=7691f3a0_4';
                final tempDir = await getTemporaryDirectory();
                final path = '${tempDir.path}/myfile.jpg';
                await Dio().download(url, path);
                await GallerySaver.saveImage(path);

                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Downloaded to Gallery!'))
                );
              },
              child: Text('Download'),
            ),
            ))],
        ),
      ),
    );
  }
}



// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';
// //import 'package:pspdfkit_flutter/pspdfkit.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
//
// // Filename of the PDF you'll download and save.
// const fileName = '/pspdfkit-flutter-quickstart-guide.pdf';
//
// // URL of the PDF file you'll download.
// const imageUrl = 'https://pspdfkit.com/downloads' + fileName;
//
// class ViewCert extends StatefulWidget {
//   const ViewCert({Key? key, required this.title}) : super(key: key);
//   static const String routeName = '/deathcert-viewcert';
//
//   final String title;
//
//   @override
//   State<ViewCert> createState() => _ViewCertState();
// }
//
// class _ViewCertState extends State<ViewCert> {
//
//   // Track the progress of a downloaded file here.
//   double progress = 0;
//
//   // Track if the PDF was downloaded here.
//   bool didDownloadPDF = false;
//
//   // Show the progress status to the user.
//   String progressString = 'File has not been downloaded yet.';
//
//   // This method uses Dio to download a file from the given URL
//   // and saves the file to the provided `savePath`.
//   Future download(Dio dio, String url, String savePath) async {
//     try {
//       Response response = await dio.get(
//         url,
//         onReceiveProgress: updateProgress,
//         options: Options(
//             responseType: ResponseType.bytes,
//             followRedirects: false,
//             validateStatus: (status) { return status! < 500; }
//         ),
//       );
//       var file = File(savePath).openSync(mode: FileMode.write);
//       file.writeFromSync(response.data);
//       await file.close();
//
//       // Here, you're catching an error and printing it. For production
//       // apps, you should display the warning to the user and give them a
//       // way to restart the download.
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   // You can update the download progress here so that the user is
//   // aware of the long-running task.
//   void updateProgress(done, total) {
//     progress = done / total;
//     setState(() {
//       if (progress >= 1) {
//         progressString = '✅ File has finished downloading. Try opening the file.';
//         didDownloadPDF = true;
//       } else {
//         progressString = 'Download progress: ' + (progress * 100).toStringAsFixed(0) + '% done.';
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               // Here, you download and store the PDF file in the temporary
//               // directory.
//               onPressed: didDownloadPDF ? null : () async {
//                 var tempDir = await getTemporaryDirectory();
//                 download(Dio(), imageUrl, tempDir.path + fileName);
//               },
//               child: Text('Download a PDF file'),
//             ),
//             Text(
//               progressString,
//             ),
//             ElevatedButton(
//               onPressed: !didDownloadPDF ? null : () async {
//                 var tempDir = await getTemporaryDirectory();
//                 //await Pspdfkit.present('file:///assets/PDFs/Document.pdf');
//
//                 //await Pspdfkit.present('assets/PDFs/Document.pdf');
//               },
//               child: Text('Open the downloaded file using PSPDFKit'),)
//           ],
//         ),
//       ),
//     );
//   }
// }