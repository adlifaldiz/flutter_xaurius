void printDebug(Object object){
  assert((){
    print(object);
    return true;
  }());
}

void printWrapped(String text) {
  assert((){
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));    return true;
  }());
}