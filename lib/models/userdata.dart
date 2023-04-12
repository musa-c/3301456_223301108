const String _alihanUsername = "alisafi";
const String _musaUsername = "musac.dev";
const String _emreUsername = "_emre_";
const String _selcukUsername = "sekcuk_0";
const String _hasanUsername = "hasanaslan";

class UserData {
  final Map<String, List<String>> _userText = {
    _alihanUsername: [
      "Defetiscor, sedo. Aer noster pulchritudinis fines. Mitis diutius arma perlustro eadem macer didtum narro clamo. Infinitio egeo universum. Surrexi his.",
    ],
    _musaUsername: [
      "Quero nitesco solvo moti super. Liber occasio pudeo gesto satio ea tumulus excito. Contabesco pressi huic. Summa, ullus. Do archa.",
      "Egnum vetus militaris rego textus narro comprehendo labor procinctu. Quodnam memor quod. Prope intercepi pulex conspicio reddo ferre per volup spargo. Quisnam mei simul mos funis oportunitas labor emo spiculum."
    ],
    _emreUsername: [
      "Egnum vetus militaris rego textus narro comprehendo labor procinctu. Quodnam memor quod. Prope intercepi pulex conspicio reddo ferre per volup spargo. Quisnam mei simul mos funis oportunitas labor emo spiculum.",
    ],
    _selcukUsername: [
      "Illorum loci fidens lento. Mellis timor letum, infantia amor lepos quam vivo dimidium priscus. Identidem punio. Explevi elemosina.",
    ],
    _hasanUsername: [
      "Diluculo natio illi ex. Fortis, perculsus lens his labor fundo ita audio. Fundo bonus sanus abscido peritus, certe texo reddere quos muto. Ita consummo rei. Decumbo tergum. Vovi ius peremptum."
    ]
  };

  final Map<String, String> _userName = {
    _alihanUsername: "Alihan Sönal",
    _musaUsername: "Musa Civelek",
    _emreUsername: "Emre Çapar",
    _selcukUsername: "Selçuk Yaman",
    _hasanUsername: "Hasan Aslan"
  };

  final Map<String, String> _userAvatar = {
    _alihanUsername: "https://picsum.photos/id/20/200/300",
    _musaUsername: "https://picsum.photos/id/27/200/300",
    _emreUsername: "https://picsum.photos/id/22/200/300",
    _selcukUsername: "https://picsum.photos/id/23/200/300",
    _hasanUsername: "https://picsum.photos/id/24/200/300"
  };

  final Map<String, int> _userCommentCount = {
    _alihanUsername: 10,
    _musaUsername: 2,
    _emreUsername: 5,
    _selcukUsername: 2,
    _hasanUsername: 8
  };

  final Map<String, int> _userUpCount = {
    _alihanUsername: 1,
    _musaUsername: 0,
    _emreUsername: 10,
    _selcukUsername: 3,
    _hasanUsername: 4
  };

  final Map<String, int> _userDownCount = {
    _alihanUsername: 2,
    _musaUsername: 48,
    _emreUsername: 3,
    _selcukUsername: 7,
    _hasanUsername: 1
  };

  final Map<String, String> _userTimeStamp = {
    _alihanUsername: "02:32",
    _musaUsername: "23:10",
    _emreUsername: "05:21",
    _selcukUsername: "12:28",
    _hasanUsername: "18:42"
  };

  final Map<String, int> _userBookmarkerCount = {
    _alihanUsername: 3,
    _musaUsername: 0,
    _emreUsername: 9,
    _selcukUsername: 20,
    _hasanUsername: 12
  };

  String? getUserName(String key) => _userName[key];
  String? getAvatar(String key) => _userAvatar[key];
  List<String>? getUserText(String key) => _userText[key];
  String? getUserTimeStamp(String key) => _userTimeStamp[key];
  int? getUserCommentCount(String key) => _userCommentCount[key];
  int? getUserUpCount(String key) => _userUpCount[key];
  int? getUserDowCount(String key) => _userDownCount[key];
  int? getUserBookmarkerCount(String key) => _userBookmarkerCount[key];

  void addUserText(String key, String text) {
    _userText[key]!.add(text);
  }
}
