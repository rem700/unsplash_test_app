import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:unsplash_test_app/model.dart';
import 'package:unsplash_test_app/provider.dart';

class ImagePage extends StatefulWidget {
  final String imageId, imageUrl;

  ImagePage(this.imageId, this.imageUrl, {Key key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  UnsplPhoto image;

  @override
  void initState() {
    super.initState();

    _loadImage();
  }

  _loadImage() async {
    UnsplPhoto image = await UnsplashPhotoProvider.loadImage(widget.imageId);
    setState(() {
      this.image = image;
    });
  }

  Widget _buildAppBar() => AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context)),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
              tooltip: 'Image Info',
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.open_in_browser,
                color: Colors.white,
              ),
              tooltip: 'Open in Browser',
              onPressed: () {}),
        ],
      );

  Widget _buildPhotoView(String imageId, String imageUrl) => PhotoView(
        imageProvider: NetworkImage(imageUrl),
        initialScale: PhotoViewComputedScale.covered,
        minScale: PhotoViewComputedScale.covered,
        maxScale: PhotoViewComputedScale.covered,
        loadFailedChild: const Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
        )),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          _buildPhotoView(widget.imageId, widget.imageUrl),
          Positioned(top: 0.0, left: 0.0, right: 0.0, child: _buildAppBar()),
        ],
      ),
    );
  }
}
