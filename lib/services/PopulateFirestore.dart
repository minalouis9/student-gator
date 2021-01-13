import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_gator/models/Articles.dart';
import 'package:student_gator/models/Cities.dart';
import 'package:student_gator/models/Levels.dart';
import 'package:student_gator/models/Programs.dart';
import 'package:student_gator/models/Schools.dart';
import 'package:student_gator/models/Task.dart';
import 'package:student_gator/models/TaskLink.dart';
import 'package:student_gator/models/Types.dart';
import 'package:student_gator/models/User.dart';
import 'package:student_gator/models/UsersChat.dart';

class PopulateFirestoreService {
  static final PopulateFirestoreService _instance =
      PopulateFirestoreService._getInstance();

  factory PopulateFirestoreService() {
    return _instance;
  }

  PopulateFirestoreService._getInstance();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference articles =
      FirebaseFirestore.instance.collection('articles');
  CollectionReference cities = FirebaseFirestore.instance.collection('cities');
  CollectionReference schools =
      FirebaseFirestore.instance.collection('schools');
  CollectionReference task = FirebaseFirestore.instance.collection('task');
  CollectionReference taskLink =
      FirebaseFirestore.instance.collection('taskLink');
  CollectionReference types = FirebaseFirestore.instance.collection('types');
  CollectionReference usersChat =
      FirebaseFirestore.instance.collection('usersChat');
  CollectionReference programs = FirebaseFirestore.instance.collection('programs');
  CollectionReference levels = FirebaseFirestore.instance.collection('levels');


  Future<void> populateUsers() async {
    try {
      List<Map<String, dynamic>> usersList = [
        {
          "Name": "Mohamed Aly",
          "bio": "WQWEQ",
          "username": "A1234",
          "password": "12345",
          "email": "mohamed.osama.salah@outlook.com",
          "nationality": "France",
          "langtest": "ielts",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "ahmed gamal",
          "bio": "None",
          "username": "agamal",
          "password": "fddb9201a0984824fd74c1123b0af7fc2dbd8d30",
          "email": "ahmedgamal47@yahoo.com",
          "nationality": "Egypt",
          "langtest": "",
          "countrywanted": "any",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "Sos",
          "bio": "from Palestine",
          "username": "aldeek",
          "password": "01c38851484d15b5b3f772dd46b51f1dd424fd3e",
          "email": "suhaibaldeek1712",
          "nationality": "Jordan",
          "langtest": "ielts",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "sos",
          "bio": "Palestine ",
          "username": "Aldeeksos",
          "password": "01c38851484d15b5b3f772dd46b51f1dd424fd3e",
          "email": "suhaibaldeek1712@gmail.com",
          "nationality": "Jordan",
          "langtest": "",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "ali",
          "bio": "jj",
          "username": "alo12122",
          "password": "7d4eebab7ce33f2c5d6d8c6240cc8fe65ea14cd7",
          "email": "ali1215@gmail.com",
          "nationality": "Egypt",
          "langtest": "",
          "countrywanted": "",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "Mohamed Aly",
          "bio": "dsadsa",
          "username": "AQWERTY",
          "password": "AQWERTY",
          "email": "mohamed.osama.salah@outlook.com",
          "nationality": "France",
          "langtest": "ielts",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "Mohamed Aly",
          "bio": "dfas",
          "username": "asdfk",
          "password": "asdfk",
          "email": "mohamed.osama.salah@outlook.com",
          "nationality": "France",
          "langtest": "ielts",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "kiss my ass",
          "bio": "kiss my ass",
          "username": "ass",
          "password": "2f61cb7837b83df50a7fffb58e802b87679cdaff",
          "email": "a@ass.com",
          "nationality": "",
          "langtest": "",
          "countrywanted": "",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "dsad",
          "bio": "",
          "username": "cc",
          "password": "cc",
          "email": "da",
          "nationality": "Azerbaijan",
          "langtest": "toefl",
          "countrywanted": "France",
          "profile_picture_url": "",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "Mohamed Aly",
          "bio": "sdasda",
          "username": "dasdadadd",
          "password": "dada",
          "email": "mohamed.osama.salah@outlook.com",
          "nationality": "France",
          "langtest": "ielts",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "Mohamed Aly",
          "bio": "dasdas",
          "username": "dasdas",
          "password": "dasddasd",
          "email": "mohamed.osama.salah@outlook.com",
          "nationality": "France",
          "langtest": "ielts",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "Mohamed Hassanien",
          "bio": "dasdasd",
          "username": "dasfdasfagf",
          "password": "fasfa",
          "email": "momo_osamasalah@hotmail.com",
          "nationality": "France",
          "langtest": "toiec",
          "countrywanted": "UK",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "Dorian Roux",
          "bio": "I Love football and food",
          "username": "dorian123",
          "password": "12345",
          "email": "sdadas",
          "nationality": "Christmas Island",
          "langtest": "ielts",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/dorian123.jpg",
          "subagent": "mario",
          "type": 0
        },
        {
          "Name": "Elie Brosset",
          "bio": "I love new technologies, high-tech and sports. Data Science is my favourite field. ",
          "username": "eliebrosset",
          "password": "salut123",
          "email": "eliebrosset@gmail.com",
          "nationality": "France",
          "langtest": "toiec",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/eliebrosset.jpg",
          "subagent": null,
          "type": 2
        },
        {
          "Name": "Mohamed Hassanien",
          "bio": "fasf",
          "username": "fasda",
          "password": "fasfaf",
          "email": "momo_osamasalah@hotmail.com",
          "nationality": "France",
          "langtest": "ielts",
          "countrywanted": "UK",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "Mohamed Aly",
          "bio": "DWADASD",
          "username": "FASDAFA",
          "password": "DASFSAD",
          "email": "mohamed.osama.salah@outlook.com",
          "nationality": "France",
          "langtest": "ielts",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "Fatima ezzahra Ibrahimi",
          "bio": "I'm 21 years old. ",
          "username": "fatibrahimi11",
          "password": "9f15090b3f935272cb476a2483d7256de819c8d7",
          "email": "ibrahimi.fatima111@gmail.com",
          "nationality": "Morocco",
          "langtest": "toiec",
          "countrywanted": "UK",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "Julien Assuied",
          "bio": "I love Constanza roja",
          "username": "JA123",
          "password": "A12345",
          "email": "jojomojo@gmail.com",
          "nationality": "Austria",
          "langtest": "toiec",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/JA123.jpg",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "Mohamed Aly ",
          "bio": "fADSF",
          "username": "JAA1234",
          "password": "16f1816066f231bbe39be9495ece0b3719e166d6",
          "email": "mohamed.osama.salah@outlook.com",
          "nationality": "France",
          "langtest": "toiec",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "lila bidouch",
          "bio": "hello",
          "username": "lilabidouch",
          "password": "f8289666d376cd26b3f593f2ef72a172b019fb02",
          "email": "contact.premium.immo@gmail.com",
          "nationality": "Morocco",
          "langtest": "",
          "countrywanted": "any",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "ceda",
          "bio": "dazdazdaz",
          "username": "mario",
          "password": "123456",
          "email": "faefa@elie.fr",
          "nationality": "American Samoa",
          "langtest": "ielts",
          "countrywanted": "UK",
          "profile_picture_url": "images\/user\/mario.JPG",
          "subagent": null,
          "type": 1
        },
        {
          "Name": "Marwa Ben Salah",
          "bio": "Business Stuudent",
          "username": "marwa.bensalah",
          "password": "c65f13e301ca5b92b6afb4b921a676accaaa3cbc",
          "email": "marwa.bensalah@msb.tn",
          "nationality": "Tunisia",
          "langtest": "",
          "countrywanted": "any",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "FELIX MENSAH",
          "bio":
              "A young man from Ghana, Africa, 29 years of age and seeking to study in France.",
          "username": "mensfel",
          "password": "b7584c83b0eb608dad3efc32e053069603b7327a",
          "email": "mensfel20@gmail.com",
          "nationality": "Ghana",
          "langtest": "",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "FELIX MENSAH",
          "bio":
              "A young man from Ghana, Africa, 29 years of age and seeking to study in France.",
          "username": "mensfel01",
          "password": "b7584c83b0eb608dad3efc32e053069603b7327a",
          "email": "mensfel20@gmail.com",
          "nationality": "Ghana",
          "langtest": "",
          "countrywanted": "any",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "Mohamed Hassanien",
          "bio": "",
          "username": "mhassanien",
          "password": "1234",
          "email": "alymohamed@eisti.eu",
          "nationality": "Bahamas",
          "langtest": "ielts",
          "countrywanted": "France",
          "profile_picture_url": "",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "BRETON Nicolas",
          "bio": "Founder",
          "username": "Nicormar",
          "password": "ea6e9bcfadb564c64c3da8a77f87c30789fa29a4",
          "email": "nico.breton14@hotmail.fr",
          "nationality": "France",
          "langtest": "ielts",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "O61QH487KMIALNJD6W1AE5QT http:\/\/mail.com\/003",
          "bio": "waggamantitus18157413@gmail.com",
          "username": "O61QH487KMIALNJD6W1AE5QT http:\/\/mail.com\/003",
          "password": "9e5d81d3d21fe52036a56f08fe719b9ce39f2ba7",
          "email": "waggamantitus18157413@gmail.com",
          "nationality": "Trinidad & Tobago",
          "langtest": "toefl",
          "countrywanted": "UK",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "Mohamed Aly",
          "bio": "dafdada",
          "username": "o;snfkald",
          "password": "9c5e20109161ae0c83efe324e7957de7ed0b3880",
          "email": "mohamed.osama.salah@outlook.com",
          "nationality": "France",
          "langtest": "ielts",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "Kiko",
          "bio": "I love girls",
          "username": "qwe",
          "password": "12345",
          "email": "sda",
          "nationality": "Austria",
          "langtest": "toiec",
          "countrywanted": "France",
          "profile_picture_url": "",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "Mohamed Aly",
          "bio": "asas",
          "username": "QWERTYU",
          "password": "QWERTYU",
          "email": "mohamed.osama.salah@outlook.com",
          "nationality": "France",
          "langtest": "ielts",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "Mohamed",
          "bio": "dasdsa",
          "username": "qwertyuio",
          "password": "qwertyui",
          "email": "momo_osamasalah@hotmail.com",
          "nationality": "France",
          "langtest": "toiec",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "Rayan El chamaa",
          "bio":
              "I am a civil engineer aiming for a master program in management",
          "username": "Rayan",
          "password": "377546ef3d11d8c28e5a2540dd87eb4e888544da",
          "email": "rayanelchamaa@gmail.com",
          "nationality": "Lebanon",
          "langtest": "",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "souhila arib",
          "bio": "hello la team",
          "username": "souhila",
          "password": "saluti",
          "email": "souhila@elie.fr",
          "nationality": "Austria",
          "langtest": "ielts",
          "countrywanted": "any",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": "mario",
          "type": 0
        },
        {
          "Name": "Omar Hammad",
          "bio": "I love naos marketing",
          "username": "S_Admin",
          "password": "admin",
          "email": "saasdd",
          "nationality": "Austria",
          "langtest": "toiec",
          "countrywanted": "France",
          "profile_picture_url": "",
          "subagent": null,
          "type": 2
        },
        {
          "Name": "Boussami  Takwa ",
          "bio":
              "Takwa je suis tudiante en premire anne faculte en franais ",
          "username": "Takwa ",
          "password": "1b2fdb5232c8b8f9ddb9a8c52f7c61d269f8ad6c",
          "email": "takwaboussami104@gmai.com",
          "nationality": "Tunisia",
          "langtest": "",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "Therese Kayrouz",
          "bio": "Associate at Smarkk",
          "username": "theresekeyrouz",
          "password": "1759105084e518592636af5d389aa63fbfc118f7",
          "email": "theresekeyrouz@hotmail.com",
          "nationality": "Lebanon",
          "langtest": "",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": null,
          "type": 0
        },
        {
          "Name": "tim burton",
          "bio": "i love sports",
          "username": "timburton",
          "password": "123456",
          "email": "dzqdz@oui.fr",
          "nationality": "Algeria",
          "langtest": "toiec",
          "countrywanted": "France",
          "profile_picture_url": "images\/user\/default.png",
          "subagent": "eliebrosset",
          "type": 0
        }
      ];

      usersList.forEach((element) {
        users
            .add(Users.fromJson(element).toMap())
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      });
    } catch (e) {
      print(e.toString());
      return 0.toString();
    }
  }

  Future<void> populateArticles() async {
    try {
      List<Map<String, dynamic>> articlesList = [
        {
          "id": "1",
          "title": "kutykt",
          "content": "kutyk",
          "date": "2020-07-23 11:13:15",
          "author": "eliebrosset"
        }
      ];

      articlesList.forEach((element) {
        articles
            .add(Article.fromJson(element).toMap())
            .then((value) => print("Article Added"))
            .catchError((error) => print("Failed to add article: $error"));
      });
    } catch (e) {
      print(e.toString());
      return 0.toString();
    }
  }

