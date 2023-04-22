import 'package:quran_project/cash_helper.dart';

import 'data_source.dart';

class Controller {
  static bool checkIsDownloaded({required String url}) {
    var temp = CashHelper.getData(key: url);
    if (temp == null) {
      return false;
    } else {
      print(temp);
      return true;
    }
  }

  static List<Reader> readers = [
    Reader(
        name: 'مشارى راشد',
        imagePath: 'assets/images/mashari.jpg',
        quran: mashari),
    Reader(
        name: 'هزاع البلوشى', imagePath: 'assets/images/hazaa.jpg', quran: hazaa),
    Reader(
        name: 'اسلام صبحى', imagePath: 'assets/images/eslam.jpg', quran: eslam),





  ];
}




class Reader {
  String name;
  String imagePath;
  Map<String, String> quran;

  Reader({required this.name, required this.quran, required this.imagePath});
}
// {
// 'الفاتحة': 'link',
// 'البقرة': 'link',
// 'آل عمران  ': 'link',
// 'النساء': 'link',
// 'المآئدة': 'link',
// 'الأنعام': 'link',
// 'الأعراف': 'link',
// 'الأنفال': 'link',
// 'التوبة': 'link',
// 'يونس': 'link',
// 'هود': 'link',
// 'يوسف': 'link',
// 'الرعد': 'link',
// 'إبراهيم': 'link',
// 'الحجر': 'link',
// 'النحل': 'link',
// 'الإسراء': 'link',
// 'الكهف': 'link',
// 'مريم': 'link',
// 'طـه': 'link',
// 'الأنبياء': 'link',
// 'الحج': 'link',
// 'المؤمنون': 'link',
// 'النور': 'link',
// 'الفرقان': 'link',
// 'الشعراء': 'link',
// 'النمل': 'link',
// 'القصص': 'link',
// 'العنكبوت': 'link',
// 'الروم': 'link',
// 'لقمان': 'link',
// 'السجدة': 'link',
// 'الأحزاب': 'link',
// 'سبأ': 'link',
// 'فاطر': 'link',
// 'يس': 'link',
// 'الصافات': 'link',
// 'ص': 'link',
// 'الزمر': 'link',
// 'غافر': 'link',
// 'فصلت': 'link',
// 'الشورى': 'link',
// 'الزخرف': 'link',
// 'الدخان': 'link',
// 'الجاثية': 'link',
// 'الأحقاف': 'link',
// 'محمد': 'link',
// 'الفتح': 'link',
// 'الحجرات': 'link',
// 'ق': 'link',
// 'الذاريات': 'link',
// 'الطور': 'link',
// 'النجم': 'link',
// 'القمر': 'link',
// 'الرحمن': 'link',
// 'الواقعة': 'link',
// 'الحديد': 'link',
// 'المجادلة': 'link',
// 'الحشر': 'link',
// 'الممتحنة': 'link',
// 'الصف': 'link',
// 'الجمعة': 'link',
// 'المنافقون': 'link',
// 'التغابن': 'link',
// 'الطلاق': 'link',
// 'التحريم': 'link',
// 'الملك': 'link',
// 'القلم': 'link',
// 'الحاقة': 'link',
// 'المعارج': 'link',
// 'نوح': 'link',
// 'الجن': 'link',
// 'المزمل': 'link',
// 'المدثر': 'link',
// 'القيامة': 'link',
// 'الإنسان': 'link',
// 'المرسلات': 'link',
// 'النبأ  ': 'link',
// 'النازعات': 'link',
// 'عبس': 'link',
// 'التكوير': 'link',
// 'الإنفطار': 'link',
// 'المطففين': 'link',
// 'الإنشقاق': 'link',
// 'البروج': 'link',
// 'الطارق': 'link',
// 'الأعلى': 'link',
// 'الغاشية': 'link',
// 'الفجر': 'link',
// 'البلد': 'link',
// 'الشمس': 'link',
// 'الليل': 'link',
// 'الضحى': 'link',
// 'الشرح': 'link',
// 'التين': 'link',
// 'العلق': 'link',
// 'القدر': 'link',
// 'البيِّنة': 'link',
// 'الزلزلة': 'link',
// 'العاديات': 'link',
// 'القارعة': 'link',
// 'التكاثر': 'link',
// 'العصر': 'link',
// 'الهمزة': 'link',
// 'الفيل': 'link',
// 'قريش': 'link',
// 'الماعون': 'link',
// 'الكوثر': 'link',
// 'الكافرون': 'link',
// 'النصر': 'link',
// 'المسد': 'link',
// 'الإخلاص': 'link',
// 'الفلق': 'link',
// 'الناس': 'link',
// };