import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:com_rawand_ayatulkursi/setting/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isRTL = false;
  String _quranTranslation =
      'Allah! There is no god but He - the Living, the Self-subsisting, Eternal. No slumber can seize Him nor Sleep. His are all things in the heavens and on earth. Who is there that can intercede in His presence except as he permitteth? He knoweth what (appeareth to His creatures As) Before or After or Behind them. Nor shall they compass aught of His knowledge except as He willeth. His throne doth extend over the heavens and on earth, and He feeleth no fatigue in guarding and preserving them, For He is the Most High, the Supreme (in glory).';
  // Setting Page
  String _pageTitleSetting = 'Settings';
  String _pageTitleGeneral = 'General';
  String _pageSubTitleGeneral = 'Latest Version, Dark Mode';
  String _pageTitleAbout = 'About';
  String _pageAubTitleAbout = 'Version, Releases, Developer';
  // Setting General Page
  String _lastVersionGeneral = 'Latest Version';
  String _lastVersionDateGeneral = '24.03.2023';
  String _darkModeGeneral = 'Dark Mode';
  // Setting About Page
  String _appDescription =
      'This app is created for those who want to read and listen to Ayat Al-Kursi daily.';
  String _appContact = 'Contact developer';
  String _appDeveloper = 'Rawand Ako Khalid';
  String _appDeveloperDescription = 'Web & Mobile App Developer + Designer';
  String _appDeveloperWebsite = 'Website';
  String _appDeveloperInstagram = 'Instagram';
  String _appSponsor = 'Sponsor';
  String _appKhmerTranlator = 'Khmer language translator';
  String _appNewVersion = 'New Version';
  String _appNewVersionCheck = 'Click to check the newst version';
  String _appVersionName = 'Version';

  @override
  void initState() {
    super.initState();
    _loadText();
  }

  Future<void> _loadText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _quranTranslation = prefs.getString('text') ??
          'Allah! There is no god but He - the Living, the Self-subsisting, Eternal. No slumber can seize Him nor Sleep. His are all things in the heavens and on earth. Who is there that can intercede in His presence except as he permitteth? He knoweth what (appeareth to His creatures As) Before or After or Behind them. Nor shall they compass aught of His knowledge except as He willeth. His throne doth extend over the heavens and on earth, and He feeleth no fatigue in guarding and preserving them, For He is the Most High, the Supreme (in glory).';

      _isRTL = prefs.getString('language') == 'ar' ||
          prefs.getString('language') == 'ckb';
    });
  }

  Future<void> _saveText(
      String text,
      String language,
      String _pageTitleSetting,
      String _pageSubTitleGeneral,
      String _pageTitleAbout,
      String _pageAubTitleAbout,
      String _pageTitleGeneral,
      String _lastVersionGeneral,
      String _lastVersionDateGeneral,
      String _darkModeGeneral,
      String _appDescription,
      String _appContact,
      String _appDeveloper,
      String _appDeveloperDescription,
      String _appDeveloperWebsite,
      String _appDeveloperInstagram,
      String _appSponsor,
      String _appKhmerTranlator,
      String _appNewVersion,
      String _appNewVersionCheck,
      String _appVersionName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('text', text);
    await prefs.setString('language', language);

    // Setting Page
    await prefs.setString('pageTileSetting', _pageTitleSetting);
    await prefs.setString('pageSubTitleGeneral', _pageSubTitleGeneral);
    await prefs.setString('pageTitleAbout', _pageTitleAbout);
    await prefs.setString('pageAubTitleAbout', _pageAubTitleAbout);

    // Setting General Page
    await prefs.setString('pageTitleGeneral', _pageTitleGeneral);
    await prefs.setString('lastVersionGeneral', _lastVersionGeneral);
    await prefs.setString('lastVersionDateGeneral', _lastVersionDateGeneral);
    await prefs.setString('darkModeGeneral', _darkModeGeneral);

    // Setting About Page
    await prefs.setString('appDescription', _appDescription);
    await prefs.setString('appContact', _appContact);
    await prefs.setString('appDeveloper', _appDeveloper);
    await prefs.setString('appDeveloperDescription', _appDeveloperDescription);
    await prefs.setString('appDeveloperWebsite', _appDeveloperWebsite);
    await prefs.setString('appDeveloperInstagram', _appDeveloperInstagram);
    await prefs.setString('appSponsor', _appSponsor);
    await prefs.setString('appKhmerTranlator', _appKhmerTranlator);
    await prefs.setString('appNewVersion', _appNewVersion);
    await prefs.setString('appNewVersionCheck', _appNewVersionCheck);
    await prefs.setString('appVersionName', _appVersionName);

    setState(() {
      _quranTranslation = text;

      _isRTL = language == 'ar' || language == 'ckb';
    });
  }

  void _showLanguageDialog() async {
    String? language = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: _isRTL ? TextDirection.rtl : TextDirection.ltr,
          child: AlertDialog(
            title: Text('Select Language'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RadioListTile<String>(
                  title: Text('English'),
                  value:
                      'Allah! There is no god but He - the Living, the Self-subsisting, Eternal. No slumber can seize Him nor Sleep. His are all things in the heavens and on earth. Who is there that can intercede in His presence except as he permitteth? He knoweth what (appeareth to His creatures As) Before or After or Behind them. Nor shall they compass aught of His knowledge except as He willeth. His throne doth extend over the heavens and on earth, and He feeleth no fatigue in guarding and preserving them, For He is the Most High, the Supreme (in glory).',
                  groupValue: _quranTranslation,
                  onChanged: (String? value) {
                    _saveText(
                      value!,
                      'en',
                      'Settings',
                      'Latest Version, Dark Mode',
                      'About',
                      'Version, Releases, Developer',
                      'General',
                      'Latest Version',
                      '24.03.2023',
                      'Dark Mode',
                      'This app is created for those who want to read and listen to Ayat Al-Kursi daily.',
                      'Contact developer',
                      'Rawand Ako Khalid',
                      'Web & Mobile App Developer + Designer',
                      'Website',
                      'Instagram',
                      'Sponsor',
                      'Khmer language translator',
                      'New Version',
                      'Click to check the newest version',
                      'Version',
                    );
                    Navigator.pop(context, value);
                  },
                ),
                RadioListTile<String>(
                  title: Text('Deutsch'),
                  value:
                      'Allāh – kein Gott ist da außer Ihm, Dem Ewiglebenden, Dem durch Sich Selbst Seienden. Ihn ergreift weder Schlummer noch Schlaf. Ihm gehört, was in den Himmeln und was auf der Erde ist. Wer ist es, der bei Ihm Fürsprache einlegen könnte außer mit Seiner Erlaubnis? Er weiß, was vor ihnen und was hinter ihnen liegt; sie aber begreifen nichts von Seinem Wissen, es sei denn das, was Er will. Weit reicht Sein Thron über die Himmel und die Erde, und es fällt Ihm nicht schwer, sie (beide) zu bewahren. Und Er ist der Hohe, der Allmächtige.',
                  groupValue: _quranTranslation,
                  onChanged: (String? value) {
                    _saveText(
                      value!,
                      'de',
                      'Einstellungen',
                      'Neueste Version, Dunkler Modus',
                      'Über',
                      'Version, Releases, Entwickler',
                      'Allgemein',
                      'Letzte Version',
                      '24.03.2023',
                      'Dunkler Modus',
                      'Diese App wurde für diejenigen entwickelt, die täglich Ayat Al-Kursi lesen und hören möchten.',
                      'Entwickler kontaktieren',
                      'Rawand Ako Khalid',
                      'Web- und Mobile-App-Entwickler + Designer',
                      'Webseite',
                      'Instagram',
                      'Sponsor',
                      'Khmer-Übersetzer',
                      'Neue Version',
                      'Klicken Sie hier, um die neueste Version zu überprüfen',
                      'Version',
                    );
                    Navigator.pop(context, value);
                  },
                ),
                RadioListTile<String>(
                  title: Text('Shqiptare'),
                  value:
                      'Allahu - nuk ka tjetër perveç Tij, që është gjallë dhe i qëndrueshëm. Atij nuk i takon shtrirja dhe ngritja. Ai nuk lodhet dhe nuk i duhet gjumi. Atij i takon çdo gjë në qiell dhe tokë. Kush mund të ndërmjetësojë tek Ai pa lejen e Tij? Ai e di atë që ka pasur më parë dhe atë që do të ndodhë. Asnjë qenie nuk mund ta kuptojë dijenë e Tij, përveç në masën që Ai dëshiron. Arshi i Tij mbulon qiellin dhe tokën, dhe mbajtja e tyre nuk i sjell Atij lodhje. Ai është Lartësuar dhe i Madhëruar.',
                  groupValue: _quranTranslation,
                  onChanged: (String? value) {
                    _saveText(
                      value!,
                      'sq',
                      'Cilësimi',
                      'Versioni i fundit, modaliteti i errët',
                      'Rreth',
                      'Versioni, Publikimet, Zhvilluesi',
                      'Gjeneral',
                      'Versioni i fundit',
                      '24.03.2023',
                      'Modaliteti i errët',
                      'Ky aplikacion është krijuar për ata që duan të lexojnë dhe dëgjojnë Ayat Al-Kursi çdo ditë.',
                      'Kontaktoni zhvilluesin',
                      'Rawand Ako Khalid',
                      'Zhvillues + Dizajnues i aplikacioneve për ueb dhe celular',
                      'Faqja e internetit',
                      'Instagram',
                      'Sponsor',
                      'Përkthyes i gjuhës Kmere',
                      'Version i ri',
                      'Klikoni për të kontrolluar versionin më të ri',
                      'Version',
                    );
                    Navigator.pop(context, value);
                  },
                ),
                RadioListTile<String>(
                  title: Text('Türkçe'),
                  value:
                      "Allah, O'ndan başka ilah yoktur. Hayy ve Kayyum olan O'dur. Kendisine ne uyku ne de uyuklama basarır. Göklerde ve yerde ne varsa hepsi O'nundur. İzni olmadan O'nun huzurunda kim şefaat edebilir? O, kullarının yaptıklarını ve yapacaklarını bilir. Kullarının nefslerindeki gizli ve açık her şeyi bilir. O'nun ilmi, kullarının kapasitesinin ötesindedir. O, her şeyi hakkıyla işiten ve görendir.",
                  groupValue: _quranTranslation,
                  onChanged: (String? value) {
                    _saveText(
                      value!,
                      'tr',
                      'Ayar',
                      'Son Sürüm, Karanlık Mod',
                      'Hakkında',
                      'Sürüm, Bültenler, Geliştirici',
                      'Genel',
                      'En son sürüm',
                      '24.03.2023',
                      'Karanlık Mod',
                      "Ky aplikacion është krijuar për ata që duan të lexojnë dhe dëgjojnë Ayat Al-Kursi çdo ditë.",
                      'Kontakto zhvilluesin',
                      'Rawand Ako Khalid',
                      "Zhvillues i aplikacioneve për ueb dhe celular + projektues",
                      'Uebfaqja',
                      'Instagram',
                      'Sponsor',
                      'Përkthyes i gjuhës Kmere',
                      'Versioni i ri',
                      'Kliko për të kontrolluar versionin më të ri',
                      'Version',
                    );
                    Navigator.pop(context, value);
                  },
                ),
                RadioListTile<String>(
                  title: Text(
                    'کوردی',
                    style: TextStyle(
                      letterSpacing: 0.0,
                      fontFamily: 'Sahel',
                    ),
                  ),
                  value:
                      '{گەورەترین ئایەت لە قورئاندا} [ اللَّهُ لَا إِلَهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ] خوای گه‌وره‌ زاتی پیرۆزی الله ئه‌و خوایه‌یه‌ كه‌ هیچ په‌رستراوێكی به‌حه‌ق نیه‌ شایه‌نی په‌رستن بێ جگه‌ له‌و كه‌ خوایه‌كه‌ هه‌میشه‌ زیندووه‌ هیچ كاتێك مردنی به‌سه‌ردا نایات و له‌ناوچوونی نیه‌ وه‌ هه‌ڵسوڕێنه‌ری ئیش و كاروباری خه‌ڵكی و بوونه‌وه‌ره‌ [ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ ] نه‌ وه‌نه‌وزه‌و خه‌وه‌نوچكه‌ ئه‌یباته‌وه‌ وه‌ نه‌ خه‌ویشی لێ ئه‌كه‌وێ [ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ ] هه‌رچی له‌ ئاسمانه‌كان و زه‌وی یه‌ و ئه‌وه‌ی له‌ نێوانیاندایه‌ هه‌مووی موڵكی خوای گه‌وره‌یه‌ [ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ ] هیچ كه‌سێك ناتوانێ شه‌فاعه‌ت بكات له‌لای خوای گه‌وره‌ ئیلا به‌ئیزنی خوای گه‌وره‌ نه‌بێ كه‌ ئیزن بدات بۆ تكاكارو تكابۆكراوه‌ [ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ] خوای گه‌وره‌ زانیاری هه‌یه‌ به‌وه‌ی كه‌ له‌ پێشیانه‌وه‌یه‌ كه‌ قیامه‌ته‌ وه‌ ئه‌وه‌ی له‌ دوایانه‌وه‌یه‌ كه‌ دونیایه‌، یاخود زانیاری هه‌یه‌ به‌ رابردوو ئێستاو داهاتوو [ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلَّا بِمَا شَاءَ ] به‌ڵام مرۆڤه‌كان هیچ زانیاریه‌كیان به‌خوای گه‌وره‌و سیفاته‌كانی نیه‌ ته‌نها مه‌گه‌ر شتێك كه‌ خوای گه‌وره‌ خۆی ویستی لێی بێ و له‌ قورئاندا ده‌رباره‌ی خۆی ڕوونی كردبێته‌وه‌ [ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ ] وه‌ كورسی خوای گه‌وره‌ فراوانه‌ به‌فراوانی هه‌ر حه‌وت ئاسمان و هه‌ر حه‌وت زه‌وی یه‌كه‌ كه‌ پێغه‌مبه‌ری خوا صلی الله علیه وسلم ئه‌فه‌رمووێ: (الْكُرْسِيُّ مَوْضِعُ الْقَدَمَيْنِ), (صححه الألباني في تَخْرِيجِ الطَّحَاوِيَّة ص: ٣١١) واته‌: كورسی شوێن هه‌ردوو پێی خوای گه‌وره‌یه‌ كه‌ چۆنیه‌ته‌كه‌ی ته‌نها خوای گه‌وره‌ خۆی ده‌یزانێت، وه‌ سیفاتی خوای گه‌وره‌ له‌ سیفاتی دروستكراوه‌كان ناچێت [ وَلَا يَئُودُهُ حِفْظُهُمَا ] وه‌ پاراستنی ئاسمانه‌كان و زه‌وی و هه‌ڵگرتنی خوای گه‌وره‌ ماندوو ناكات و قورس نیه‌ لای خوای گه‌وره‌ [ وَهُوَ الْعَلِيُّ الْعَظِيمُ (٢٥٥) ] وه‌ خوای گه‌وره‌ به‌رزه‌ له‌ زاتی پیرۆزیدا له‌سه‌رووی عه‌رشی پیرۆزه‌وه‌یه‌، وه‌ له‌ ناو و سیفات و تواناو ده‌سه‌ڵاتی، وه‌ خوای گه‌وره‌ زۆر گه‌وره‌یه‌، كه‌ ئه‌م ئایه‌تی كورسی یه‌ گه‌وره‌ترین ئایه‌ته‌ له‌ قورئانی پیرۆزدا وه‌ فه‌زڵی زۆر گه‌وره‌یه‌.',
                  groupValue: _quranTranslation,
                  onChanged: (String? value) {
                    _saveText(
                      value!,
                      'ckb',
                      'دۆخ',
                      'نوێترین وەشان، دۆخی تاریک',
                      'دەربارە',
                      'وەشان، بڵاوکردنەوە، گەشەپێدەر',
                      'گشتی',
                      'نوێترین وەشان',
                      '٢٤.٠٣.٢٠٢٣',
                      'دۆخی تاریک',
                      'ئەم ئەپە بۆ ئەو کەسانە دروستکراوە کە دەیانەوێت ڕۆژانە ئایەت الکورسی بخوێننەوە و گوێیان لێبگرن.',
                      'پەیوەندی بە گەشەپێدەرەوە',
                      'ڕەوەند ئاکۆ خالید',
                      'گەشەپێدەری ئەپی وێب و مۆبایل + دیزاینەر',
                      'ماڵپەڕ',
                      'ئینستاگرام',
                      'سپۆنسەر',
                      'وەرگێڕی زمانی khmer',
                      'وەشانى نوێ',
                      'کلیک بکە بۆ پشکنینی نوێترین وەشان',
                      'وەشانی',
                    );
                    Navigator.pop(context, value);
                  },
                ),
                RadioListTile<String>(
                  title: Text(
                    'العربية',
                    style: TextStyle(
                      letterSpacing: 0.0,
                      fontFamily: 'Sahel',
                    ),
                  ),
                  value:
                      'أخبر تعالى عن نفسه الكريمة بأن {لا إله إلا هو} أي: لا معبود بحق سواه، فهو الإله الحق الذي تتعين أن تكون جميع أنواع العبادة والطاعة والتأله له تعالى؛ لكماله، وكمال صفاته، وعظيم نعمه، ولكون العبد مستحقا أن يكون عبدا لربه، ممتثلا أوامره، مجتنبا نواهيه، وكل ما سوى الله تعالى باطل، فعبادة ما سواه باطلة؛ لكون ما سوى الله مخلوقا ناقصا مدبرا فقيرا من جميع الوجوه، فلم يستحق شيئا من أنواع العبادة. وقوله: {الحي القيوم} هذان الاسمان الكريمان يدلان على سائر الأسماء الحسنى دلالة مطابقة وتضمنا ولزوما، فالحي: من له الحياة الكاملة المستلزمة لجميع صفات الذات، كالسمع، والبصر، والعلم، والقدرة، ونحو ذلك، والقيوم: هو الذي قام بنفسه وقام بغيره، وذلك مستلزم لجميع الأفعال التي اتصف بها رب العالمين من فعله ما يشاء من الاستواء، والنزول، والكلام، والقول، والخلق، والرزق، والإماتة، والإحياء، وسائر أنواع التدبير، كل ذلك داخل في قيومية الباري، ولهذا قال بعض المحققين: إنهما الاسم الأعظم الذي إذا دعي الله به أجاب، وإذا سئل به أعطى، ومن تمام حياته وقيوميته أن {لا تأخذه سنة ولا نوم} والسنة: النعاس {له ما في السماوات وما في الأرض} أي: هو المالك وما سواه مملوك، وهو الخالق الرازق المدبر وغيره مخلوق مرزوق مدبر لا يملك لنفسه ولا لغيره مثقال ذرة في السماوات ولا في الأرض، فلهذا قال: {من ذا الذي يشفع عنده إلا بإذنه} أي: لا أحد يشفع عنده بدون إذنه، فالشفاعة كلها لله تعالى، ولكنه تعالى إذا أراد أن يرحم من يشاء من عباده أذن لمن أراد أن يكرمه من عباده أن يشفع فيه، لا يبتدئ الشافع قبل الإذن، ثم قال {يعلم ما بين أيديهم} أي: ما مضى من جميع الأمور {وما خلفهم} أي: ما يستقبل منها؛ فعلمه تعالى محيط بتفاصيل الأمور، متقدمها ومتأخرها، بالظواهر والبواطن، بالغيب والشهادة، والعباد ليس لهم من الأمر شيء، ولا من العلم مثقال ذرة إلا ما علمهم تعالى، ولهذا قال: {ولا يحيطون بشيء من علمه إلا بما شاء وسع كرسيه السماوات والأرض} وهذا يدل على كمال عظمته، وسعة سلطانه، إذا كان هذه حالة الكرسي أنه يسع السماوات والأرض على عظمتهما وعظمة من فيهما، والكرسي ليس أكبر مخلوقات الله تعالى، بل هنا ما هو أعظم منه وهو العرش، وما لا يعلمه إلا هو، وفي عظمة هذه المخلوقات تحير الأفكار، وتكل الأبصار، وتقلقل الجبال، وتكع ـ أي تهاب وتضعف ـ عنها فحول الرجال، فكيف بعظمة خالقها ومبدعها، والذي أودع فيها من الحكم والأسرار ما أودع، والذي قد أمسك السماوات والأرض أن تزولا من غير تعب ولا نصب، فلهذا قال: {ولا يؤوده} أي: يثقله {حفظهما وهو العلي} بذاته فوق عرشه، العلي بقهره لجميع المخلوقات، العلي بقدره لكمال صفاته {العظيم} الذي تتضاءل عند عظمته جبروت الجبابرة، وتصغر في جانب جلاله أنوف الملوك القاهرة، فسبحان من له العظمة العظيمة، والكبرياء الجسيمة، والقهر والغلبة لكل شيء، فقد اشتملت هذه الآية على توحيد الإلهية، وتوحيد الربوبية، وتوحيد الأسماء والصفات، وعلى إحاطة ملكه، وإحاطة علمه، وسعة سلطانه وجلاله ومجده، وعظمته وكبريائه، وعلوه على جميع مخلوقاته، فهذه الآية بمفردها عقيدة في أسماء الله وصفاته، متضمنة لجميع الأسماء الحسنى والصفات العلا.',
                  groupValue: _quranTranslation,
                  onChanged: (String? value) {
                    _saveText(
                      value!,
                      'ar',
                      'إعدادات',
                      'أحدث إصدار ، الوضع المظلم',
                      'عن',
                      'الإصدار، الإصدارات، المطور',
                      'عام',
                      'احدث اصدار',
                      '٢٤.٠٣.٢٠٢٣',
                      'الوضع المظلم',
                      "تم إنشاء هذا التطبيق لأولئك الذين يرغبون في القراءة والاستماع إلى آية الكرسي يوميًا.",
                      "الاتصال بالمطور",
                      'رواند آكو خالد',
                      "مطور تطبيقات الويب والجوال + مصمم",
                      'موقع إلكتروني',
                      "إنستغرام",
                      'برعاية',
                      "مترجم لغة khmer",
                      'نسخة جديدة',
                      "انقر للتحقق من أحدث إصدار",
                      'إصدار',
                    );
                    Navigator.pop(context, value);
                  },
                ),
                RadioListTile<String>(
                  title: Text(
                    'ខ្មែរ',
                    style: TextStyle(
                      letterSpacing: 0.0,
                    ),
                  ),
                  value:
                      'អល់ឡោះគ្មានម្ចាស់ណាក្រៅពីទ្រង់ទេ ដែលរស់ជាអមតៈ ឥតមានងងុយ និងឥតមានសម្រាន្តដែរ។ កម្មសិទ្ធិព្រះអង្គគឺអ្វីដែលមាននៅលើមេឃ និងអ្វីដែលមាននៅលើដី។ តើជនណាដែលអាចធ្វើអន្តរាគមន៍អំពីទ្រង់ បើសិនគ្មានការអនុញ្ញាតពីទ្រង់នោះ។ ទ្រង់ដឹងនូវអ្វីដែលនៅចំពោះមុខពួកគេ និងអ្វីដែលនៅពីក្រោយខ្នងរបស់ពួកគេ។ ហើយពួកគេមិនអាចជ្រួតជ្រាបបន្តិចសោះឡើយពីការដឹងរបស់ព្រះអង្គ ក្រៅពីអ្វីដែលទ្រង់មានសោមនស្ស។ គួរស៊ីរបស់ទ្រង់ទូលាយជាងមេឃ និងដី។ ការថែរក្សាមេឃ និងដីពុំមែនធ្ងន់ធ្ងរទេចំពោះទ្រង់។ ទ្រង់ដ៏មហាខ្ពង់ខ្ពស់ និងធំក្រៃលែងបំផុត (255)។',
                  groupValue: _quranTranslation,
                  onChanged: (String? value) {
                    _saveText(
                      value!,
                      'km',
                      'ការកំណត់',
                      'កំណែចុងក្រោយបំផុត, ម៉ូដងងឹត',
                      'អំពី',
                      'កំណែ, ការចេញផ្សាយ, អ្នកអភិវឌ្ឍន៍',
                      'ទូទៅ',
                      'ជំនាន់​ចុងក្រោយ',
                      '24.03.2023',
                      'ម៉ូដងងឹត',
                      'កម្មវិធីនេះត្រូវបានបង្កើតឡើងសម្រាប់អ្នកដែលចង់អាន និងស្តាប់ Ayat Al-Kursi ប្រចាំថ្ងៃ។',
                      'ទាក់ទងអ្នកអភិវឌ្ឍន៍',
                      'Rawand Ako Khalid',
                      'Web & Mobile App Developer + Designer',
                      'គេហទំព័រ',
                      'Instagram',
                      'អ្នកឧបត្ថម្ភ',
                      'អ្នកបកប្រែភាសាខ្មែរ',
                      'កំណែ​ថ្មី',
                      'ចុចដើម្បីពិនិត្យមើលកំណែថ្មីបំផុត',
                      'កំណែ',
                    );
                    Navigator.pop(context, value);
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                child: Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );

    if (language != null) {
      String content = await rootBundle.loadString('assets/$language.txt');
      _saveText(
        content,
        language,
        _pageTitleSetting,
        _pageSubTitleGeneral,
        _pageTitleAbout,
        _pageAubTitleAbout,
        _pageTitleGeneral,
        _lastVersionGeneral,
        _lastVersionDateGeneral,
        _darkModeGeneral,
        _appDescription,
        _appContact,
        _appDeveloper,
        _appDeveloperDescription,
        _appDeveloperWebsite,
        _appDeveloperInstagram,
        _appSponsor,
        _appKhmerTranlator,
        _appNewVersion,
        _appNewVersionCheck,
        _appVersionName,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: _isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            'Ayatul Kursi Offline',
            style: TextStyle(
              letterSpacing: 0.0,
              fontFamily: 'Google',
            ),
          ),
          actions: [
            IconButton(
              onPressed: _showLanguageDialog,
              icon: const Icon(Icons.translate_outlined),
            ),
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingPage(),
                ),
              ),
              icon: const Icon(Icons.settings_outlined),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 18.0),
                const Text(
                  'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 0.0,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Quran',
                  ),
                ),
                const SizedBox(height: 12.0),
                const Text(
                  'ٱللَّهُ لَآ إِلَـٰهَ إِلَّا هُوَ ٱلْحَىُّ ٱلْقَيُّومُ ۚ لَا تَأْخُذُهُۥ سِنَةٌۭ وَلَا نَوْمٌۭ ۚ لَّهُۥ مَا فِى ٱلسَّمَـٰوَٰتِ وَمَا فِى ٱلْأَرْضِ ۗ مَن ذَا ٱلَّذِى يَشْفَعُ عِندَهُۥٓ إِلَّا بِإِذْنِهِۦ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَىْءٍۢ مِّنْ عِلْمِهِۦٓ إِلَّا بِمَا شَآءَ ۚ وَسِعَ كُرْسِيُّهُ ٱلسَّمَـٰوَٰتِ وَٱلْأَرْضَ ۖ وَلَا يَـُٔودُهُۥ حِفْظُهُمَا ۚ وَهُوَ ٱلْعَلِىُّ ٱلْعَظِيمُ {٢٥٥}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    height: 1.8,
                    letterSpacing: 0.0,
                    fontFamily: 'Quran',
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  margin: const EdgeInsets.only(bottom: 70),
                  child: Text(
                    _quranTranslation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: _isRTL ? 'Sahel' : 'Google',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