  Future<void> populateCities() async {
    try {
      List<Map<String, dynamic>> citiesList = [
        {
          "Name": "Nancy",
          "Aclow": "300",
          "Achigh": "600",
          "glow": "20",
          "ghigh": "30",
          "grolow": "150",
          "grohigh": "250",
          "outlow": "70",
          "outhigh": "130",
          "trans": "21.5",
          "parag": "Nancy is a medium-sized city (106,000 inhabitants), located in an urban area of nearly 450,000 inhabitants. Located in the department of Meurthe-et-Moselle of the former Lorraine region - now the Grand-Est region - and close to the Luxembourg, Belgian and German borders, Nancy has nearly 46,000 students in many fields of study in various faculties and schools.Linked to a rich cultural heritage inherited, among others, from the time of King Stanislas, who had the famous \"Place Stanislas\" built, or the artistic movement of the Ecole de Nancy, the city is positioned as a historical and dynamic cultural city.Thanks to its plural cultural establishments, diverse cultural events and community life, Nancy's cultural agenda is often full!"
        },
        {
          "Name": "Berlin",
          "Aclow": "420",
          "Achigh": "700",
          "glow": "25",
          "ghigh": "30",
          "grolow": "200",
          "grohigh": "250",
          "outlow": "100",
          "outhigh": "150",
          "trans": "80",
          "parag": "Berlin, Germany's cosmopolitan capital, is a city of great cultural diversity. The city abounds in small art galleries, culinary innovations and owes its international reputation to its cultural institutions such as its famous National Opera House.Berlin, a trendy destination for international students. In recent years, the city has built up a solid reputation among young people from all over the world, not least because of the local lifestyle, the low cost of education, the variety of academic courses on offer and the quality of the training.It welcomes more young people than ever before. Of the more than 180,000 students enrolled in the German capital in 2017, an average of 16% are foreigners. Many of them come from other European countries and participate in the Erasmus+ exchange programme. The main countries of origin are China, Russia and Austria."
        },
        {
          "Name": "Nuremberg",
          "Aclow": "250",
          "Achigh": "600",
          "glow": "25",
          "ghigh": "30",
          "grolow": "150",
          "grohigh": "200",
          "outlow": "80",
          "outhigh": "120",
          "trans": "",
          "parag": "A bustling and lively nightlife, excellent career prospects, unbeatable quality of life, Nuremberg has the best provisions for a successful expatriation project.If your decision is to study and work in Nuremberg, you will also find a city with a fascinating beauty and unique history, notably its famous Christmas market and opera programme.The colourful architecture of Nuremberg in Bavaria is a feast for the eyes. The Old Town quarter still has a medieval atmosphere with half-timbered houses built in the shadow of churches and castles."
        },
        {
          "Name": "Troyes",
          "Aclow": "300",
          "Achigh": "500",
          "glow": "20",
          "ghigh": "30",
          "grolow": "150",
          "grohigh": "200",
          "outlow": "90",
          "outhigh": "130",
          "trans": "50",
          "parag": "A short distance from Paris and Reims, Troyes is the historic capital of Champagne. A 16th century town, it is known for its many churches, colourful half-timbered houses, narrow streets and Champagne fairs, which bring the former capital of the Counts of Champagne to life at the end of spring. Rich in history and heritage, this medieval town with its Gothic and Renaissance accents is an important symbol of French history. Attracting more and more students every year, it seems to be the ideal place for enriching higher education studies."
        },
        {
          "Name": "Nice",
          "Aclow": "500",
          "Achigh": "800",
          "glow": "25",
          "ghigh": "40",
          "grolow": "200",
          "grohigh": "250",
          "outlow": "120",
          "outhigh": "200",
          "trans": "25",
          "parag": "In the heart of the French Riviera, Nice brilliantly combines the marriage of sea and mountains. As a seaside resort, the city has this long beach that runs along the immense Baie des Anges where the waters always remain calm. Its assets are not limited to its sunny coastline. Its profusion of museums dedicated to art bears witness to the passage of the greatest painters of yesteryear. These parks bathed in an exceptional microclimate reveal a Mediterranean flora largely mixed with exoticism.The fifth largest city in France, Nice has a large number of inhabitants, including more than 40,000 students. Every year, this city attracts many international students, interested in the various study and employment opportunities the city offers."
        },
        {
          "Name": "Rennes",
          "Aclow": "200",
          "Achigh": "450",
          "glow": "20",
          "ghigh": "30",
          "grolow": "170",
          "grohigh": "280",
          "outlow": "90",
          "outhigh": "150",
          "trans": "30",
          "parag": "With 67,000 students, spread over three campuses and some fifty higher education schools, Rennes is definitely a student metropolis. The capital of Brittany is ranked as the 10th best city in France to study in the 2020 Student Magazine's 'l'Etudiant'. Attractiveness, quality of training, quality of life, professional opportunities... all the ingredients are there to spend beautiful years studying and celebrating in Rennes.The cultural, festive and sporting life is intense! Everything smiles to the students, everything is done to brighten up their leisure time. Rennes' cultural facilities are a reference: Champs Libres, Diapason... For sport, the Interuniversity Physical and Sports Activities Service (SUIAPS) makes it easy to practice, especially now that Rennes is one of the rare cities in France to have a covered athletics stadium, the Stade Robert Poirier in Villejean."
        },
        {
          "Name": "Montpellier",
          "Aclow": "400",
          "Achigh": "600",
          "glow": "20",
          "ghigh": "30",
          "grolow": "190",
          "grohigh": "300",
          "outlow": "90",
          "outhigh": "150",
          "trans": "36",
          "parag": "Montpellier is ranked as France's 3rd largest student city and 1st student metropolis where approximately one out of every five inhabitants is a student. With its universities and \"grandes \u00e9coles\", Montpellier welcomes young people from all over the world and its university tradition has made it a privileged European place of study since the Middle Ages, with some 71,000 students today.The City of Montpellier, through L'Espace Montpellier Jeunesse, offers all young people in Montpellier, and therefore its students, a free, open and friendly place where they can be welcomed, informed and orientated according to their needs.Every year (during the summer and autumn), it organizes the Housing Fair set up to help students settle in Montpellier. It also organises a welcome day for new Montpellier students, which takes place in September\/November."
        },
        {
          "Name": "Angers",
          "Aclow": "250",
          "Achigh": "400",
          "glow": "20",
          "ghigh": "30",
          "grolow": "180",
          "grohigh": "250",
          "outlow": "80",
          "outhigh": "130",
          "trans": "32",
          "parag": "Capital of Anjou, or rather of Maine et Loire, Angers is a lively student city where life is good. 300 km from Paris, located near the Loire Valley (classified as a UNESCO World Heritage Site) in the Pays de la Loire region, Angers is a pleasant city with its many green spaces and the gentle Angevin countryside, its cultural wealth and its economic dynamism. Indeed, sometimes nicknamed the \"Athens of the West\", it has an important cultural heritage, with its grandes \u00e9coles and universities, its numerous museums (Fine Arts Museum of Angers...), its monuments and historical places (King Ren\u00e9's castle), its religious buildings (Angers cathedral, St Maurice cathedral) and its numerous cultural events (theatre and dance companies, Anjou festival, festival of \"accroche-coeur\"...). It is also nicknamed the \"green city\" or the \"city of flowers\" because of its green spaces (parks, rose gardens of Angers, St Aubin Island...), its plant industries and the fact that it is the 1st horticultural pole of Europe) which make it a nice city without too much stress. "
        },
        {
          "Name": "Shanghai",
          "Aclow": "400",
          "Achigh": "800",
          "glow": "45",
          "ghigh": "60",
          "grolow": "200",
          "grohigh": "300",
          "outlow": "120",
          "outhigh": "200",
          "trans": "20.2",
          "parag": "As you explore the streets of Shanghai, you will discover a city in perpetual evolution and overflowing with energy. The metropolis that combines tradition and modernity is distinguished by its many ultra-modern buildings with bold architecture.Then join hundreds of locals during their daily tai chi rituals in Jing'an Park or take the ferry across the Huangpu River to Pudong and see some of the tallest buildings in the world.Shanghai is also a paradise for food lovers. Enjoy spicy dumplings and handmade noodles from street vendors, relax in the trendy cocktail bars or savour delicious contemporary cuisine in one of the Bund's high-end restaurants."
        },
        {
          "Name": "Budapest",
          "Aclow": "250",
          "Achigh": "400",
          "glow": "15",
          "ghigh": "30",
          "grolow": "100",
          "grohigh": "150",
          "outlow": "100",
          "outhigh": "120",
          "trans": "11",
          "parag": "The city of Budapest in Hungary is the capital with a population of 1.7 million. Its inhabitants are called the budapestois. With its magnificent palaces and castles, museums with rich collections, Budapest is one of the most attractive destinations in Eastern Europe. The Danube, which runs through the Hungarian capital, helps to give the city a unique character.Budapest enjoys a unique and diverse architecture, testimony to a capital that has shone over the centuries. On the Buda side you will discover the Old Town with the Castle, the Matthias Castle On the Pest side don't miss to visit the Hungarian Parliament (pictured above), St. Stephen's Basilica, Heroes' Square, the National Opera on the famous Andrassy Avenue, the Sz\u00e9chenyi Baths, the Great Synagogue and the Great Covered Market among others."
        },
        {
          "Name": "Clermont-Ferrand",
          "Aclow": "320",
          "Achigh": "400",
          "glow": "25",
          "ghigh": "30",
          "grolow": "150",
          "grohigh": "200",
          "outlow": "80",
          "outhigh": "110",
          "trans": "17",
          "parag": "One of the main factors in the city's vitality is its student population itself. In 2018, there were 36,880 students (including nearly 5,000 foreign students) in Clermont. The population is constantly growing (+7% in 10 years) and represents a little over one in four inhabitants on a city scale and one in seven on a metropolitan scale. Because, yes, since 2018 Clermont-Ferrand is a metropolis.The central position of Clermont-Ferrand and positions the city less than 2 hours from Lyon (by car), 3 hours from Paris (by train), 3 hours from Bordeaux or Montpellier (by car). Clermont-Ferrand is also open to the world thanks to the Aulnat airport and several low-cost lines to the whole of Europe.Another important attraction of the city is its sports facilities. Swimming pools, stadiums, skating rink... the metropolis has nearly 70,000 sports licensees in 481 clubs. With, of course, a Sports Office within the School."
        },
        {
          "Name": "La Rochelle",
          "Aclow": "300",
          "Achigh": "450",
          "glow": "25",
          "ghigh": "30",
          "grolow": "180",
          "grohigh": "220",
          "outlow": "100",
          "outhigh": "130",
          "trans": "20",
          "parag": "La Rochelle is a city of history, a port marked by its maritime past. But it is above all a city where it is good to live and study.Bathed in sunshine and lulled by the ocean, La Rochelle is a city where the quality of life is recognized thanks to numerous cultural events, sports clubs, high-level sailing, a rich historical heritage...Not to be missed:The Medieval TowersFor a unique panorama over the whole city, climb to the top of the Medieval Towers. The view over the ocean and La Rochelle is magnificent!Aquarium La RochelleFacing the Old Port, come and travel to the heart of the oceans. From the gallery of magical jellyfish...to the shark basin, plunge into the fascinating world of marine animals. An unmissable site!The FrancofoliesThe Francofolies, the great musical festival of the summer, is a major festival, a hundred shows, a dream setting, 5 days of madness."
        },
        {
          "Name": "Tours",
          "Aclow": "300",
          "Achigh": "350",
          "glow": "25",
          "ghigh": "30",
          "grolow": "160",
          "grohigh": "220",
          "outlow": "90",
          "outhigh": "120",
          "trans": "23",
          "parag": "Tours is a French city, located in the department of Indre-et-Loire and the Centre-Val de Loire region.The city covers an area of 34.4 km\u00b2 and has a population of 138,616 inhabitants.In the heart of the Loire Valley, on the banks of the Loire and Cher rivers, Tours symbolizes all the historical, cultural and gastronomic heritage of the Loire Valley. The city that was once the capital of the kingdom of France is a marvellous reflection of the French art of living, through its old town, its lively squares and its religious buildings. "
        },
        {
          "Name": "Rochefort",
          "Aclow": "300",
          "Achigh": "430",
          "glow": "25",
          "ghigh": "30",
          "grolow": "180",
          "grohigh": "220",
          "outlow": "100",
          "outhigh": "130",
          "trans": "20",
          "parag": "Only 20 minutes from La Rochelle and the ocean, the city of Charente-Maritime offers many advantages and a very good quality of life.Known by tourists for the Hermione construction site, the Corderie Royale and the house of the famous Pierre Loti, Rochefort is also an ideal town to enjoy its bars, caf\u00e9s and restaurants as well as its natural setting on the banks of the Charente. The open sea is accessible via shuttle boats, notably towards the island of Aix. The famous Fort Boyard is visible during the crossing.Students can celebrate the end of their year of studies during the Stereopark festival, which hosts both well-known DJs and young talents from the electro scene.On a daily basis, it is easy to get supplies at the market which takes place 3 times a week. The city offers many activities and leisure activities, notably thanks to its cinema, bowling alley, theatre and media library.Rochefort is therefore an accessible town, on a human scale, where life is good and which will appeal to work-study students."
        },
        {
          "Name": "Niort",
          "Aclow": "250",
          "Achigh": "350",
          "glow": "20",
          "ghigh": "30",
          "grolow": "150",
          "grohigh": "200",
          "outlow": "90",
          "outhigh": "120",
          "trans": "FREE",
          "parag": "With nearly 58,000 inhabitants, Niort is the \"central city\" of a community of agglomeration of about 120,000 inhabitants.Recognizable by its twin towers, the Keep remains the emblematic monument of Niort. It is not the only remarkable building. The Middle Ages, the Renaissance, the 18th and 19th centuries have left their mark on the urban landscape. With nearly 150 sports clubs and 19,800 members, sport plays an important role in Niort. Skating rink, racecourse, skate-park..., the sports facilities are numerous. We have just climbed the Verticale de l'Acclameur, the biggest indoor climbing wall in France!"
        },
        {
          "Name": "Raleigh",
          "Aclow": "600",
          "Achigh": "900",
          "glow": "30",
          "ghigh": "40",
          "grolow": "200",
          "grohigh": "250",
          "outlow": "140",
          "outhigh": "200",
          "trans": "40",
          "parag": "Commonly known as the City of Oaks, the \"City of Oaks\" because of the many oak trees planted throughout the city, Raleigh is the capital of the state of North Carolina.Historical and cultural city, its most symbolic and important monument is its Capitol. The city has many museums and cultural sites dedicated to its history such as the North Carolina Museum of Art created in 1924, the Joel Lane House which is the oldest house in Raleigh and the Museum of Natural Science which traces the history of North Carolina. Raleigh has many restaurants, theatres and nightclubs. Attending a hockey game is also a tradition to discover."
        },
        {
          "Name": "Sophia-Antipolis",
          "Aclow": "380",
          "Achigh": "600",
          "glow": "30",
          "ghigh": "40",
          "grolow": "200",
          "grohigh": "260",
          "outlow": "120",
          "outhigh": "160",
          "trans": "12",
          "parag": "Europe's leading technology park, Sophia Antipolis, was founded in 1969 around a strong idea: \"cross-fertilization\" between researchers, teachers and industrialists. It has become a world reference in innovation and now boasts 2,230 companies employing 36,300 people from 63 different nationalities, along with 4,000 researchers and 5,000 students.With a population of 9,102 inhabitants, it covers 2,400 hectares in the communes of Antibes, Biot, Mougins, Valbonne and Vallauris, and has the Nice-C\u00f4te d'Azur international airport some 20 kilometres away."
        },
        {
          "Name": "Lille",
          "Aclow": "450",
          "Achigh": "600",
          "glow": "25",
          "ghigh": "30",
          "grolow": "150",
          "grohigh": "230",
          "outlow": "90",
          "outhigh": "130",
          "trans": "28",
          "parag": "At the heart of Europe, Lille enjoys an exceptional geographical location, reinforced by the advantages of the TGV (high-speed train), the Channel Tunnel and a dense network of motorways.It is less than one hour by train from Paris and Brussels, one hour and forty minutes from London and two hours from Amsterdam.With a strong industrial and commercial tradition, Lille is today a dynamic and enterprising metropolis of 2 million inhabitants. It is an important financial centre, home to the headquarters of many international companies, and is one of the largest innovation centres."
        },
        {
          "Name": "Belo Horizonte",
          "Aclow": "150",
          "Achigh": "350",
          "glow": "15",
          "ghigh": "20",
          "grolow": "90",
          "grohigh": "120",
          "outlow": "80",
          "outhigh": "100",
          "trans": "15",
          "parag": "With more than two and a half million inhabitants, it stretches over miles of mountains. Located in the mountainous region of southeastern Brazil in the state of Minas Gerais, Belo Horizonte is still a little known destination for travelers to South America. Right in the heart of the gold and gemstone mining area, the country's third largest city has real tourist attractions. The city of Belo Horizonte lives day and night. Here, it is impossible to get bored as there are so many places to be entertained. Brazil is known for its torrid atmosphere, you will notice it in the many bars and nightclubs where young and old come together to share good times. Come and dance to the rhythm of samba, electronic music or rock, hundreds of places are available."
        },
        {
          "Name": "Suzhou",
          "Aclow": "150",
          "Achigh": "300",
          "glow": "25",
          "ghigh": "30",
          "grolow": "90",
          "grohigh": "120",
          "outlow": "80",
          "outhigh": "120",
          "trans": "12",
          "parag": "Suzhou is a city in Jiangsu province in eastern China. It is located about 100 km from Shanghai and has a population of more than 10 million people. Thanks to the success of its modern industries, Suzhou is today an urban and industrial centre. The city is world famous for its canals, old-fashioned houses and gardens.Nicknamed the Venice of the East, Suzhou is one of the two most beautiful cities in China. Tourists enjoy visiting its many gardens and strolling through the small streets lined with traditional houses. Suzhou invites to a romantic stay rich in discoveries.In addition to the gardens, Suzhou contains some buildings which arouse admiration. From He Lu's burial place to Hanshan Temple and Tiger Hill, you will always find a reason to stroll around Suzhou."
        },
        {
          "Name": "Lyon",
          "Aclow": "500",
          "Achigh": "650",
          "glow": "30",
          "ghigh": "40",
          "grolow": "200",
          "grohigh": "300",
          "outlow": "150",
          "outhigh": "200",
          "trans": "56.2",
          "parag": "The natural diversity of the Auvergne-Rh\u00f4ne-Alpes Region offers a wide range of activities related to agriculture and food.Fruit and vegetable crops and livestock farming are important productions, linked to dynamic food companies; the largest vineyards are located in the Beaujolais region and along the Rhone Valley.Lyon now has 144,500 students in the city's 4 universities and 54 higher education institutions. It thus offers an unlimited range of choices for higher education.Every year, nearly 15,000 foreign students decide to come and study in Lyon. 700 exchange partnerships have been set up with foreign universities.Lyon's strong attractiveness enables it to expand internationally and create close ties with foreign students."
        },
        {
          "Name": "Reims",
          "Aclow": "300",
          "Achigh": "550",
          "glow": "25",
          "ghigh": "35",
          "grolow": "200",
          "grohigh": "300",
          "outlow": "90",
          "outhigh": "130",
          "trans": "30",
          "parag": "Reims, 12th city of France, city of the coronations in the heart of the Champagne region, is characterized by a prestigious historical heritage inscribed on the UNESCO list. It also stands out for the dynamism of its local life in a pleasant and attractive environment for both tourists and businesses.Home to many of the most prestigious champagne houses, Reims is a city of effervescence: cultural, sporting, economic, university... only 45 minutes from Paris thanks to the TGV. With its museums, parks, shops and restaurants, sports and cultural facilities, the 12th city of France with its many faces offers an exceptional living environment for its inhabitants and visitors alike."
        },
        {
          "Name": "Rouen",
          "Aclow": "280",
          "Achigh": "400",
          "glow": "25",
          "ghigh": "35",
          "grolow": "180",
          "grohigh": "250",
          "outlow": "90",
          "outhigh": "130",
          "trans": "20",
          "parag": "With more than 40,000 students, Rouen is a great city to study in. Its three major educational centres (Mont-Saint-Aignan, Rouen centre and Saint-Etienne-du-Rouvray) offer many study possibilities: from medicine to law, including business, science and languages, you are bound to find a course adapted to your desires! Rouen is a culturally rich city and, since January 2016, the city allows free access to the permanent collections of the Fine Arts Museum, Ceramics Museum, Ironwork Museum (Le Secq des Tournelles), Antiquities Museum and Natural History Museum. Culture is within everyone's reach free of charge, no reason not to visit these museums located in downtown Rouen.Rouen is also the scene of free events that enliven the city throughout the year: from mid-June to the end of September, the majestic Cathedral is illuminated by a sound and light show every evening. In July, the Thursday terraces or the free concerts of the region on the Waddington peninsula are open to the public."
        },
        {
          "Name": "Barcelona",
          "Aclow": "400",
          "Achigh": "600",
          "glow": "40",
          "ghigh": "70",
          "grolow": "180",
          "grohigh": "230",
          "outlow": "110",
          "outhigh": "150",
          "trans": "47",
          "parag": "Every year more than 12,000 international students come to study in Barcelona. Barcelona is a city open to the sea, with almost five kilometres of beaches. With its eventful history, dating back to Roman times, excellent cuisine, art, music, shopping and outstanding architecture, Barcelona has enough attractions to keep you busy throughout your studies. Moreover, Barcelona also stands out for the beauty of its landscapes. You will visit Montjuic and its famous castle, the Olympic stadium for the 1992 Summer Olympics and even the site of the 1929 International Exhibition. The National Geographic recently voted Barcelona the world's top beach city. Barcelona is one of the only cities in Europe that offers a wide variety of cuisine: 1 euro tapas bars are very common in the city, and there are also many restaurants to suit all tastes. In this city, you will enjoy many traditional dishes, and lots of seafood and tapas. "
        },
        {
          "Name": "Toulouse",
          "Aclow": "400",
          "Achigh": "600",
          "glow": "20",
          "ghigh": "30",
          "grolow": "180",
          "grohigh": "230",
          "outlow": "100",
          "outhigh": "130",
          "trans": "10",
          "parag": "With more than 100,000 students, Toulouse, the \"pink city\" is the 4th largest student city in France. Toulouse is a very lively and animated city, ideal for attracting students from all over the world. You will spend unforgettable evenings around the Carmes Saint-\u00c9tienne district or, if you prefer the quiet, you will appreciate the St-Cyprien district and its village atmosphere.For students on a small budget, the St Michel district offers the lowest rent, otherwise you can go to La busca, which has no shortage of university housing.Toulouse has many historical monuments that are just waiting to be discovered. Take advantage of the city's museums, visit the Cit\u00e9 de l'espace, walk along the banks of the Garonne or the Canal du Midi, and don't forget to indulge in the gastronomy of southwest France!"
        },
        {
          "Name": "Strasbourg",
          "Aclow": "350",
          "Achigh": "450",
          "glow": "20",
          "ghigh": "30",
          "grolow": "180",
          "grohigh": "220",
          "outlow": "90",
          "outhigh": "120",
          "trans": "22",
          "parag": "Studying in Strasbourg means taking an active part in the life of nearly 50,000 students, 20% of whom are foreigners. A cosmopolitan city with a young vocation, the emblematic capital of Europe, Strasbourg is a city where it is good to study with many assets to attract international students. The population is young: 32% of Alsatians are under 25 years old. It boasts a dynamic and pleasant living environment. Its geographical location makes Strasbourg one of the most international metropolises. It is also home to three major institutions: the European Parliament, the Council of Europe and the European Court of Human Rights. Strasbourg is also a two-thousand-year-old city with a unique cultural and architectural heritage. Walking through the streets of the city, marvelling at its prodigious cathedral, observing the variety of its architecture, is like taking a trip back in time to meet the events and people who have shaped it and contributed to its influence. What's more, the human size of this small city means that everything is within your reach, wh"
        },
        {
          "Name": "Milan",
          "Aclow": "500",
          "Achigh": "700",
          "glow": "40",
          "ghigh": "60",
          "grolow": "190",
          "grohigh": "220",
          "outlow": "130",
          "outhigh": "200",
          "trans": "22",
          "parag": "The Italian capital of fashion and design, Milan attracts many tourists every year, but also students from all over the world! Why is Milan the ideal city for these students? The gastronomy, the \"aperitivi\", lots of green spaces in the city, the possibility to travel thanks to the train stations that serve the country very well... Milan is also famous for being one of the world capitals of fashion, with many shops of the most important companies in the sector; many designers and fashion houses are based in the city (Armani, Prada, Versace, Dolce & Gabbana, Etro, Miu Miu Miu). Its priceless artistic heritage is one of the most important in Italy and Europe, with hundreds of ancient churches and museums so essential to the history of art, such as the Pinacoteca di Brera, one of the largest museums in Europe, founded in 1809."
        },
        {
          "Name": "Singapore",
          "Aclow": "600",
          "Achigh": "900",
          "glow": "50",
          "ghigh": "90",
          "grolow": "200",
          "grohigh": "350",
          "outlow": "150",
          "outhigh": "230",
          "trans": "55",
          "parag": "Also known as the \u201cThe Lion City\u201d, Singapore is a cosmopolitan city-state with a high quality of life, especially in terms of safety and health. Although Singapore is a small city, it is home to more than 5.7 million people, including more than 50,000 international students, excluding university exchanges! And, at nightfall, this business city is transformed into a bustling nightlife centre, full of nightclubs, pubs and bars. The areas around Clarke Quay or Orchard Road are particularly worth a visit. On the culinary side, Singapore's geographical location and its busy port have made it a melting pot of cultures, imbuing the island city with the flavours of neighbouring countries such as Malaysia, China, Indonesia, India, Thailand, Vietnam and even Japan. Singapore's excellent geographical location also makes it an ideal base for exploring other Southeast Asian countries. It is not uncommon to go to Malaysia or Thailand for the weekend. As for Indonesia, Cambodge to China or India, they are only 5 or 6 hours away by plane..."
        },
        {
          "Name": "London",
          "Aclow": "600",
          "Achigh": "900",
          "glow": "25",
          "ghigh": "45",
          "grolow": "200",
          "grohigh": "250",
          "outlow": "130",
          "outhigh": "200",
          "trans": "130",
          "parag": "According to QS World University Rankings, London is the best city in the world for students thanks to its many first-class universities, dynamic job market, diversity and quality of life. Indeed, the majority of students surveyed agreed that London offers professional networking opportunities, tolerates different cultures and provides access to a rich cultural life with its museums, theatres and festivals.London is known to be a city with a great international openness. Indeed, the capital of Great Britain with more than 7 million inhabitants is a fascinating city for its cultural diversity. With a mix of more than 50 nationalities and 300 different languages, London is undeniably the most cosmopolitan city on the Old Continent."
        },
        {
          "Name": "Oxford",
          "Aclow": "600",
          "Achigh": "800",
          "glow": "40",
          "ghigh": "50",
          "grolow": "250",
          "grohigh": "400",
          "outlow": "90",
          "outhigh": "150",
          "trans": "60",
          "parag": " Situated in the south-east of England, and 80km from London, Oxford (153 000 Inhabitants, 27% of students) is a city renowned for the beauty of its architecture, but also for its universities. One of them is the oldest in the Anglo-Saxon world. Of medium size, Oxford is a relatively dynamic city because of the high number of students in the population. Indeed, Oxford has the highest rate of students in England and Wales. It is also very attractive because of the multitude of activities available to locals and tourists: museums, boat trips, filming locations for many films (especially Harry Potter), cultural activities (theatre, cinema, concerts, ...), discos, pubs, ... It is also an ideal starting point to visit the rest of England."
        },
        {
          "Name": "Caen",
          "Aclow": "350",
          "Achigh": "400",
          "glow": "25",
          "ghigh": "30",
          "grolow": "180",
          "grohigh": "220",
          "outlow": "90",
          "outhigh": "130",
          "trans": "30",
          "parag": "Situated in the west of France, in the heart of Normandy, bordered by the romantic coastline of the seaside resorts of the 1900s and the D-Day beaches, Caen-Normandie is an authentic setting with preserved natural areas. 34 000 students are currently studying in Caen.Caen-Normandie is also innovative, creative and enterprising. The commercial and economic capital of western Normandy, and international (through its port, airport and open-mindedness), it offers all the employment opportunities and support you need to accomplish your professional or personal projects."
        },
        {
          "Name": "Le Havre",
          "Aclow": "350",
          "Achigh": "450",
          "glow": "20",
          "ghigh": "30",
          "grolow": "180",
          "grohigh": "230",
          "outlow": "90",
          "outhigh": "230",
          "trans": "30",
          "parag": "Choosing Le Havre means choosing a seaside campus. The place where the people of Le Havre like to meet, walk and do their sports. Le Havre welcomes more than 12,000 students. With the sea as a horizon and water sports as a passion, Le Havre vibrates to the rhythm of the tides. The city also benefits from places that are totally out of time and out of place. A beach in the city centre, basins all over the city, a container port, cruises, yachting, regattas and fishing, you're bound to find what you're looking for!  The Tetris, located within the Fort de Tourneville, a former military stronghold, is a showroom with colourful container architecture that hosts the annual Ouest Park festival. After a nice stroll in the sea air, there is nothing better than a stop at La petite rade to have a drink on its huge terrace facing the sea. The city is bathed in a multicultural context turned towards the vast world, like its world-class city and port. "
        },
        {
          "Name": "Marseille",
          "Aclow": "400",
          "Achigh": "600",
          "glow": "25",
          "ghigh": "30",
          "grolow": "150",
          "grohigh": "220",
          "outlow": "90",
          "outhigh": "130",
          "trans": "18.3",
          "parag": "There is nothing more pleasant than living in a city where the sun has become a strong part of the daily life of the inhabitants. Marseille, the 4th largest city in France, has more than 75,000 students, including more than 10,000 international students. Between sea and mountains, you will have no difficulty in finding a nice place to go for a weekend with your friends. Marseille has many monuments such as the Palais Longchamp, a museum of fine arts which reserves you magnificent exhibitions. You can also benefit from student discounts for all kinds of visits. But what would Marseille be without its old port? A social and cultural centre with its markets, bars, restaurants and unmissable walks. Moreover, the centre has become a pedestrianised area, enough to fully enjoy this historic place. In the Vieille Chapelle district in the south of the city by the sea, for example, you can choose between water activities, caf\u00e9s with terraces and sunsets to end your day in style. If you also want to finance your studies, finding a student job should not be too "
        },
        {
          "Name": "Bordeaux",
          "Aclow": "550",
          "Achigh": "700",
          "glow": "25",
          "ghigh": "35",
          "grolow": "200",
          "grohigh": "250",
          "outlow": "120",
          "outhigh": "150",
          "trans": "30",
          "parag": "Bordeaux is a very attractive city with more than 87,000 students. Less than an hour from the Atlantic Ocean and the Arcachon Basin, Bordeaux has all the characteristics of a modern and dynamic city while keeping those of the South of France; sunshine and a pleasant living environment.Very well connected to the rest of France, it is only 2 hours by train from the capital. If you like to take a leisurely stroll, Bordeaux has made its city centre an area exclusively dedicated to pedestrians and trams. The city centre is full of shops, bars, restaurants, cinemas, discos, which makes the city even more dynamic, as well as many places to visit. This is where the student status is beneficial; indeed you can have a young card, very easy to obtain, it will allow you to have many discounts on museums, plays, cinemas... enough to liven up your weekends!"
        },
        {
          "Name": "Nantes",
          "Aclow": "250",
          "Achigh": "350",
          "glow": "25",
          "ghigh": "30",
          "grolow": "180",
          "grohigh": "220",
          "outlow": "90",
          "outhigh": "120",
          "trans": "40",
          "parag": "A dynamic and attractive city, the city of Nantes attracts both companies and students. Nantes ranks 6th in the ranking of cities in France in terms of number of inhabitants. It currently has around 55,000 students.Nantes ranks 6th in the ranking of French cities in terms of number of inhabitants (nearly 300,000) and in the general classification.Capital of the Loire-Atlantique department and the Pays de la Loire region, the city is located in the west of France, only 2 hours from Paris by train. Nantes was also elected Green Capital in 2013.A cultural city: Sport, culture, outings, festivals, Nantes offers a multitude of possibilities such as :- The trip to Nantes- The machines of the Island and the unavoidable elephant- The castle of the Dukes of Brittany- The Scopitone Festival, festival of musical and digital creations"
        },
        {
          "Name": "Brest",
          "Aclow": "340",
          "Achigh": "450",
          "glow": "20",
          "ghigh": "30",
          "grolow": "180",
          "grohigh": "220",
          "outlow": "90",
          "outhigh": "120",
          "trans": "23",
          "parag": "At the western end of France stands Brest, the maritime city. Brest has more than 28,000 students, including more than 3,000 international students. Choosing to come and study in Brest or its surroundings is to make the choice of an easy student life. The city has all the advantages of a metropolis on a human scale. Living in Brest also means living close to the natural elements that surround it. The sea is an integral part of the landscape and daily life of Brest inhabitants and influences the sports and leisure activities to be done after work or on weekends: paddle courses, windsurfing, sea kayaking, sailing tours in the harbour, etc. You will be able to take advantage of the islands along the Finisterian coasts: the islands of Ouessant and Mol\u00e8ne offer sumptuous landscapes with the air of the end of the world. In addition, numerous events dedicated to students take place throughout the academic year, not forgetting the Brest Life Exp\u00e9rience scheme, a unique scheme in France allowing students to discover the area in an unusual way. To travel or vi"
        },
        {
          "Name": "Paris",
          "Aclow": "550",
          "Achigh": "900",
          "glow": "25",
          "ghigh": "45",
          "grolow": "200",
          "grohigh": "350",
          "outlow": "120",
          "outhigh": "200",
          "trans": "35",
          "parag": "Paris is the capital of France, its agglomeration has more than 10 million inhabitants and 700 000 students.\r\nParis is the capital of fashion immediately recognizable by the richness of its architectural heritage. To realise this, all you have to do is climb the Eiffel Tower or go to the esplanade of the Sacr\u00e9-Coeur in Montmartre at nightfall. The 'City of Lights' is renowned for its architecture, bridges, parks and churches.\r\nDivided into districts, each with its own picturesque charm, Paris is a dynamic capital. \r\nParis has retained its village spirit with its markets, restaurants and bars. It is also a paradise for shopping addicts."
        }
      ];

      citiesList.forEach((element) {
        cities
            .add(Cities.fromJson(element).toMap())
            .then((value) => print("City Added"))
            .catchError((error) => print("Failed to add city: $error"));
      });
    } catch (e) {
      print(e.toString());
      return 0.toString();
    }
  }

