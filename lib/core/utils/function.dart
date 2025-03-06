String checkIsEmpty(data, [instead = '']) {
  if (data == null || data == '') {
    return instead;
  } else {
    return data;
  }
}
