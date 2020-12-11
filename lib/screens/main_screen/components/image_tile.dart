import 'package:flutter/material.dart';
import 'package:unsplash_test_app/model.dart';
import 'package:unsplash_test_app/screens/photo_screen/photo_page.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageTile extends StatelessWidget {
  final UnsplPhoto image;

  const ImageTile(this.image);

  Widget _addRoundedCorners(Widget widget) =>
      ClipRRect(borderRadius: BorderRadius.circular(4.0), child: widget);

  Widget _buildImagePlaceholder({UnsplPhoto image}) => Container(
        color: Colors.grey[200],
      );

  Widget _buildImageErrorWidget() => Container(
        color: Colors.grey[200],
        child: Center(
            child: Icon(
          Icons.broken_image,
          color: Colors.grey[400],
        )),
      );

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<Null>(
              builder: (BuildContext context) =>
                  ImagePage(image.getId(), image.getFullUrl()),
            ),
          );
        },
        child: image != null
            ? _addRoundedCorners(
                CachedNetworkImage(
                  imageUrl: image?.getSmallUrl(),
                  placeholder: (context, url) =>
                      _buildImagePlaceholder(image: image),
                  errorWidget: (context, url, obj) => _buildImageErrorWidget(),
                  fit: BoxFit.cover,
                ),
              )
            : _buildImagePlaceholder(),
      );
}