  Future<void> populateSchools() async {
    try {
      List<Map<String, dynamic>> schoolsList = [
        {
          "name": "ICN",
          "descr": "Since 1905, ICN has been the leading management school in Eastern France, in the heart of Europe. Its identity and development are based on the links that unite, in today's and tomorrow's economy, management, technology and art. ICN Business School's mission is to provide innovative and transdisciplinary training that enables students in initial and continuing education to become responsible professionals capable of acting in a globalized economic environment.\n\nTranslated with www.DeepL.com\/Translator (free version)",
          "rangep": "47.000 \u20ac - 50.000 \u20ac",
          "alumni": " + 15 000",
          "nostu": "3,000",
          "nointrstu": "38%",
          "rank1": "69",
          "rank2": "15",
          "rank3": "13"
        },
        {
          "name": "IPAG ",
          "descr": "In a world in constant evolution, companies need agile managers who can think beyond existing frameworksand inspire productive interchange among existing disciplines.\nAs a member of the Conference of Grandes \u00c9coles, IPAG offers a range of exceptional programmes to help students from diverse backgrounds become just such high-potential managers.\nThe mission of the school is to promote management adapted to a globalised and fast-changing world",
          "rangep": "38.000 \u20ac - 40.000 \u20ac",
          "alumni": " +12 500",
          "nostu": "2,800",
          "nointrstu": "100000%",
          "rank1": "-",
          "rank2": "25",
          "rank3": "26"
        },
        {
          "name": "RENNES BUSINESS SCHOOL",
          "descr": "Rennes School of Business is considered to be the most international School of Management in Europe. With 95% of faculty members being non-French, 55% foreign students, classes in English and a network of more than 300 partner universities worldwide, Rennes School of Business gives the students a unique opportunity to learn in a continuous international environment from first year to graduation.\n",
          "rangep": "40.000 \u20ac - 43.000 \u20ac",
          "alumni": "19 400",
          "nostu": "4,500",
          "nointrstu": "55%",
          "rank1": "56",
          "rank2": "14",
          "rank3": "11"
        },
        {
          "name": "IESEG",
          "descr": "As a French Grande \u00c9cole and member of the Conf\u00e9rence des Grandes \u00c9coles,  I\u00c9SEG is part of the most prestigious higher education institutions in the country. It is also awarded with the international accreditations EQUIS, AACSB and AMBA.\nI\u00c9SEG is part of Universit\u00e9 Catholique de Lille, which, by its organization, size, infrastructure, resources and quality is very similar to some famous British universities.\nEstablished in 1964 in Lille, the school has a second campus in Paris \u2013 La D\u00e9fense, Europe\u2019s biggest business hub. With its two campuses, the School counts more than 5850 students.",
          "rangep": "40.000 \u20ac - 47.000 \u20ac",
          "alumni": "9000",
          "nostu": "5,850",
          "nointrstu": "2600",
          "rank1": "64",
          "rank2": "9",
          "rank3": "8"
        },
        {
          "name": "ESSCA",
          "descr": "ESSCA School of Management creates knowledge and develops responsible managers and entrepreneurs, while fully considering the human, ethical and economic dimensions of organisations in a multicultural environment driven by technology and social innovations.\nESSCA is a well-established Business School: For over 100 years it has consistently kept to the humanistic values that make up its ethical foundations.",
          "rangep": "40.000 \u20ac - 47.000 \u20ac",
          "alumni": "14 500",
          "nostu": "6,000",
          "nointrstu": "",
          "rank1": "76",
          "rank2": "15",
          "rank3": "16"
        },
        {
          "name": "AUDENCIA",
          "descr": "Founded in Nantes in 1900, Audencia \u2013 from the Latin audientia, meaning \u201clistening\u201d, and audacia, meaning \u201cdaring\u201d \u2013 was first accredited by EQUIS in 1998 and is ranked amongst the top European business schools. Learn more about Audencia\u2019s quality.\nIn 2015, Audencia was awarded reaccreditation by EQUIS, AACSB and AMBA for the maximum period of five years. We also had the first combined start of the university year for the schools in our alliance.",
          "rangep": "Over 50.000 \u20ac",
          "alumni": "22000",
          "nostu": "4,500",
          "nointrstu": " +90 nationalities",
          "rank1": "40",
          "rank2": "11",
          "rank3": "12"
        },
        {
          "name": "ESC CLERMONT",
          "descr": "Groupe ESC Clermont is a well-established French Business School. It was founded in 1919, under the patronage of the Ministry of Commerce, the City of Clermont-Ferrand, the Conseil G\u00e9n\u00e9ral du Puy-de-D\u00f4me (General Council), the Chamber of Commerce and several partner companies.\n",
          "rangep": "33.000 \u20ac - 35.500 \u20ac",
          "alumni": "13 000",
          "nostu": "1,663",
          "nointrstu": "30%",
          "rank1": "95",
          "rank2": "33",
          "rank3": "33"
        },
        {
          "name": "EXCELIA",
          "descr": "Excelia Group has always been a pioneer in its sphere of activity. By becoming an educational centre encompassing 5 multi-disciplinary and multi-campus Schools, it has developed a new model designed to respond to students' professional ambitions as well as to the significant demands from companies in terms of the skills and competencies required for current and for future jobs.\n",
          "rangep": " 40 000 \u20ac",
          "alumni": "17 500",
          "nostu": "3,800",
          "nointrstu": "950",
          "rank1": "79",
          "rank2": "17",
          "rank3": "17"
        },
        {
          "name": "SKEMA",
          "descr": "SKEMA Business School is a private establishment of higher education and research with the legal status of a non-profit association under the French \"1901 law\".\nSKEMA is a member of the Conf\u00e9rence des Grandes Ecoles. The school was approved by the French Ministry of Higher Education and Research, as an EESPIG (Private Establishment for Higher Education declared to be of public usefulness). The school aims to become the global business school on five continents",
          "rangep": "48.000 \u20ac - 50.000 \u20ac",
          "alumni": "45 000",
          "nostu": "8,500",
          "nointrstu": "5 400",
          "rank1": "49",
          "rank2": "6",
          "rank3": "5"
        },
        {
          "name": "EISTI",
          "descr": "As an engineering school officially recognised by the State and made competent by the CTI (French Engineering accreditation institution) the EISTI\u2019s vocation is to train future engineers in Mathematics and Computering. \nAcademic excellence combined with a strong sense of humanism have always brought Eistian culture and spirit to life. The school has elected 4 core values in its charter: Professionalism, Openness, Solidarity and Ethics.\n",
          "rangep": "45 000\u20ac",
          "alumni": "6900 (linkedin)",
          "nostu": "400",
          "nointrstu": "12%",
          "rank1": "-",
          "rank2": "17",
          "rank3": "96"
        },
        {
          "name": "ISEP",
          "descr": "ISEP is a French engineering graduate school in digital technology, known as a \u201cGrande \u00c9cole d\u2019Ing\u00e9nieurs\u201d. ISEP trains very high-level graduate engineers who receive a thorough training in Electronics, Telecommunications & Networks, Software Engineering, Signal-Image Processing and Humanities, providing them with the required knowledge and skills to meet the needs of businesses. Since 2008, ISEP has been offering an international program taught fully in English which allows international students to obtain the Engineering Master Degree. \n",
          "rangep": "45 000\u20ac",
          "alumni": "9000",
          "nostu": "1,500",
          "nointrstu": "400",
          "rank1": "-",
          "rank2": "15",
          "rank3": "86"
        },
        {
          "name": "EPITA",
          "descr": "Founded in 1984, EPITA is a bilingual Graduate School of Computer Science. Thanks to its unique pedagogical approach, EPITA trains its students to become outstanding engineers who boast a solid base of scientific knowledge and the most advanced skills in the digital sector. \n",
          "rangep": "45.000 \u20ac - 50.000 \u20ac",
          "alumni": "Over 12 000 (linkedin)",
          "nostu": "",
          "nointrstu": "8%",
          "rank1": "-",
          "rank2": "71",
          "rank3": "19"
        },
        {
          "name": "ECAM Lyon",
          "descr": "Founded in 1900, ECAM Lyon ties research, education, and innovation to follow shifts in industry and business. ECAM Lyon provides academic programs in engineering with rigorous scientific and technical standards, human and social perspectives, cross-disciplinary knowledge, and openness to the world all while maintaining the ethical values at the heart of its mission since its founding.\n",
          "rangep": "Over 40 000\u20ac",
          "alumni": "Over 6000",
          "nostu": "1,200",
          "nointrstu": "17 nationalities",
          "rank1": "-",
          "rank2": "-",
          "rank3": "57"
        },
        {
          "name": "NEOMA",
          "descr": "NEOMA Business School has the ambition to be an innovative challenger to the world's leading business schools. Driven by its strategic plan, NEOMA Business School is building the school of tomorrow and rethinking its approach to international development, teaching, the use of digital technology and campus design.\n",
          "rangep": "47.000 \u20ac - 50.000 \u20ac",
          "alumni": "60 000",
          "nostu": "9,500",
          "nointrstu": " + 100 nationalities",
          "rank1": "50",
          "rank2": "9",
          "rank3": "7"
        },
        {
          "name": "TOULOUSE BUSINESS SCHOOL",
          "descr": "Founded in 1903 by the Toulouse Chamber of Commerce and Industry, TBS (formerly known as Toulouse Business School) stands out in its educational mission. By anticipating changes in society, TBS helps students understand disruptive changes and consider them as opportunities. Our goal is to train future decision-makers who have an international focus and are collaborative, agile and responsible.\n",
          "rangep": "43.000 \u20ac - 47.000 \u20ac",
          "alumni": "44000",
          "nostu": "5 600",
          "nointrstu": "25%",
          "rank1": "57",
          "rank2": "12",
          "rank3": "13"
        },
        {
          "name": "PARIS SCHOOL OF BUSINESS",
          "descr": "Founded in 1974, PSB Paris School of Business is a school offering various programmes from undergraduate programmes (International BBA), to graduate programmes (Master in Management \u201cProgramme Grande Ecole\u201d), and post graduate programme (MSc, MBA, Executive DBA).\n",
          "rangep": "40 000",
          "alumni": "13000",
          "nostu": "4,000",
          "nointrstu": "700",
          "rank1": "-",
          "rank2": "23",
          "rank3": "21"
        },
        {
          "name": "EM NORMANDIE",
          "descr": "EM Normandie is a member of the Grandes Ecoles Chapter of Management, which has guaranteed a level of excellence to match its ambitions for over 147 years.\nEM Normandie is a Management Higher Education and Research Institution formed as a private association under the 1901 Act. Elian Pilvin is Dean since 2020. He succeeds Jean-Guy Bernard, who has been Dean since 2004.",
          "rangep": "40.000 \u20ac - 43.000 \u20ac",
          "alumni": "16 000 (linkedin)",
          "nostu": "4,500",
          "nointrstu": "50 nationalities",
          "rank1": "81",
          "rank2": "19",
          "rank3": "21"
        },
        {
          "name": "KEDGE BS",
          "descr": "KEDGE BS was created to achieve a critical mass that would ensure its international visibility. Created as an association, it is financially independent. Its activities fall within two inter-related categories: applied research and education, including:\n\n31 formal higher education courses and a thriving Executive Education programme.\nFour recognised areas of research expertise and six management centres of excellence.\nThis dual expertise in education and research has earned it its status among the 1% of the world's business schools that are triple accredited by EQUIS, AMBA and AACSB.",
          "rangep": "43.000 \u20ac - 47.000 \u20ac",
          "alumni": "70 000 (linkedin)",
          "nostu": "12,500",
          "nointrstu": "1000",
          "rank1": "31",
          "rank2": "8",
          "rank3": "10"
        },
        {
          "name": "ESAIP",
          "descr": "\"ESAIP is a Graduate school of Engineering proposing a generalist, broad-based 3 years course, starting at a 12+2  level or based 5 years course, starting after high school. ESAIP offers two Diplomas at Angers and Aix-en-Provence:\n\u2022 Computer science and networks\n\u2022 Safety, environment and industrial risk managment.\n\nThe graduate school of Engineering is authorized by the \u201cCommission des Titres d\u2019Ing\u00e9nieurs\u201d, EUR-ACE label, member of the \u201cConf\u00e9rence des Grandes Ecoles\u201d.\"",
          "rangep": "32.000 \u20ac - 35.000 \u20ac",
          "alumni": "3100 (linkedin)",
          "nostu": "700",
          "nointrstu": "35",
          "rank1": "-",
          "rank2": "62",
          "rank3": "150"
        },
        {
          "name": "ESSEC",
          "descr": "A pioneer of business-related learning  since 1907, ESSEC\u2019s mission is to respond  to the challenges  of the future.  In an interconnected, technological, and uncertain world, where the tasks are increasingly complex, ESSEC offers a unique pedagogical approach. This approach is founded on the creation and dissemination of cutting- edge knowledge, a blend of academic learning and practical experience, and a multicultural openness and dialogue.",
          "rangep": "Over 50.000 \u20ac",
          "alumni": "47000",
          "nostu": "6,000",
          "nointrstu": "N\/A",
          "rank1": "8",
          "rank2": "2",
          "rank3": "2"
        },
        {
          "name": "EM STRASBOURG",
          "descr": "EM Strasbourg Business School distinguishes itself by being the only business school in France that is part of an academic centre of excellence, the University of Strasbourg. Our identity is defined by a forward-looking and innovative vision of the socio-economic world and its environment.",
          "rangep": "30.000 - 33.000\u20ac",
          "alumni": "15000",
          "nostu": "3,600",
          "nointrstu": "22000",
          "rank1": "-",
          "rank2": "17",
          "rank3": "19\n"
        },
        {
          "name": "Nova SBE",
          "descr": "Nova School of Business & Economics (Nova SBE) is the leading business school in Portugal and one of the best business schools in Europe in the areas of Economics, Finance and Management. It offers Bachelor's, Master's, Ph.D., MBA as well as Executive Education programs. \nIt was the first Portuguese business school to acquire international accreditations and recognition of world renown in higher education. The international vision of Nova SBE is also reflected in the adoption of English as the main teaching language.",
          "rangep": "35.000 - 45 000\u20ac",
          "alumni": "20000",
          "nostu": "3,200",
          "nointrstu": "40%",
          "rank1": "16",
          "rank2": "-",
          "rank3": "-"
        },
        {
          "name": "IUBH",
          "descr": "IUBH International University is a state-recognized university of applied sciences. It offers degree programs in English, double degree programs in German, as well as extracurricular and online courses in German and English.\nThe curriculum has multiple facets which reflect this, for example, the inclusion of internship semesters, discussions and lectures with experts from industry and excursions to companies. The integration of theory and practice is a daily reality for every student. In the context of its lectures the IUBH offers project work and case studies.",
          "rangep": "30.000 - 35.000\u20ac",
          "alumni": "-",
          "nostu": "27,000",
          "nointrstu": "40 Nationalities",
          "rank1": "-",
          "rank2": "-",
          "rank3": "-"
        },
        {
          "name": "UE Germany",
          "descr": "At the University of Applied Sciences Europe (UE), located in Berlin, Hamburg, and Iserlohn, you\u2019ll explore new paths. We offer you an international program that prepares you for the demands of tomorrow\u2019s job markets with inno-vative programs and teaching formats. Our global network embracing all cultures and continents is the gateway to an exciting career in the global, digitalised workplace \u2013 whether as a manager or in your own company. We offer courses in business, media, communication, and sports and event management, as well as art & design, new media, and new technologies. ",
          "rangep": "30.000 - 35.000\u20ac",
          "alumni": "4000 (Linkedin)",
          "nostu": "-",
          "nointrstu": "-",
          "rank1": "-",
          "rank2": "-",
          "rank3": "-"
        },
        {
          "name": "IMT Atlantique ",
          "descr": "Our mission at IMT Atlantique is to prepare the new generation to face future challenges, to deal with complex problems, to understand increasingly networked systems, but also and above all to be responsible agents for change in the world. \n",
          "rangep": " + 40 000",
          "alumni": "13 000",
          "nostu": "1,900",
          "nointrstu": "20%",
          "rank1": "-",
          "rank2": "23",
          "rank3": "8"
        },
        {
          "name": "EM Lyon",
          "descr": "emlyon business school is a French leading business school. It was founded in Lyon, France in 1872 by the local business community, and is affiliated to the Lyon Chamber of Commerce and Industry. It has triple accreditation: EQUIS by the EFMD, AMBA, and the AACSB.\n",
          "rangep": "over 50 000 \u20ac",
          "alumni": "32 000",
          "nostu": "8,600",
          "nointrstu": "110 nationalities",
          "rank1": "20",
          "rank2": "4",
          "rank3": "4"
        },
        {
          "name": "Atelier Sevres Paris",
          "descr": "The Atelier de S\u00e8vres is a private establishment approved by the Paris Education Authority (Rectorat de Paris).\nSince 1979, it has been preparing students for public and private art and animation schools in France and abroad.\nFrom Beaux-Arts and Gobelins to Central Saint Martins in London, Atelier de S\u00e8vres achieves the highest rate of admissions to the most prestigious art and animation schools, thanks to the commitment and professionalism of its teaching staff.",
          "rangep": "",
          "alumni": "",
          "nostu": "",
          "nointrstu": "-",
          "rank1": "-",
          "rank2": "-",
          "rank3": "-"
        },
        {
          "name": "EMLV",
          "descr": "EMLV is a member of the Conf\u00e9rence des Grandes Ecoles, which brings together the best French higher education institutions.\nL\u00e9onard de Vinci Business School (EMLV) offers several degrees with specialisations in accounting, digital business, marketing, finance, and human resources.\nThe EMLV programmes have been designed to help students reach their highest potential as future leaders",
          "rangep": "38 000 euros",
          "alumni": "10 000",
          "nostu": "6,500",
          "nointrstu": "500",
          "rank1": "-",
          "rank2": "22",
          "rank3": "16"
        },
        {
          "name": "IESA Art & Culture",
          "descr": "Situated in the heart of Paris, IESA is ideally located to provide specialized, hands-on instruction in Cultural Events Management and the Art Market.\n\nThrough its international partnerships with leading universities and cultural institutions, IESA welcomes over 100 foreign students each year into both its French-language programs and its English-language MA and MBA programs.  \n",
          "rangep": "",
          "alumni": "",
          "nostu": "750",
          "nointrstu": "-",
          "rank1": "-",
          "rank2": "-",
          "rank3": "-"
        },
        {
          "name": "Istituto Marangoni",
          "descr": "The essence of fashion and design: this is what is taught at Istituto Marangoni. Professionals who are passionate about their work and willing to share their expertise teach the young talent who, once graduated, will reach the highest professional levels. \n\nThrough a complete course, where theory is taught alongside practice, students learn that creativity is a gift to be nurtured, nourished and stimulated continuously, with passion and dedication. It is the same passion for the world of fashion and design with which our teachers teach.\n",
          "rangep": "",
          "alumni": "40 000",
          "nostu": "4,000",
          "nointrstu": "-",
          "rank1": "-",
          "rank2": "-",
          "rank3": "-"
        },
        {
          "name": "Strate",
          "descr": "Fully recognized by the State and ranking among the top French design schools, following the \u201cGrande Ecole\u201d pattern, STRATE  has established itself among the 60 best Design establishments worldwide (Business Week ranking), and among the top 50 in Europe by DOMUS. It is also the first French private school in France. \n",
          "rangep": "",
          "alumni": "",
          "nostu": "660",
          "nointrstu": "-",
          "rank1": "-",
          "rank2": "-",
          "rank3": "-"
        },
        {
          "name": "Cours Florent",
          "descr": "An internationally-renowned, multidisciplinary drama school in Paris with 50 years of experience.\n\nWhen Fran\u00e7ois Florent founded the Cours Florent in 1967, his vision was to create a unique and innovative programs focusing on each individual student. The goal is to allow them to nuture and develop acting skills in our drama school.\n",
          "rangep": "",
          "alumni": "",
          "nostu": "2,500",
          "nointrstu": "-",
          "rank1": "-",
          "rank2": "-",
          "rank3": "-"
        },
        {
          "name": "ESGCI ",
          "descr": "The ESGCI is a business school that delivers level 6 (Bac+3) and 7 (Bac+5) diplomas recognized by the State.\nThe means of your success and achievement are offered to you: attentive teachers, specialisation from the 1st year, a dynamic network of associations, the possibility of going abroad every year, free tutoring, professional projects with real companies, a network of 6,000 alumni with a wide range of experience...",
          "rangep": "31 000",
          "alumni": "",
          "nostu": "1,700",
          "nointrstu": "20%",
          "rank1": "-",
          "rank2": "-",
          "rank3": "-"
        },
        {
          "name": "Le Cordon Blue ",
          "descr": "Paris is the ideal location choice for studying culinary arts and techniques, guaranteeing an unforgettable cultural experience in the world capital of gastronomy, fashion and luxury. Take the first steps towards your ambitions at our new campus in the heart of Paris and be inspired to develop your passion for the culinary arts and hospitality management under the supervision of our prestigious Chefs and teachers.\n\nLocated by the Seine River and close to the Eiffel Tower, Le Cordon Bleu Paris features state of the art facilities providing the latest and most innovative opportunities in culinary and hospitality management.",
          "rangep": "",
          "alumni": "",
          "nostu": "",
          "nointrstu": "-",
          "rank1": "-",
          "rank2": "-",
          "rank3": "-"
        },
        {
          "name": "Atelier Chardon Savard",
          "descr": "At Atelier Chardon Savard fashion design and styling school, we are training our students to devellop their own personality, to increase their knowledge in the field of fashion, design and the arts, to experience and master the indispensable know-hows of the fashion industry. \nWith a trained team of teachers and various experts in their field to support each step of the learning process, our experienced staff is constantly guiding and following  our students through the various projects, courses and experiments they have to complete.",
          "rangep": "",
          "alumni": "",
          "nostu": "",
          "nointrstu": "-",
          "rank1": "-",
          "rank2": "-",
          "rank3": "-"
        },
        {
          "name": "Montpellier BS",
          "descr": "Founded in 1897 and member of the eminent French Conference des Grandes Ecoles, Montpellier Business School (MBS) holds the three prestigious international accreditations AACSB, EQUIS and AMBA, a recognition of its academic quality.\r\nIt has been continuously ranked in the Financial Times\u2019 Best Masters in Management rankings since 2012.\r\n",
          "rangep": "40.000 \u20ac - 43.000 \u20ac",
          "alumni": "over 20 000 (Linkedin)",
          "nostu": "3,600\t",
          "nointrstu": "over 1000",
          "rank1": "69",
          "rank2": "13",
          "rank3": "150"
        },
        {
          "name": "YSCHOOLS",
          "descr": "In more than 25 years, Groupe ESC Troyes has developed by exploring new and differentiating paths around 3 founding axes: transversality, entrepreneurial innovation and social and environmental responsibility. This policy of developing our institution through experimentation and innovation has enabled us to be recognized in the following areas of expertise: management, tourism, design, paramedical, social, innovation and entrepreneurship.\r\nIn 2018, Groupe ESC Troyes became Y SCHOOLS. Discover our ecosystem!",
          "rangep": "under 40 000 euros",
          "alumni": "+ 11 000",
          "nostu": "1,800",
          "nointrstu": "600",
          "rank1": "none",
          "rank2": "30",
          "rank3": "31"
        }
      ];

      schoolsList.forEach((element) {
        schools
            .add(Schools.fromJson(element).toMap())
            .then((value) => print("School Added"))
            .catchError((error) => print("Failed to add school: $error"));
      });
    } catch (e) {
      print(e.toString());
      return 0.toString();
    }
  }

