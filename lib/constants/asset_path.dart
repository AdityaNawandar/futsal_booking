const String imageAssetsRoot = "assets/images/";
final String logo2 = _getImagePath("lg2.png");
final String kAuthScreenBgImage = _getImagePath("futsal.jpeg");
final String kSearchIcon = _getImagePath("icon_search.png");
final String kGreenField = _getImagePath("image_fieldGreen.png");
final String kWhiteField = _getImagePath("image_fieldWhite.png");
final String kGreyField = _getImagePath("image_fieldGrey.png");
// final String playIcon = _getImagePath("play.png");
// final String routeIcon = _getImagePath("route.png");
// final String locationIcon = _getImagePath("location.png");
final String kFootball = _getImagePath("football.png");
final String kLocationIcon = _getImagePath("icon_location.png");
final String kProfileImage = _getImagePath("image_profile.png");

String _getImagePath(String fileName) {
  return imageAssetsRoot + fileName;
}
