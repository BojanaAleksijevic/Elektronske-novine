# Проjектни задатак из Проjектовања информационих система и база података

Задатак: Креирати веб апликациjу коjа представља портал електронских новина.

На пројекту радила: Бојана Алексијевић


## Упутство за покретање

Пројекат је рађен у програмском језику <i>php</i>.
<br>
За конектовање са базом је коришћен <i>Wampserver64</i>.
<br>
Сви фајлови би требали да се налазе на следећој локацији:
<br>
C:\wamp64\www\novine
<br>



## Имплементирано до сада (по комитовима)

* #1 
  * систем пријаве
  * <i>logIn</i> за админа(главног уредника), уредника и новинара
  * регистрација новинара и уредника коју мора да одобри админ
* #2
  * новинар додаје вест коју админ треба да одобри
  * с тим у вези, сређено је додавање слика, тагова и категорија
* #3
  * админ одобрава и брише вести
  * измена вести:
    * новинар мења све док је уредник не одобри
    * брисање вести док није одобрена
    * када је вест одобрена, шаље се захтев за измену/брисање
  * "костур" почетне стране 
* #4
  * додате вести у базу
  * додате функционалности уредника
    * одобрава вести само за своју категорију
    * брише вести само за своју категорију
  * омогућен преглед вести за категорије које се налазе на поченој страни
* #5
  * приказ неколико најновијих вести на почетној страни
  * страница где су све вести:
    * <i>search</i> по насловима, таговима и датуму
    * пагинација
  * детаљан приказ вести кликом на наслов
* #6
  * лајковање у детаљном прегледу вести
  * <i>frontend</i>
    * почетна страна
    * детаљан преглед вести
    * поља за <i>login</i> и регистрацију
