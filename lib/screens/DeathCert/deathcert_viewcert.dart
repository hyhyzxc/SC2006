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