import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_project/cash_helper.dart';

class Controller {
  static downloadFile({required String url}) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    print(appDocPath);

    Dio().download(url, '$appDocPath/$url.mp3',
        onReceiveProgress: (received, total) {
      int percentage = ((received / total) * 100).floor();
      print('percentage : $percentage');
    }).then((value) {
      CashHelper.setData(key: url, value: '$appDocPath/$url.mp3');
    });
  }

static bool checkIsDownloaded({required String url}){
   var temp= CashHelper.getData(key: url);
   if(temp==null){
     return false;
   }
    else{
      print(temp);
      return true;
   }
  }

}

Map<String,String> mashari =
  {
    'الفاتحة':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F001.mp3?alt=media&token=79f89e42-1a12-438a-9920-40663ba987c4',
    'البقرة':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F002.mp3?alt=media&token=24f396c7-ac84-4a4b-9a13-5cc6677e1831',
    'آل عمران	':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F003.mp3?alt=media&token=7a5f440d-5d65-4001-8d5f-712f944da5ab',
    'النساء':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F004.mp3?alt=media&token=e7a3df90-b2ed-475d-98e9-289df35e4bbe',
    'المآئدة':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F005.mp3?alt=media&token=b611fb10-e9cc-4976-b5be-fe4c046acb81',
    'الأنعام':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F006.mp3?alt=media&token=b654a48e-d3ce-43a0-92a0-5b96ae748326',
    'الأعراف':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F007.mp3?alt=media&token=c4539404-878c-48ac-8ee7-70eba9a06e70',
    'الأنفال':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F008.mp3?alt=media&token=ea6a5408-0a8c-4c38-bee6-011f27914aea',
    'التوبة':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F009.mp3?alt=media&token=d63ca230-ae45-4fe6-bfe4-18d1f71de66c',
    'يونس':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F010.mp3?alt=media&token=65ebe9ee-3c2f-43e6-b6e8-0c3af44f2ffd',
    'هود':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F011.mp3?alt=media&token=9df4d388-be77-4024-88bb-a4c5441b7b67',
    'يوسف':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F012.mp3?alt=media&token=9ec602bc-80f3-46da-a3ea-144cbe1e6047',
    'الرعد':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F013.mp3?alt=media&token=e254fd84-b521-4167-a19d-d452589e00cb',
    'إبراهيم':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F014.mp3?alt=media&token=6a773fe2-a977-443f-9523-e964f685533d',
    'الحجر':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F015.mp3?alt=media&token=e66298ee-6c83-4f39-910a-d03f7e984ee4',
    'النحل':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F016.mp3?alt=media&token=b40e52de-873b-420e-a750-4084b9b355a4',
    'الإسراء':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F017.mp3?alt=media&token=59c61b3c-a5f3-400d-98c5-7e2d5b3f2e62',
    'الكهف':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F018.mp3?alt=media&token=e0157655-8657-4922-ad27-03d440a3320b',
    'مريم':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F019.mp3?alt=media&token=af5c87bb-01fc-4d4a-859d-0948d222be37',
    'طـه':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F020.mp3?alt=media&token=f3b4da42-1110-477b-8622-289cc31b1f7c',
    'الأنبياء':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F021.mp3?alt=media&token=e5b76c57-c130-4118-8f3f-2b7b8094b387',
    'الحج':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F022.mp3?alt=media&token=a51077e1-98a0-4ddd-91af-8ec0398f8fef',
    'المؤمنون':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F023.mp3?alt=media&token=6d73e7f4-0418-4c0f-9ee8-0b049eae77e9',
    'النور':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F024.mp3?alt=media&token=cc0b7da2-3f52-45ca-a8cc-9d4d56d3b7d3',
    'الفرقان':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F025.mp3?alt=media&token=574fce89-ec86-4ee1-9e7b-54223eef38c6',
    'الشعراء':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F026.mp3?alt=media&token=7ccba369-aaad-4e42-a43e-456b19b3b44b',
    'النمل':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F027.mp3?alt=media&token=0b7aabd5-4898-4c09-9abb-65cf48a40988',
    'القصص':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F028.mp3?alt=media&token=42f5c48d-1b4e-4621-a69a-463e16c96aae',
    'العنكبوت':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F029.mp3?alt=media&token=f1757728-af81-41f0-9f18-bd4c0600e32f',
    'الروم':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F030.mp3?alt=media&token=ceca2f29-f206-4f92-94e3-86d097b19279',
    'لقمان':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F031.mp3?alt=media&token=18befa01-b1a7-42b2-b1b3-87b2397aacb8',
    'السجدة':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F032.mp3?alt=media&token=b57e531d-4d53-4f07-992d-77f602f8adba',
    'الأحزاب':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F033.mp3?alt=media&token=e3d5fb78-f9e1-412a-a91c-fa8628995a7f',
    'سبأ':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F034.mp3?alt=media&token=b56cd7cb-61ff-4210-9f9f-622eabc5e04d',
    'فاطر':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F035.mp3?alt=media&token=a628b1fe-d16d-4ecd-97a2-e53dc392c380',
    'يس':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F036.mp3?alt=media&token=f65147ab-f2b3-4b40-902f-d79399e1a32e',
    'الصافات':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F037.mp3?alt=media&token=30a6f0f6-d9d0-4c25-b78a-7d45e90ad633',
    'ص':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F038.mp3?alt=media&token=de8757a4-1555-4d46-a386-5e476b00d280',
    'الزمر':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F039.mp3?alt=media&token=2fd2a506-43f7-4376-83f9-addc93a5d355',
    'غافر':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F040.mp3?alt=media&token=964f0e52-459a-42bd-92cf-47f7f2d370c0',
    'فصلت':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F041.mp3?alt=media&token=15de67be-0132-4e0c-bbe3-68868382602b',
    'الشورى':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F042.mp3?alt=media&token=b5f4c385-ed63-4f4a-a142-de86e0393c5f',
    'الزخرف':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F043.mp3?alt=media&token=e5c837cf-d17e-4733-abaa-9cf3c0a0e19f',
    'الدخان':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F044.mp3?alt=media&token=3b59e1ec-4dce-4820-94c7-406d3f99a637',
    'الجاثية':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F045.mp3?alt=media&token=35ea7069-53bb-4e32-8296-c64ab6399cb2',
    'الأحقاف':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F046.mp3?alt=media&token=e3086bec-5be6-4fc6-a9f3-47a9cc4b53cb',
    'محمد':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F047.mp3?alt=media&token=84ac7366-957d-4e09-a79a-163869817bb4',
    'الفتح':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F048.mp3?alt=media&token=05093f9e-4aa5-4654-a5f9-8cbe313a8dba',
    'الحجرات':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F049.mp3?alt=media&token=2c0eb356-b5fe-4045-8fa3-fb9a032ec155',
    'ق':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F050.mp3?alt=media&token=1b724d48-0aa0-4b66-9ad2-43fcc958d1a2',
    'الذاريات':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F051.mp3?alt=media&token=cb98b4fe-fb89-4faf-8838-00723b008fa9',
    'الطور':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F052.mp3?alt=media&token=f59f9a9f-79a3-4bee-80ef-37ccd5490042',
    'النجم':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F053.mp3?alt=media&token=54233a19-cd8c-42dc-af09-41bb3eba4231',
    'القمر':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F054.mp3?alt=media&token=42132357-5a8c-499c-8efd-302a24093004',
    'الرحمن':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F055.mp3?alt=media&token=a2de4da7-b73e-470e-8cc7-c3e0360351e2',
    'الواقعة':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F056.mp3?alt=media&token=0345247e-131b-4255-b861-91db4e7bd8e4',
    'الحديد':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F057.mp3?alt=media&token=48d65a6a-4262-4125-90c8-edd4a9af0bce',
    'المجادلة':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F058.mp3?alt=media&token=9e2338af-677b-4c94-a60a-d76302adae39',
    'الحشر':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F059.mp3?alt=media&token=3ce70525-5258-48d3-8f24-f980697ee528',
    'الممتحنة':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F060.mp3?alt=media&token=38432885-cc4d-4ef1-8dce-edf689ce08aa',
    'الصف':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F061.mp3?alt=media&token=93f2ea0e-9c39-481a-8232-a0c02e160e96',
    'الجمعة':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F062.mp3?alt=media&token=6f1551b9-eb64-44fb-8a9e-5ffa9d3e0be2',
    'المنافقون':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F063.mp3?alt=media&token=dfb641f2-a5da-40cf-8fae-fb5053b6537a',
    'التغابن':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F064.mp3?alt=media&token=0d5890ac-b4c6-414f-8d63-9c8d95eec086',
    'الطلاق':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F065.mp3?alt=media&token=b5b4e91c-f5db-4861-b030-0ed4a526dd66',
    'التحريم':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F066.mp3?alt=media&token=f6b3a5ef-b024-4ea5-ac9a-7c6150c85883',
    'الملك':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F067.mp3?alt=media&token=eff53e48-3429-4876-b926-a00eb0689ab2',
    'القلم':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F068.mp3?alt=media&token=e6723882-9918-414d-8bae-5ff00ba8f1bd',
    'الحاقة':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F069.mp3?alt=media&token=264b6149-77d0-4e3b-b239-651b60b5e327',
    'المعارج':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F070.mp3?alt=media&token=bd3ee2af-41ee-4c8a-a368-33b170511bbd',
    'نوح':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F071.mp3?alt=media&token=6b78f58e-0970-4945-a697-9be1f6d65abf',
    'الجن':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F072.mp3?alt=media&token=aa9e335f-9661-4ca6-947c-28c6cab06a39',
    'المزمل':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F073.mp3?alt=media&token=b96ed14e-eacd-4768-acb4-8e907f609077',
    'المدثر':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F074.mp3?alt=media&token=d9f5b20a-84be-4349-ad32-c40cc173729f',
    'القيامة':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F075.mp3?alt=media&token=6a570e62-6e03-444d-80d5-dc4d82ce3bb5',
    'الإنسان':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F076.mp3?alt=media&token=8bf7f007-5ce9-43cf-9f23-335f466d90a6',
    'المرسلات':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F077.mp3?alt=media&token=a25c4e4b-93eb-4ba2-aaec-43194c434574',
    'النبأ	':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F078.mp3?alt=media&token=62d557c7-ae69-41b6-9c2b-fbfea13df414',
    'النازعات':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F079.mp3?alt=media&token=33b7efd0-d4fb-4e51-a687-3dfba6ffeb28',
    'عبس':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F080.mp3?alt=media&token=5b7a9850-2e3b-4e05-986b-24dd94e1d68a',
    'التكوير':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F081.mp3?alt=media&token=7a3a4b75-7ad2-4774-8008-c755bcdbeff7',
    'الإنفطار':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F082.mp3?alt=media&token=0f976ddc-da95-4e49-bd95-135231f7daa6',
    'المطففين':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F083.mp3?alt=media&token=dc9a409b-0510-4308-9d46-1ce8400c9bcb',
    'الإنشقاق':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F084.mp3?alt=media&token=b2ef2fce-567d-4bf3-9fa5-a141d48c0b5b',
    'البرج':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F085.mp3?alt=media&token=7d584317-c69b-4d00-bb54-24d46b5eb999',
    'الطارق':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F086.mp3?alt=media&token=a8711e39-0ed6-4749-b9c8-e2679bc821fa',
    'الأعلى':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F087.mp3?alt=media&token=961dc9c7-1bd8-4a49-9c81-c4fc43ff4a6e',
    'الغاشية':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F088.mp3?alt=media&token=8b7f615e-642c-4ea8-8de1-c3b8bcef7b75',
    'الفجر':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F089.mp3?alt=media&token=b29c281d-fe36-4f49-b82c-ddba3987addb',
    'البلد':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F090.mp3?alt=media&token=a205760c-2302-45f1-b891-be8cbb134109',
    'الشمس':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F091.mp3?alt=media&token=eb7a409a-6ae5-4c90-928f-2007fbe195ca',
    'الليل':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F092.mp3?alt=media&token=e80ec1af-eaee-4b80-baef-bcacf0f54c4d',
    'الضحى':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F093.mp3?alt=media&token=77d1e679-9065-4b83-839d-8759e34ffb7b',
    'الشرح':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F094.mp3?alt=media&token=3170f020-b366-4725-9827-798ef03b5385',
    'التين':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F095.mp3?alt=media&token=1fbb246e-691a-41c9-af5a-d947ee223b51',
    'العلق':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F096.mp3?alt=media&token=9319b540-1910-4520-bb07-1ce131c7b755',
    'القدر':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F097.mp3?alt=media&token=67787e3d-3ef1-44d4-8e6e-8fc03428c258',
    'البيِّنة':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F098.mp3?alt=media&token=73d08850-113b-4a05-ba73-35846c99637a',
    'الزلزلة':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F099.mp3?alt=media&token=7e536f01-04a7-4b48-a0be-a81ce8f659b9',
    'العاديات':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F100.mp3?alt=media&token=ec228b3f-45b1-4939-9526-2502aa85cfa3',
    'القارعة':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F101.mp3?alt=media&token=ea249488-f45b-4624-9bcb-49c44d79717e',
    'التكاثر':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F102.mp3?alt=media&token=b55923f1-baea-4784-b9d0-c35adb35db6f',
    'العصر':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F103.mp3?alt=media&token=94248ceb-303e-4b19-b3d2-9699aec27867',
    'الهمزة':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F104.mp3?alt=media&token=ae9b3b10-5600-44b5-9472-25ac1b1c2f22',
    'الفيل':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F105.mp3?alt=media&token=cf465153-86b4-4f3b-bdc7-4966add88799',
    'قريش':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F106.mp3?alt=media&token=1fa97c72-5e0d-4c25-82b1-6d3be03f2e44',
    'الماعون':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F107.mp3?alt=media&token=ac6b5ead-d4c7-46fd-a9fc-280283c04712',
    'الكوثر':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F108.mp3?alt=media&token=39690368-5fa2-4535-a2cc-fd38c7099daf',
    'الكافرون':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F109.mp3?alt=media&token=35336c43-9479-4885-8f48-e204239f73ca',
    'النصر':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F110.mp3?alt=media&token=8843be0d-1e39-47d9-ac47-1f47e582dfc1',
    'المسد':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F111.mp3?alt=media&token=1fbc0692-266d-407d-bbda-c6d3afe526f0',
    'الإخلاص':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F112.mp3?alt=media&token=a9670888-044d-452f-bdf6-5bdbcdbc5089',
    'الفلق':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F113.mp3?alt=media&token=55036b9a-cf82-4c2d-a53c-3443cb41ec95',
    'الناس':
        'https://firebasestorage.googleapis.com/v0/b/fproject-ba45b.appspot.com/o/mashari%2F114.mp3?alt=media&token=0640804e-8fcd-41d1-9e69-72be8837f596',
  }
;
