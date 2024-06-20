import 'package:base_project_flutter/export.dart';

class CustomImageWidget extends StatefulWidget {
  final String imageUrl;
  final Widget? errorUrl;
  final BoxFit? fit;
  final double? height;
  final double? weight;
  final double? radius;

  const CustomImageWidget(
      {super.key, required this.imageUrl, this.errorUrl, this.fit, this.height, this.weight, this.radius});
  @override
  State<CustomImageWidget> createState() => _CustomImageWidgetState();
}

class _CustomImageWidgetState extends State<CustomImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.radius ?? 0),
        child: CachedNetworkImage(
            imageUrl: widget.imageUrl,
            fit: widget.fit ?? BoxFit.contain,
            height: widget.height,
            width: widget.weight,
            errorWidget: (context, url, error) {
              return widget.errorUrl ?? const Icon(Icons.error);
            }),
      ),
    );
  }
}