  Future<void> populateTask() async {
    try {
      List<Map<String, dynamic>> taskList = [
        {
          "ID": 16,
          "content": "ftyftufgfu yif-t ",
          "checked": "0",
          "due_date": "Jul 29, 2020",
          "date": "Jul\/20\/2020"
        },
        {
          "ID": 17,
          "content": "salut la team",
          "checked": "0",
          "due_date": "Jul 21, 2020",
          "date": "Jul\/20\/2020"
        },
        {
          "ID": 18,
          "content": "upload cv",
          "checked": "0",
          "due_date": "Jul 23, 2020",
          "date": "Jul\/22\/2020"
        },
        {
          "ID": 19,
          "content": "dz",
          "checked": "0",
          "due_date": "",
          "date": "Jul\/22\/2020"
        },
        {
          "ID": 20,
          "content": "fezfz",
          "checked": "0",
          "due_date": "",
          "date": "Jul\/22\/2020"
        },
        {
          "ID": 21,
          "content": "fzfe\u00e9fe\u00e9",
          "checked": "0",
          "due_date": "Jul 23, 2020",
          "date": "Jul\/22\/2020"
        },
        {
          "ID": 22,
          "content": "vdvzvz",
          "checked": "0",
          "due_date": "",
          "date": "Jul\/22\/2020"
        },
        {
          "ID": 23,
          "content": "yes ok then",
          "checked": "0",
          "due_date": "Jul 31, 2020",
          "date": "Jul\/22\/2020"
        },
        {
          "ID": 24,
          "content": "mohamed is beautiful",
          "checked": "0",
          "due_date": "Aug 12, 2020",
          "date": "Jul\/22\/2020"
        },
        {
          "ID": 25,
          "content": "salut les amis",
          "checked": "0",
          "due_date": "Jul 30, 2020",
          "date": "Jul\/22\/2020"
        }
      ];

      taskList.forEach((element) {
        task
            .add(Task.fromJson(element).toMap())
            .then((value) => print("Task Added"))
            .catchError((error) => print("Failed to add task: $error"));
      });
    } catch (e) {
      print(e.toString());
      return 0.toString();
    }
  }

  Future<void> populateTaskLink() async {
    try {
      List<Map<String, dynamic>> taskLinkList = [
        {
          "user": "dorian123",
          "ID_TL": "16"
        },
        {
          "user": "dorian123",
          "ID_TL": "17"
        },
        {
          "user": "dorian123",
          "ID_TL": "18"
        },
        {
          "user": "dorian123",
          "ID_TL": "19"
        },
        {
          "user": "dorian123",
          "ID_TL": "20"
        },
        {
          "user": "souhila",
          "ID_TL": "21"
        },
        {
          "user": "timburton",
          "ID_TL": "22"
        },
        {
          "user": "dorian123",
          "ID_TL": "23"
        },
        {
          "user": "dorian123",
          "ID_TL": "24"
        }
      ];

      taskLinkList.forEach((element) {
        taskLink
            .add(TaskLink.fromJson(element).toMap())
            .then((value) => print("Task Link Added"))
            .catchError((error) => print("Failed to add task link: $error"));
      });
    } catch (e) {
      print(e.toString());
      return 0.toString();
    }
  }

  Future<void> populateTypes() async {
    try {
      List<Map<String, dynamic>> typesList = [
        {
          "type": "Agriculture & Forestry"
        },
        {
          "type": "Applied Sciences & Professions "
        },
        {
          "type": "Arts, Design & Architecture "
        },
        {
          "type": "Bachelors in Hospitality, Leisure & Sports"
        },
        {
          "type": "Business & Management"
        },
        {
          "type": "Computer Science & IT"
        },
        {
          "type": "Engineering & Technology"
        },
        {
          "type": "Environmental Studies & Earth Sciences"
        },
        {
          "type": "Hospitality, Leisure & Sports"
        },
        {
          "type": "Medicine & Health"
        },
        {
          "type": "Social Sciences"
        }
      ];

      typesList.forEach((element) {
        types
            .add(Types.fromJson(element).toMap())
            .then((value) => print("Types Added"))
            .catchError((error) => print("Failed to add types: $error"));
      });
    } catch (e) {
      print(e.toString());
      return 0.toString();
    }
  }

