-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 13, 2024 at 12:22 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `novine`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `idCategory` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`idCategory`, `name`) VALUES
(14, 'Planeta'),
(13, 'Hronika'),
(12, 'Moda'),
(11, 'Lifestyle '),
(10, 'Sport'),
(9, 'Zabava'),
(15, 'Magazin'),
(16, 'Srbija'),
(17, 'Biznis'),
(18, 'Zabava'),
(19, 'Zabava'),
(20, 'Sport'),
(21, 'Sport'),
(22, 'Lifestyle '),
(23, 'Moda'),
(24, 'Moda'),
(25, 'Hronika'),
(26, 'Planeta'),
(27, 'Planeta'),
(28, 'Magazin'),
(29, 'Srbija'),
(30, 'Biznis'),
(31, 'Biznis');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `newsID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `newsID` (`newsID`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `name`, `newsID`) VALUES
(50, '350300_profimedia0844824735_ff.jpg', 34),
(48, '202059_shutterstock-1077423647_ls.jpg', 32),
(49, '350282_shutterstock-1285399408_ls.jpg', 33),
(47, '853406_05_m.webp', 31),
(46, '836879_836838-cile8786-orig_orig.jpg', 31),
(45, '855465_viber-image-2024-02-12-12-15-13-117_orig.jpg', 30),
(43, '726810_tan2023-07-0723541824-5_m.webp', 29),
(44, '828882_21_m.webp', 30),
(42, '855055_tan2024-02-1201192137-7_iff.jpg', 28),
(41, '855050_tan2024-02-1200454415-2_m.webp', 28),
(40, '713858_fss_m.webp', 27),
(37, 'fb.png', 24),
(36, '5a4e42e52da5ad73df7efe79.png', 23),
(51, '350110_profimedia0844305642_ff.jpg', 35),
(52, '350112_profimedia0844305864_ff.jpg', 35),
(53, '350034_zika-rodjendan-gosti-06022024-0091_ff.jpg', 36),
(54, '350036_zika-rodjendan-gosti-06022024-0083_ff.jpg', 36),
(55, '349954_profimedia0843716997_ls.jpg', 37),
(56, '349955_profimedia0843717061_ff.jpg', 37),
(57, '2520407_policija04-zorana-jevtic_ls.jpg', 38),
(58, '3813723_screenshot-20240211-223449_ls.jpg', 39),
(60, '784275_27_m.webp', 41),
(61, '3806680_collage_ls.jpg', 42),
(62, '3105077_shutterstock-1493994896_ls.jpg', 43),
(63, '824790_shutterstock-2161385085_m.webp', 44),
(64, '839302_shutterstock-2338427615_m.webp', 45),
(65, '528343_space-g4870190ec-1920_m.webp', 46),
(66, '855495_untitled-23-copy_m.webp', 47),
(67, '855793_rzs_orig.png', 48),
(68, '3814714_1707753155-banjskastenafotorina_ff.jpg', 49),
(69, '3814715_1707753155-16194463261605701533bajinabastabanjskastenafotorina3_ff.jpg', 49),
(70, '3758798_1702217669kopaonikracunbrojdvafotorina_ff.jpg', 50),
(71, '3758836_kopaonik_ls.jpg', 50);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `idNews` int(10) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `subtitle` text NOT NULL,
  `content` text NOT NULL,
  `categoryID` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) DEFAULT NULL,
  `status` enum('pending','approved','rejected','editing') DEFAULT 'pending',
  PRIMARY KEY (`idNews`),
  KEY `userID` (`userID`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`idNews`, `title`, `subtitle`, `content`, `categoryID`, `date`, `userID`, `status`) VALUES
(28, 'Å ok! Brazil ne ide na Olimpijske igre posle 20 godina Podeli vest', 'Fudbalska reprezentacija Brazila, igraÄi do 23 godine, nije uspela da se plasira na Olimpijske igre u Parizu', 'PoraÅ¾eni su Brazilci od Argentine sa 1:0 u meÄu poslednjeg, treÄ‡eg kola juÅ¾noameriÄkih kvalifikacija za Olimpijske igre. Jedini gol za reprezentaciju Argentine postigao je LuÄijano Gondu u 77. minutu.\r\nSelekciju Argentine, igraÄi do 23 godine, predvodi Havijer Maskerano. U drugom meÄu treÄ‡eg kola, selekcija Paragvaja je savladala Venecuelu 2:0. Prvo mesto na tabeli osvojio je Paragvaj sa sedam bodova, dok je Argentina druga sa pet. Ove dve selekcije igraÄ‡e na OI u Parizu.', 10, '2024-02-12 17:07:42', 28, 'pending'),
(27, 'Novi skandal u srpskom fudbalu! RadniÄkom zbog nameÅ¡tanja oduzeto 6 bodova!', 'RadniÄki sa Novog Beograda kaÅ¾njen je oduzimanjem Å¡est bodova, i to nakon ubedljivog poraza od Tekstilca (5:0).', 'Pomenuti klub iz Prve lige Srbije kaÅ¾njen je zbog \"povreda integriteta igre\".\r\n- Na sednici Disciplinske i EtiÄke komisije FSS, kojom je predsedavao Ivan NikoliÄ‡, u vezi sa dostavljenim pisanim informacijama od strane UEFA nadleÅ¾nih organa za integritet protiv FK RadniÄki iz Beograda, da je svojim Äinjenjem ugrozio i povredio integritet fudbalske utakmice 20. kola Prve lige Srbije FK Tekstilac â€“ FK RadniÄki, odigrane 11. decembra prosle godine u OdÅ¾acima, doneta je odluka kojom se kaÅ¾njava FK RadniÄki iz Beograda oduzimanjem Å¡est bodova od onih koje je osvojio do izricanja kazne i novÄanom kaznom u iznosu od Äetiri miliona dinara.\r\n\r\nFSS i na ovaj naÄin dokazuje nultu toleranciju na pojave ugroÅ¾avanja i povreda integriteta fudbalskih utakmica i duboku posveÄ‡enost oÄuvanju integriteta i digniteta fudbalskih takmiÄenja, stoji u saopÅ¡tenju koje je dostavljeno \"Sport klubu\".', 10, '2024-02-12 17:03:26', 28, 'pending'),
(29, 'Kakve reÄi Stena o Novaku, Federer Ä‡e biti ljubomoran', 'Å vajcarski teniser Sten Vavrinka prokomentarisao je ', 'Analizirao je igre verovatno najboljih tenisera ikada, pa kaÅ¾e da Srbin, Å vajcarac i Å panac imaju razliÄit stil. Zna Sten o Äemu priÄa, protiv ÄokoviÄ‡a ima skor 21:6, Nadala 19:3, a zemljaka Federera 23:3.\r\n- Rafa je levoruk, partije sa njim su izuzetno teÅ¡ke, naporno je i psiholoÅ¡ki i fiziÄki igrati protiv njega. RoÅ¾er je veoma brz, kada igraÅ¡ sa njim oseÄ‡aÅ¡ se neprijatno na terenu. Novak je perfektan teniser, zbog naÄina na koji igra. PobeÄ‘ivao sam ih viÅ¡e puta, ali sam gubio joÅ¡ viÅ¡e. Za mene je to uvek bila dobra Å¡ansa da igram protiv najboljih tenisera u istoriji. ÄŒak i kada sam gubio, uvek je to bio izazov za mene. Uvek je specijalno igrati protiv njih - istakao je Vavrinka.\r\n\r\nSten je tek sa 29 godina osvojio svoju prvu grend slem titulu.\r\n\r\n- To zavisi od igraÄa, od njegove liÄnosti. Na primer, Karlos Alkaraz je veÄ‡ osvojio gren slem, bio je prvi na svetu.  Janik Siner je sada osvojio veliki trofej. UÅ¾ivam Å¡to i dalje igram protiv tenisera raznih generacija i razliÄitog stila. SreÄ‡an sam Å¡to mogu to da proÅ¾ivljavam i oÄekuje da uspem i da pobednim nekoga iz nove generacije.', 10, '2024-02-12 17:36:31', 29, 'pending'),
(32, 'NOSITE OVE BROJEVE U NOVÄŒANIKU DA BISTE PRIVUKLI NOVAC', 'Saznajte koja je vaÅ¡a finansijska amajlija koja donosi izobilje', 'U numerologiji brojevi su povezani sa raznim simbolima, neki se smatraju najsreÄ‡nijim, jedni su povezani sa energijom ljubavi, a postoje oni koji se odnose na finansijsko blagostanje. Kada je reÄ o novcu, numerolozi smatraju da postoje brojevi koji su kao amajlije za privlaÄenje obilja i moÅ¾ete ih nositi u novÄaniku.\r\n\r\nDonosimo vam spisak jednocifrenih brojeva od kojih svaki ima posebno znaÄenje u sferi novca. Izaberite nekoliko na osnovu onoga Å¡to Å¾elite da postignete kada je reÄ o finansijama. MoÅ¾ete ga zapisati na papir i nositi utaj papiriÄ‡ u novÄaniku, ili Ä‡ete na radnom mestu imati olovke u tom broju. Na primer, ako je vaÅ¡ broj 3, imaÄ‡ete dve olovke na stolu, ili tri knjige, ili 3 sreÄ‡ne figurice.\r\nProÄitajte u nastavku Å¡ta koji broj znaÄi i izaberite nekoliko svojih i napravite liÄni kod za obilje i sreÄ‡u u finansijama:\r\n\r\nJedinica: Ovaj broj simbolizuje novi poÄetak, napredovanje i zbog toga povoljno utiÄe na polje finansija. Jedinica pomaÅ¾e ljudima da uÅ¡tede novac i razumno procene kako i na Å¡ta Ä‡e ga potroÅ¡iti. SavrÅ¡en je broj za ljude koji analiziraju i detaljno planiraju svaki svoj sledeÄ‡i potez. Ako radite u oblasti u kojoj morate stalno razmiÅ¡ljati o buduÄ‡nosti i praviti strategiju, onda je ovo vaÅ¡ sreÄ‡an broj.\r\n\r\nDvojka: Ovaj broj podstiÄe ljude da ÄeÅ¡Ä‡e misle samo na sebe. Ovo je loÅ¡ pomoÄ‡nik u finansijskim pitanjima, jer sebiÄnost donosi samo siromaÅ¡tvo. Ukoliko dajete i delite, dobiÄ‡ete. Dvojka je suprotnost finansijskom toku, pa je treba izbegavati u ovom polju.\r\n\r\nTrojka: Ovaj broj je jedan od sreÄ‡nijih kada je reÄ o privlaÄenju novca. Predstavlja dobrog vodiÄa kada je reÄ o promeni finansijske situacije. Trojka je simbol harmonije, pa je numerolozi povezuju sa skladom u polju novca.', 11, '2024-02-12 19:45:52', 31, 'pending'),
(30, 'Oduvek sam Å¾eleo da glumim sa Jezdom', 'MiloÅ¡ TimotijeviÄ‡ kaÅ¾e da mu se konaÄno ostvario san da glumi sa Nenadom JezdiÄ‡em. Zvezda serije ', 'MiloÅ¡ TimotijeviÄ‡ kaÅ¾e da mu se konaÄno ostvario san da glumi sa Nenadom JezdiÄ‡em. Zvezda serije \"Besa\" i \"JuÅ¾ni vetar\" u najnovijem krimi-trileru \"Poslednji strelac\" reditelja Darka NikoliÄ‡a igra opasnog kriminalca i kaÅ¾e da mu je prijao rad sa kolegom kojeg veoma ceni.\r\n- JoÅ¡ od Akademije sam Å¾eleo da saraÄ‘ujem sa Nenadom i sada mi se ta Å¾elja ispunila. U filmu smo nas dvojica direktni partneri i presreÄ‡an sam zbog toga. NaÅ¡i junaci se vole i poÅ¡tuju, ali interes stoji izmeÄ‘u njih i gledaocima Ä‡e biti zanimljivo da gledaju njihov odnos - priÄa TimotijeviÄ‡ i dodaje da su imali kratko vreme da snime ceo film:\r\n\r\n- Kada smo dobili scenario, rekli su nam da sve moramo da snimimo za 15-20 dana. Pitali smo se kako Ä‡emo to izvesti, jer je za film potrebno bar duplo vremena. MeÄ‘utim, scenario je bio dobro napisan, tako da smo sve uspeli da snimimo u rekordnom roku. Imali smo sreÄ‡u Å¡to smo imali Darka za reditelja, a jedino su nam rad oteÅ¾avale velike vruÄ‡ine, ali i to smo izdrÅ¾ali.', 9, '2024-02-12 17:40:51', 26, 'approved'),
(31, 'Za tri nedelje u Srbiji i regionu film \"Nedelja\" pogledalo 400.000 gledalaca!', 'Film \"Nedelja\", koji prikazuje do sada malo poznate detalje iz Å¾ivota pevaÄa DÅ¾eja Ramadanovskog, za kratko vreme postigao je neverovatan uspeh.', 'Producent Vladan AnÄ‘elkoviÄ‡ i scenarista Stefan BoÅ¡koviÄ‡, u saradnji sa Telekomom Srbija i Filmskim centrom Srbije, na jedan poseban naÄin uspeli su da oÅ¾ive nasleÄ‘e poznatog pevaÄa. Pored same priÄe i nezaobilazne muzike, film je obeleÅ¾ila i neverovatna glumaÄka ekipa. \r\nHusein Husa AlijeviÄ‡ izneo je ulogu DÅ¾eja na jedinstven naÄin, dok je Marko JanketiÄ‡ u ulozi DÅ¾ejevog brata pobrao sjajne kritike. \r\n\r\nMilica Janevski i Zlatan VidoviÄ‡ oduÅ¡evili su gledaoce ulogama Marine TucakoviÄ‡ i Aleksandra Fute RaduloviÄ‡a. \r\n\r\nPored njih, zapaÅ¾ene uloge ostvarili su i Stefan VukiÄ‡, Aleksej BjelogrliÄ‡, Alen Selimi, Ana PindoviÄ‡, MaÅ¡a ÄorÄ‘eviÄ‡, StojÅ¡a OljaÄiÄ‡, Bajram SeverdÅ¾an, Nela MihajloviÄ‡ i mnogi drugi.\r\n\r\nFilm \"Nedelja\", Äiju reÅ¾iju potpisuje Nemanja Ä†eraniÄ‡, nastavlja sa prikazivanjem Å¡irom Srbije i regiona.\r\n\r\nDistribucija ovog ostvarenja poverena je regionalnom distributeru Art Visti.', 9, '2024-02-12 17:45:23', 26, 'pending'),
(33, 'Å TA REÄ†I LJUDIMA KOJI SE STALNO NEÅ TO KUKAJU', 'Posle ovog viÅ¡e vam se nikada neÄ‡e obratiti', 'TeÅ¾ak i veoma realan tekst ruskog psihologa Lilije AhremÄik morate da proÄitate.\r\n\"ObiÄno, kada Äovek loÅ¡e radi svoj posao, on postaje ogorÄen: \"ZnaÅ¡ li koliko malo sam plaÄ‡en?\" Znam. I ne razumem Å¡ta onda radiÅ¡ na tom poslu. Po mom miÅ¡ljenju sve je jednostavno: ako ti se ne sviÄ‘a, ne radi tu. I tako je u svemu.\r\n\r\nAko ti je loÅ¡e da Å¾iviÅ¡ sa odreÄ‘enom osobom, nemoj da Å¾iviÅ¡ sa njim/njom. Ako se vaÅ¡i nadreÄ‘eni ponaÅ¡aju loÅ¡e prema vama, promenite posao. Ako vam odelo ne stoji dobro, dajte ga nekome kome Ä‡e stajati lepo.\r\n\r\nAko spavate loÅ¡e, pobrinite se za svoju duÅ¡u. Ako se oseÄ‡ate fiziÄki loÅ¡e, leÄite se. LoÅ¡e ti je Å¡to Å¾iviÅ¡ na selu - idi. Uradi to, samo ne kukaj.\r\n\r\nA ako niÅ¡ta ne uradiÅ¡ po tom pitanju i niÅ¡ta ne promeniÅ¡, onda si uredu. Budi iskren prema sebi - dobro ti je. Lepo ti je da kukaÅ¡. VoliÅ¡ da se Å¾aliÅ¡. VoliÅ¡ da patiÅ¡ pomalo. SviÄ‘a ti se uloga Å¾rtve. Dobro ti je Å¡to drugi odluÄuju umesto tebe. Dobro ti je Å¡to ne radiÅ¡ niÅ¡ta sa svojim Å¾ivotom. Lepo ti je Å¡to je sve mirno, predvidljivo. To je tvoja zona udobnosti. Biti u govnima je tvoj izbor, tvoja zona komfora.\r\n\r\nNeodluÄivanje je takoÄ‘e odluka. Ne menjanje je takoÄ‘e stvar izbora. Ako ste se ipak odluÄili za to, ne Å¾alite se. Ne ispiraj mozak drugome, on ne Å¾eli da sluÅ¡a tvoje gluposti.\r\n\r\nJednostavno samo priznaj: tamo si gde Å¾eliÅ¡ da budeÅ¡.\"', 11, '2024-02-12 19:48:42', 31, 'pending'),
(34, 'BALENSIJAGA PEÅ KIR-SUKNJA OD 850 EVRA NASTAVLJA DA ZALUÄUJE POZNATE', 'Neki kaÅ¾u wow, nekima je GROZNA, a Å¡ta vi mislite?', 'Balensijagina nova hit peÅ¡kir-suknja nastavlja da dominira meÄ‘u poznatima.\r\nViralna Balensijagina suknja-peÅ¡kir, je proÅ¡le godine izazvala velike kontroverze. Nekima je bila simpatiÄna, nekima smeÅ¡na i odvratna.\r\n\r\nNo, bilo je pitanje vremena kada Ä‡e neko od poznatih liÄnosti obuÄ‡i ovaj hit komad. MeÄ‘u prvima je to bio reper i glumac DÅ¾ejden Smit.\r\n\r\nSmitova suknja zapravo nije viralni Balensijaga peÅ¡kir, vecÌ interpretacija skejt brenda MSFTSrep. Nije ni istog materijala, odnosno frotirni peÅ¡kir izvuÄen iz kupatila, no, izgleda da je suknja od sivog teksasa, koju je nosio preko para odgovarajucÌih pantalona.\r\n\r\nIpak, ceo izgled je trenutni poziv na suknju koja je zapalila internet krajem proÅ¡le godine, tako da je verovatno i inspirisalo Smita.\r\n\r\nUpario je svoju suknju sa crnom debelom jaknom, opremljenom sa dosta dÅ¾epova. Nosio je jaknu zakopÄanu sve do brade sa kapuljaÄom preko glave.\r\nSmit je inaÄe Äesto viÄ‘en u tom utilitarnom stilu, noseÄ‡i viralne stritstajl komade.\r\n\r\nSada se postavlja pitanje, kako se vama dopada i da li biste nosili ovu suknju?', 12, '2024-02-12 19:52:21', 32, 'pending'),
(35, 'IRINA Å AJK PONOVO DIKTIRA MODNE TRENDOVE', 'Stajlingom \"Å¾ene mafijaÅ¡a\", privukla ogromnu paÅ¾nju, a 1 detalj je kljuÄan', 'Irina Å ajk pridruÅ¾uje se trendu Å¾ene mafijaÅ¡a.\r\nTrend koji je potekao sa Tiktoka ne daje znake stajanja. Model Irina Å ajk demonstrira kako da inkorporirate izgled.\r\n\r\nPaparaci su pre neki dan Irinu fotografisali na ulicama Njujorka i svojim stajlingom ostavlja snaÅ¾an utisak.\r\n\r\nTako odevena u crnom od glave do pete (ako izuzmemo zelenu tuniku), podseÄ‡a na \"Å¾enu mafijaÅ¡a\", takozvani trend.\r\n\r\nZa Å¡etnju sa svojom Ä‡erkom u Njujorku, Irina je odabrala Å¡iroki crni tedi dvoredni kaput sa Moskino crnim Äizmama i zelenu tuniku.\r\n\r\nOna je od aksesoara odabrala glomazne minÄ‘uÅ¡e i edÅ¾i glomazne naoÄare(Å¡to su glavni postulati ovog trenda), dok je kosu zavezala u rep.\r\n\r\nUkoliko ste dosad imali dilemu da se upustite u ovaj trend, sada je pravi trenutak da ga prigrlite i uvrstite u svoj stil.', 12, '2024-02-12 19:54:47', 32, 'pending'),
(36, 'CIPELE OD 180 EVRA, A TORBICA OD 700 - NEDA UKRADEN JE IZDOMINIRALA NA Å½URCI Å½IKE JAKÅ IÄ†A', 'Neda Ukraden se na gala proslavi pojavila u savrÅ¡enoj kombinaciji kojom se sve dame mogu inspirisati.', 'Neda Ukraden se na proslavi 60. roÄ‘endana Å½ike JakÅ¡iÄ‡a pojavila u savrÅ¡enom izdanju na koju mnoge dame mogu da se ugledaju.\r\n\r\nZa ovu gala proslavu producenta i voditelja popularne emisije ,,Nikad nije kasno\", se pojavila u monohromatskom izdanju u boji fuksije, koju je razbila besprekornim odabirom Å¡tikli na plaformu.\r\nPantalone i rolka od satena, kao i jakna od pliÅ¡a, jeste savrÅ¡en izbor za ovakav veÄernji dogaÄ‘aj. Damski, opulentno, ali i senzualno.\r\n\r\nPrema modnom kreatoru u penziji Tomu Fordu, pliÅ¡ je materijal za koji kaÅ¾e da \"niÅ¡ta ne izgleda tako bogato i dobro\". Ovaj izbor Nede Ukraden jeste pun pogodak.\r\nDa bi monohramtski stil ublaÅ¾ila, Neda je odabrala Kurt Gajger Å¡tikle na platformu u boji duge, malim kaiÅ¡em na gleÅ¾njevima, sa detaljem u vidu orla na Å¡picu, u vrednosti od oko 180 evra.\r\n\r\nAksesoar koji je odabrala- torbica sa Å¡ljokicama Aleksander Veng, sa logoom na drÅ¡ci koja se kreÄ‡e do 700 evra. Od nakita, sofisticirane minÄ‘uÅ¡e u boji zlata sa biserima.\r\n\r\nU ovom izdanju, Neda je pokazala da godine ne znaÄe niÅ¡ta da biste bili sofisticirani i Å¡armantni', 12, '2024-02-12 19:57:57', 33, 'pending'),
(37, 'ONA TIP-TOP SREÄENA, ON IZAÅ AO U Å TRIKANOM KOMPLETU BAKA MARE: Svi se pitaju Å¡ta pevaÄica radi sa NJIM', 'Selena Gomez i njen deÄko Beni Blanko, viÄ‘eni su na after-Å¾urci Gremi nagrada u potpuno razliÄitim stilovima.', 'Selena Gomez je za izlazak odabrala diskretni glamur, uparivÅ¡i crnu haljinu sa Å¡ljokicama sa velikim i luksuznim kaputom od veÅ¡taÄkog krzna. Glamurozno, pravi je opis njenog izgleda, dok je njen deÄko bio suÅ¡ta suprotnost.\r\n\r\nBeni Blanko je odabrao leÅ¾erniju i udobniju kombinaciju, nosivÅ¡i raznobojni heklani duks sa kapuljaÄom i pantalone u istom maniru.\r\n\r\nUkoliko napravimo podelu, sa jedne strane moÅ¾emo reÄ‡i da imamo izlazak namenjen formalnoj veÄeri, dok sa druge strane imamo kuÄ‡nu Å¾urku. Ipak, njih dvoje funkcioniÅ¡u zajedno.\r\n\r\nIpak, na druÅ¡tvenim mreÅ¾ama svi su jednoglasni da su njih dvoje dve suprotnosti u svakom smislu:\r\n\r\n\"Kao da mu je ovo Å¡trikala baka Mara,\" \"Å ta ona vidi u njemu?\", \"Å to se bar nije poÄeÅ¡ljao?\", neki su od komentara na mreÅ¾ama.\r\n\r\nInaÄe, moramo reÄ‡i da oni nisu prvi par poznat po takvom polarizovanom odevanju. Trend je veÄ‡ duÅ¾e vreme prisutan meÄ‘u holivudskim parovima kao Å¡to su Kajli DÅ¾ener i Timoti Å alame, ili kao Biberovi.\r\n\r\nMeÄ‘utim, zaÅ¡to se oblaÄiti usklaÄ‘eno kada umesto toga moÅ¾ete da prihvatite individualnost u potpunosti?\r\n\r\nNjihovi sukobljeni izgledi dokazuju da mogu da prihvate meÄ‘usobne razlike kao par i da su najvaÅ¾nije vrednosti, koje se poklapaju i koje par neguje i ceni.\r\n\r\nU decembru 2023, Selena Gomez je ostavila niz komentara na Instagramu koji su konaÄno potvrdili njenu vezu sa muziÄkim producentom Benijem Blankom. â€žOn je moje apsolutno sve u mom srcuâ€œ, izjavila je zvezda svojim fanovima, samo nekoliko nedelja nakon Å¡to su se proÅ¡irile glasine da su zajedno.\r\n\r\nPredivno vreme provodili su proÅ¡le nedelje u Diznilendu, gde su fanovi uspeli da ih snime kako zajedno uÅ¾ivaju.', 12, '2024-02-12 20:00:21', 33, 'pending'),
(38, '\"PALA\" 2 STRANCA U VALJEVU, SA NJIMA BIO I SRBIN: Policija zavirila u reno, on PUN MIGRANATA a to ni nije sve! U autu naÄ‘eno i OVO', 'VALJEVO - Policija u Valjevu uhapsila je dva strana drÅ¾avljanina i jednog drÅ¾avljanina Srbije zbog krijumÄarenja ljudi.', 'U akciji koja je izvedena u saradnji sa ViÅ¡im i Osnovnim javnim tuÅ¾ilaÅ¡tvom u Valjevu, uhapÅ¡eni su drÅ¾avljanin Turske M. C. (38), drÅ¾avljanin Moldavije V. I. (46), kao i L. K. (31) iz Beograda zbog postojanja osnova sumnje da su izvrÅ¡ili kriviÄno delo nedozvoljen prelaz drÅ¾avne granice i krijumÄarenje ljudi.\r\n\r\nPolicija je u okolini Valjeva, u â€žrenouâ€œ kojim je upravljao M. C. pronaÅ¡la pet migranata, u â€žmercedesuâ€œ koji je vozio V. I. jednog, a u â€žforduâ€œ kojim je upravljao L. K. Å¡est migranata, saopÅ¡teno je iz PU Valjevo.\r\n\r\nKod L. K. je pronaÄ‘ena i jedna tableta za koju se sumnja da se nalazi na spisku psihoaktivnih supstanci, pa Ä‡e protiv njega biti podneta i kriviÄna prijava, zbog postojanja osnova sumnje da je izvrÅ¡io kriviÄno delo neovlaÅ¡Ä‡eno drÅ¾anje opojnih droga.\r\n\r\nPo nalogu ViÅ¡eg javnog tuÅ¾ilaÅ¡tva u Valjevu, osumnjiÄenima je odreÄ‘eno zadrÅ¾avanje do 48 Äasova nakon Äega Ä‡e, uz kriviÄnu prijavu, biti privedeni tuÅ¾iocu.', 13, '2024-02-12 20:04:40', 34, 'pending'),
(39, 'ÄŒOVEK IZ SRBIJE POKUÅ AO DA PROKRIJUMÄŒARI 47 PAPAGAJA Makedonski carinici ostali u Å¡oku', 'Makedonski carinici zaplenili su 47 papagaja od drÅ¾avljanina Srbije koji je hteo da ih unese u Severnu Makedoniju, a da ih prethodno nije prijavio, saopÅ¡tila je makedonska Uprava carina.', 'Protiv drÅ¾avljanina Srbije podneta je prijava zbog pokuÅ¡aja krijumÄarenja 47 papagaja iz Srbije u Severnu Makedoniju, saopÅ¡tila je makedonska Uprava carina na Fejsbuku.\r\n\r\nKako se navodi, papagaji su zaplenjeni na graniÄnom prelazu Tabanovce.\r\n\r\nIako je drÅ¾avljanin Srbije rekao da nema Å¡ta da prijavi, carinici su detaljnim pregledom vozila u gepeku pronaÅ¡li kaveze sa pticama.\r\n\r\nKako se navodi, papagaji su predati Agenciji za upravljanje oduzetom imovinom.', 13, '2024-02-12 20:09:04', 34, 'approved'),
(41, 'KreÄ‡e ludilo! NATO razneo ruski avion?! Moskva zna krivca i veÄ‡ sprema osvetu, Putin im novo neÄ‡e oprostiti!', 'Instruktori NATO-a mogu biti umeÅ¡ani u napad na Il-76 ruskih VazduÅ¡no-kosmiÄkih snaga sa zarobljenim Ukrajincima u avionu, oborenog protivvazduÅ¡nim raketnim sistemom (SAM) Patriot u Belgorodskoj oblasti, rekao je Å¡ef ruske delegacije na pregovorima u BeÄu o vojnoj bezbednosti i kontroli naoruÅ¾anja Konstantin Gavrilov.', '- Ovo ne moraju nuÅ¾no biti ameriÄki operateri sistema protivvazduÅ¡ne odbrane Patriot, oni mogu biti operateri iz zemalja NATO-a, oni takoÄ‘e imaju ove sisteme i mogu da upravljaju njima - rekao je on.\r\n\r\nIstovremeno, Gavrilov je naglasio da uÄeÅ¡Ä‡e instruktora NATO-a nije dokazano, ali se â€žto moÅ¾e pretpostavitiâ€œ, jer je za rad sistema PVO Patriot potrebna posebna obuka.\r\n\r\nRanije tog dana, TASS je, pozivajuÄ‡i se na izvor u snagama bezbednosti, izvestio da su OruÅ¾ane snage Ukrajine unapred planirale napad na Il-76 . Prema reÄima sagovornika, instalacija PVO Patriot je prethodno premeÅ¡tena u pozicioni prostor i stajala sa iskljuÄenom radarskom stanicom.\r\n\r\nIl-76 se sruÅ¡io u Belgorodskoj oblasti ujutru 24. januara. Ministarstvo odbrane Rusije saopÅ¡tilo je da su ukrajinske oruÅ¾ane snage oborile avion uz pomoÄ‡ dve rakete i nazvale incident teroristiÄkim aktom kijevskog reÅ¾ima.\r\n\r\nNa brodu je bilo Å¡est Älanova posade, 65 ukrajinskih ratnih zarobljenika za razmenu i tri ruska vojna lica u njihovoj pratnji. Svi su poginuli. Odeljenje je primetilo da je Kijev imao za cilj da optuÅ¾i Moskvu za uniÅ¡tavanje ukrajinske vojske.', 14, '2024-02-12 21:44:41', 35, 'pending'),
(42, 'SRUÅ IO SE HANGAR AERODROMA U AMERICI! Ima mrtvih i povreÄ‘enih, PRVI SNIMCI sa mesta tragedije', 'Hangar u izgradnji sruÅ¡io na aerodromu u Bojziju u ameriÄkoj saveznoj drÅ¾avi Ajdaho, pri Äemu je poginulo troje, a povreÄ‘eno devet ljudi.', 'AP prenosi navode zvaniÄnika da je petoro povreÄ‘enih u kritiÄnom stanju.\r\n\r\nNavodi se da su vatrogasci juÄe popodne po lokalnom vremenu dobili poziv za intervenciju u privatnom hangaru na kojem se desilo \"katastrofalno\" ruÅ¡enje.\r\n\r\nIz gradske uprave Bojzija je saopÅ¡teno da je troje ljudi stradalo na licu mesta.\r\n\r\nNavodi se da su vatrogasci uspeli da stabilizuju mesto nesreÄ‡e i spasu viÅ¡e ljudi.\r\n\r\n- Scena je bila veoma haotiÄna. Ne znam Å¡ta je bio uzrok, ali mogu da vam kaÅ¾em da je bilo baÅ¡ veliko ruÅ¡enje - kazao je Hamel lokalnim medijima.\r\n\r\nZvaniÄnici su naveli da ruÅ¡enje hangara nije uticalo na redovno obavljanje poslova na aerodromu u Bojziju.\r\n\r\nNa druÅ¡tvenim mreÅ¾ama pojavili su se snimci sa mesta tragedije.', 14, '2024-02-12 22:15:27', 35, 'pending'),
(43, 'PUCNJAVA U ATINI: NapadaÄ ubio jednu osobu, pa se zabarikadirao u zgradi', 'NaoruÅ¾ani napadaÄ se zabarikadirao na drugom spratu zgrade u juÅ¾nom naselju Glifada u grÄkoj prestonici.', 'Prema informacijama, jedna osoba je izgubila Å¾ivot, a dve su povreÄ‘ene.\r\n\r\nPrema prvim informacijama, reÄ je o bivÅ¡em zaposlenom licu, poreklom iz Egipta, koje je otpuÅ¡teno. Prema istim informacijama, muÅ¡karac je godinama bio majstor u firmi i navodno je naoruÅ¾an karabinom.\r\n\r\nPoÄinilac je sa parkinga uÅ¡ao u prostorije preduzeÄ‡a, poÅ¡to je i pored toga Å¡to je dobio otkaz, i dalje imao pravo pristupa. Po ulasku je rekao da ide da poÄisti. Prvo je upucao dve osobe, a zatim se zaustavio na drugom spratu gde je upucao joÅ¡ jednu osobu, verovatno Å¾enu.\r\n\r\nHitna pomoÄ‡ ne moÅ¾e da uÄ‘e u zgradu jer je napadaÄ joÅ¡ uvek unutra. Napolju Äekaju dve mobilne jedinice, motocikl i hitna pomoÄ‡.', 14, '2024-02-12 22:19:28', 36, 'pending'),
(44, 'NauÄnici tvrde da su Å¾ene jaÄi pol! Ovo su argumenti', 'Hormoni imaju veoma vaÅ¾nu ulogu, poÅ¡to je poznato da Å¾enski hormon estrogen podstiÄe imunoloÅ¡ki sistem.', 'Å½ene imaju snaÅ¾niji i agresivniji imunitet od muÅ¡karaca, a osim toga, na njih bolje deluju vakcine i brojni lekovi - tvrdi profesor Piter DÅ¾onson s klinike na britanskom institutu za istraÅ¾ivanje raka.\r\n\r\nPrema njegovoj studiji, u kojoj je istraÅ¾ivao smrtnost od malignog melanoma, muÅ¡karci mnogo ÄeÅ¡Ä‡e umiru od ove bolesti nego Å¾ene, a veruje se da je uzrok tome testosteron, tzv. muÅ¡ki hormon, zbog koga, naÅ¾alost, imaju slab imunitet.\r\n\r\n- MuÅ¡ki organizam se slabije brani od kancerogenih Ä‡elija i ne uspeva da stopira njihovo Å¡irenje u telu poput Å¾enskog - rekao je dr DÅ¾onson.\r\n\r\nStatistika je pokazala i da u gotovo svim populacijama Å¾ene Å¾ive duÅ¾e od muÅ¡karaca, a nedavno su i danski nauÄnici ustanovili kako je Å¾enski pol otporniji i jaÄi od muÅ¡kog.\r\n\r\n- Å½ene u veÄ‡ini modernih druÅ¡tava Å¾ive duÅ¾e od muÅ¡karaca, a za to su zasluÅ¾ni bioloÅ¡ki i druÅ¡tveni Äinioci. Hormoni imaju veoma vaÅ¾nu ulogu, poÅ¡to je poznato da Å¾enski hormon estrogen podstiÄe imunoloÅ¡ki sistem - podseÄ‡aju danski nauÄnici.', 15, '2024-02-12 22:23:07', 37, 'pending'),
(45, 'Slab imunitet je glavni krivac zaÅ¡to ste Äesto bolesni! Evo kako da ga ojaÄate', 'Bolesti disajnih puteva su Äest problem u poslednje vreme, a farmaceut Navin Khosli je otkrio nekoliko trikova kako da ih izbegnete.', 'Da li se osecÌate kao da ste stalno bolesni? Å ta god da je u vazduhu u ovom trenutku, Äini se da tegobama nema kraja jer Äim prebolite jednu, skoro vas odmah pogodi druga.\r\n\r\nFarmaceut Navin Khosli upozorava da stalne bolesti mogu u velikoj meri uticati na kvalitet naÅ¡eg Å¾ivota, ali i na naÅ¡e mentalno zdravlje.\r\n\r\nNajvecÌi problem je slab imunitet, zbog Äega smo skloni Äestim oboljenjima. Neki ljudi imaju vecÌu predispoziciju da lakÅ¡e dobiju infekcije, a to moÅ¾e biti povezano sa vaÅ¡im okruÅ¾enjem.\r\n\r\nPostoji nekoliko naÄina kako moÅ¾ete ojaÄati vaÅ¡ imunitet, a toliko su jednostavni da s njima moÅ¾ete poÄeti veÄ‡ danas:\r\n\r\nSmanjite potroÅ¡nju preraÄ‘ene hrane\r\nVeÅ¾bajte redovno\r\nSmanjite stres\r\n', 15, '2024-02-12 22:24:47', 37, 'pending'),
(46, 'Dnevni horoskop! Lavovi se upuÅ¡taju u afere, StrelÄevi menjaju karijeru, a tek Å korpije', 'Od svih horoskopskih znakova, danaÅ¡nji dan Ä‡e biti najproduktivniji Å korpijama.', 'OVAN\r\nLJUBAV: ImaÄ‡ete pogreÅ¡no ubeÄ‘enje koje Ä‡e vam kvariti vezu ili Å¡anse da je ostvarite. POSAO: Vrlo ste kreativni i inspirisani ovih dana, Å¡to moÅ¾e biti dobro za posao. ZDRAVLJE: Povrede.\r\n\r\nBIK\r\nLJUBAV: Vrlo ste privlaÄni suprotnom polu, a vaÅ¡e mirno prisustvo ume da intrigira viÅ¡e nego bilo Å¡ta drugo. POSAO: Uspeh i uveÄ‡an obim posla. ZDRAVLJE: Osetljivi disajni putevi.\r\n\r\nBLIZANCI\r\nLJUBAV: Do sada bi veÄ‡ trebalo da ste naÅ¡li nekoga za sebe, a ako niste, imaÄ‡ete prilike. POSAO: Sav vaÅ¡ trud Ä‡e se uskoro isplatiti ili Ä‡e bar biti priznat na neki naÄin. ZDRAVLJE: Solidno.\r\n\r\nRAK\r\nLJUBAV: ÄŒak bi se i vaÅ¡a nerealna oÄekivanja ovih dana mogla donekle ispuniti. POSAO: ImaÄ‡ete sreÄ‡e, pogotovo u partnerskom poslu. ZDRAVLJE: Stabilno.\r\n\r\nLAV\r\nLJUBAV: Strast bi mogla da vas prevari da se upustite u aferu Äak i ako ste u vezi. POSAO: I dalje povoljan period za finansije, ali i opasnost od neracionalnog troÅ¡enja. ZDRAVLJE: Pazite Å¡ta jedete.\r\n\r\nDEVICA\r\nLJUBAV: Ako se neka prilika i bude pojavila, biÄ‡e sa osobom koja je dosta starija i neodgovarajuÄ‡a za vas. POSAO: Kvar sredstava za rad, ali inaÄe solidan period. ZDRAVLJE: Prehlada.\r\n\r\nVAGA\r\nLJUBAV: Morate da se izborite za ono Å¡to Å¾elite, inaÄe to neÄ‡ete dobiti. POSAO: MoÅ¾ete doneti pogreÅ¡ne odluke zbog pogreÅ¡nih pretpostavki. ZDRAVLJE: StomaÄne tegobe.\r\n\r\nÅ KORPION\r\nLJUBAV: U sjajnom ste periodu kada moÅ¾ete ostvariti ljubav kakvu traÅ¾ite ili podiÄ‡i postojeÄ‡u vezu na viÅ¡i nivo. POSAO: Uspeh Ä‡e vam doÄ‡i preko lepih stvari. ZDRAVLJE: Solidno.\r\n\r\nSTRELAC\r\nLJUBAV: Mogli biste doÄ‡i u centar paÅ¾nje iz pogreÅ¡nih razloga ili zbog neÄega Å¡to ne Å¾elite da se zna. POSAO: Promena karijere ili nadreÄ‘enih. ZDRAVLJE: Pad vitalnosti.\r\n\r\nJARAC\r\nLJUBAV: VaÅ¡ fiziÄki magnetizam je posebno izraÅ¾en ovih dana, zbog Äega doÅ¾ivljavate procvat u ljubavi. POSAO: MoguÄ‡e je da Ä‡e se desiti velike promene na poslu. ZDRAVLJE: Hormonski disbalans.\r\n\r\nVODOLIJA\r\nLJUBAV: Vreme ljubavi za vas joÅ¡ nije doÅ¡lo, osim ako budete putovali ili se povezali sa nekim iz inostranstva. POSAO: DoÅ¾iveÄ‡ete blokadu u ovoj sferi. ZDRAVLJE: Promenljivo.\r\n\r\nRIBE\r\nLJUBAV: VaÅ¡a paÅ¾nja je skrenuta na poslovne obaveze i to Ä‡e se osetiti u ljubavnom Å¾ivotu. POSAO: LogistiÄki ili administrativni problemi. ZDRAVLJE: Oprez u saobraÄ‡aju.\r\n\r\n ', 15, '2024-02-12 22:29:51', 37, 'pending'),
(47, 'Gde je najbolji burek u Srbiji? Kako gde? Pa u ÄŒaÄku!', 'ÄŒaÄak je grad poznat po peÄenju. Sada imaju i najboljeg buregdÅ¾iju u Srbiji. Tu titulu poneo je Goran PavloviÄ‡ koji viÅ¡e od 30 godina burek priprema na tradicionalan naÄin.', 'Otkad se proÄulo da se u buregdÅ¾inici u ÄaÄanskom naselju LjubiÄ‡ pravi najbolji burek mnogi i vikendom porane u kupovinu. Ne mare i da saÄekaju samo da bi probali vruÄ‡ specijalitet Gorana PavloviÄ‡a. Ima muÅ¡terija i iz drugih gradova.\r\n- ÄŒuli smo da je ovde najbolji i ovo je jedini razlog zaÅ¡to smo krenuli iz Beograda ovamo. Da probamo najbolji burek u Srbiji! - kaÅ¾e Boris ProkiÄ‡, iz Beograda.\r\n\r\n- Pitali smo usput na nekoliko mesta i svi su znali koga traÅ¾imo! Svi kaÅ¾u da je burek ubedljivo najbolji - kaÅ¾e MiloÅ¡ StojkoviÄ‡ iz Beograda.\r\n\r\nVeÄ‡ tri decenije Goran PavloviÄ‡ recept za burek ne menja. VeÅ¡to ruÄno razvija kore, meso je juneÄ‡e a testo priprema dan ranije.\r\n\r\n- Nema tajne za dobar burek osim predanosti poslu, dobro braÅ¡no, dobar fil i tanka kora, strogo tanka kora bez okrajaka i lepo sloÅ¾en burek -  objaÅ¡njava Goran PavloviÄ‡, buregdÅ¾ija iz ÄŒaÄka za RTS.', 16, '2024-02-12 22:33:39', 38, 'pending'),
(48, 'Zemljotres u RaÅ¡ki! Treslo se tlo u ovom naselju!', 'Zemljotres jaÄine 2.6 stepeni po Rihteru pogodio je veÄeras naselje Baljevac u RaÅ¡koj.', 'Potres se dogodio na dubini od 12 kilometara.\r\nPotres je registrovan u 21.05 Äasova, navodi se na sajtu SeizmoloÅ¡kog zavoda Srbije.\r\n\r\nZa sada nema izveÅ¡taja o materijalnoj Å¡teti.', 16, '2024-02-12 22:34:48', 38, 'pending'),
(49, 'SVE KRCATO ZA SRETENJE, NA OVOJ PLANINI SE TRAÅ½I MESTO VIÅ E: Rezervisana pred praznike, cena apartmana od 40 do 60 evra', 'Bajina BaÅ¡ta - Neposredno pre drÅ¾avni praznik Sretenje svi smeÅ¡tajni kapaciteti u Bajinoj BaÅ¡ti su popunjeni skoro sto odsto.', 'Prepoznata kao odliÄna destinacija za porodiÄni odmor planina Tara ponovo je privukla veliki broj gostiju, a nepisano je pravilo da oni koji jednom doÄ‘u uvek se vraÄ‡aju. Povoljne cene za svaÄiji dÅ¾ep, ono je Å¡to takoÄ‘e privlaÄi posetioce.\r\n\r\nHoteli VU â€œTaraâ€œ sa glavnim objektom â€žOmorikaâ€œ i ove godine su prepoznati od strane turista kao mesto koje pruÅ¾e odliÄne uslove za boravak. Mesta ima jedino u hotelu â€žBeli borâ€œ gde cena polupansiona iznosi 5100 din uz moguÄ‡nost besplatnog koriÅ¡Ä‡enja bazena, saune i teretane u \"Omorici\". Cena je izraÅ¾ena po osobi na dnevnom nivou, rekao je za RINU SiniÅ¡a SpasojeviÄ‡ iz TO Tara - Drina.\r\n\r\nOn dodaje da cene za pojedine kategorije privatnih smeÅ¡tajnih jedinica na Tari variraju u zavisnosti od tipa i u znatnoj meri su korigovane u smislu smanjenja u odnosu na novogodiÅ¡nje praznike. Najam apartmana iznosi od 40 do 60 evra. Cena vikendica za izdavanje je bazirana na dnevnom najmu i iznosi od 50 do 120 evra za luksuzniji smeÅ¡taj sa prateÄ‡im sadrÅ¾ajima, Ä‘akuzijem i saunom.\r\n\r\nDolaskom u Bajinu BaÅ¡tu i na Taru oÄekuju vas brojne moguÄ‡nosti za aktivan odmor poput planinarenja, biciklistiÄkih tura, voÅ¾nji kvadova, izleta do atraktivnih vidikovaca Nacionalnog parka Tara i joÅ¡ mnogo toga. Tokom prazniÄnih dana posveÄ‡enih Danu drÅ¾avnosti u Bajinoj BaÅ¡ti su zakazana primerena deÅ¡avanja iz oblasti kulture koja takoÄ‘e mogu biti zanimljiva posetiocima destinacije Tara Drina Bajina BaÅ¡ta.\r\n\r\nZa sve informacije o aktivnostima i dostupnim sadrÅ¾ajima tokom praznika pozovite ili posetite TuristiÄki info centar Bajina BaÅ¡ta koji radi svaki dan.', 17, '2024-02-12 22:37:20', 39, 'pending'),
(50, 'Å OK RAÄŒUN SA KOPAONIKA ÄorÄ‘e sa porodicom otiÅ¡ao na skijanje pa se zaprepastio', 'Voda 2.000 dinara! Jedno ga posebno iznerviralo', 'SneÅ¾ne padavine utabale su staze na Kopaoniku, pa je popularno srpsko skijaliÅ¡te veÄ‡ puno posetilaca.\r\n\r\nJedna od nezoabilaznih tema kada je ova planina u pitanju jesu visoke cene, koje nisu izostale ni ove godine. ÄorÄ‘e iz Kraljeva sa porodicom vikend je upravo proveo na ovom skijaliÅ¡tu i kaÅ¾e da se tu i popriliÄno dubok dÅ¾ep prazni brzinom svetlosti.\r\n\r\n- Dovoljno vam je reÄ‡i, da za jedan ruÄak sa porodocom najmanje koÅ¡tati 120 evra, dok su na primer samo domaÄ‡a kafa i Äaj 700 dinara, a flaÅ¡a od dva litra vode 2.000 dinara. Pritom konobar je priÅ¡ao i rekao iz topa rekao \"Äaj i domaÄ‡a kafa su vam 700 dinara\", kada smo traÅ¾ili raÄun, koÅ¡talo nas je 620. Iako smo bili i proÅ¡le godine, imam utisak da je poskupelo sve za 30 posto - kazao je za ÄorÄ‘e za RINU.\r\n\r\nOn dodaje da su staze na Kopaoniku zasta odliÄne i da zbog ljubavi prema skijanju rado bira ovu planinu, ali da Ä‡e zbog visokih cena i neljubaznosti konobara tokom predstojeÄ‡e zime najverovatnije potraÅ¾iti drugu destinaciju.\r\n\r\n- Razumem da sve poskupi, ali mislim da je Kopaonik nije viÅ¡e planina za Å¡ire narodne mase, veÄ‡ samo za one sa izrazito dubokim dzepom, zbog toga se mi selimo na Zlatibor ili Staru Planinu. Kada saberemo sve i stavimo na papir, za naÅ¡u porodicu na ovom mestu, za sve Äetiri dana, skijanja treba preko 2.000 evra, Å¡to je zaista puno - istiÄe StankoviÄ‡.', 17, '2024-02-12 22:40:51', 40, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `prijave`
--

DROP TABLE IF EXISTS `prijave`;
CREATE TABLE IF NOT EXISTS `prijave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `password` varchar(45) NOT NULL,
  `kategorija` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `created_at` varchar(45) NOT NULL,
  `experience` text NOT NULL,
  `role` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prijave`
--

INSERT INTO `prijave` (`id`, `name`, `surname`, `password`, `kategorija`, `status`, `created_at`, `experience`, `role`) VALUES
(17, 'Sanja', 'Vucic', 'sanja', 'Zabava', 'approved', '2024-02-12 14:19:32', 'Kao urednik zabavnog segmenta novina, stekla sam dragoceno iskustvo u koordinaciji i selekciji raznovrsnih zabavnih tema koje privlaÄe paÅ¾nju Äitatelja. TakoÄ‘e sam imala priliku da organizujem intervjue sa poznatim liÄnostima i da kreiram intrigantne priÄe o kulturnim dogaÄ‘ajima i trendovima, Å¡to me je dodatno obogatilo profesionalno.', 1),
(18, 'Jovan', 'Jankovic', 'jovan', 'Sport', 'approved', '2024-02-12 14:20:12', 'U oblasti sporta, razvio sam znaÄajno iskustvo praÄ‡enjem sportskih deÅ¡avanja, analizom sportskih trendova i strategijom izveÅ¡tavanja koja privlaÄi razliÄite segmente publike. Moje angaÅ¾ovanje novinara koji su specijalizovani za odreÄ‘ene sportske discipline doprinelo je kvalitetu i raznovrsnosti sportskog sadrÅ¾aja.', 1),
(19, 'Milica', 'Kovacevic', 'milica', 'Lifestyle ', 'approved', '2024-02-12 14:20:49', 'Uloga urednika za lifestyle predstavlja izazov koji sam s oduÅ¡evljenjem prihvatila, voÄ‘enjem rubrike koja se bavi temama poput putovanja, hrane, umetnosti i kulture. Moje iskustvo obuhvata istraÅ¾ivanje trendova, kreiranje originalnih sadrÅ¾aja i uspeÅ¡nu saradnju sa struÄnjacima iz razliÄitih oblasti.', 1),
(20, 'Kristina', 'Nikolic', 'kristina', 'Moda', 'approved', '2024-02-12 14:21:29', 'Kao urednik modnog segmenta, posedujem bogato iskustvo u praÄ‡enju modnih trendova, kreiranju sadrÅ¾aja o dizajnerima, brendovima i modnim dogaÄ‘ajima. Moje voÄ‘enje rubrike inspiriÅ¡e Äitateljstvo i pruÅ¾a korisne savete o stilu i modi, Å¡to mi omoguÄ‡ava da doprinesem kvalitetu novinskog izdanja.', 1),
(21, 'Dragan', 'Spasic', 'dragan', 'Hronika', 'approved', '2024-02-12 14:24:58', 'Kao urednik hronike, razvio sam znaÄajno iskustvo u praÄ‡enju aktuelnih dogaÄ‘aja, kriminalistiÄkih vesti i sudskih procesa. Moje angaÅ¾ovanje u istraÅ¾ivanju i proveri informacija, kao i u kreiranju relevantnih i objektivnih izveÅ¡taja, doprinelo je ugledu novina u ovoj oblasti.', 1),
(22, 'Sonja', 'Jovanovic', 'sonja', 'Planeta', 'approved', '2024-02-12 14:27:11', 'U oblasti planete, moje iskustvo obuhvata praÄ‡enje ekoloÅ¡kih problema, klimatskih promena i globalnih dogaÄ‘aja. Aktivno sam uÄestvovala u istraÅ¾ivanju tema kao Å¡to su oÄuvanje prirode, obnovljivi izvori energije i ekoloÅ¡ka odrÅ¾ivost, pruÅ¾ajuÄ‡i Äitaocima relevantne informacije o stanju naÅ¡e planete.', 1),
(23, 'Ana', 'Marinkovic', 'ana', 'Magazin', 'approved', '2024-02-12 14:28:07', 'Kao urednik magazina, imam bogato iskustvo u kreiranju raznovrsnih i privlaÄnih sadrÅ¾aja koji pokrivaju teme poput zdravlja, kulture, doma i porodice. Moje voÄ‘enje rubrike magazina obuhvata selekciju relevantnih tema, angaÅ¾ovanje struÄnjaka za savete i osmiÅ¡ljavanje kreativnih pristupa priÄama koje inspiriÅ¡u Äitatelje.', 1),
(24, 'Jovan', 'Ducic', 'jovan', 'Srbija', 'approved', '2024-02-12 14:28:47', 'U oblasti novinarstva u Srbiji, posedujem duboko iskustvo u praÄ‡enju domaÄ‡ih politiÄkih, ekonomskih i druÅ¡tvenih deÅ¡avanja. Moja uloga obuhvata istraÅ¾ivanje i analizu kljuÄnih tema, voÄ‘enje intervjua sa relevantnim akterima i pruÅ¾anje sveobuhvatnih informacija koje Äitaocima omoguÄ‡avaju bolje razumevanje aktuelne situacije u zemlji.', 1),
(25, 'Sofija', 'Knezevic', 'sofija', 'Biznis', 'approved', '2024-02-12 14:30:56', 'Kao urednik za poslovne vesti, stekao sam znaÄajno iskustvo u praÄ‡enju trÅ¾iÅ¡nih trendova, ekonomskih analiza i poslovnih dogaÄ‘aja. Moje angaÅ¾ovanje obuhvata voÄ‘enje rubrike koja pruÅ¾a relevantne informacije o poslovnim prilikama, investicionim projekcijama i ekonomskim izazovima, Äime doprinosim informisanju Äitalaca o poslovnom svetu.', 1),
(26, 'Katarina', 'Grujic', 'katarina', 'Zabava', 'approved', '2024-02-12 15:57:57', 'Kao novinar u oblasti zabave, stekla sam relevantno iskustvo u praÄ‡enju filmskih premijera, muziÄkih dogaÄ‘aja i kulturnih deÅ¡avanja. Moj doprinos obuhvata kreiranje zanimljivih i informativnih Älanaka o poznatim liÄnostima, trendovima u industriji zabave i aktuelnim dogaÄ‘ajima, Äime doprinosim bogatstvu sadrÅ¾aja i angaÅ¾ovanju Äitalaca.', 2),
(27, 'Lidija', 'Markovic', 'lidija', 'Zabava', 'approved', '2024-02-12 16:00:42', 'Imam velikog iskustva u ovoj oblasti. 10 godina iskustva je iza mene. Pravim informativne clanke zabavnog karaktera.', 2),
(28, 'Marko', 'Ristic', 'marko', 'Sport', 'approved', '2024-02-12 16:02:03', 'U oblasti sporta, moje novinarsko iskustvo obuhvata praÄ‡enje sportskih takmiÄenja, intervjue sa sportistima i analizu sportskih rezultata. Aktivno sam uÄestvovao u izveÅ¡tavanju o sportskim dogaÄ‘ajima, pruÅ¾ajuÄ‡i Äitaocima informacije o rezultatima, transferima, taktikama i dogaÄ‘ajima iz sveta sporta, Äime doprinosim pokrivanju Å¡irokog spektra sportskih tema.', 2),
(29, 'Milos', 'Milosevic', 'milos', 'Sport', 'approved', '2024-02-12 16:04:05', 'U svakom trenutku pratim sva moguca sportska desavanja. Analiziram sportske rezultate, prisustvujem i sam obavljam intervjuisanje sportista. Aktivno sam uÄestvovao u izveÅ¡tavanju o sportskim dogaÄ‘ajima, pruÅ¾ajuÄ‡i Äitaocima informacije o rezultatima, transferima, taktikama i dogaÄ‘ajima iz sveta sporta, Äime doprinosim pokrivanju Å¡irokog spektra sportskih tema.', 2),
(31, 'Jovana', 'Jevtic', 'jovana', 'Lifestyle ', 'approved', '2024-02-12 16:09:16', 'Kao novinar u oblasti lifestyle-a, imam relevantno iskustvo u istraÅ¾ivanju tema kao Å¡to su putovanja, gastronomija, umetnost i liÄni razvoj. Moj rad obuhvata pisanje inspirativnih Älanaka o Å¾ivotnom stilu, savetima za unapreÄ‘enje kvaliteta Å¾ivota i istraÅ¾ivanje aktuelnih trendova, pruÅ¾ajuÄ‡i Äitateljima korisne informacije za obogaÄ‡ivanje svakodnevnog Å¾ivota.', 2),
(32, 'Milica', 'Milic', 'milica', 'Moda', 'approved', '2024-02-12 16:21:09', 'Kao novinar u oblasti mode, posedujem relevantno iskustvo u praÄ‡enju modnih trendova, revija i dizajnerskih kolekcija. Moje angaÅ¾ovanje obuhvata izveÅ¡tavanje o aktuelnim trendovima, intervjuisanje modnih kreatora i analizu uticaja mode na druÅ¡tvo, pruÅ¾ajuÄ‡i Äitateljima uvid u svet mode i stilskih inovacija.', 2),
(33, 'Iva', 'Prokic', 'iva', 'Moda', 'approved', '2024-02-12 16:23:15', 'Cesto posecujem modne revije, dizajnerske kolekcije i ostala modna desavanja. Moje angaÅ¾ovanje obuhvata izveÅ¡tavanje o aktuelnim trendovima, intervjuisanje modnih kreatora i analizu uticaja mode na druÅ¡tvo, pruÅ¾ajuÄ‡i Äitateljima uvid u svet mode i stilskih inovacija.', 2),
(34, 'Lazar', 'Ilic', 'lazar', 'Hronika', 'approved', '2024-02-12 16:23:51', 'U oblasti hronike, kao novinar imam relevantno iskustvo u praÄ‡enju aktuelnih dogaÄ‘aja, kriminalistiÄkih vesti i sudskih procesa. Moje angaÅ¾ovanje u istraÅ¾ivanju i proveri informacija, kao i u kreiranju relevantnih i objektivnih izveÅ¡taja, doprinelo je ugledu novina u ovoj oblasti, pruÅ¾ajuÄ‡i Äitaocima pouzdane informacije o aktuelnim dogaÄ‘ajima.', 2),
(35, 'Nada', 'Petrovic', 'nada', 'Planeta', 'approved', '2024-02-12 16:25:56', 'Kao novinar u oblasti planete, imam bogato iskustvo u praÄ‡enju ekoloÅ¡kih problema, klimatskih promena i globalnih dogaÄ‘aja. Aktivno sam uÄestvovala u istraÅ¾ivanju tema kao Å¡to su oÄuvanje prirode, obnovljivi izvori energije i ekoloÅ¡ka odrÅ¾ivost, pruÅ¾ajuÄ‡i Äitaocima relevantne informacije o stanju naÅ¡e planete i izazovima sa kojima se suoÄava.', 2),
(36, 'Kosta', 'Kostic', 'kosta', 'Planeta', 'approved', '2024-02-12 16:33:59', 'Vec 7 godina pisem izvestaje o ekoloÅ¡kim problemima, klimatskim promenama i globalnim dogaÄ‘ajajima. Aktivno sam uÄestvovao u istraÅ¾ivanju tema kao Å¡to su oÄuvanje prirode, obnovljivi izvori energije i ekoloÅ¡ka odrÅ¾ivost, pruÅ¾ajuÄ‡i Äitaocima relevantne informacije o stanju naÅ¡e planete i izazovima sa kojima se suoÄava.', 2),
(37, 'Bojana', 'Stankovic', 'bojana', 'Magazin', 'approved', '2024-02-12 16:35:05', 'Kao novinar u oblasti planete, imam bogato iskustvo u praÄ‡enju ekoloÅ¡kih problema, klimatskih promena i globalnih dogaÄ‘aja. Aktivno sam uÄestvovao u istraÅ¾ivanju tema kao Å¡to su oÄuvanje prirode, obnovljivi izvori energije i ekoloÅ¡ka odrÅ¾ivost, pruÅ¾ajuÄ‡i Äitaocima relevantne informacije o stanju naÅ¡e planete i izazovima sa kojima se suoÄava.', 2),
(38, 'Rajko', 'Savic', 'rajko', 'Srbija', 'approved', '2024-02-12 16:36:04', 'U oblasti novinarstva u Srbiji, posedujem duboko iskustvo u praÄ‡enju domaÄ‡ih politiÄkih, ekonomskih i druÅ¡tvenih deÅ¡avanja. Moja uloga obuhvata istraÅ¾ivanje i analizu kljuÄnih tema, voÄ‘enje intervjua sa relevantnim akterima i pruÅ¾anje sveobuhvatnih informacija koje Äitaocima omoguÄ‡avaju bolje razumevanje aktuelne situacije u zemlji.', 2),
(39, 'David', 'Jakovljevic', 'david', 'Biznis', 'approved', '2024-02-12 16:40:04', 'Kao novinar u oblasti biznisa, stekao sam relevantno iskustvo u praÄ‡enju trÅ¾iÅ¡nih trendova, ekonomskih analiza i poslovnih dogaÄ‘aja. Moj rad obuhvata izveÅ¡tavanje o poslovnim prilikama, investicionim projekcijama i ekonomskim izazovima, pruÅ¾ajuÄ‡i Äitateljima relevantne informacije o poslovnom svetu i doprinoseÄ‡i razumevanju kompleksnosti poslovnog okruÅ¾enja.', 2),
(40, 'Viktorija', 'Pavlovic', 'viktorija', 'Biznis', 'approved', '2024-02-12 16:41:41', 'Vec dugo godina sam, mogu da kazem, u drustvu poznatih, uspesnih ljudi. Kao novinar u oblasti biznisa, stekao sam relevantno iskustvo u praÄ‡enju trÅ¾iÅ¡nih trendova, ekonomskih analiza i poslovnih dogaÄ‘aja. Moj rad obuhvata izveÅ¡tavanje o poslovnim prilikama, investicionim projekcijama i ekonomskim izazovima, pruÅ¾ajuÄ‡i Äitateljima relevantne informacije o poslovnom svetu i doprinoseÄ‡i razumevanju kompleksnosti poslovnog okruÅ¾enja.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `idTag` int(10) NOT NULL AUTO_INCREMENT,
  `contentTag` text NOT NULL,
  `newsID` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTag`),
  KEY `newsID` (`newsID`)
) ENGINE=MyISAM AUTO_INCREMENT=195 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`idTag`, `contentTag`, `newsID`) VALUES
(113, 'gluma', 30),
(118, 'numerololgija', 32),
(117, 'tenis', 29),
(116, 'Novak', 29),
(115, 'Stena', 29),
(114, 'Svajcarska', 29),
(73, ' Argentina', 28),
(72, ' fudbal', 28),
(71, ' Olimpijske igre', 28),
(70, 'Brazil', 28),
(69, ' Prva liga Srbije', 27),
(68, ' klub', 27),
(67, ' fudbal', 27),
(62, 'g', 23),
(63, 'pr', 24),
(66, 'Radnicki', 27),
(111, 'Besa', 30),
(109, 'Poslednji strelac', 30),
(85, 'film', 31),
(86, ' nedelja', 31),
(87, ' Dzej Ramadanovski', 31),
(88, ' telekom', 31),
(89, ' Husein Husa AlijeviÄ‡', 31),
(112, 'Nenad Jezdic', 30),
(110, 'Milos Timotijevic', 30),
(108, 'triler', 30),
(119, ' brojevi', 32),
(120, ' finansije', 32),
(121, 'ljudi', 33),
(122, ' kukanje', 33),
(123, 'balensijaga', 34),
(124, ' suknja', 34),
(125, ' peskir', 34),
(126, ' Dzejden Smit', 34),
(127, 'Irina Sajk', 35),
(128, ' model', 35),
(129, ' zena', 35),
(130, ' mafijas', 35),
(131, ' trend', 35),
(132, 'Neda Ukrade', 36),
(133, ' Zika Jaksic', 36),
(134, ' proslava', 36),
(135, ' zurka', 36),
(136, ' evri', 36),
(137, 'Selena Gomez', 37),
(138, ' decko', 37),
(139, ' Beni Blanko', 37),
(140, ' gremi', 37),
(141, ' nagrade', 37),
(142, ' glamur', 37),
(143, 'Valjevo', 38),
(144, ' policija', 38),
(145, ' migranti', 38),
(146, ' hapsenje', 38),
(153, 'NATO', 41),
(152, 'Severna Makedonija', 39),
(151, 'papagaji', 39),
(154, ' Putin', 41),
(155, ' napad', 41),
(156, ' Ukrajinci', 41),
(157, ' avion', 41),
(158, ' Rusija', 41),
(159, 'hangar', 42),
(160, ' aerodrom', 42),
(161, ' amerika', 42),
(162, ' tragedija', 42),
(163, 'pucnjava', 43),
(164, ' Atina', 43),
(165, ' karabin', 43),
(166, 'zene', 44),
(167, ' muskarci', 44),
(168, ' pol', 44),
(169, ' hormoni', 44),
(170, 'bolesti', 45),
(171, ' imunitet', 45),
(172, ' stres', 45),
(173, ' hrana', 45),
(174, 'horoskop', 46),
(175, ' ljubav', 46),
(176, ' posao', 46),
(177, ' zdravlje', 46),
(178, 'burek', 47),
(179, ' Cacak', 47),
(180, ' Ljubic', 47),
(181, ' Goran Pavlovic', 47),
(182, 'zemljotres', 48),
(183, ' Raska', 48),
(184, ' steta', 48),
(185, 'Bajina Basta', 49),
(186, ' Sretenje', 49),
(187, ' Tara', 49),
(188, ' hotel', 49),
(189, ' odmor', 49),
(190, 'racun', 50),
(191, ' Kopaonik', 50),
(192, ' skijanje', 50),
(193, ' cene', 50),
(194, ' planina', 50);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `password` varchar(45) NOT NULL,
  `categoryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cateoryID` (`categoryID`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `role`, `name`, `surname`, `password`, `categoryID`) VALUES
