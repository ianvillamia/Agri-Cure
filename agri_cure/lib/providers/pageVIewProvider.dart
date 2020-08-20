import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';

class PageViewProvider with ChangeNotifier {
  var controller = PageController(initialPage: 0);
  double currentPage = 0;
  void nextPage() {
    controller.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    this.currentPage = controller.page;
    notifyListeners();
  }
}