  Future<void> populateUsersChat() async {
    try {
      List<Map<String, dynamic>> usersChatList = [
        {
          "msg_id": "1",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "",
          "msg_status": "read",
          "msg_date": "2020-06-18 16:35:40"
        },
        {
          "msg_id": "2",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "",
          "msg_status": "read",
          "msg_date": "2020-06-18 16:38:23"
        },
        {
          "msg_id": "3",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "hola",
          "msg_status": "read",
          "msg_date": "2020-06-18 16:39:49"
        },
        {
          "msg_id": "4",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "bb",
          "msg_status": "read",
          "msg_date": "2020-06-18 16:41:25"
        },
        {
          "msg_id": "5",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "bb",
          "msg_status": "read",
          "msg_date": "2020-06-18 16:42:15"
        },
        {
          "msg_id": "6",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "bb",
          "msg_status": "read",
          "msg_date": "2020-06-18 16:58:22"
        },
        {
          "msg_id": "7",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "hola",
          "msg_status": "read",
          "msg_date": "2020-06-18 17:02:17"
        },
        {
          "msg_id": "8",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hola",
          "msg_status": "read",
          "msg_date": "2020-06-18 21:17:25"
        },
        {
          "msg_id": "9",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "hola",
          "msg_status": "read",
          "msg_date": "2020-06-18 21:19:44"
        },
        {
          "msg_id": "10",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "i love you",
          "msg_status": "read",
          "msg_date": "2020-06-18 21:20:24"
        },
        {
          "msg_id": "11",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "",
          "msg_status": "read",
          "msg_date": "2020-06-18 22:02:55"
        },
        {
          "msg_id": "12",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "test",
          "msg_status": "read",
          "msg_date": "2020-06-18 22:03:52"
        },
        {
          "msg_id": "14",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "hi",
          "msg_status": "read",
          "msg_date": "2020-06-18 22:58:46"
        },
        {
          "msg_id": "15",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-06-18 23:28:06"
        },
        {
          "msg_id": "16",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hi",
          "msg_status": "read",
          "msg_date": "2020-06-18 23:29:51"
        },
        {
          "msg_id": "17",
          "sender_username": "S_Admin",
          "receiver_username": "cc",
          "msg_content": "hellooooo",
          "msg_status": "read",
          "msg_date": "2020-06-18 23:33:14"
        },
        {
          "msg_id": "18",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "asap",
          "msg_status": "read",
          "msg_date": "2020-06-18 23:34:49"
        },
        {
          "msg_id": "19",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "how are you",
          "msg_status": "read",
          "msg_date": "2020-06-19 15:17:13"
        },
        {
          "msg_id": "20",
          "sender_username": "qw",
          "receiver_username": "S_Admin",
          "msg_content": "my name",
          "msg_status": "read",
          "msg_date": "2020-06-19 15:38:43"
        },
        {
          "msg_id": "21",
          "sender_username": "qw",
          "receiver_username": "S_Admin",
          "msg_content": "my name",
          "msg_status": "read",
          "msg_date": "2020-06-19 15:39:55"
        },
        {
          "msg_id": "22",
          "sender_username": "S_Admin",
          "receiver_username": "qw",
          "msg_content": "zdiceoc,ecnre",
          "msg_status": "read",
          "msg_date": "2020-06-19 15:41:24"
        },
        {
          "msg_id": "23",
          "sender_username": "qw",
          "receiver_username": "S_Admin",
          "msg_content": "my name",
          "msg_status": "read",
          "msg_date": "2020-06-19 15:41:41"
        },
        {
          "msg_id": "24",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "my name",
          "msg_status": "read",
          "msg_date": "2020-06-19 15:47:20"
        },
        {
          "msg_id": "25",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-06-26 14:14:20"
        },
        {
          "msg_id": "26",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-06-26 14:16:25"
        },
        {
          "msg_id": "27",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-06-26 14:18:14"
        },
        {
          "msg_id": "28",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-06-26 14:19:36"
        },
        {
          "msg_id": "29",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-06-26 14:21:01"
        },
        {
          "msg_id": "30",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-06-26 14:21:58"
        },
        {
          "msg_id": "31",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-06-26 14:24:39"
        },
        {
          "msg_id": "32",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-06-26 14:25:17"
        },
        {
          "msg_id": "33",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-06-26 14:28:54"
        },
        {
          "msg_id": "34",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-06-26 14:30:57"
        },
        {
          "msg_id": "35",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-06-26 14:33:16"
        },
        {
          "msg_id": "36",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-06-26 14:34:11"
        },
        {
          "msg_id": "37",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-06-26 14:35:20"
        },
        {
          "msg_id": "38",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-06-26 14:37:10"
        },
        {
          "msg_id": "39",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-06-26 14:38:08"
        },
        {
          "msg_id": "40",
          "sender_username": "S_Admin",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-06-26 14:41:01"
        },
        {
          "msg_id": "41",
          "sender_username": "S_Admin",
          "receiver_username": "cc",
          "msg_content": " ",
          "msg_status": "read",
          "msg_date": "2020-06-27 19:01:40"
        },
        {
          "msg_id": "43",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": " ",
          "msg_status": "read",
          "msg_date": "2020-06-27 19:05:55"
        },
        {
          "msg_id": "44",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": " ",
          "msg_status": "read",
          "msg_date": "2020-06-27 19:08:48"
        },
        {
          "msg_id": "45",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "coucou",
          "msg_status": "read",
          "msg_date": "2020-06-27 19:15:17"
        },
        {
          "msg_id": "46",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "coucou",
          "msg_status": "read",
          "msg_date": "2020-06-27 19:16:06"
        },
        {
          "msg_id": "48",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "bro",
          "msg_status": "read",
          "msg_date": "2020-06-27 19:30:49"
        },
        {
          "msg_id": "49",
          "sender_username": "S_Admin",
          "receiver_username": "dorian123",
          "msg_content": "what can i help u for",
          "msg_status": "read",
          "msg_date": "2020-06-27 19:36:52"
        },
        {
          "msg_id": "50",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "kar",
          "msg_status": "read",
          "msg_date": "2020-06-27 19:47:24"
        },
        {
          "msg_id": "51",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "te amo mama",
          "msg_status": "read",
          "msg_date": "2020-06-28 01:47:23"
        },
        {
          "msg_id": "53",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "ddjjd ciue,dco,ei ijnozojdoeozroooo zoooooooooooooo ooooooooo ooooooooooooooo ooooooooooooo",
          "msg_status": "read",
          "msg_date": "2020-06-28 03:19:13"
        },
        {
          "msg_id": "54",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-06-28 22:06:50"
        },
        {
          "msg_id": "55",
          "sender_username": "S_Admin",
          "receiver_username": "dorian123",
          "msg_content": "bitch",
          "msg_status": "read",
          "msg_date": "2020-06-28 23:24:36"
        },
        {
          "msg_id": "56",
          "sender_username": "S_Admin",
          "receiver_username": "dorian123",
          "msg_content": "everythiing is ugly ",
          "msg_status": "read",
          "msg_date": "2020-06-30 20:36:24"
        },
        {
          "msg_id": "57",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "lol",
          "msg_status": "read",
          "msg_date": "2020-07-01 03:52:45"
        },
        {
          "msg_id": "58",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "efrsde",
          "msg_status": "read",
          "msg_date": "2020-07-03 15:39:35"
        },
        {
          "msg_id": "59",
          "sender_username": "S_Admin",
          "receiver_username": "dorian123",
          "msg_content": "efrsde",
          "msg_status": "read",
          "msg_date": "2020-07-03 15:40:16"
        },
        {
          "msg_id": "60",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-07-09 20:06:34"
        },
        {
          "msg_id": "61",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "cdcd",
          "msg_status": "read",
          "msg_date": "2020-07-09 20:19:59"
        },
        {
          "msg_id": "62",
          "sender_username": "cc",
          "receiver_username": "",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-07-09 20:22:30"
        },
        {
          "msg_id": "63",
          "sender_username": "cc",
          "receiver_username": "",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-07-09 20:45:49"
        },
        {
          "msg_id": "64",
          "sender_username": "cc",
          "receiver_username": "",
          "msg_content": "ola",
          "msg_status": "read",
          "msg_date": "2020-07-09 20:46:33"
        },
        {
          "msg_id": "65",
          "sender_username": "cc",
          "receiver_username": "",
          "msg_content": "gg",
          "msg_status": "read",
          "msg_date": "2020-07-09 20:47:05"
        },
        {
          "msg_id": "66",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "helloo",
          "msg_status": "read",
          "msg_date": "2020-07-09 20:59:09"
        },
        {
          "msg_id": "67",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "meb",
          "msg_status": "read",
          "msg_date": "2020-07-09 21:02:11"
        },
        {
          "msg_id": "68",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-07-10 02:19:28"
        },
        {
          "msg_id": "69",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-07-10 02:19:28"
        },
        {
          "msg_id": "70",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "ola",
          "msg_status": "read",
          "msg_date": "2020-07-10 02:19:34"
        },
        {
          "msg_id": "71",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "beb",
          "msg_status": "read",
          "msg_date": "2020-07-10 02:20:07"
        },
        {
          "msg_id": "72",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "br",
          "msg_status": "read",
          "msg_date": "2020-07-10 02:22:36"
        },
        {
          "msg_id": "73",
          "sender_username": "S_Admin",
          "receiver_username": "",
          "msg_content": "br",
          "msg_status": "read",
          "msg_date": "2020-07-10 02:23:37"
        },
        {
          "msg_id": "74",
          "sender_username": "S_Admin",
          "receiver_username": "mariaroulet",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-07-10 02:23:52"
        },
        {
          "msg_id": "75",
          "sender_username": "S_Admin",
          "receiver_username": "mariaroulet",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-07-10 02:23:59"
        },
        {
          "msg_id": "76",
          "sender_username": "S_Admin",
          "receiver_username": "mariaroulet",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-07-10 02:25:52"
        },
        {
          "msg_id": "77",
          "sender_username": "S_Admin",
          "receiver_username": "dorian123",
          "msg_content": "123",
          "msg_status": "read",
          "msg_date": "2020-07-10 02:26:26"
        },
        {
          "msg_id": "78",
          "sender_username": "S_Admin",
          "receiver_username": "dorian123",
          "msg_content": "hello",
          "msg_status": "read",
          "msg_date": "2020-07-10 02:46:50"
        },
        {
          "msg_id": "79",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "14",
          "msg_status": "read",
          "msg_date": "2020-07-10 02:49:26"
        },
        {
          "msg_id": "80",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "15",
          "msg_status": "read",
          "msg_date": "2020-07-10 02:50:47"
        },
        {
          "msg_id": "81",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "16",
          "msg_status": "read",
          "msg_date": "2020-07-10 02:53:59"
        },
        {
          "msg_id": "82",
          "sender_username": "S_Admin",
          "receiver_username": "dorian123",
          "msg_content": "17",
          "msg_status": "read",
          "msg_date": "2020-07-10 03:06:34"
        },
        {
          "msg_id": "83",
          "sender_username": "S_Admin",
          "receiver_username": "dorian123",
          "msg_content": "18",
          "msg_status": "read",
          "msg_date": "2020-07-10 03:06:59"
        },
        {
          "msg_id": "84",
          "sender_username": "S_Admin",
          "receiver_username": "cc",
          "msg_content": "kk",
          "msg_status": "read",
          "msg_date": "2020-07-10 03:08:08"
        },
        {
          "msg_id": "85",
          "sender_username": "S_Admin",
          "receiver_username": "dorian123",
          "msg_content": "20",
          "msg_status": "read",
          "msg_date": "2020-07-10 03:13:59"
        },
        {
          "msg_id": "86",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "18",
          "msg_status": "read",
          "msg_date": "2020-07-10 03:17:16"
        },
        {
          "msg_id": "87",
          "sender_username": "S_Admin",
          "receiver_username": "mariaroulet",
          "msg_content": "jo",
          "msg_status": "read",
          "msg_date": "2020-07-10 12:05:36"
        },
        {
          "msg_id": "88",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "5516",
          "msg_status": "read",
          "msg_date": "2020-07-10 12:06:58"
        },
        {
          "msg_id": "89",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "15272",
          "msg_status": "read",
          "msg_date": "2020-07-10 12:09:19"
        },
        {
          "msg_id": "90",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "bro",
          "msg_status": "read",
          "msg_date": "2020-07-10 12:45:31"
        },
        {
          "msg_id": "91",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "123",
          "msg_status": "read",
          "msg_date": "2020-07-10 12:46:40"
        },
        {
          "msg_id": "92",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "15",
          "msg_status": "read",
          "msg_date": "2020-07-10 12:50:46"
        },
        {
          "msg_id": "93",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "12",
          "msg_status": "read",
          "msg_date": "2020-07-10 12:51:41"
        },
        {
          "msg_id": "94",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "18",
          "msg_status": "read",
          "msg_date": "2020-07-10 12:51:45"
        },
        {
          "msg_id": "95",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "20",
          "msg_status": "read",
          "msg_date": "2020-07-10 12:51:48"
        },
        {
          "msg_id": "96",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "23",
          "msg_status": "read",
          "msg_date": "2020-07-10 12:59:19"
        },
        {
          "msg_id": "97",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "24",
          "msg_status": "read",
          "msg_date": "2020-07-10 12:59:22"
        },
        {
          "msg_id": "98",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "25",
          "msg_status": "read",
          "msg_date": "2020-07-10 12:59:25"
        },
        {
          "msg_id": "99",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "broooo",
          "msg_status": "read",
          "msg_date": "2020-07-13 02:51:22"
        },
        {
          "msg_id": "100",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "1542",
          "msg_status": "read",
          "msg_date": "2020-07-13 02:51:31"
        },
        {
          "msg_id": "101",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "hiiii",
          "msg_status": "read",
          "msg_date": "2020-07-13 02:52:14"
        },
        {
          "msg_id": "102",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "1",
          "msg_status": "read",
          "msg_date": "2020-07-13 02:52:22"
        },
        {
          "msg_id": "103",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "2",
          "msg_status": "read",
          "msg_date": "2020-07-13 02:52:26"
        },
        {
          "msg_id": "104",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "2525",
          "msg_status": "read",
          "msg_date": "2020-07-13 02:54:26"
        },
        {
          "msg_id": "105",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "25254",
          "msg_status": "read",
          "msg_date": "2020-07-13 02:54:32"
        },
        {
          "msg_id": "106",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "22",
          "msg_status": "read",
          "msg_date": "2020-07-13 03:04:56"
        },
        {
          "msg_id": "107",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "54",
          "msg_status": "read",
          "msg_date": "2020-07-13 03:05:03"
        },
        {
          "msg_id": "108",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "0.25",
          "msg_status": "read",
          "msg_date": "2020-07-13 03:05:33"
        },
        {
          "msg_id": "109",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "nnn",
          "msg_status": "read",
          "msg_date": "2020-07-13 03:05:38"
        },
        {
          "msg_id": "110",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "uhuy",
          "msg_status": "read",
          "msg_date": "2020-07-13 03:05:42"
        },
        {
          "msg_id": "111",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "1551",
          "msg_status": "read",
          "msg_date": "2020-07-13 03:07:38"
        },
        {
          "msg_id": "112",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "79",
          "msg_status": "read",
          "msg_date": "2020-07-13 03:07:57"
        },
        {
          "msg_id": "113",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "7894*",
          "msg_status": "read",
          "msg_date": "2020-07-13 03:08:03"
        },
        {
          "msg_id": "114",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "33",
          "msg_status": "read",
          "msg_date": "2020-07-13 03:09:07"
        },
        {
          "msg_id": "115",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "22",
          "msg_status": "read",
          "msg_date": "2020-07-13 03:09:40"
        },
        {
          "msg_id": "116",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "wxq",
          "msg_status": "read",
          "msg_date": "2020-07-13 03:27:06"
        },
        {
          "msg_id": "117",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "22",
          "msg_status": "read",
          "msg_date": "2020-07-13 03:29:05"
        },
        {
          "msg_id": "118",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "23",
          "msg_status": "read",
          "msg_date": "2020-07-13 03:30:35"
        },
        {
          "msg_id": "119",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "23",
          "msg_status": "read",
          "msg_date": "2020-07-13 03:30:54"
        },
        {
          "msg_id": "120",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "25",
          "msg_status": "read",
          "msg_date": "2020-07-13 03:31:08"
        },
        {
          "msg_id": "121",
          "sender_username": "S_Admin",
          "receiver_username": "cc",
          "msg_content": "12",
          "msg_status": "read",
          "msg_date": "2020-07-13 04:21:21"
        },
        {
          "msg_id": "122",
          "sender_username": "S_Admin",
          "receiver_username": "cc",
          "msg_content": "2",
          "msg_status": "read",
          "msg_date": "2020-07-13 04:42:51"
        },
        {
          "msg_id": "123",
          "sender_username": "S_Admin",
          "receiver_username": "dorian123",
          "msg_content": "1",
          "msg_status": "read",
          "msg_date": "2020-07-13 04:43:30"
        },
        {
          "msg_id": "124",
          "sender_username": "S_Admin",
          "receiver_username": "dorian123",
          "msg_content": "2",
          "msg_status": "read",
          "msg_date": "2020-07-13 04:45:09"
        },
        {
          "msg_id": "125",
          "sender_username": "S_Admin",
          "receiver_username": "cc",
          "msg_content": "1",
          "msg_status": "read",
          "msg_date": "2020-07-13 05:11:31"
        },
        {
          "msg_id": "126",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "qiubo",
          "msg_status": "read",
          "msg_date": "2020-07-13 21:50:17"
        },
        {
          "msg_id": "127",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "bro",
          "msg_status": "read",
          "msg_date": "2020-07-13 21:50:23"
        },
        {
          "msg_id": "128",
          "sender_username": "S_Admin",
          "receiver_username": "cc",
          "msg_content": "bro",
          "msg_status": "read",
          "msg_date": "2020-07-14 15:23:39"
        },
        {
          "msg_id": "129",
          "sender_username": "S_Admin",
          "receiver_username": "eecere",
          "msg_content": "lol",
          "msg_status": "read",
          "msg_date": "2020-07-14 15:23:53"
        },
        {
          "msg_id": "130",
          "sender_username": "S_Admin",
          "receiver_username": "dorian123",
          "msg_content": "123",
          "msg_status": "read",
          "msg_date": "2020-07-17 15:08:28"
        },
        {
          "msg_id": "131",
          "sender_username": "cc",
          "receiver_username": "S_Admin",
          "msg_content": "hello*",
          "msg_status": "read",
          "msg_date": "2020-07-17 15:08:56"
        },
        {
          "msg_id": "132",
          "sender_username": "dorian123",
          "receiver_username": "S_Admin",
          "msg_content": "send",
          "msg_status": "read",
          "msg_date": "2020-07-17 15:09:22"
        },
        {
          "msg_id": "133",
          "sender_username": "eliebrosset",
          "receiver_username": "S_Admin",
          "msg_content": "i need help pls",
          "msg_status": "read",
          "msg_date": "2020-07-22 21:25:52"
        },
        {
          "msg_id": "134",
          "sender_username": "mario",
          "receiver_username": "S_Admin",
          "msg_content": "fjdfskddsj",
          "msg_status": "read",
          "msg_date": "2020-07-30 18:45:21"
        },
        {
          "msg_id": "135",
          "sender_username": "mario",
          "receiver_username": "S_Admin",
          "msg_content": "fjdfskddsj",
          "msg_status": "read",
          "msg_date": "2020-07-30 18:45:25"
        },
        {
          "msg_id": "136",
          "sender_username": "eliebrosset",
          "receiver_username": "mario",
          "msg_content": "dfkvfkf",
          "msg_status": "unread",
          "msg_date": "2020-07-30 18:45:51"
        },
        {
          "msg_id": "137",
          "sender_username": "eliebrosset",
          "receiver_username": "mario",
          "msg_content": "dfkvfkf",
          "msg_status": "unread",
          "msg_date": "2020-07-30 18:45:54"
        },
        {
          "msg_id": "138",
          "sender_username": "S_Admin",
          "receiver_username": "mario",
          "msg_content": "dvijsdkjvsdl",
          "msg_status": "read",
          "msg_date": "2020-07-30 18:48:37"
        },
        {
          "msg_id": "139",
          "sender_username": "S_Admin",
          "receiver_username": "mario",
          "msg_content": "dvijsdkjvsdl",
          "msg_status": "read",
          "msg_date": "2020-07-30 18:48:41"
        }
      ];

      usersChatList.forEach((element) {
        usersChat
            .add(UsersChat.fromJson(element).toMap())
            .then((value) => print("User chat Added"))
            .catchError((error) => print("Failed to add user chat: $error"));
      });
    } catch (e) {
      print(e.toString());
      return 0.toString();
    }
  }

