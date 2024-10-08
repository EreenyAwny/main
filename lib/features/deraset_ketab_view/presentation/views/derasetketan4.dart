import 'package:flutter/material.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/widgets/app_leading.dart';
import 'package:mutamaruna/core/widgets/derasetKetab_body.dart';

class Derasetketab4 extends StatelessWidget {
  const Derasetketab4({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "اليوم الرابع",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        ),
        backgroundColor: mainColor,
        leading: const AppLeading(),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            child: const Text(
              "اليوم الرابع حوش اللى وقع منك ذاتيا ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Derasetketabbody(
            title: "١ - يوسف يصبح الرجل الثانى فى مصر ( تك 41 : 25 - 46 )",
            body_details:
                "25 فَقَالَ يُوسُفُ لِفِرْعَوْنَ: «حُلْمُ فِرْعَوْنَ وَاحِدٌ. قَدْ أَخْبَرَ اللهُ فِرْعَوْنَ بِمَا هُوَ صَانِعٌ. 26 اَلْبَقَرَاتُ السَّبْعُ الْحَسَنَةُ هِيَ سَبْعُ سِنِينَ، وَالسَّنَابِلُ السَّبْعُ الْحَسَنَةُ هِيَ سَبْعُ سِنِينَ. هُوَ حُلْمٌ وَاحِدٌ. 27 وَالْبَقَرَاتُ السَّبْعُ الرَّقِيقَةُ الْقَبِيحَةُ الَّتِي طَلَعَتْ وَرَاءَهَا هِيَ سَبْعُ سِنِينَ، وَالسَّنَابِلُ السَّبْعُ الْفَارِغَةُ الْمَلْفُوحَةُ بِالرِّيحِ الشَّرْقِيَّةِ تَكُونُ سَبْعَ سِنِينَ جُوعًا. 28 هُوَ الأَمْرُ الَّذِي كَلَّمْتُ بِهِ فِرْعَوْنَ. قَدْ أَظْهَرَ اللهُ لِفِرْعَوْنَ مَا هُوَ صَانِعٌ. 29 هُوَذَا سَبْعُ سِنِينَ قَادِمَةٌ شِبَعًا عَظِيمًا فِي كُلِّ أَرْضِ مِصْرَ. 30 ثُمَّ تَقُومُ بَعْدَهَا سَبْعُ سِنِينَ جُوعًا، فَيُنْسَى كُلُّ الشِّبَعْ فِي أَرْضِ مِصْرَ وَيُتْلِفُ الْجُوعُ الأَرْضَ. 31 وَلاَ يُعْرَفُ الشِّبَعُ فِي الأَرْضِ مِنْ أَجْلِ ذلِكَ الْجُوعِ بَعْدَهُ، لأَنَّهُ يَكُونُ شَدِيدًا جِدًّا. 32 وَأَمَّا عَنْ تَكْرَارِ الْحُلْمِ عَلَى فِرْعَوْنَ مَرَّتَيْنِ، فَلأَنَّ الأَمْرَ مُقَرَّرٌ مِنْ قِبَلِ اللهِ، وَاللهُ مُسْرِعٌ لِيَصْنَعَهُ. 33 «فَالآنَ لِيَنْظُرْ فِرْعَوْنُ رَجُلًا بَصِيرًا وَحَكِيمًا وَيَجْعَلْهُ عَلَى أَرْضِ مِصْرَ. 34 يَفْعَلْ فِرْعَوْنُ فَيُوَكِّلْ نُظَّارًا عَلَى الأَرْضِ، وَيَأْخُذْ خُمْسَ غَلَّةِ أَرْضِ مِصْرَ فِي سَبْعِ سِنِي الشِّبَعِ، 35 فَيَجْمَعُونَ جَمِيعَ طَعَامِ هذِهِ السِّنِينَ الْجَيِّدَةِ الْقَادِمَةِ، وَيَخْزِنُونَ قَمْحًا تَحْتَ يَدِ فِرْعَوْنَ طَعَامًا فِي الْمُدُنِ وَيَحْفَظُونَهُ. 36 فَيَكُونُ الطَّعَامُ ذَخِيرَةً لِلأَرْضِ لِسَبْعِ سِنِي الْجُوعِ الَّتِي تَكُونُ فِي أَرْضِ مِصْرَ، فَلاَ تَنْقَرِضُ الأَرْضُ بِالْجُوعِ». 37 فَحَسُنَ الْكَلاَمُ فِي عَيْنَيْ فِرْعَوْنَ وَفِي عُيُونِ جَمِيعِ عَبِيدِهِ. 38 فَقَالَ فِرْعَوْنُ لِعَبِيدِهِ: «هَلْ نَجِدُ مِثْلَ هذَا رَجُلًا فِيهِ رُوحُ اللهِ؟» 39 ثُمَّ قَالَ فِرْعَوْنُ لِيُوسُفَ: «بَعْدَ مَا أَعْلَمَكَ اللهُ كُلَّ هذَا، لَيْسَ بَصِيرٌ وَحَكِيمٌ مِثْلَكَ. 40 أَنْتَ تَكُونُ عَلَى بَيْتِي، وَعَلَى فَمِكَ يُقَبِّلُ جَمِيعُ شَعْبِي إِلاَّ إِنَّ الْكُرْسِيَّ أَكُونُ فِيهِ أَعْظَمَ مِنْكَ». 41 ثُمَّ قَالَ فِرْعَوْنُ لِيُوسُفَ: «انْظُرْ، قَدْ جَعَلْتُكَ عَلَى كُلِّ أَرْضِ مِصْرَ». 42 وَخَلَعَ فِرْعَوْنُ خَاتِمَهُ مِنْ يَدِهِ وَجَعَلَهُ فِي يَدِ يُوسُفَ، وَأَلْبَسَهُ ثِيَابَ بُوصٍ، وَوَضَعَ طَوْقَ ذَهَبٍ فِي عُنُقِهِ، 43 وَأَرْكَبَهُ فِي مَرْكَبَتِهِ الْثَّانِيَةِ، وَنَادَوْا أَمَامَهُ «ارْكَعُوا». وَجَعَلَهُ عَلَى كُلِّ أَرْضِ مِصْرَ. 44 وَقَالَ فِرْعَوْنُ لِيُوسُفَ: «أَنَا فِرْعَوْنُ. فَبِدُونِكَ لاَ يَرْفَعُ إِنْسَانٌ يَدَهُ وَلاَ رِجْلَهُ فِي كُلِّ أَرْضِ مِصْرَ». 45 وَدَعَا فِرْعَوْنُ اسْمَ يُوسُفَ «صَفْنَاتَ فَعْنِيحَ»، وَأَعْطَاهُ أَسْنَاتَ بِنْتَ فُوطِي فَارَعَ كَاهِنِ أُونَ زَوْجَةً. فَخَرَجَ يُوسُفُ عَلَى أَرْضِ مِصْرَ. 46 وَكَانَ يُوسُفُ ابْنَ ثَلاَثِينَ سَنَةً لَمَّا وَقَفَ قُدَّامَ فِرْعَوْنَ مَلِكِ مِصْرَ. فَخَرَجَ يُوسُفُ مِنْ لَدُنْ فِرْعَوْنَ وَاجْتَازَ فِي كُلِّ أَرْضِ مِصْرَ",
          ),
          Container(
            height: 40,
          ),
          const Derasetketabbody(
              title: "٢ - يهوديت تخلص شعب اسرائيل (يهو 13 : 1 - 22 )",
              body_details:
                  "1 وَلَمَّا أَمْسَوْا أَسْرَعَ عَبِيدُهُ إِلَى مَنَازِلِهِمْ، وَأَغْلَقَ بُوغَا أَبْوَابَ الْمُخْدَعِ وَمَضَى، 2 وَكَانُوا جَمِيعُهُمْ قَدْ ثَقُلُوا مِنَ الْخَمْرِ، 3 وَكَانَتْ يَهُودِيتُ وَحْدَهَا فِي الْمُخْدَعِ. 4 وَأَلِيفَانَا مُضْطَجِعٌ عَلَى السَّرِيرِ نَائِمًا لِشِدَّةِ سُكْرِهِ. 5 فَأَمَرَتْ يَهُودِيتُ جَارِيَتَهَا أَنْ تَقِفَ خَارِجًا أَمَامَ الْمُخْدَعِ وَتَتَرَصَّدَ، 6 وَوَقَفَتْ يَهُودِيتُ أَمَامَ السَّرِيرِ وَكَانَتْ تُصَلِّي بِالدُّمُوعِ وَتُحَرِّكُ شَفَتَيْهَا وَهِيَ سَاكِتَةٌ، 7 وَتَقُولُ: «أَيِّدْنِي أَيُّهَا الرَّبُّ إِلهُ إِسْرَائِيلَ وَانْظُرْ فِي هذِهِ السَّاعَةِ إِلَى عَمَلِ يَدَيَّ، حَتَّى تُنْهِضَ أُورُشَلِيمَ مَدِينَتَكَ كَمَا وَعَدْتَ وَأَنَا أُتِمُّ مَا عَزَمْتُ عَلَيْهِ وَاثِقَةً بَأَنِي أَقْدِرُ عَلَيْهِ بِمَعُونَتِكَ». 8 وَبَعْدَ أَنْ قَالَتْ هذَا، دَنَتْ مِنَ الْعَمُودِ الَّذِي فِي رَأْسِ سَرِيرِهِ فَحَلَّتْ خَنْجَرَهُ الْمُعَلَّقَ بِهِ مَرْبُوطًا. 9 وَاسْتَلَّتْهُ، ثُمَّ أَخَذَتْ بِشَعَرِ رَأْسِهِ وَقَالَتْ أَيِّدْنِي أَيُّهَا الرَّبُّ الإِلهُ فِي هذِهِ السَّاعَةِ، 10 ثُمَّ ضَرَبَتْ مَرَّتَيْنِ عَلَى عُنُقِهِ فَقَطَعَتْ رَأْسَهُ، وَنَزَعَتْ خَيْمَةَ سَرِيرِهِ عَنِ الْعَمَدِ، وَدَحْرَجَتْ جُثَّتَهُ عَنِ السَّرِيرِ. 11 وَبَعْدَ هُنَيْهَةٍ خَرَجَتْ وَنَاوَلَتْ وَصِيفَتَهَا رَأْسَ أَلِيفَانَا وَأَمَرَتْهَا أَنْ تَضَعَهُ فِي مِزْوَدِهَا، 12 وَخَرَجَتَا كِلْتَاهُمَا عَلَى عَادَتِهِمَا كَأَنَّهُمَا خَارِجَتَانِ لِلصَّلاَةِ وَاجْتَازَتَا الْمُعَسْكَرَ وَدَارَتَا فِي الْوَادِي حَتَّى انْتَهَتَا إِلَى بَابِ الْمَدِينَةِ. 13 فَنَادَتْ يَهُودِيتُ مِنْ بُعْدٍ حُرَّاسَ السُّورِ: «افْتَحُوا الأَبْوَابَ فَإِنَّ اللهَ مَعَنَا وَقَدْ أَجْرَى قُوَّةً فِي إِسْرَائِيلَ». 14 فَكَانَ أَنَّهُ لَمَّا سَمِعَ الرِّجَالُ صَوْتَهَا دَعَوْا شُيُوخَ الْمَدِينَةِ، 15 وَبَادَرُوا إِلَيْهَا جَمِيعُهُمْ مِنْ أَصْغَرِهِمْ إِلَى أَكْبَرِهِمْ، لأَنَّهُ لَمْ يَكُنْ فِي آمَالِهِمْ أَنَّهَا تَرْجِعُ بَعْدُ. 16 ثُمَّ أَوْقَدُوا مَصَابِيحَ وَاجْتَمَعُوا حَوْلَهَا بِأَسْرِهِمْ، فَصَعِدَتْ إِلَى أَعْلَى مَوْضِعٍ وَأَمَرْت بِالسُّكُوتِ، فَلَمَّا سَكَتُوا كُلُّهُمْ، 17 قَالَتْ يَهُودِيتُ: «سَبِّحُوا الرَّبَّ إِلهَنَا الَّذِي لَمْ يَخْذُلِ الْمُتَوَكِّلِينَ عَلَيْهِ، 18 وَبِي أَنَا أَمَتَهُ أَتَمَّ رَحْمَتَهُ الَّتِي وَعَدَ بِهَا آلَ إِسْرَائِيلَ وَقَتَلَ بِيَدِي عَدُوَ شَعْبِهِ هذِهِ اللَّيْلَةَ». 19 ثُمَّ أَخْرَجَتْ رَأْسَ أَلِيفَانَا مِنَ الْمِزْوَدِ وَأَرَتْهُمْ إِيَّاهُ قَائِلَةً: «هَا هُوَذَا رَأْسُ أَلِيفَانَا رَئِيسُ جَيْشِ الأَشُّورِيِّينَ وَهذِهِ خَيْمَةُ سَرِيرِهِ الَّتِي كَانَ مُضْطَجِعًا فِيهَا فِي سُكْرِهِ حَيْثُ ضَرَبَهُ الرَّبُّ إِلهُنَا بِيَدِ امْرَأَةٍ. 20 حَيٌّ الرَّبُّ إِنَّهُ حَفِظَنِي مَلاَكُهُ فِي مَسِيرِي مِنْ ههُنَا وَفِي إِقَامَتِي هُنَاكَ وَفِي إِيَابِي إِلَى هُنَا، وَلَمْ يَأْذَنِ الرَّبُّ أَنْ تَتَدَنَّسَ أَمَتُهُ، وَلكِنْ أَرْجَعَنِي إِلَيْكُمْ بِغَيْرِ نَجَاسَةِ خَطِيئَةٍ فَرِحَةً بِغَلْبَتِهِ وَبِخَلاَصِي وَخَلاَصِكُمْ. 21 فَاشْكُرُوا لَهُ كُلُّكُمْ لأَنَّهُ صَالِحٌ لأَنَّ رَحْمَتَهُ إِلَى الأَبَدِ». 22 فَسَجَدُوا بِأَجْمَعِهِم لِلرَّبِّ وَقَالُوا لَهَا: «قَدْ بَارَكَكِ الرَّبُّ بِقُوَّتِهِ لأَنَّهُ بِكِ أَفْنَى أَعْدَاءَنَا».")
        ],
      ),
    );
  }
}
