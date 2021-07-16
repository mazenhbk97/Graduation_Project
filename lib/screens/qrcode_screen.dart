import 'dart:io';
import 'dart:typed_data';

import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:re7al/Widgets/ticket_screen.dart';
import 'package:re7al/screens/HomeScreen.dart';
import 'package:screenshot/screenshot.dart';

class QrCode extends StatefulWidget {
  final String placeName;

  QrCode(this.placeName);

  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  ScreenshotController screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              tileColor: Theme.of(context).primaryColor,
              title: Text(
                'Get Ticket',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.file_download,
                  color: Colors.white,
                ),
                onPressed: () async {
                  final status = await Permission.storage.request();
                  if (status.isGranted) {
                    _widgetShot();
                  }
                },
              ),
            ),
          ),
          body: Screenshot(
              controller: screenshotController,
              child: TicketWithQrCode(widget.placeName))),
    );
  }

  Future<void> _widgetShot() async {
    Uint8List imageCapture = await screenshotController.capture();
    Image.file(File.fromRawPath(imageCapture));

    if (imageCapture != null) {
      //Return path
      final pdf = pw.Document();
      final image = pw.MemoryImage(imageCapture);
      print("width: ${image.width}");
      pdf.addPage(pw.Page(build: (pw.Context context) {
        return pw.Center(
          child: pw.Image(image),
        ); // Center
      })); // Page
      final outPut = await DownloadsPathProvider.downloadsDirectory;
      final pdfFile = File('${outPut.path}/pdfticket${DateTime.now()}.pdf');
      await pdfFile.writeAsBytes(await pdf.save());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Ticket saved to downloads"),
      ));
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false,
      );
    } else
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('error'),
      ));
  }
}