  Future<void> populatePrograms() async {
    try {
      List<Map<String, dynamic>> programsList = [
        {
          "Name": "Bachelor of Computer Sciences",
          "Language": "English",
          "type": "Computer Science & IT",
          "city": "Paris",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "9,900",
          "intake": "Sept",
          "school": "EPITA"
        },
        {
          "Name": "Msc Computer Sciences",
          "Language": "English",
          "type": "Computer Science & IT",
          "city": "Paris",
          "level": "Msc",
          "length": "18 months",
          "fee": "12,900",
          "intake": "Sept, March",
          "school": "EPITA"
        },
        {
          "Name": "Msc Artificial Intelligence Systems",
          "Language": "English",
          "type": "Artificial Intelligence\n",
          "city": "Paris",
          "level": "Msc",
          "length": "2 years",
          "fee": "9,000",
          "intake": "Sept, March",
          "school": "EPITA"
        },
        {
          "Name": "Msc Artificial Intelligence for Marketing Strategy",
          "Language": "English",
          "type": "Artificial Intelligence\n",
          "city": "Paris",
          "level": "Msc",
          "length": "2 years",
          "fee": "9,000",
          "intake": "Sept, March",
          "school": "EPITA"
        },
        {
          "Name": "Master of Computer Engineering",
          "Language": "English",
          "type": "Computer Engineering\n",
          "city": "Paris",
          "level": "Master",
          "length": "2 years",
          "fee": "11,000",
          "intake": "Sept",
          "school": "EPITA"
        },
        {
          "Name": "MSc Communication System and Network Engineering",
          "Language": "English",
          "type": "Technology",
          "city": "Brest",
          "level": "Master",
          "length": "-",
          "fee": "5100",
          "intake": "-",
          "school": "IMT Atlantique"
        },
        {
          "Name": "MSc Architecture and Engineering for the\nInternet of Things",
          "Language": "English",
          "type": "Technology",
          "city": "Brest",
          "level": "Master",
          "length": "-",
          "fee": "5100",
          "intake": "-",
          "school": "IMT Atlantique"
        },
        {
          "Name": "MSc in Data Science ",
          "Language": "English",
          "type": "Technology",
          "city": "Brest",
          "level": "Master",
          "length": "-",
          "fee": "5100",
          "intake": "-",
          "school": "IMT Atlantique"
        },
        {
          "Name": "MSc in Management of Production, Logistics and Procurement",
          "Language": "English",
          "type": "Supply Chain",
          "city": "Nantes ",
          "level": "Master",
          "length": "-",
          "fee": "12000",
          "intake": "-",
          "school": "IMT Atlantique"
        },
        {
          "Name": "MSc in Process and Bioprocess Engineering",
          "Language": "English",
          "type": "Nuclear Engineering, Environemental",
          "city": "Nantes ",
          "level": "Master",
          "length": "-",
          "fee": "12000",
          "intake": "-",
          "school": "IMT Atlantique"
        },
        {
          "Name": "MSc in Nuclear Energy Production & Industrial Applications (NEPIA)",
          "Language": "English",
          "type": "Nuclear Engineering, Environemental",
          "city": "Nantes ",
          "level": "Master",
          "length": "-",
          "fee": "12000",
          "intake": "-",
          "school": "IMT Atlantique"
        },
        {
          "Name": "MSc in Advanced Nuclear Waste Management (ANWM)",
          "Language": "English",
          "type": "Nuclear Engineering,Environemental",
          "city": "Nantes ",
          "level": "Master",
          "length": "-",
          "fee": "12000",
          "intake": "-",
          "school": "IMT Atlantique"
        },
        {
          "Name": "Bachelor in Management",
          "Language": "English",
          "type": "Hospitality, tourism\nBusiness & Management\n",
          "city": "Toulouse",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "10,500",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "Bachelor in Management",
          "Language": "English",
          "type": "Hospitality, tourism\nBusiness & Management\n",
          "city": "Barcelona",
          "level": "Bachelor",
          "length": "-",
          "fee": "10,500",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "International Business",
          "city": "Barcelona",
          "level": "MIM",
          "length": "2 years",
          "fee": "14,300",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Toulouse",
          "level": "MIM",
          "length": "2 years",
          "fee": "14,300",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "MSc Financial Technology and Markets",
          "Language": "English",
          "type": "Finance",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "MSc Financial Technology and Markets",
          "Language": "English",
          "type": "Finance",
          "city": "Toulouse",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "MSc International Business ",
          "Language": "English",
          "type": "Business & Management",
          "city": "Barcelona",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "MSc International Business ",
          "Language": "English",
          "type": "Business & Management",
          "city": "Toulouse",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "MSc Entrepreneurship and Business Development",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Toulouse",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "MSc Strategic Innovation Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Toulouse ",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "MSc Controlling and Risk Management",
          "Language": "English",
          "type": "Business & Management\nFinance",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "MSc Banking and International Finance",
          "Language": "English",
          "type": "Finance",
          "city": "Toulouse ",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "MSc Management of Cultural and Creative Activities",
          "Language": "English",
          "type": "Arts, Design & Architecture\nBusiness & Management",
          "city": "Toulouse ",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "MSc Purchasing and Supply Chain Management",
          "Language": "English",
          "type": "Business & Management\nSupply Chain",
          "city": "Toulouse ",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "MSc Artificial Intelligence and Business Analytics",
          "Language": "English",
          "type": "Business & Management\nArtificial Intelligence\nBusiness Analytics",
          "city": "Toulouse ",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "MSc Business to Consumer Marketing (B2C)",
          "Language": "English",
          "type": "Business & Management\nMarketing",
          "city": "Toulouse ",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "MSc Aerospace Management",
          "Language": "English",
          "type": "Business & Management\nAeronautic",
          "city": "Toulouse",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "MSc Fashion and Luxury Marketing Management",
          "Language": "English",
          "type": "Business & Management\nLuxury, Fashion",
          "city": "Barcelona",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,500",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "MSc Consulting and Strategic Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Toulouse",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "MSc Corporate Finance",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Toulouse",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "TOULOUSE BUSINESS SCHOOL"
        },
        {
          "Name": "International BBA\n",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Marseille",
          "level": "Bachelor",
          "length": "4 years",
          "fee": "10,500",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Bordeaux",
          "level": "MIM",
          "length": "2 years",
          "fee": "13,500",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Marseille",
          "level": "MIM",
          "length": "2 years",
          "fee": "13,500",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "Msc Busines Engineering ",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Toulon",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,500",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "MSc Management Control and Reporting",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Marseille",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,500",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "Msc Arts & Creative Industries management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "19,900",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "MSc Banking & Finance",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Bordeaux",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,500",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "Msc Digital Marketing & sales",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Marseille",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,500",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "MSc Innovation Transformation Entrepreneurship",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Marseille",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,500",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "Msc Corporate Finance",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Marseille",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "19,900",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "MSc in Purchasing & Innovation Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Bordeaux",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,500",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "Msc Marketing",
          "Language": "English",
          "type": "Business & Management\n",
          "city": " Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,500",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "Msc Marketing",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Marseille",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,500",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "Msc Marketing",
          "Language": "English",
          "type": "Business & Management\n",
          "city": " Bordeaux",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,500",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "MSc in Global Supply Chain Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Bordeaux",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "19,900",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "Msc International Trade & Logistics",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Marseille",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "19,900",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "MSc Sustainable Finance",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,500",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "Msc International Business",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Marseille",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,500",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "Msc International Business",
          "Language": "English",
          "type": "Business & Management\n",
          "city": " Bordeaux",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,500",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "Msc International Business",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,500",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "Msc Sport - International sport & event management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Marseille",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,500",
          "intake": "Sept",
          "school": "KEDGE BS"
        },
        {
          "Name": "Bachelor of Business Administration",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "9,950",
          "intake": "Sept",
          "school": "PARIS SCHOOL OF BUSINESS"
        },
        {
          "Name": "MSc in Arts & Cultural Management    ",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "18,000",
          "intake": "Sept",
          "school": "PARIS SCHOOL OF BUSINESS"
        },
        {
          "Name": "MSc in Hospitality & Tourism Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "13,500",
          "intake": "Sept",
          "school": "PARIS SCHOOL OF BUSINESS"
        },
        {
          "Name": "MSc in International Finance",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "13,500",
          "intake": "Sept",
          "school": "PARIS SCHOOL OF BUSINESS"
        },
        {
          "Name": "MSc in International Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "13,250",
          "intake": "Sept",
          "school": "PARIS SCHOOL OF BUSINESS"
        },
        {
          "Name": "MSc in Luxury & Fashion Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "13,250",
          "intake": "Sept",
          "school": "PARIS SCHOOL OF BUSINESS"
        },
        {
          "Name": "MSc in Purchasing & Supply Chain Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "19,950",
          "intake": "Sept",
          "school": "PARIS SCHOOL OF BUSINESS"
        },
        {
          "Name": "MSc in Marketing Strategy & Data Analytics",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "13,250",
          "intake": "Sept",
          "school": "PARIS SCHOOL OF BUSINESS"
        },
        {
          "Name": "MSc in International Marketing and Business Development",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "13,250",
          "intake": "Sept",
          "school": "PARIS SCHOOL OF BUSINESS"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Nantes",
          "level": "MIM",
          "length": "2 years",
          "fee": "14,875",
          "intake": "Sept",
          "school": "AUDENCIA"
        },
        {
          "Name": "Msc International Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Nantes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "18,000",
          "intake": "Sept",
          "school": "AUDENCIA"
        },
        {
          "Name": "Msc in Management-engineering",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Nantes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "22,000",
          "intake": "Sept",
          "school": "AUDENCIA"
        },
        {
          "Name": "Msc in Food & Agribusiness Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Nantes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,000",
          "intake": "Sept",
          "school": "AUDENCIA"
        },
        {
          "Name": "Msc in Supply Chain and Purchasing Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Nantes",
          "level": "Msc",
          "length": "18 months",
          "fee": "17,500",
          "intake": "Sept",
          "school": "AUDENCIA"
        },
        {
          "Name": "Msc in Cognac and Spirits Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Nantes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,000",
          "intake": "Sept",
          "school": "AUDENCIA"
        },
        {
          "Name": "Msc in Financial Technology & Risk Control",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Nantes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "22,000",
          "intake": "Sept",
          "school": "AUDENCIA"
        },
        {
          "Name": "Bachelor of International Business Administration (BIBA)",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Montpellier",
          "level": "Bachelor",
          "length": "4 years",
          "fee": "8,250",
          "intake": "Sept",
          "school": "Montpellier BS"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Montpellier",
          "level": "MIM",
          "length": "2 years",
          "fee": "13,000",
          "intake": "Sept",
          "school": "Montpellier BS"
        },
        {
          "Name": "Msc Finance",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Montpellier",
          "level": "Msc",
          "length": "18 months",
          "fee": "13,900",
          "intake": "Sept",
          "school": "Montpellier BS"
        },
        {
          "Name": "Msc Marketing",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Montpellier",
          "level": "Msc",
          "length": "18 months",
          "fee": "13,900",
          "intake": "Sept",
          "school": "Montpellier BS"
        },
        {
          "Name": "Msc Digital Transformation",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Montpellier",
          "level": "Msc",
          "length": "18 months",
          "fee": "13,900",
          "intake": "Sept",
          "school": "Montpellier BS"
        },
        {
          "Name": "Msc Business Excellence",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Montpellier",
          "level": "Msc",
          "length": "18 months",
          "fee": "13,900",
          "intake": "Sept",
          "school": "Montpellier BS"
        },
        {
          "Name": "Msc International Business",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Montpellier",
          "level": "Msc",
          "length": "18 months",
          "fee": "13,900",
          "intake": "Sept",
          "school": "Montpellier BS"
        },
        {
          "Name": "International Bachelor Ygrec in Modelling and Data Science",
          "Language": "English",
          "type": "Data science",
          "city": "Paris",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "10,000",
          "intake": "Sept",
          "school": "EISTI"
        },
        {
          "Name": "Master in Quantitative Finance and Risk Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Master",
          "length": "2 years",
          "fee": "14,000",
          "intake": "Sept",
          "school": "EISTI"
        },
        {
          "Name": "Data Analytics, Data Science, Data Architecture",
          "Language": "English",
          "type": "Data science",
          "city": "Paris",
          "level": "Master",
          "length": "2 years",
          "fee": "14,000",
          "intake": "Sept",
          "school": "EISTI"
        },
        {
          "Name": "Bachelor in International Management",
          "Language": "English",
          "type": "\nBusiness & Management",
          "city": "Clermont-Ferrand",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "7,500",
          "intake": "Sept",
          "school": "ESC CLERMONT"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Clermont-Ferrand",
          "level": "MIM",
          "length": "2 years",
          "fee": "9,250",
          "intake": "Sept",
          "school": "ESC CLERMONT"
        },
        {
          "Name": "MSc. in Corporate Finance and Fintech",
          "Language": "English",
          "type": "Finance",
          "city": "Clermont-Ferrand",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "11,500",
          "intake": "Sept",
          "school": "ESC CLERMONT"
        },
        {
          "Name": "MSc. in Project Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Clermont-Ferrand",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "11,500",
          "intake": "Sept",
          "school": "ESC CLERMONT"
        },
        {
          "Name": "MSc. in International Commerce & Digital Marketing",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Clermont-Ferrand",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "11,500",
          "intake": "Sept",
          "school": "ESC CLERMONT"
        },
        {
          "Name": "MSc. in Business Intelligence & Analytics",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Clermont-Ferrand",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "11,500",
          "intake": "Sept",
          "school": "ESC CLERMONT"
        },
        {
          "Name": "MSc. in Transforming Mobility \u2013 Business Models & Vehicles for the future",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Clermont-Ferrand",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "11,500",
          "intake": "Sept",
          "school": "ESC CLERMONT"
        },
        {
          "Name": "MSc. in Strategy & Design for the Anthropocene",
          "Language": "English",
          "type": "Business & Management",
          "city": "Clermont-Ferrand",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "11,500",
          "intake": "Sept",
          "school": "ESC CLERMONT"
        },
        {
          "Name": "MSc. in Purchasing & Supply Chain Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Clermont-Ferrand",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "11,500",
          "intake": "Sept",
          "school": "ESC CLERMONT"
        },
        {
          "Name": "Bachelor Global Bba",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Belo Horizonte (Brazil)",
          "level": "Bachelor",
          "length": "4 years",
          "fee": "12,500",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Bachelor Global Bba",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Raleigh (USA) \n",
          "level": "Bachelor",
          "length": "4 years",
          "fee": "12,500",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Bachelor Global Bba",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Sophia-Antipolis (France) \n",
          "level": "Bachelor",
          "length": "4 years",
          "fee": "12,500",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Sophia-Antipolis\n\n",
          "level": "MIM",
          "length": "2 years",
          "fee": "15,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris\n",
          "level": "MIM",
          "length": "2 years",
          "fee": "15,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Lille",
          "level": "MIM",
          "length": "2 years",
          "fee": "15,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc in 2 years",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Sophia-Antipolis\n",
          "level": "Msc",
          "length": "2 years",
          "fee": "15,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc in 2 years",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "2 years",
          "fee": "15,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Auditing, Management Accounting & Information Systems",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Corporate Financial Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris\n",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Corporate Financial Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Sophia-Antipolis\n",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Corporate Financial Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Belo Horizonte\n",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Corporate Financial Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "\nSuzhou",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Financial Markets & Investments",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Sophia-Antipolis\n",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "21,500",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Financial Markets & Investments",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris\n",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "21,500",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Financial Markets & Investments",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "\nRaleigh",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "21,500",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Digital Business, Data Analysis & Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Sophia-Antipolis",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc International Human Resources & Performance Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Project and Programme Management & Business Development",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "\nBelo Horizonte",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Project and Programme Management & Business Development",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris\n",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Project and Programme Management & Business Development",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Lille\n",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "\u200bMsc Strategic Event Management & Tourism Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Sophia-Antipolis",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Supply Chain Management & Purchasing\n",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Lille",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Digital Marketing",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Sophia-Antipolis",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Global Luxury and Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Sophia-Antipolis\n",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "25,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Global Luxury and Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Raleigh",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "25,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc International Marketing & Business Development",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris\n",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc International Marketing & Business Development",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Sophia-Antipolis\n",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc International Marketing & Business Development",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Belo Horizonte\n",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc International Marketing & Business Development",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "\nSuzhou",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Luxury & Fashion Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Sophia-Antipolis\n",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "19,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Luxury & Fashion Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Suzhou",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "19,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Luxury Hospitality & Innovation",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "25,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Artificial Intelligence for Business Transformation",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "25,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Business Consulting & Digital Transformation",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Sophia-Antipolis",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Entrepreneurship & Innovation",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Sophia-Antipolis\n",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Entrepreneurship & Innovation",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Suzhou",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc Entrepreneurship & Sustainable Design",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Sophia-Antipolis",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "25,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc International Business",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Raleigh\n",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc International Business",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris\n",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc International Business",
          "Language": "English",
          "type": "Business & Management\n",
          "city": " Brazil",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc International Business",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "\nSuzhou",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Msc International Strategy & Influence",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "17,000",
          "intake": "Sept",
          "school": "SKEMA"
        },
        {
          "Name": "Master Data & Security Science",
          "Language": "English",
          "type": "Computer Science & IT",
          "city": "Angers",
          "level": "Master",
          "length": "2 years",
          "fee": "8,100",
          "intake": "Sept",
          "school": "ESAIP"
        },
        {
          "Name": "",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Singapore",
          "level": "MBA",
          "length": "1 year",
          "fee": "46,000",
          "intake": "Sept",
          "school": "ESSEC"
        },
        {
          "Name": "Global MBA Luxury Brand Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris ",
          "level": "MBA",
          "length": "1 year",
          "fee": "46,000",
          "intake": "Sept",
          "school": "ESSEC"
        },
        {
          "Name": "Global MBA Luxury Brand Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris ",
          "level": "MBA",
          "length": "1 year",
          "fee": "46,000",
          "intake": "Sept",
          "school": "ESSEC"
        },
        {
          "Name": "Global MBA Strategy & Digital Leadership",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Singapore",
          "level": "MBA",
          "length": "1 year",
          "fee": "46,000",
          "intake": "Sept",
          "school": "ESSEC"
        },
        {
          "Name": "Global MBA Strategy & Digital Leadership",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "2 years",
          "fee": "17,500",
          "intake": "Sept",
          "school": "ESSEC"
        },
        {
          "Name": "MSc in Hospitality Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Executive Master",
          "length": "18 months ",
          "fee": "52,800",
          "intake": "Sept",
          "school": "ESSEC"
        },
        {
          "Name": "Executive MBA Essec& Mannheim  ( Part Time)",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Executive Master",
          "length": "18 months ",
          "fee": "47,500",
          "intake": "Sept",
          "school": "ESSEC"
        },
        {
          "Name": "Executive MBA ( Part Time)",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Executive Master",
          "length": "-",
          "fee": "-",
          "intake": "Sept",
          "school": "ESSEC"
        },
        {
          "Name": "Executive Master in Luxury Management and Design Innovation ( Part Time)",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Executive Master",
          "length": "-",
          "fee": "-",
          "intake": "Sept",
          "school": "ESSEC"
        },
        {
          "Name": "Executive Master in Strategy & Management of International Business (Part Time)",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "-",
          "length": "5 months",
          "fee": "-",
          "intake": "Sept",
          "school": "ESSEC"
        },
        {
          "Name": "Advanced Certificate-European Management Program- International Real Estate.",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "-",
          "length": "-",
          "fee": "-",
          "intake": "Sept",
          "school": "ESSEC"
        },
        {
          "Name": "Bachelor In Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "9,540",
          "intake": "Sept",
          "school": "ICN"
        },
        {
          "Name": "Bachelor In Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": " Nancy",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "9,540",
          "intake": "Sept",
          "school": "ICN"
        },
        {
          "Name": "Bachelor In Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Nuremberg",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "9,540",
          "intake": "Sept",
          "school": "ICN"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "MIM",
          "length": "2 years",
          "fee": "12,720",
          "intake": "Sept",
          "school": "ICN"
        },
        {
          "Name": "Msc Audit",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Nancy",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "10,740",
          "intake": "Sept",
          "school": "ICN"
        },
        {
          "Name": "Msc Creative and cultural industries management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Nancy",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "10,740",
          "intake": "Sept",
          "school": "ICN"
        },
        {
          "Name": "MSc in Digital transformation management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Berlin",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "10,740",
          "intake": "Sept",
          "school": "ICN"
        },
        {
          "Name": "MSc in Finance and risk management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Berlin",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "10,740",
          "intake": "Sept",
          "school": "ICN"
        },
        {
          "Name": "MSc in International business development",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Nancy",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "10,740",
          "intake": "Sept",
          "school": "ICN"
        },
        {
          "Name": "MSc in International management \u2013 MIEX",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Nancy",
          "level": "Msc",
          "length": "2 years",
          "fee": "17,900",
          "intake": "Sept",
          "school": "ICN"
        },
        {
          "Name": "MSc in Luxury and design management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Nancy",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "11,160",
          "intake": "Sept",
          "school": "ICN"
        },
        {
          "Name": "MSc in Luxury and design management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "11,160",
          "intake": "Sept",
          "school": "ICN"
        },
        {
          "Name": "MSc in Marketing and brand management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Berlin",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "10,740",
          "intake": "Sept",
          "school": "ICN"
        },
        {
          "Name": "Bachelor in International Business",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Lille",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "10,734",
          "intake": "Sept",
          "school": "IESEG"
        },
        {
          "Name": "Bachelor in International Business",
          "Language": "English",
          "type": "Business & Management\n",
          "city": " Paris",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "10,734",
          "intake": "Sept",
          "school": "IESEG"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "MIM",
          "length": "2 years",
          "fee": "11,480",
          "intake": "Sept",
          "school": "IESEG"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Lille",
          "level": "MIM",
          "length": "2 years",
          "fee": "11,480",
          "intake": "Sept",
          "school": "IESEG"
        },
        {
          "Name": "Msc Fashion Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "18,500",
          "intake": "Sept",
          "school": "IESEG"
        },
        {
          "Name": "MSc in International Business",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Lille",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "15,750",
          "intake": "Sept",
          "school": "IESEG"
        },
        {
          "Name": "MSc in International Business",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "15,750",
          "intake": "Sept",
          "school": "IESEG"
        },
        {
          "Name": "Msc International Business and Technology \nTechnology",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "IESEG"
        },
        {
          "Name": "Msc International Business Negotiation",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "15,000",
          "intake": "Sept",
          "school": "IESEG"
        },
        {
          "Name": "Msc Finance",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "IESEG"
        },
        {
          "Name": "Msc Banking, Capital Markets & Financial",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Lille",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "15,750",
          "intake": "Sept",
          "school": "IESEG"
        },
        {
          "Name": "Msc International Accounting, Audit & Control",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "15,750",
          "intake": "Sept",
          "school": "IESEG"
        },
        {
          "Name": "Msc Big Data Analytics for Business",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Lille",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "IESEG"
        },
        {
          "Name": "Msc Digital Marketing & CRM",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Lille",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,500",
          "intake": "Sept",
          "school": "IESEG"
        },
        {
          "Name": "MSc Business Analysis and Consulting",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,500",
          "intake": "Sept",
          "school": "IESEG"
        },
        {
          "Name": "International MBA",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "MBA",
          "length": "1 year",
          "fee": "28,000",
          "intake": "Sept",
          "school": "IESEG"
        },
        {
          "Name": "MBA in Leadership and Coding",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "MBA",
          "length": "1 year",
          "fee": "30,000",
          "intake": "Sept",
          "school": "IESEG"
        },
        {
          "Name": "Executive MBA",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "MBA",
          "length": "24 months",
          "fee": "39,000",
          "intake": "Sept",
          "school": "IESEG"
        },
        {
          "Name": "Bachelor in Business Administration",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "8,900",
          "intake": "Sept",
          "school": "IPAG"
        },
        {
          "Name": "Bachelor in Business Administration",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Nice",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "8,900",
          "intake": "Sept",
          "school": "IPAG"
        },
        {
          "Name": "Msc in Business Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Hanoi",
          "level": "Msc",
          "length": "18 months",
          "fee": "6,000",
          "intake": "Sept",
          "school": "IPAG"
        },
        {
          "Name": "Msc Project Management\n",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1 year",
          "fee": "10,000",
          "intake": "Sept",
          "school": "IPAG"
        },
        {
          "Name": "MBA Fashion Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "MBA",
          "length": "1 year",
          "fee": "10,000",
          "intake": "Sept",
          "school": "IPAG"
        },
        {
          "Name": "MBA Digital Transformation & Innovation Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "MBA",
          "length": "1 year",
          "fee": "10,000",
          "intake": "Sept",
          "school": "IPAG"
        },
        {
          "Name": "MBA Energy & Sustainability Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "MBA",
          "length": "1 year",
          "fee": "10,000",
          "intake": "Sept",
          "school": "IPAG"
        },
        {
          "Name": "MBA Luxury Brand Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "MBA",
          "length": "1 year",
          "fee": "10,000",
          "intake": "Sept",
          "school": "IPAG"
        },
        {
          "Name": "MBA International Business Development",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "MBA",
          "length": "1 year",
          "fee": "10,000",
          "intake": "Sept",
          "school": "IPAG"
        },
        {
          "Name": "MBA Finance & Investments",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "MBA",
          "length": "1 year",
          "fee": "10,000",
          "intake": "Sept",
          "school": "IPAG"
        },
        {
          "Name": "Bachelor IBPM",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rennes",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "9,000",
          "intake": "Sept",
          "school": "RENNES BUSINESS SCHOOL"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rennes",
          "level": "MIM",
          "length": "2 years",
          "fee": "13,000",
          "intake": "Sept",
          "school": "RENNES BUSINESS SCHOOL"
        },
        {
          "Name": "MSc in Strategic and Digital Marketing",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rennes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "18,200",
          "intake": "Sept",
          "school": "RENNES BUSINESS SCHOOL"
        },
        {
          "Name": "MSc in International Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rennes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "18,200",
          "intake": "Sept",
          "school": "RENNES BUSINESS SCHOOL"
        },
        {
          "Name": "MSc in Financial Data Intelligence",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rennes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "18,200",
          "intake": "Sept",
          "school": "RENNES BUSINESS SCHOOL"
        },
        {
          "Name": "MSc in Supply Chain Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rennes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "18,200",
          "intake": "Sept",
          "school": "RENNES BUSINESS SCHOOL"
        },
        {
          "Name": "MSc in Innovation & Entrepreneurship",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rennes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "18,200",
          "intake": "Sept",
          "school": "RENNES BUSINESS SCHOOL"
        },
        {
          "Name": "MSc in International Human Resource Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rennes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "18,200",
          "intake": "Sept",
          "school": "RENNES BUSINESS SCHOOL"
        },
        {
          "Name": "MSc in International Finance",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rennes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "18,200",
          "intake": "Sept",
          "school": "RENNES BUSINESS SCHOOL"
        },
        {
          "Name": "MSc in Data and Business Analytics\n",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rennes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "18,200",
          "intake": "Sept",
          "school": "RENNES BUSINESS SCHOOL"
        },
        {
          "Name": "MSc in International Luxury and Brand Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rennes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "18,200",
          "intake": "Sept",
          "school": "RENNES BUSINESS SCHOOL"
        },
        {
          "Name": "Msc in Creative Project Management, Culture & Design",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rennes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "18,200",
          "intake": "Sept",
          "school": "RENNES BUSINESS SCHOOL"
        },
        {
          "Name": "MSc in Sports and Tourism Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rennes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "18,200",
          "intake": "Sept",
          "school": "RENNES BUSINESS SCHOOL"
        },
        {
          "Name": "MSc in Sustainable Management & Eco-Innovation",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rennes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "18,200",
          "intake": "Sept",
          "school": "RENNES BUSINESS SCHOOL"
        },
        {
          "Name": "MSc in International Negotiation & Business Development",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rennes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "18,200",
          "intake": "Sept",
          "school": "RENNES BUSINESS SCHOOL"
        },
        {
          "Name": "MSc in International Accounting, Management Control and Auditing",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rennes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "18,200",
          "intake": "Sept",
          "school": "RENNES BUSINESS SCHOOL"
        },
        {
          "Name": "MSc in Global Business Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rennes",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "18,200",
          "intake": "Sept",
          "school": "RENNES BUSINESS SCHOOL"
        },
        {
          "Name": "Global BBA \u2013 Bachelor in Business Administration",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Bachelor",
          "length": "4 years",
          "fee": "10,500",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "Global BBA \u2013 Bachelor in Business Administration",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Reims",
          "level": "Bachelor",
          "length": "4 years",
          "fee": "10,500",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "Global BBA \u2013 Bachelor in Business Administration",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rouen",
          "level": "Bachelor",
          "length": "4 years",
          "fee": "10,500",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Reims",
          "level": "MM",
          "length": "2 years",
          "fee": "14,750",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rouen",
          "level": "MM",
          "length": "2 years",
          "fee": "14,750",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "Msc International Master in Luxury Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Reims",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "19,500",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc Accounting, Auditing & Advisory",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rouen",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc Corporate Finance",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Reims",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc Corporate Finance",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rouen",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc Cultural and Creative Industries",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rouen",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc Digital Expertise for Marketing",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Reims",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc Finance, Investment and Wealth Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Reims",
          "level": "Msc",
          "length": "18 months",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc Entrepreneurship & Innovation",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Reims",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc Entrepreneurship & Innovation",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rouen",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc Financial Markets and technologies",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rouen",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc Financial Markets and technologies",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Reims",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc Global Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Reims",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc Human Resources and Consulting",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Reims",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc International Marketing and Brand Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Reims",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc International Marketing and Brand Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rouen",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc International Project Development",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rouen",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc Luxury Marketing",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc Marketing French Excellence",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rouen",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc Supply Chain Management",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rouen",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "MSc Wine & Gastronomy Marketing Savoir Faire and Terroir in a Disruptive and Digital World",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rouen",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "16,900",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "The Global Executive MBA",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Paris",
          "level": "MBA",
          "length": "1,5 years",
          "fee": "37,000",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "The Global Executive MBA",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Reims",
          "level": "MBA",
          "length": "1,5 years",
          "fee": "37,000",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "The Global Executive MBA",
          "Language": "English",
          "type": "Business & Management\n",
          "city": "Rouen",
          "level": "MBA",
          "length": "1,5 years",
          "fee": "37,000",
          "intake": "Sept",
          "school": "NEOMA"
        },
        {
          "Name": "Mechanical & Electrical Engineering Degree",
          "Language": "English",
          "type": "Engineering",
          "city": "Lyon",
          "level": "Bachelor",
          "length": "5 years",
          "fee": "7,480",
          "intake": "Sept",
          "school": "ECAM Lyon"
        },
        {
          "Name": "International Integrated Cycle (cii) - Technical Sciences & Technology",
          "Language": "English",
          "type": "Engineering & Technology",
          "city": "Paris",
          "level": "Bachelor",
          "length": "2 years",
          "fee": "7,650",
          "intake": "Sept",
          "school": "ISEP"
        },
        {
          "Name": "Master in Embedded Systems",
          "Language": "English",
          "type": "Engineering & Technology",
          "city": "Paris",
          "level": "Master",
          "length": "2 years",
          "fee": "9,080",
          "intake": "Sept",
          "school": "ISEP"
        },
        {
          "Name": "Master in Software Engineering",
          "Language": "English",
          "type": "Engineering & Technology",
          "city": "Paris",
          "level": "Master",
          "length": "2 years",
          "fee": "9,080",
          "intake": "Sept",
          "school": "ISEP"
        },
        {
          "Name": "Master in Wireless Telecommunication Systems and Iot",
          "Language": "English",
          "type": "Engineering & Technology",
          "city": "Paris",
          "level": "Master",
          "length": "2 years",
          "fee": "9,080",
          "intake": "Sept",
          "school": "ISEP"
        },
        {
          "Name": "Bachelor International Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Paris",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "7,000",
          "intake": "Sept",
          "school": "EM NORMANDIE"
        },
        {
          "Name": "Bachelor International Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Le Havre",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "7,000",
          "intake": "Sept",
          "school": "EM NORMANDIE"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Paris",
          "level": "MIM",
          "length": "2 years",
          "fee": "11,000",
          "intake": "Sept",
          "school": "EM NORMANDIE"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management",
          "city": " Le Havre",
          "level": "MIM",
          "length": "2 years",
          "fee": "11,000",
          "intake": "Sept",
          "school": "EM NORMANDIE"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Caen",
          "level": "MIM",
          "length": "2 years",
          "fee": "11,000",
          "intake": "Sept",
          "school": "EM NORMANDIE"
        },
        {
          "Name": "MSc Artificial Intelligence for Marketing Strategy",
          "Language": "English",
          "type": "Business & Management",
          "city": "Paris",
          "level": "Msc",
          "length": "2 years",
          "fee": "9,700",
          "intake": "Sept",
          "school": "EM NORMANDIE"
        },
        {
          "Name": "MSc Financial Data Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Caen",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "12,500",
          "intake": "Sept, Jan",
          "school": "EM NORMANDIE"
        },
        {
          "Name": "MSc International Events Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "13,500",
          "intake": "Sept",
          "school": "EM NORMANDIE"
        },
        {
          "Name": "MSc International Logistics and Port Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Le Havre",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "12,500",
          "intake": "Sept, Jan",
          "school": "EM NORMANDIE"
        },
        {
          "Name": "MSc International Marketing and Business Development",
          "Language": "English",
          "type": "Business & Management",
          "city": "Caen",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "12,500",
          "intake": "Sept, Jan",
          "school": "EM NORMANDIE"
        },
        {
          "Name": "MSc Marketing and Digital in Luxury and Lifestyle",
          "Language": "English",
          "type": "Business & Management",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "13,500",
          "intake": "Sept",
          "school": "EM NORMANDIE"
        },
        {
          "Name": "MSc Banking, Finance and FinTech",
          "Language": "English",
          "type": "Business & Management",
          "city": "Oxford",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "13,500",
          "intake": "Sept",
          "school": "EM NORMANDIE"
        },
        {
          "Name": "MSc Supply Chain Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Le Havre",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "12,500",
          "intake": "Sept, Jan",
          "school": "EM NORMANDIE"
        },
        {
          "Name": "Master Equine Industry Sciences and Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Paris",
          "level": "Master",
          "length": "_",
          "fee": "12,500",
          "intake": "Sept ",
          "school": "EM NORMANDIE"
        },
        {
          "Name": "Master Equine Industry Sciences and Management",
          "Language": "English",
          "type": "Business & Management",
          "city": " Caen",
          "level": "Master",
          "length": "_",
          "fee": "12,500",
          "intake": "Sept ",
          "school": "EM NORMANDIE"
        },
        {
          "Name": "Bachelor of International Business",
          "Language": "English",
          "type": "Business & Management",
          "city": "Strasbourg",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "7,500",
          "intake": "Sept",
          "school": "EM NORMANDIE"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Strasbourg",
          "level": "MIM",
          "length": "2 years",
          "fee": "8,500",
          "intake": "Sept",
          "school": "EM NORMANDIE"
        },
        {
          "Name": "Bachelor Foundation Year",
          "Language": "English",
          "type": "Business & Management",
          "city": "La Rochelle",
          "level": "Bachelor",
          "length": "1 year",
          "fee": "7,155",
          "intake": "Sept, Jan",
          "school": "EXCELIA"
        },
        {
          "Name": "Bachelor First year",
          "Language": "English",
          "type": "Business & Management",
          "city": "Paris",
          "level": "Bachelor",
          "length": "1 year",
          "fee": "7,900",
          "intake": "Oct, Feb",
          "school": "EXCELIA"
        },
        {
          "Name": "Bachelor First year",
          "Language": "English",
          "type": "Business & Management",
          "city": "La Rochelle",
          "level": "Bachelor",
          "length": "1 year",
          "fee": "7,900",
          "intake": "Oct, Feb",
          "school": "EXCELIA"
        },
        {
          "Name": "Bachelor Business",
          "Language": "English",
          "type": "Business & Management",
          "city": "La Rochelle",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "8,600",
          "intake": "Sept, Jan",
          "school": "EXCELIA"
        },
        {
          "Name": "Bachelor Business",
          "Language": "English",
          "type": "Business & Management",
          "city": " Tours",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "8,600",
          "intake": "Sept, Jan",
          "school": "EXCELIA"
        },
        {
          "Name": "Bachelor Business",
          "Language": "English",
          "type": "Business & Management",
          "city": " Niort",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "8,600",
          "intake": "Sept, Jan",
          "school": "EXCELIA"
        },
        {
          "Name": "Bachelor Business",
          "Language": "English",
          "type": "Business & Management",
          "city": "Rochefort",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "8,600",
          "intake": "Sept, Jan",
          "school": "EXCELIA"
        },
        {
          "Name": "Bachelor Business",
          "Language": "English",
          "type": "Business & Management",
          "city": "Angoul\u00eame",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "8,600",
          "intake": "Sept, Jan",
          "school": "EXCELIA"
        },
        {
          "Name": "Bachelor in Tourism & Hospitality Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Tours",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "8,800",
          "intake": "Sept, Jan",
          "school": "EXCELIA"
        },
        {
          "Name": "Bachelor in Tourism & Hospitality Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "La Rochelle",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "8,800",
          "intake": "Sept, Jan",
          "school": "EXCELIA"
        },
        {
          "Name": "Bachelor of Business Administration",
          "Language": "English",
          "type": "Business & Management",
          "city": "La Rochelle",
          "level": "Bachelor",
          "length": "4 years",
          "fee": "11,100",
          "intake": "Sept, Jan",
          "school": "EXCELIA"
        },
        {
          "Name": "Bachelor of Business Administration",
          "Language": "English",
          "type": "Business & Management",
          "city": "Paris",
          "level": "Bachelor",
          "length": "4 years",
          "fee": "11,100",
          "intake": "Sept, Jan",
          "school": "EXCELIA"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "La Rochelle",
          "level": "MIM",
          "length": "2 years",
          "fee": "12,600",
          "intake": "Sept",
          "school": "EXCELIA"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Tours",
          "level": "MIM",
          "length": "2 years",
          "fee": "12,600",
          "intake": "Sept",
          "school": "EXCELIA"
        },
        {
          "Name": "Msc Audit and Consultancy",
          "Language": "English",
          "type": "Business & Management",
          "city": "La Rochelle",
          "level": "Msc",
          "length": "1 year",
          "fee": "15,500",
          "intake": "Sept",
          "school": "EXCELIA"
        },
        {
          "Name": "Msc Banking, Insurance, Wealth and Real Estate Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "La Rochelle",
          "level": "Msc",
          "length": "1 year",
          "fee": "15,500",
          "intake": "Sept",
          "school": "EXCELIA"
        },
        {
          "Name": "Msc Sustainable Development, Csr and Environment",
          "Language": "English",
          "type": "Business & Management",
          "city": "La Rochelle",
          "level": "Msc",
          "length": "1 year",
          "fee": "15,500",
          "intake": "Sept",
          "school": "EXCELIA"
        },
        {
          "Name": "Msc International Business Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "La Rochelle",
          "level": "Msc",
          "length": "1 year",
          "fee": "15,500",
          "intake": "Sept",
          "school": "EXCELIA"
        },
        {
          "Name": "Msc Purchasing and Supply Chain Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "La Rochelle",
          "level": "Msc",
          "length": "1 year",
          "fee": "15,500",
          "intake": "Sept",
          "school": "EXCELIA"
        },
        {
          "Name": "Msc Engineering Business Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "La Rochelle",
          "level": "Msc",
          "length": "1 year",
          "fee": "15,500",
          "intake": "Sept",
          "school": "EXCELIA"
        },
        {
          "Name": "Msc Global Luxury Management and Innovation",
          "Language": "English",
          "type": "Business & Management",
          "city": "Cognac",
          "level": "Msc",
          "length": "1 year",
          "fee": "17,500",
          "intake": "Sept",
          "school": "EXCELIA"
        },
        {
          "Name": "Msc Digital Marketing and Collaborative Strategies",
          "Language": "English",
          "type": "Business & Management",
          "city": "Niort",
          "level": "Msc",
          "length": "1 year",
          "fee": "15,500",
          "intake": "Sept",
          "school": "EXCELIA"
        },
        {
          "Name": "Msc International Hospitality Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "La Rochelle",
          "level": "Msc",
          "length": "1 year",
          "fee": "15,500",
          "intake": "Sept",
          "school": "EXCELIA"
        },
        {
          "Name": "Msc International Event Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "La Rochelle",
          "level": "Msc",
          "length": "1 year",
          "fee": "15,500",
          "intake": "Sept",
          "school": "EXCELIA"
        },
        {
          "Name": "MSc in Destination Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "La Rochelle",
          "level": "Msc",
          "length": "2 years",
          "fee": "11,200",
          "intake": "Sept, Jan",
          "school": "EXCELIA"
        },
        {
          "Name": "MSc in International Tourism and Destination Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Tours",
          "level": "Msc",
          "length": "15 months",
          "fee": "18,900",
          "intake": "Jan",
          "school": "EXCELIA"
        },
        {
          "Name": "Bachelor in International Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Paris",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "7,600",
          "intake": "Sept",
          "school": "ESSCA"
        },
        {
          "Name": "Bachelor in International Management",
          "Language": "English",
          "type": "Business & Management",
          "city": " Lyon",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "7,600",
          "intake": "Sept",
          "school": "ESSCA"
        },
        {
          "Name": "Bachelor in International Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Budapest",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "7,600",
          "intake": "Sept",
          "school": "ESSCA"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Paris",
          "level": "MIM",
          "length": "2 years",
          "fee": "11,000",
          "intake": "_",
          "school": "ESSCA"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management",
          "city": " Angers",
          "level": "MIM",
          "length": "2 years",
          "fee": "11,000",
          "intake": "_",
          "school": "ESSCA"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management",
          "city": " Lyon",
          "level": "MIM",
          "length": "2 years",
          "fee": "11,000",
          "intake": "_",
          "school": "ESSCA"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management",
          "city": " Budapest",
          "level": "MIM",
          "length": "2 years",
          "fee": "11,000",
          "intake": "_",
          "school": "ESSCA"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Shanghai",
          "level": "MIM",
          "length": "2 years",
          "fee": "11,000",
          "intake": "_",
          "school": "ESSCA"
        },
        {
          "Name": "MSc International Finance",
          "Language": "English",
          "type": "Business & Management",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "14,750",
          "intake": "Sept",
          "school": "ESSCA"
        },
        {
          "Name": "Msc Digital and Big Data for Value ",
          "Language": "English",
          "type": "Business & Management",
          "city": "Paris",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "14,750",
          "intake": "Sept",
          "school": "ESSCA"
        },
        {
          "Name": "Bachelor in Economics\n",
          "Language": "English",
          "type": "Business & Management",
          "city": "Lisbon",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "7,500",
          "intake": "Sept",
          "school": "Nova SBE"
        },
        {
          "Name": "Bachelor in Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Lisbon",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "7,500",
          "intake": "Sept",
          "school": "Nova SBE"
        },
        {
          "Name": "Bachelor in Aviation Management\n ",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "10,997",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Bachelor in International Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "11,990",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Bachelor in International Aviation Management\n ",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "Bachelor",
          "length": "3,5 years",
          "fee": "13,070",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Bachelor in Computer Sciences",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "11,000",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Bachelor in Computer Sciences",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "11,000",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Bachelor in Digital Business",
          "Language": "English",
          "type": "Business & Management",
          "city": " Bad Honnef",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "11,000",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Bachelor in Digital Business",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "11,000",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Bachelor in International Event Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "11,000",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Bachelor in Hospitality Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "11,000",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Bachelor in International Hospitality Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "Bachelor",
          "length": "3,5 years",
          "fee": "11,210",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Bachelor in International Marketing Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "11,000",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Bachelor in International Marketing Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin, Bad Honnef",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "11,000",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "MIM",
          "length": "2 years",
          "fee": "10,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in Big Data Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "1 year",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in Big Data Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "Master",
          "length": "1 year",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in Computer Science",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "1 year",
          "fee": "10,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in Computer Science",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "Master",
          "length": "1 year",
          "fee": "10,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in Engineering Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "1 year",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in Engineering Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "Master",
          "length": "1 year",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in International Finance & Accounting",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "1 year",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in International Finance & Accounting",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "Master",
          "length": "1 year",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in International HR Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "2 years",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in International HR Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "Master",
          "length": "2 years",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in International Marketing Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "1 year",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in International Marketing Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "Master",
          "length": "1 year",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in International Hospitality Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "1 year",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in International Hospitality Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "Master",
          "length": "1 year",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in International Health Care Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "1 year",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in International Health Care Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "Master",
          "length": "1 year",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in International Aviation Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "1 year",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in International Aviation Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "Master",
          "length": "1 year",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in IT Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "1 year",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in IT Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "Master",
          "length": "1 year",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in Transport & Logistics Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "1 year",
          "fee": "10,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Master in IT Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "Master",
          "length": "1 year",
          "fee": "12,580",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "MBA ",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "MBA",
          "length": "1,5 years",
          "fee": "17,390",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "MBA ",
          "Language": "English",
          "type": "Business & Management",
          "city": "Bad Honnef",
          "level": "MBA",
          "length": "1,5 years",
          "fee": "17,390",
          "intake": "Oct, April",
          "school": "IUBH"
        },
        {
          "Name": "Bachelor ADVERTISING & BRAND COMMUNICATION",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor ",
          "length": "3,5",
          "fee": "8,730",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "Bachelor AUDIO DESIGN",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor ",
          "length": "3,5",
          "fee": "8,730",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "Bachelor CREATIVE INDUSTRIES MANAGEMENT",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor ",
          "length": "3,5",
          "fee": "8,730",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "Bachelor DEVELOPER FOR DIGITAL SERVICES AND PRODUCTS",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor ",
          "length": "3,5",
          "fee": "8,730",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "Bachelor INT. BUSINESS ADMINISTRATION \u2013 FAST TRACK",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor ",
          "length": "3",
          "fee": "9,894",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "Bachelor INT. BUSINESS ADMINISTRATION \u2013 INT. EXPERIENCE TRACK",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor ",
          "length": "3,5",
          "fee": "8,730",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "Bachelor INT. HOTEL MANAGEMENT",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor ",
          "length": "3,5",
          "fee": "8,730",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "Bachelor MUSIC PRODUCTION",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor ",
          "length": "3,5",
          "fee": "8,730",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "Bachelor PHOTOGRAPHY",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor ",
          "length": "3,5",
          "fee": "8,730",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "Bachelor POPULAR MUSIC",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor ",
          "length": "3,5",
          "fee": "8,730",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "MSc COMPUTER SCIENCE \u2013 BIG DATA AND ARTIFICIAL INTELLIGENCE",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "MSc",
          "length": "2",
          "fee": "12,513",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "MSc COMPUTER SCIENCE \u2013 FOCUS ON CYBER SECURITY",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "MSc",
          "length": "2",
          "fee": "12,513",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "M.A COMPUTING AND THE ARTS",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "M.A",
          "length": "2",
          "fee": "10,476",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "M.A ENGINEERING AND INT. BUSINESS \u2013\n\nRENEWABLE ENERGY, WATER AND WASTE MANAGEMENT",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "M.A.Eng.",
          "length": "2",
          "fee": "12,513",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "M.A ENGINEERING AND SUSTAINABLE TECHNOLOGY MANAGEMENT.\nFOCUS ON CIVIL ENGINEERING:\n\"SMART\" BUILDING INFRASTRUCTURE",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "M.A.Eng.",
          "length": "2",
          "fee": "12,513",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "M.A ENGINEERING AND SUSTAINABLE TECHNOLOGY MANAGEMENT.\nFOCUS ON INDUSTRY 4.0.: AUTOMATION, ROBOTICS & 3D\nMANUFACTURING",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "M.A. Eng.",
          "length": "2",
          "fee": "12,513",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "M.A ENGINEERING AND SUSTAINABLE TECHNOLOGY MANAGEMENT.\nFOCUS ON MOBILITY AND AUTOMOTIVE INDUSTRY",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "M.A. Eng.",
          "length": "2",
          "fee": "12,513",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "M.A ENTREPRENEURSHIP",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "M.A",
          "length": "2",
          "fee": "12,513",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "M.A FILM, TELEVISION AND DIGITAL NARRATIVES\n(JOINT PROJECT WITH POPULAR ARTS)",
          "Language": "English",
          "type": "Business & Management",
          "city": "DRESDEN",
          "level": "M.A.",
          "length": "2",
          "fee": "10,476",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "M.A HOSPITALITY MANAGEMENT & LEADERSHIP",
          "Language": "English",
          "type": "Business & Management",
          "city": "DRESDEN",
          "level": "M.A",
          "length": "2",
          "fee": "10,476",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "M.A INT. MANAGEMENT \u2013 TRIPARTITE WITH PARTNER UNIVERSITIES",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "M.A",
          "length": "2",
          "fee": "12,513",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "M.A INT. MANAGEMENT \u2013\nFOCUS ON CREATIVE LEADERSHIP",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "M.A",
          "length": "2",
          "fee": "12,513",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "M.A INT. BUSINESS & LEADERSHIP",
          "Language": "English",
          "type": "Business & Management",
          "city": "DRESDEN",
          "level": "M.A",
          "length": "2",
          "fee": "10,476",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "M.A INT. BUSINESS & LEADERSHIP",
          "Language": "English",
          "type": "Business & Management",
          "city": "HAMBURG",
          "level": "M.A",
          "length": "2",
          "fee": "12,513",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "M.A INT. ES MANAGEMENT \u2013 FOCUS ON CREATIVE MANAGEMENT",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "M.A",
          "length": "2",
          "fee": "10,476",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "M.A PHOTOGRAPHY",
          "Language": "English",
          "type": "Business & Management",
          "city": "HAMBURG",
          "level": "M.A",
          "length": "2",
          "fee": "10,476",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "M.A SOCIAL DESIGN & SUSTAINABLE INNOVATION",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "M.A",
          "length": "2",
          "fee": "10,476",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "MSc SOFTWARE ENGINEERING",
          "Language": "English",
          "type": "Business & Management",
          "city": "HAMBURG",
          "level": "MSc",
          "length": "2",
          "fee": "12,513",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "M.A STRATEGIC DESIGN",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "M.A",
          "length": "2",
          "fee": "10,476",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "MSc SUPPLY CHAIN MANAGEMENT",
          "Language": "English",
          "type": "Business & Management",
          "city": "HAMBURG",
          "level": "MSc",
          "length": "2",
          "fee": "12,513",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "MBA EXECUTIVE GENERAL MANAGEMENT Part-time",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "MBA",
          "length": "2",
          "fee": "7,566",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "MBA EXECUTIVE GENERAL MANAGEMENT",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "MBA",
          "length": "2",
          "fee": "14,550",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "MBA GENERAL MANAGEMENT",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "MBA",
          "length": "1,5",
          "fee": "13,968",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "MBA INT. HEALTHCARE MANAGEMENT",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "MBA",
          "length": "1,5",
          "fee": "13,968",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "MBA INT. HUMAN RESOURCE MANAGEMENT",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "MBA",
          "length": "1,5",
          "fee": "13,968",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "MBA MARKETING INTELLIGENCE",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "MBA",
          "length": "1,5",
          "fee": "13,968",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "MBA SUSTAINABLE INNOVATION AND ENTREPRENEURSHIP",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "MBA",
          "length": "1,5",
          "fee": "13,968",
          "intake": "Sept",
          "school": "SRH Germany"
        },
        {
          "Name": "Bachelor in Communication Design",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "12,110",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Bachelor in Game Design",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "12,110",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Bachelor in Film + Motion Design",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "12,110",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Bachelor in Photography",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "12,110",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Bachelor in Illustration",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "12,110",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Bachelor in Business & Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "11,340",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Bachelor in Business & Management",
          "Language": "English",
          "type": "Business & Management",
          "city": " Hamburg",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "11,340",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Bachelor in Business & Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Iserlohn",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "11,340",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Bachelor in Digital Business & Data Science",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "11,340",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Bachelor in Digital Business & Data Science",
          "Language": "English",
          "type": "Business & Management",
          "city": "Hamburg",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "11,340",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Bachelor in Digital Media & Marketing",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "11,340",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Bachelor in Digital Media & Marketing",
          "Language": "English",
          "type": "Business & Management",
          "city": " Hamburg",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "11,340",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Bachelor in Digital Media & Marketing",
          "Language": "English",
          "type": "Business & Management",
          "city": "Iserlohn",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "11,340",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Bachelor in Sport & Event Management ",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Bachelor",
          "length": "3 years",
          "fee": "11,340",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Master Corporate Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "2 years",
          "fee": "13,188",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Master in Finance and Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "2 years",
          "fee": "13,188",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Master in International Sport & Event Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "2 years",
          "fee": "13,188",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Master in Smart City Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "2 years",
          "fee": "13,188",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Master in Smart City Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Hamburg",
          "level": "Master",
          "length": "2 years",
          "fee": "13,188",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Master in Photography",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "1,5 years",
          "fee": "18,900",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Master in Media spaces",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "1,5 years",
          "fee": "18,900",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Master in Innovation Design Management",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "1 year",
          "fee": "14,300",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Master in Visual & Experience Design",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "Master",
          "length": "1 year",
          "fee": "14,300",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "MBA",
          "Language": "English",
          "type": "Business & Management",
          "city": "Berlin",
          "level": "MBA",
          "length": "1year",
          "fee": "17,500",
          "intake": "Sept, March",
          "school": "UE Germany"
        },
        {
          "Name": "Msc of Science Innovation, Creativity & Entrepreneurship\r\n",
          "Language": "English",
          "type": "Business & Management\r\n",
          "city": "Troyes\r\n",
          "level": "Msc",
          "length": "1,5 years",
          "fee": "10,400\r\n",
          "intake": "Sept",
          "school": "YSCHOOLS"
        },
        {
          "Name": "International BBA \r\n",
          "Language": "English",
          "type": "Business & Management\r\n",
          "city": "Troyes\r\n",
          "level": "Bachelor",
          "length": "4 years",
          "fee": "9,000\r\n",
          "intake": "Sept",
          "school": "YSCHOOLS"
        },
        {
          "Name": "Grande \u00c9cole Programme Master Degree\r\n\r\n",
          "Language": "English",
          "type": "Business & Management\r\n",
          "city": "Troyes",
          "level": "MIM",
          "length": "2 years",
          "fee": "10,500",
          "intake": "-",
          "school": "YSCHOOLS"
        },
      ];
      print(programsList.length);
      for(var i=0;i<programsList.length;++i){
        programs.add(Programs.fromJson(programsList.elementAt(i)).toMap());
      }
      // programsList.forEach((element) {
      //   programs
      //       .add(Programs.fromJson(element).toMap())
      //       .whenComplete(() => print("Programs Added"))
      //       .catchError((error) => print("Failed to add programs: $error"));
      // });
    } catch (e) {
      print(e.toString());
      return 0.toString();
    }
  }

  Future<void> populateLevels() async {
    try {
      List<Map<String, dynamic>> levelsList = [
        {
          "level": "Bachelor"
        },
        {
          "level": "Master"
        },
        {
          "level": "MBA"
        },
        {
          "level": "MIM"
        },
        {
          "level": "Msc"
        },
        {
          "level": "PhD"
        }
      ];

      levelsList.forEach((element) {
        levels
            .add(Level.fromJson(element).toMap())
            .then((value) => print("Levels Added"))
            .catchError((error) => print("Failed to add levels: $error"));
      });
    } catch (e) {
      print(e.toString());
      return 0.toString();
    }
  }
}
