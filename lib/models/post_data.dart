class PostForListing {
  String friendName;
  String cartoonName;
  String yourName;

  PostForListing({this.friendName, this.cartoonName, this.yourName});

  factory PostForListing.fromJson(Map<String, dynamic> item) {
    return PostForListing(
        friendName: item["friend_name"],
        cartoonName: item["favourite_cartoon"],
        yourName: item["your_name"]);
  }
}
