import 'package:get/get.dart';

class HomePageState {
  HomePageState() {
    ///Initialize variables
  }

  RxInt selectedIndex = 0.obs;

  var news = [
    {
      'title': 'Optimisme Timnas',
      'desc':
          'Lorem Ipsum Dolor Sit Amet adalah satu istilah yang biasanya kerap ditemukan pada demo-demo template blog, khususnya pada kanal tipografi. Namun sebenarnya istilah ini sudah lama digunakan dalam dunia percetakan untuk menjelaskan secara detail mengenai penataan huruf',
    },
    {
      'title': 'Unlucky Liverpool di Liga Champion',
      'desc':
      'Lorem Ipsum Dolor Sit Amet adalah satu istilah yang biasanya kerap ditemukan pada demo-demo template blog, khususnya pada kanal tipografi. Namun sebenarnya istilah ini sudah lama digunakan dalam dunia percetakan untuk menjelaskan secara detail mengenai penataan huruf',
    },
  ];
}
