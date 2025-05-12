class GallerySection {
  final String title;
  final List<String> mediaPaths;
  final bool isVideo;
  final bool useGrid; //

  GallerySection({
    required this.title,
    required this.mediaPaths,
    this.isVideo = false,
    this.useGrid = false,

  });
}
