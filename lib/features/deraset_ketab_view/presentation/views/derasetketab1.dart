import 'package:flutter/material.dart';
import 'package:mutamaruna/core/constants.dart';
import 'package:mutamaruna/core/widgets/derasetKetab_body.dart';

class Derasetketab1 extends StatelessWidget {
  const Derasetketab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "اليوم الاول",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: mainColor,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            child: const Text(
              "اليوم الاول : حوش اللى وقع منك روحيا ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const Derasetketabbody(
            title: "بطرس و يوحنا  ( انجيل يوحنا  21 : 1 - 7) ",
            body_details:
                "1 بعد هذا أظهر أيضا يسوع نفسه للتلاميذ على بحر طبرية. ظهر هكذا   2 كان سمعان بطرس، وتوما الذي يقال له التوأم، ونثنائيل الذي من قانا الجليل، وابنا زبدي، واثنان آخران من تلاميذه مع بعضهم.  3 قال لهم سمعان بطرس : أنا أذهب لأتصيد. قالوا له: نذهب نحن أيضا معك. فخرجوا ودخلوا السفينة للوقت. وفي تلك الليلة لم يمسكوا شيئا.  4 ولما كان الصبح، وقف يسوع على الشاطئ. ولكن التلاميذ لم يكونوا يعلمون أنه يسوع.  5 فقال لهم يسوع: يا غلمان ألعل عندكم إداما؟. أجابوه: لا.  6 فقال لهم: ألقوا الشبكة إلى جانب السفينة الأيمن فتجدوا. فألقوا، ولم يعودوا يقدرون أن يجذبوها من كثرة السمك.  7 فقال ذلك التلميذ الذي كان يسوع يحبه لبطرس: هو الرب. فلما سمع سمعان بطرس أنه الرب، اتزر بثوبه، لأنه كان عريانا، وألقى نفسه في البحر",
          )
        ],
      ),
    );
  }
}