(1, 0, 'Bojana', 'Aleksijevic', 'bojana', NULL),
(17, 1, 'Sanja', 'Vucic', 'sanja', 9),
(18, 1, 'Jovan', 'Jankovic', 'jovan', 10),
(19, 1, 'Milica', 'Kovacevic', 'milica', 11),
(20, 1, 'Kristina', 'Nikolic', 'kristina', 12),
(21, 1, 'Dragan', 'Spasic', 'dragan', 13),
(22, 1, 'Sonja', 'Jovanovic', 'sonja', 14),
(23, 1, 'Ana', 'Marinkovic', 'ana', 15),
(24, 1, 'Jovan', 'Ducic', 'jovan', 16),
(25, 1, 'Sofija', 'Knezevic', 'sofija', 17),
(26, 2, 'Katarina', 'Grujic', 'katarina', 9),
(27, 2, 'Lidija', 'Markovic', 'lidija', 9),
(28, 2, 'Marko', 'Ristic', 'marko', 10),
(29, 2, 'Milos', 'Milosevic', 'milos', 10),
(31, 2, 'Jovana', 'Jevtic', 'jovana', 11),
(32, 2, 'Milica', 'Milic', 'milica', 12),
(33, 2, 'Iva', 'Prokic', 'iva', 12),
(34, 2, 'Lazar', 'Ilic', 'lazar', 13),
(35, 2, 'Nada', 'Petrovic', 'nada', 14),
(36, 2, 'Kosta', 'Kostic', 'kosta', 14),
(37, 2, 'Bojana', 'Stankovic', 'bojana', 15),
(38, 2, 'Rajko', 'Savic', 'rajko', 16),
(39, 2, 'David', 'Jakovljevic', 'david', 17),
(40, 2, 'Viktorija', 'Pavlovic', 'viktorija', 17);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
