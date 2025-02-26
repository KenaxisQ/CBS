import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'te'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? teText = '',
  }) =>
      [enText, teText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '1m7byqw8': {
      'en': 'One Step Solution for all ',
      'te': 'అందరికీ ఒక దశ పరిష్కారం',
    },
    'dpb7yfdg': {
      'en': 'Financial Needs',
      'te': 'ఆర్థిక అవసరాలు',
    },
    'b3dk5eb8': {
      'en': 'Get Started',
      'te': 'ప్రారంభించడానికి',
    },
    '7ir36ubw': {
      'en': 'Home',
      'te': 'హొమ్ పేజ్',
    },
  },
  // Signup
  {
    'u4pjnmd8': {
      'en': 'Sign Up',
      'te': 'చేరడం',
    },
    '9i538w0s': {
      'en': 'Phone Number',
      'te': 'ఫోన్ నంబర్',
    },
    '1ea8vlxf': {
      'en': 'Enter Phone Number',
      'te': 'ఫోన్ నంబర్‌ను నమోదు చేయండి',
    },
    'kxqopajw': {
      'en': 'Send OTP',
      'te': 'OTP పంపండి',
    },
    'j8kt48kc': {
      'en': 'Home',
      'te': 'గృహ రుణం',
    },
  },
  // VerifyOTP
  {
    '2e9dke8z': {
      'en': 'Back',
      'te': 'వెనుకకు',
    },
    'ksxoxohk': {
      'en': 'Verify OTP',
      'te': 'OTP ని ధృవీకరించండి',
    },
    'fqxsj4o1': {
      'en': 'Sign up',
      'te': 'సైన్ అప్ చేయండి',
    },
    '22mfn8uw': {
      'en': 'Home',
      'te': 'గృహ రుణం',
    },
  },
  // landing
  {
    'sfveah9s': {
      'en': 'View Requests',
      'te': 'అభ్యర్థనలను వీక్షించండి',
    },
    'fn3h5pk1': {
      'en': 'View All Requests',
      'te': 'అభ్యర్థనలను వీక్షించండి',
    },
    'odlfa954': {
      'en': 'Logout',
      'te': 'లాగ్అవుట్',
    },
    't3ldp84i': {
      'en': 'Welcome',
      'te': 'స్వాగతం',
    },
    '91x0of6q': {
      'en': '1',
      'te': '1. 1.',
    },
    'v4s9msbi': {
      'en': 'Chandra Bonafied Consultancy',
      'te': 'చంద్ర బోనఫీడ్ కన్సల్టేంసి',
    },
    'r99dcrz3': {
      'en': 'Click here for loans',
      'te': 'రుణాల కోసం ఇక్కడ క్లిక్ చేయండి',
    },
    '27oks4hk': {
      'en': 'Click here for realestate',
      'te': 'స్థిరాస్తి కోసం ఇక్కడ క్లిక్ చేయండి',
    },
    'iev4tlpm': {
      'en': 'About us',
      'te': 'మా గురించి',
    },
    '43tdi67s': {
      'en':
          'We provide seamless bank loan services and expert real estate solutions to help you secure loans and find your dream property effortlessly. Your trusted partner for hassle-free banking and real estate needs!',
      'te':
          'మీరు రుణాలను పొందడంలో మరియు మీ కలల ఆస్తిని సులభంగా కనుగొనడంలో సహాయపడటానికి మేము సజావుగా బ్యాంక్ రుణ సేవలు మరియు నిపుణులైన రియల్ ఎస్టేట్ పరిష్కారాలను అందిస్తాము. ఇబ్బంది లేని బ్యాంకింగ్ మరియు రియల్ ఎస్టేట్ అవసరాలకు మీ విశ్వసనీయ భాగస్వామి!',
    },
    'pvhkrtyv': {
      'en': 'Partners',
      'te': 'భాగస్వాములు',
    },
    'to6ad51t': {
      'en': 'Home',
      'te': 'హొమ్ పేజ్',
    },
  },
  // ThankYou
  {
    'jb0hrqxp': {
      'en': 'THANK YOU',
      'te': 'ధన్యవాదాలు',
    },
    'occtfbkb': {
      'en': 'Our Agent will contact shortly',
      'te': 'మా ఏజెంట్ త్వరలో మిమ్మల్ని సంప్రదిస్తారు.',
    },
    'qs2yozt6': {
      'en': 'OK',
      'te': 'సరే',
    },
    'jczttiq2': {
      'en': 'Home',
      'te': 'హొమ్ పేజ్',
    },
  },
  // Services
  {
    'l4iwav2o': {
      'en': 'Select type of loan you want',
      'te': 'మీకు కావలసిన రుణ రకాన్ని ఎంచుకోండి',
    },
    '9rc4i8bx': {
      'en': 'Home',
      'te': 'హొమ్ పేజ్',
    },
  },
  // HomeLoanForm
  {
    '8wxkw05n': {
      'en': 'Select Loan Mode',
      'te': 'లోన్ మోడ్‌ను ఎంచుకోండి',
    },
    'evucjmgm': {
      'en': 'Select Loan For...',
      'te': '... కోసం లోన్ ఎంచుకోండి.',
    },
    '1j3jt4cn': {
      'en': 'Search...',
      'te': 'వెతకండి...',
    },
    '8aa9yofg': {
      'en': 'Construction',
      'te': 'నిర్మాణం',
    },
    'a6ip1501': {
      'en': 'Purchasing',
      'te': 'కొనుగోలు చేయడం',
    },
    '64fb7qft': {
      'en': 'Renovation',
      'te': 'పునరుద్ధరణ',
    },
    'vjlprnhk': {
      'en': 'Take Over',
      'te': 'స్వాధీనం చేసుకోండి',
    },
    '4t0x8oc3': {
      'en': 'SIte/Land',
      'te': 'సైట్/భూమి',
    },
    '2ih1byj7': {
      'en': 'Select House Type',
      'te': 'ఇంటి రకాన్ని ఎంచుకోండి',
    },
    '875jnx2y': {
      'en': 'Select House Type..',
      'te': 'ఇంటి రకాన్ని ఎంచుకోండి..',
    },
    'mxykcy38': {
      'en': 'Search...',
      'te': 'వెతకండి...',
    },
    '07k69vl5': {
      'en': 'Renovation',
      'te': 'పునరుద్ధరణ',
    },
    '28258thv': {
      'en': 'New House',
      'te': 'కొత్త ఇల్లు',
    },
    'xrm3oqti': {
      'en': 'Flat',
      'te': 'ఫ్లాట్',
    },
    'aiigj37e': {
      'en': 'In Construction',
      'te': 'నిర్మాణంలో',
    },
    'ifj2dcel': {
      'en': 'Select House Registration',
      'te': 'ఇంటి రిజిస్ట్రేషన్ ఎంచుకోండి',
    },
    'cpm2att5': {
      'en': 'Select House Registration...',
      'te': 'ఇంటి రిజిస్ట్రేషన్ ఎంచుకోండి...',
    },
    '87ibo2ue': {
      'en': 'Search...',
      'te': 'వెతకండి...',
    },
    'ti9eipy4': {
      'en': 'Registered',
      'te': 'నమోదు చేయబడింది',
    },
    '2l1grxgf': {
      'en': 'Not Registered',
      'te': 'నమోదు కాలేదు',
    },
    'rmhxmaib': {
      'en': 'Select Occupation',
      'te': 'వృత్తిని ఎంచుకోండి',
    },
    '5cxuiav2': {
      'en': 'Select Occupation...',
      'te': 'వృత్తిని ఎంచుకోండి...',
    },
    '8ykcxa4z': {
      'en': 'Search...',
      'te': 'వెతకండి...',
    },
    '5dh1f5cc': {
      'en': 'Govt Employee',
      'te': 'ప్రభుత్వ ఉద్యోగి',
    },
    'f3lmcha0': {
      'en': 'Pravaite Employee',
      'te': 'ప్రవైట్ ఉద్యోగి',
    },
    'wd24qlsf': {
      'en': 'Bussiness man',
      'te': 'వ్యాపారవేత్త',
    },
    'qqwf5cxe': {
      'en': 'Monthly Income',
      'te': 'నెలవారీ ఆదాయం',
    },
    'h1bxetol': {
      'en': 'Enter Monthly Income',
      'te': 'నెలవారీ ఆదాయాన్ని నమోదు చేయండి',
    },
    'ai2k1w1o': {
      'en': 'Other Loans',
      'te': 'ఇతర రుణాలు',
    },
    'zc9gvcfh': {
      'en': 'Enter Other Loans',
      'te': 'ఇతర రుణాలను నమోదు చేయండి',
    },
    'q38ea0x5': {
      'en': 'CIBIL',
      'te': 'సిబిల్',
    },
    'f2bsvq1h': {
      'en': 'Ente CIBIL Score',
      'te': 'ఎంటె సిబిల్ స్కోర్',
    },
    'xrrluoqw': {
      'en': 'Loan Amount',
      'te': 'లోన్ మొత్తం',
    },
    'bp8lowxz': {
      'en': 'Ente Loan Amount',
      'te': 'మొత్తం రుణ మొత్తం',
    },
    'nj85kadf': {
      'en': 'Referrer',
      'te': 'లోన్ మొత్తం',
    },
    '1be5cw6g': {
      'en': 'Enter the name of the referrer',
      'te': 'మొత్తం రుణ మొత్తం',
    },
    '5r5qynvp': {
      'en': 'SUBMIT',
      'te': 'సమర్పించు',
    },
    'jaj21ot8': {
      'en': 'Enter Monthly Income is required',
      'te': 'నెలవారీ ఆదాయాన్ని నమోదు చేయడం తప్పనిసరి.',
    },
    'fgv1q3xz': {
      'en': 'Please choose an option from the dropdown',
      'te': 'దయచేసి డ్రాప్‌డౌన్ నుండి ఒక ఎంపికను ఎంచుకోండి.',
    },
    'v80xsy0p': {
      'en': 'Enter Other Loans is required',
      'te': 'ఇతర రుణాలను నమోదు చేయడం అవసరం.',
    },
    'pvlpx8wm': {
      'en': 'Please choose an option from the dropdown',
      'te': 'దయచేసి డ్రాప్‌డౌన్ నుండి ఒక ఎంపికను ఎంచుకోండి.',
    },
    '6wrsuj79': {
      'en': 'Ente CIBIL Score is required',
      'te': 'ఎంటే సిబిల్ స్కోర్ అవసరం',
    },
    '4bnntiv2': {
      'en': 'Please choose an option from the dropdown',
      'te': 'దయచేసి డ్రాప్‌డౌన్ నుండి ఒక ఎంపికను ఎంచుకోండి.',
    },
    'qnkevrg1': {
      'en': 'Ente Loan Amount is required',
      'te': 'పూర్తి రుణ మొత్తం అవసరం',
    },
    '9jb8exso': {
      'en': 'Please choose an option from the dropdown',
      'te': 'దయచేసి డ్రాప్‌డౌన్ నుండి ఒక ఎంపికను ఎంచుకోండి.',
    },
    '3ceuzsuh': {
      'en': 'Contact',
      'te': 'సంప్రదించండి',
    },
    'jrdxkf22': {
      'en': 'Home Loan Request Form',
      'te': 'గృహ రుణ అభ్యర్థన ఫారం',
    },
    '7oro2d3s': {
      'en': 'Home',
      'te': 'హొమ్ పేజ్',
    },
  },
  // EducationLoanForm
  {
    'jy2mxsnx': {
      'en': 'Select Education',
      'te': 'విద్యను ఎంచుకోండి',
    },
    'bct3fd9s': {
      'en': 'Select Education...',
      'te': 'విద్యను ఎంచుకోండి...',
    },
    'u420octm': {
      'en': 'Search...',
      'te': 'వెతకండి...',
    },
    's6pgo3dr': {
      'en': 'UG',
      'te': 'యుజి',
    },
    'p6139emp': {
      'en': 'PG',
      'te': 'పేజీ',
    },
    '8qk122ms': {
      'en': 'Select Loan mode',
      'te': 'లోన్ మోడ్‌ను ఎంచుకోండి',
    },
    'fe4jkwv8': {
      'en': 'Select Loan mode..',
      'te': 'లోన్ మోడ్ ఎంచుకోండి..',
    },
    'qbtt8swx': {
      'en': 'Search...',
      'te': 'వెతకండి...',
    },
    'ffryo2zd': {
      'en': 'Domestic',
      'te': 'దేశీయ',
    },
    '64abwz0j': {
      'en': 'International',
      'te': 'అంతర్జాతీయ',
    },
    'efyq3z7z': {
      'en': 'Select Loan Type',
      'te': 'రుణ రకాన్ని ఎంచుకోండి',
    },
    'ly5cx854': {
      'en': 'Select Loan Type...',
      'te': 'లోన్ రకాన్ని ఎంచుకోండి...',
    },
    'n7phnp9p': {
      'en': 'Search...',
      'te': 'వెతకండి...',
    },
    'op8xjzr7': {
      'en': 'Secured',
      'te': 'సురక్షితం',
    },
    '9237x1pv': {
      'en': 'Unsecured',
      'te': 'భద్రత లేని',
    },
    'k28fynlt': {
      'en': 'Other Loans',
      'te': 'ఇతర రుణాలు',
    },
    'dszl69ax': {
      'en': 'Enter Other Loans',
      'te': 'ఇతర రుణాలను నమోదు చేయండి',
    },
    'h0h1g4nw': {
      'en': 'CIBIL',
      'te': 'సిబిల్',
    },
    'xplu2zok': {
      'en': 'Ente CIBIL Score',
      'te': 'ఎంటె సిబిల్ స్కోర్',
    },
    'aod9vyxb': {
      'en': 'Loan Amount',
      'te': 'లోన్ మొత్తం',
    },
    '5nrm52hi': {
      'en': 'Ente Loan Amount',
      'te': 'మొత్తం రుణ మొత్తం',
    },
    '0mtdc9qe': {
      'en': 'Referrer',
      'te': 'లోన్ మొత్తం',
    },
    'dacxnzmd': {
      'en': '',
      'te': '',
    },
    'axdeic5y': {
      'en': 'Enter the name of the referrer',
      'te': 'మొత్తం రుణ మొత్తం',
    },
    'cvr2rk33': {
      'en': 'SUBMIT',
      'te': 'సమర్పించు',
    },
    'iihagoyv': {
      'en': 'Enter Monthly Income is required',
      'te': 'నెలవారీ ఆదాయాన్ని నమోదు చేయడం తప్పనిసరి.',
    },
    '3kr7jhpu': {
      'en': 'Please choose an option from the dropdown',
      'te': 'దయచేసి డ్రాప్‌డౌన్ నుండి ఒక ఎంపికను ఎంచుకోండి.',
    },
    'xbajs1kk': {
      'en': 'Enter Other Loans is required',
      'te': 'ఇతర రుణాలను నమోదు చేయడం అవసరం.',
    },
    'w2dks747': {
      'en': 'Please choose an option from the dropdown',
      'te': 'దయచేసి డ్రాప్‌డౌన్ నుండి ఒక ఎంపికను ఎంచుకోండి.',
    },
    'kuz3iq8o': {
      'en': 'Ente CIBIL Score is required',
      'te': 'ఎంటే సిబిల్ స్కోర్ అవసరం',
    },
    'ma3ykybh': {
      'en': 'Please choose an option from the dropdown',
      'te': 'దయచేసి డ్రాప్‌డౌన్ నుండి ఒక ఎంపికను ఎంచుకోండి.',
    },
    'neg3qrrl': {
      'en': 'Ente Loan Amount is required',
      'te': 'పూర్తి రుణ మొత్తం అవసరం',
    },
    'q6znjuun': {
      'en': 'Please choose an option from the dropdown',
      'te': 'దయచేసి డ్రాప్‌డౌన్ నుండి ఒక ఎంపికను ఎంచుకోండి.',
    },
    '4foxjia9': {
      'en': 'Ente Loan Amount is required',
      'te': 'పూర్తి రుణ మొత్తం అవసరం',
    },
    'z2yaadox': {
      'en': 'Please choose an option from the dropdown',
      'te': 'దయచేసి డ్రాప్‌డౌన్ నుండి ఒక ఎంపికను ఎంచుకోండి.',
    },
    'qirj1kye': {
      'en': 'Contact',
      'te': 'సంప్రదించండి',
    },
    '0vm5huqo': {
      'en': 'Education Loan Request Form',
      'te': 'విద్యా రుణ అభ్యర్థన ఫారం',
    },
    'y8qvn38y': {
      'en': 'Home',
      'te': 'హొమ్ పేజ్',
    },
  },
  // BussinesLoanForm
  {
    'pz05qi3q': {
      'en': 'Select Loan mode',
      'te': 'లోన్ మోడ్‌ను ఎంచుకోండి',
    },
    't28ey67i': {
      'en': 'Select Loan mode..',
      'te': 'లోన్ మోడ్ ఎంచుకోండి..',
    },
    '80727oss': {
      'en': 'Search...',
      'te': 'వెతకండి...',
    },
    'qf92fih5': {
      'en': 'Secured',
      'te': 'సురక్షితం',
    },
    '2h14texr': {
      'en': 'UnSecured',
      'te': 'భద్రత లేనిది',
    },
    'ejsh476n': {
      'en': 'Select Loan Type',
      'te': 'రుణ రకాన్ని ఎంచుకోండి',
    },
    'dgez36kp': {
      'en': 'Select Loan Type...',
      'te': 'లోన్ రకాన్ని ఎంచుకోండి...',
    },
    'p5j7mnm2': {
      'en': 'Search...',
      'te': 'వెతకండి...',
    },
    'o4n0zdfi': {
      'en': 'Ferm',
      'te': 'ఫెర్మ్',
    },
    'ie41ngfl': {
      'en': 'OD',
      'te': 'ఓడి',
    },
    'qakilf49': {
      'en': 'CC',
      'te': 'సిసి',
    },
    'gs9koxbv': {
      'en': 'Bussines Type',
      'te': 'వ్యాపార రకం',
    },
    'aa3kl731': {
      'en': 'Enter Bussines Type',
      'te': 'వ్యాపార రకాన్ని నమోదు చేయండి',
    },
    '7uce3svp': {
      'en': 'Required Loan',
      'te': 'అవసరమైన రుణం',
    },
    '2xlxzxnp': {
      'en': ' Required Loan...',
      'te': 'అవసరమైన రుణం...',
    },
    'wrutqkhw': {
      'en': 'Search...',
      'te': 'వెతకండి...',
    },
    'cacwy1s0': {
      'en': 'For Current Bussiness',
      'te': 'ప్రస్తుత వ్యాపారం కోసం',
    },
    'hi38bkf5': {
      'en': 'For New Bussiness',
      'te': 'కొత్త వ్యాపారం కోసం',
    },
    'k201qey8': {
      'en': 'Other Loans',
      'te': 'ఇతర రుణాలు',
    },
    '0uhml5am': {
      'en': 'Enter Other Loans',
      'te': 'ఇతర రుణాలను నమోదు చేయండి',
    },
    'om6vbq2f': {
      'en': 'CIBIL',
      'te': 'సిబిల్',
    },
    'armrjwa0': {
      'en': 'Ente CIBIL Score',
      'te': 'ఎంటె సిబిల్ స్కోర్',
    },
    '4kvnjxep': {
      'en': 'Loan Amount',
      'te': 'లోన్ మొత్తం',
    },
    'lekhsyle': {
      'en': 'Ente Loan Amount',
      'te': 'మొత్తం రుణ మొత్తం',
    },
    'nppjox27': {
      'en': 'Referrer',
      'te': 'రిఫరర్',
    },
    'a5bqvfab': {
      'en': 'Enter the name of the referrer',
      'te': 'మొత్తం రుణ మొత్తం',
    },
    '3q08df96': {
      'en': 'SUBMIT',
      'te': 'సమర్పించు',
    },
    'd3vwmyfn': {
      'en': 'Enter Monthly Income is required',
      'te': 'నెలవారీ ఆదాయాన్ని నమోదు చేయడం తప్పనిసరి.',
    },
    'qik68s53': {
      'en': 'Please choose an option from the dropdown',
      'te': 'దయచేసి డ్రాప్‌డౌన్ నుండి ఒక ఎంపికను ఎంచుకోండి.',
    },
    'cp83680k': {
      'en': 'Enter Other Loans is required',
      'te': 'ఇతర రుణాలను నమోదు చేయడం అవసరం.',
    },
    '35m5c2qd': {
      'en': 'Please choose an option from the dropdown',
      'te': 'దయచేసి డ్రాప్‌డౌన్ నుండి ఒక ఎంపికను ఎంచుకోండి.',
    },
    'uypjbj1k': {
      'en': 'Ente CIBIL Score is required',
      'te': 'ఎంటే సిబిల్ స్కోర్ అవసరం',
    },
    'drehd6mh': {
      'en': 'Please choose an option from the dropdown',
      'te': 'దయచేసి డ్రాప్‌డౌన్ నుండి ఒక ఎంపికను ఎంచుకోండి.',
    },
    'zxr41e98': {
      'en': 'Ente Loan Amount is required',
      'te': 'పూర్తి రుణ మొత్తం అవసరం',
    },
    'mn3jzsah': {
      'en': 'Please choose an option from the dropdown',
      'te': 'దయచేసి డ్రాప్‌డౌన్ నుండి ఒక ఎంపికను ఎంచుకోండి.',
    },
    'd5fry0m8': {
      'en': 'Ente Loan Amount is required',
      'te': 'పూర్తి రుణ మొత్తం అవసరం',
    },
    'gzcc6amq': {
      'en': 'Please choose an option from the dropdown',
      'te': 'దయచేసి డ్రాప్‌డౌన్ నుండి ఒక ఎంపికను ఎంచుకోండి.',
    },
    'f6n9z9ue': {
      'en': 'Contact',
      'te': 'సంప్రదించండి',
    },
    'nhiumn2k': {
      'en': 'Bussines Loan Request Form',
      'te': 'వ్యాపార రుణ అభ్యర్థన ఫారం',
    },
    'abi6tsme': {
      'en': 'Home',
      'te': 'హొమ్ పేజ్',
    },
  },
  // Realestate
  {
    '77hiiwhl': {
      'en': 'Select Offer Type',
      'te': 'ఆఫర్ రకాన్ని ఎంచుకోండి',
    },
    'lztgk0mt': {
      'en': 'Select offer type..',
      'te': 'ఆఫర్ రకాన్ని ఎంచుకోండి..',
    },
    'he6axkue': {
      'en': 'Search...',
      'te': 'వెతకండి...',
    },
    'g4e53sbx': {
      'en': 'BUY',
      'te': 'కొనుగోలు',
    },
    'mnx7r9rb': {
      'en': 'SELL',
      'te': 'అమ్మండి',
    },
    'oe8uryfb': {
      'en': 'Select Property Type',
      'te': 'ఆస్తి రకాన్ని ఎంచుకోండి',
    },
    'kiuhvgec': {
      'en': 'Select Loan Type...',
      'te': 'లోన్ రకాన్ని ఎంచుకోండి...',
    },
    'ur5q2ax2': {
      'en': 'Search...',
      'te': 'వెతకండి...',
    },
    '6li9h1ye': {
      'en': 'Residential',
      'te': 'నివాస',
    },
    'c561g2vy': {
      'en': 'Commercial',
      'te': 'వాణిజ్య',
    },
    '5mkh7i6p': {
      'en': 'Land',
      'te': 'దేశం',
    },
    'un89i1on': {
      'en': 'PropertyDetails',
      'te': 'ఆస్తి వివరాలు',
    },
    'urp00fi1': {
      'en': 'Enter property details',
      'te': 'ఆస్తి వివరాలను నమోదు చేయండి',
    },
    'itp8yj7b': {
      'en': 'PropertyAddress',
      'te': 'ఆస్తి చిరునామా',
    },
    '95po2xsy': {
      'en': 'Ente property address',
      'te': 'ఇంటి ఆస్తి చిరునామా',
    },
    'l8xq1qpv': {
      'en': 'Referrer',
      'te': 'ఆస్తి చిరునామా',
    },
    'e4s254kd': {
      'en': 'Enter the name of the referrer',
      'te': 'ఇంటి ఆస్తి చిరునామా',
    },
    'lfwx9wyn': {
      'en': 'SUBMIT',
      'te': 'సమర్పించు',
    },
    'a2b415cv': {
      'en': 'Ente CIBIL Score is required',
      'te': 'ఎంటే సిబిల్ స్కోర్ అవసరం',
    },
    'p2tds4qn': {
      'en': 'Please choose an option from the dropdown',
      'te': 'దయచేసి డ్రాప్‌డౌన్ నుండి ఒక ఎంపికను ఎంచుకోండి.',
    },
    'td2k5bd3': {
      'en': 'Ente Loan Amount is required',
      'te': 'పూర్తి రుణ మొత్తం అవసరం',
    },
    'ig6k7tja': {
      'en': 'Please choose an option from the dropdown',
      'te': 'దయచేసి డ్రాప్‌డౌన్ నుండి ఒక ఎంపికను ఎంచుకోండి.',
    },
    'h7yfnxpo': {
      'en': 'Contact',
      'te': 'సంప్రదించండి',
    },
    'r9zp4qqw': {
      'en': 'Realestate Form',
      'te': 'రియల్ ఎస్టేట్ ఫారం',
    },
    '25rk6e60': {
      'en': 'Home',
      'te': 'హొమ్ పేజ్',
    },
  },
  // Requests
  {
    '0ofjgrtu': {
      'en': 'check.io',
      'te': 'చెక్.ఐఓ',
    },
    '5ugouk5u': {
      'en': 'Platform Navigation',
      'te': 'ప్లాట్‌ఫామ్ నావిగేషన్',
    },
    'ba0l1hrs': {
      'en': 'Dashboard',
      'te': 'డాష్‌బోర్డ్',
    },
    'm1ex7f6f': {
      'en': 'Chats',
      'te': 'చాట్‌లు',
    },
    'it0ypcr3': {
      'en': 'Projects',
      'te': 'ప్రాజెక్టులు',
    },
    'yvzyv4o8': {
      'en': 'Settings',
      'te': 'సెట్టింగులు',
    },
    'arx38tq2': {
      'en': 'Notifications',
      'te': 'నోటిఫికేషన్‌లు',
    },
    'xkdka98v': {
      'en': '12',
      'te': '12',
    },
    'x2upryuz': {
      'en': 'Billing',
      'te': 'బిల్లింగ్',
    },
    'vcijvyb2': {
      'en': 'Explore',
      'te': 'అన్వేషించండి',
    },
    'arahgbrv': {
      'en': 'Light Mode',
      'te': 'లైట్ మోడ్',
    },
    'n5j490vp': {
      'en': 'Dark Mode',
      'te': 'డార్క్ మోడ్',
    },
    'rfdofecj': {
      'en': 'Andrew D.',
      'te': 'ఆండ్రూ డి.',
    },
    '8s74htw4': {
      'en': 'admin@gmail.com',
      'te': 'అడ్మిన్@gmail.com',
    },
    '264bw67k': {
      'en': '',
      'te': '',
    },
    '9uaqbyfl': {
      'en': 'Requests',
      'te': 'అభ్యర్థనలు',
    },
    '2uim0ghj': {
      'en': 'Below are a list of requests raised by you.',
      'te': 'మీరు లేవనెత్తిన అభ్యర్థనల జాబితా క్రింద ఉంది.',
    },
    'v3jpegtj': {
      'en': 'BUSSINESS LOAN',
      'te': 'వ్యాపార రుణం',
    },
    '8i4xvl36': {
      'en': 'EDUCATION LOAN',
      'te': 'విద్యా రుణం',
    },
    'i2tegzz0': {
      'en': 'REALESTATE',
      'te': 'రియల్ ఎస్టేట్',
    },
    '0059s958': {
      'en': 'HOUSE LOAN',
      'te': 'గృహ రుణం',
    },
    'jcrrmq8m': {
      'en': 'BUSSINESS LOAN',
      'te': '',
    },
    'zt534xfw': {
      'en': 'BUSSINESS LOAN',
      'te': '',
    },
    '81pf6pu1': {
      'en': 'Home',
      'te': 'గృహ రుణం',
    },
  },
  // AdminRequests
  {
    'rida3q6i': {
      'en': 'Id',
      'te': '',
    },
    '1fca55wa': {
      'en': 'Request_Id',
      'te': '',
    },
    'e4xioeb2': {
      'en': 'User_id',
      'te': '',
    },
    '8byrqukz': {
      'en': 'Loan Type',
      'te': '',
    },
    'nb65e6mt': {
      'en': 'Status',
      'te': '',
    },
    '7l28m4q4': {
      'en': 'Home',
      'te': 'గృహ రుణం',
    },
  },
  // OTP_Component
  {
    'ehs1qg6m': {
      'en': 'OTP',
      'te': 'ఓటీపీ',
    },
  },
  // Invalid_otp
  {
    'stajj4in': {
      'en': 'Invalid Otp',
      'te': 'చెల్లని Otp',
    },
    'hmlrc1kc': {
      'en': 'Ok',
      'te': 'సరే',
    },
  },
  // RequestCards
  {
    'qwydjujr': {
      'en': 'Requested',
      'te': 'అభ్యర్థించబడింది',
    },
    'oq5r6go5': {
      'en': '1',
      'te': '1. 1.',
    },
  },
  // RequestStatusUpdate
  {
    'nx3xzdk0': {
      'en': 'Update Request Status',
      'te': '',
    },
    'm9kcla2b': {
      'en': 'Update Status...',
      'te': '',
    },
    'uprd5aei': {
      'en': 'Search...',
      'te': '',
    },
    'hydecrqo': {
      'en': 'Submitted',
      'te': '',
    },
    'rkmdien1': {
      'en': 'Processing',
      'te': '',
    },
    'j6ohmutc': {
      'en': 'Completed',
      'te': '',
    },
    '1oqi0qp9': {
      'en': 'Update',
      'te': '',
    },
  },
  // Miscellaneous
  {
    '4g6z71u4': {
      'en': '',
      'te': '',
    },
    'dgvnrrz7': {
      'en': '',
      'te': '',
    },
    'vbbw1qxc': {
      'en': '',
      'te': '',
    },
    'mo72pxo5': {
      'en': '',
      'te': '',
    },
    '8s69awsa': {
      'en': '',
      'te': '',
    },
    'dkpivc4i': {
      'en': '',
      'te': '',
    },
    'swze0ihi': {
      'en': '',
      'te': '',
    },
    '8vz0fhnx': {
      'en': '',
      'te': '',
    },
    '0ehq5kpr': {
      'en': '',
      'te': '',
    },
    'bizni3l2': {
      'en': '',
      'te': '',
    },
    'rlascm1b': {
      'en': '',
      'te': '',
    },
    'l5cajd0i': {
      'en': '',
      'te': '',
    },
    'pa8uk1i3': {
      'en': '',
      'te': '',
    },
    '9atop8sw': {
      'en': '',
      'te': '',
    },
    '2ficoji9': {
      'en': '',
      'te': '',
    },
    'z4atpe4j': {
      'en': '',
      'te': '',
    },
    '04bihj9d': {
      'en': '',
      'te': '',
    },
    'aha9quwh': {
      'en': '',
      'te': '',
    },
    '27sw7asv': {
      'en': '',
      'te': '',
    },
    '7z87u7so': {
      'en': '',
      'te': '',
    },
    'n9585igv': {
      'en': '',
      'te': '',
    },
    '0ppziuwe': {
      'en': '',
      'te': '',
    },
    'bb4338r3': {
      'en': '',
      'te': '',
    },
    'k9ta68px': {
      'en': '',
      'te': '',
    },
    'r08bdg3u': {
      'en': '',
      'te': '',
    },
  },
].reduce((a, b) => a..addAll(b));
