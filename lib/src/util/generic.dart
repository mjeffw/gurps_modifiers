String reverseString(String s) {
  return s.codeUnits.reversed
      .map((it) => String.fromCharCode(it))
      .reduce((a, b) => a + b);
}
