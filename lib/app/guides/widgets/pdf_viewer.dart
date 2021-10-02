import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class MyPdfViewer extends StatefulWidget {
  @override
  _MyPdfViewerState createState() => _MyPdfViewerState();
}

class _MyPdfViewerState extends State<MyPdfViewer> {
  static final int _initialPage = 1;
  int _actualPageNumber = _initialPage, _allPagesCount = 0;
  bool isSampleDoc = true;
  late PdfController _pdfController;

  @override
  void initState() {
    _pdfController = PdfController(
      document: PdfDocument.openAsset('assets/sample.pdf'),
      initialPage: _initialPage,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.white),
    home: Scaffold(
      appBar: AppBar(
        title: Text('PdfView example'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {
              _pdfController.previousPage(
                curve: Curves.ease,
                duration: Duration(milliseconds: 100),
              );
            },
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              '$_actualPageNumber/$_allPagesCount',
              style: TextStyle(fontSize: 22),
            ),
          ),
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () {
              _pdfController.nextPage(
                curve: Curves.ease,
                duration: Duration(milliseconds: 100),
              );
            },
          ),
        ],
      ),
      body: PdfView(
        documentLoader: Center(child: CircularProgressIndicator()),
        pageLoader: Center(child: CircularProgressIndicator()),
        controller: _pdfController,
        onDocumentLoaded: (document) {
          setState(() {
            _allPagesCount = document.pagesCount;
          });
        },
        onPageChanged: (page) {
          setState(() {
            _actualPageNumber = page;
          });
        },
      ),
    ),
  );
}