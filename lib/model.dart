class UnsplPhoto {
  var data;

  UnsplPhoto(this.data);

  String getId() {
    return data['id'];
  }

  int getWidth() {
    return data['width'];
  }

  int getHeight() {
    return data['height'];
  }

  Author getAutor() {
    return Author(data['user']);
  }

  getUrls() {
    return data['urls'];
  }

  String getRawUrl() {
    return getUrls()['raw'];
  }

  String getFullUrl() {
    return getUrls()['full'];
  }

  String getRegularUrl() {
    return getUrls()['regular'];
  }

  String getSmallUrl() {
    return getUrls()['small'];
  }

  String getThumbUrl() {
    return getUrls()['thumb'];
  }
}

class Author {
  var data;
  Author(this.data);

  String getId() {
    return data['id'];
  }

  String getUsername() {
    return data['username'];
  }

  String getFirstName() {
    return data['first_name'];
  }

  String getLastName() {
    return data['last_name'];
  }
}
