import 'package:firebase_lesson/model/tips_model.dart';

class About {
  static List<TipsModel> setAbout() {
    List<TipsModel> items = [];

    items.add(TipsModel(
        about1:
            """Sir emaski, butun dunyo xalqlari ayol kishini, avvalo, xotin – uyning bekasi, sarishtasi sifatida ko’radi. Avval iqtisod, deganlaridek, mazali taomlar ila oila a’zolarini siylash; uy-joy, xo’jalik anjomlarini asrash, ularni toza-ozoda tutish – xonadon bekasi bo’lmish ayolning avvali burchidir. Navbatdagi tavsiyalarimiz ham bu burchni bekam-u ko’st bajarishingizga oz bo’lsa-da ko’mak beradi, degan umiddamiz:

1) Dog’langan yog’ sachrab ketmasligi uchun qozonga ozroq tuz solish lozim;

2) Sirli idishlarni qaynoq suvga ko’p solib bo’lmaydi. Shuningdek, qizib turgan sirli idishga sovuq suv yoki yog’ quyib ham bo’lmaydi. Siri o’chib ketadi;

3) Alyuminiydan yasalgan idish-tovoqlarni simqirg’ich bilan ishqab yuvmang, chunki simqirg’ich idishni tirnab, tez kirlanadigan qilib qo’yadi;

4) Biror idishga yog’och qipig’i solib idish-tovoq javoniga qo’yilsa, oziq-ovqat mahsulotlari aynimaydi va javonning ichini hid bosmaydi;

5) Go’shtga tuz sepib qovurilsa, seli yaxshi chiqadi;

6) Go’shtni sovuq suvga solib, asta-sekin qaynatib pishirilsa, sho’rvasi shirin bo’ladi;

7) Agar go’shtdagi moddalar ko’proq saqlanib qolsin desangiz, uni shaqirlab qaynab turgan suvga solib yoki qovurib pishiring;

8) Tozalanadigan baliqni issiq suvga botirib olinsa, tangachalari oson ko’chadi;

9) Bodring, rediska va yangi sabzini archimay iste’mol qilinsa, tezroq hazm bo’ladi;

10) So’lib qolgan ko’k piyoz, ukrop, kashnich va boshqalarni sirkali suvga botirib qo’yilsa, “tirilib” ketadi;

11) Taom kuysa, qozonni olovdan olib sovuq suvga soling. Qozonning ostiga yopishgan kuyindi – qirmochni qoldirib, ovqatni boshqa idishga olib, pishirishni davom ettirish mumkin;

12) Haddan tashqari seryog’ bo’lib ketgan palovga guruch solishdan oldin bir nechta kartoshkani archib solinsa, yog’ni tortib oladi;

13) Quyuq ovqatlar (palov, shavla, qovurma…) juda sho’r bo’lib ketsa, pishish oldidan dog’langan yog’ qo’shib, tuzini rostlash mumkin;

14) Sabzavotlarni bug’da dimlab pishirilsa, ulardagi vitaminlar, kerakli moddalar yaxshi saqlanib qoladi;

15) Tuzdonga bir necha dona guruch tashlab qo’yilsa, tuz doim quruq saqlanadi.""",
        about2:   """Uy – mo‘jaz vatan. Ana shu vatan ichi ayollarga topshirilgan. Unda bajariladigan ro‘zg‘or ishlari o‘ziga xos san’at bo‘lib, uni egallagan ayolning qadri oshib, o‘zligini namoyon qiladi. Ro‘zg‘or yuritish bekalarni o‘ylab, chamalab, hisob-kitob bilan, eng asosiysi – yaratish ishtiyoqi bilan ishlashga o‘rgatadigan o‘ziga xos fan hamdir. Quyidagi maslahatu tavsiyalar uy-ro‘zg‘or yumushlaringizda asqotadi, degan umiddamiz:

1 Yog‘larni mis idishlarda saqlamang, sifati buziladi. Yog‘larni, ayniqsa, sariyog‘ va maskayog‘ni qorong‘i yerda saqlash kerak, chunki quyosh nuri ta’sir etsa, unda yog‘ kislotasi hosil bo‘ladi, bu kislota esa inson organizmiga zarar;

2 No‘xat, mosh, loviya kabi dukkakli donlarni issiq suvda ivitib bo‘lmaydi, qotib, pishishi qiyin bo‘ladi. Pishirganda sovuq suvga solib, sekin qaynating. Tuzni yetilib pishgandan so‘nggina soling;

3 Guruch, makaron, vermishel’ kabi mahsulotlarni esa qaynoq suvga solib, tez qaynating. Aks holda, mahsulot idishning ostiga yopishib qoladi;

4 Suyuq ovqatlar shaqirlatib qaynatilsa, xira tortadi. Miltiratib qaynatish lozim;

5 Qattiq go‘shtni sirkalab pishirsangiz, yumshoq tortadi;

6 Muzlagan go‘shtni sovuq suvga solib pishirmang. Negaki, sekin-asta issiq o‘tgan go‘shtda vitaminlar yo‘qolib boradi, ta’mi qolmaydi. Qaynab turgan suvda pishirish lozim;

7 Ko‘k piyoz, ukrop, kashnich va boshqalarni iste’mol qilishdan oldin 5 minut tuzli suvga solib oling. Ulardagi ko‘zga ko‘rinmas hasharotlar o‘ladi;

8 Sho‘r bo‘lib ketgan ovqatga 2-3 ta xom kartoshka solsangiz, sho‘rini o‘ziga tortib oladi;

9 Pichoqni biroz suvlab piyoz to‘g‘rasangiz, ko‘zingiz achishmaydi;

10 Guruchni yuvganda suvga 1-2 osh qoshiq tuz solib yuborsangiz, g‘ubori yaxshi ketadi va bunday guruch suvdan olib qo‘yilganda ham uzoq vaqtgacha uqalanib ketmaydigan bo‘ladi;

11 Ortib qolgan palov, shavla, qovurma kabi taomlar isitib yeyiladigan bo‘lsa, ularga bir bosh piyozni maydalab to‘g‘rab, qo‘shib yuboring. Bu ovqatning ta’mini asl holatiga keltiradi;

12 Sut pishirayotganda idishning chetiga moy surib qo‘ysangiz, sut qaynaganda toshmaydi;

13 Tomat pyuresi – pomidor qiymasining yuzi mog‘orlab qolmasin desangiz, uning yuziga bir oz tuz sepib, paxta moyidan tomizib qo‘ying.""",
        about3:  """Har bir beka mehmon kutishni va biror bir bayramda dasturxon bezatishni juda yaxshi ko’radi. Ular bu ishni juda qunt va mahorat bilan bajaradi. Hammaga o’z pazandaligini ko’rsatib qo’yishni istaydi. Agar mahoratingizni va bilimingizni yana ham oshirmoqchi bo’lsangiz, quyidagi oshxona sirlariga e’tibor bering:

Agarda salat mehmonlarga og’irlik qilmasin desangiz, unga bodring yoki nordon olma qo’shib yuboring. Shunda salat tezroq hazm bo’ladi.
Ko’katlaringiz endigina uzilgan ta’mli bo’lishni istasangiz, iste’mol qilishdan avval sovuq suvda emas, iliq suvda chaying.
Kartoshga qaynaganda, po’sti yorilib ketishini istamasangiz, kartoshkali suv qaynashidan oldin suvga oz miqdorda sirka qo’shib yuboring.

Bodring qo’shilgan salatlarni uzoq vaqt saqlanishini istasangiz, tuzlangan bodring o’rniga marinadlanganidan soling.
Salatlar uchun ishlatiladigan tuxumni baland olovda 10 daqiqadan kam pishirmang. Keyin esa po’chog’ini artishga shoshmasdan bir necha daqiqa sovuq suvda qoldiring.

Baliq tozalash oson ish emas, shuning uchum tozalash paytida qiynalmay desangiz, baliqni tozalashdan oldin 30 soniya qaynagan suvga solib oling. Shunda baliq osongina tozalanadi.

Gaz pechida pishadigan go’shtning sersuv bo’lishini istasangiz, har 10-15 daqiqada o’zidan chiqqan sharbatini ustiga quyib turing. Agar sharbati kam bo’lsa, ozroq sho’rva yoki suv qo’shishingiz mumkin.
Mehmonlaringiz va o’z salomatligingiz haqida o’ylasangiz, yeguliklar bilan birga ko’proq ko’katlar va salat barglarini qo’ying. Ko’katlar bilan bezatilgan taomingiz ham chiroyli ko’rinadi, ham foydali bo’ladi.
Dasturxonga taomlar bilan birga gazli suv qo’ymang. Chunki gazli suv taomlar bilan birikmaydi. Yaxshisi, gazlanmagan yoki qaynagan suv qo’ying. Ko’k choy ham taomlar hazmini yaxshilaydi.

Tayyorlagan salatingiz tezroq hazm bo’lishini istasangiz, mayonezni smetana bilan 1:1 nisbatta alaralashtiring.
Ko’p miqdordagi tuxum esa salatni yanada to’yimli qilishi mumkin. Shuning uchun salatga kamroq tuxum qo’shing.

Albatta, mehmonlarni shirinliksiz kutmaydi. Agar shirinlik yoki tort tayyorlashda yong’oqdan foydalanmoqchi bo’lsangiz, uni avval gaz pechida biroz qizdirib oling. Shunda yong’oq xushbo’y bo’ladi.
Shirinlik xamiriga vanilin solishdan avval uni suvga aralashtirib oling. Bu vanilinning xamirga teng miqdorda aralashishiga yordam beradi."""));

    return items;
  }
}
