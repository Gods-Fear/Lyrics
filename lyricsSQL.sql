-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2021 at 08:29 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `isbd`
--

-- --------------------------------------------------------

--
-- Table structure for table `albumy`
--

CREATE TABLE `albumy` (
  `IdAlb` int(11) NOT NULL,
  `NazwaAlb` varchar(50) NOT NULL,
  `DataWAlb` date NOT NULL,
  `ObrazAlb` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `albumy`
--

INSERT INTO `albumy` (`IdAlb`, `NazwaAlb`, `DataWAlb`, `ObrazAlb`) VALUES
(1, 'Blue Madonna', '2018-01-12', '220px-Borns_-_Blue_Madonna.png'),
(2, 'ANTI (Deluxe)', '2016-02-27', 'Rihanna_-_Anti.png'),
(3, 'Solace', '2018-06-21', '');

-- --------------------------------------------------------

--
-- Table structure for table `artysci`
--

CREATE TABLE `artysci` (
  `IdArt` int(11) NOT NULL,
  `NazwaArt` varchar(50) NOT NULL,
  `DataUrArt` date NOT NULL,
  `PlecAr` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `artysci`
--

INSERT INTO `artysci` (`IdArt`, `NazwaArt`, `DataUrArt`, `PlecAr`) VALUES
(1, 'Borns', '1992-01-07', 'M'),
(3, 'Rihanna', '1988-02-20', 'F'),
(7, 'Ramstein', '2001-05-09', 'M'),
(9, 'Lana Del Ray', '1990-03-04', 'F');

-- --------------------------------------------------------

--
-- Table structure for table `edytorzy`
--

CREATE TABLE `edytorzy` (
  `idE` int(10) UNSIGNED NOT NULL,
  `NazwiskoE` varchar(50) NOT NULL,
  `ImieE` varchar(50) NOT NULL,
  `PlecE` varchar(1) NOT NULL,
  `NrDE` varchar(20) NOT NULL,
  `EmailE` varchar(50) NOT NULL,
  `LoginE` varchar(30) NOT NULL,
  `HasloE` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `klienci`
--

CREATE TABLE `klienci` (
  `IdK` int(10) UNSIGNED NOT NULL,
  `NazwiskoK` varchar(50) NOT NULL,
  `ImieK` varchar(50) NOT NULL,
  `PlecK` varchar(1) NOT NULL,
  `DataUrK` date NOT NULL,
  `EmailK` varchar(50) NOT NULL,
  `HasloK` varchar(30) NOT NULL,
  `ZdjK` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `klienci`
--

INSERT INTO `klienci` (`IdK`, `NazwiskoK`, `ImieK`, `PlecK`, `DataUrK`, `EmailK`, `HasloK`, `ZdjK`) VALUES
(2, 'Kovalenko', 'Artem', 'M', '2001-05-09', '1234@icloud.com', 'admin', ''),
(4, 'Melnik', 'Daniil', 'M', '1999-01-01', 'daniil@gmail.com', 'zxcv', '');

-- --------------------------------------------------------

--
-- Table structure for table `komentarze`
--

CREATE TABLE `komentarze` (
  `IdKom` int(11) NOT NULL,
  `TrescKom` varchar(500) NOT NULL,
  `DataKom` datetime NOT NULL,
  `IdK` int(11) NOT NULL,
  `IdU` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `komentarze`
--

INSERT INTO `komentarze` (`IdKom`, `TrescKom`, `DataKom`, `IdK`, `IdU`) VALUES
(1, 'test', '2021-01-11 00:00:00', 1, 1),
(2, 'bla bla bla', '2021-01-11 00:00:00', 1, 1),
(3, 'jhbhb', '2021-01-11 00:00:00', 2, 10),
(4, 'consideration', '2021-01-11 00:00:00', 2, 13),
(5, 'jjjj', '2021-01-11 00:00:00', 2, 1),
(6, 'first comment! yay!', '2021-01-11 00:00:00', 2, 2),
(7, 'kjnkjj', '2021-01-11 00:00:00', 1, 25),
(8, 'nmm', '2021-01-11 14:39:20', 1, 25),
(9, 'Cool Song!', '2021-01-12 16:08:48', 4, 13);

-- --------------------------------------------------------

--
-- Table structure for table `listyulub`
--

CREATE TABLE `listyulub` (
  `IdK` int(11) NOT NULL,
  `IdU` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `listyulub`
--

INSERT INTO `listyulub` (`IdK`, `IdU`) VALUES
(2, 24),
(2, 27),
(4, 13);

-- --------------------------------------------------------

--
-- Table structure for table `utworym`
--

CREATE TABLE `utworym` (
  `IdU` int(11) NOT NULL,
  `NazwaU` varchar(50) NOT NULL,
  `TekstU` text NOT NULL,
  `IdAlb` int(11) NOT NULL,
  `IdArt` int(11) NOT NULL,
  `IdK` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utworym`
--

INSERT INTO `utworym` (`IdU`, `NazwaU`, `TekstU`, `IdAlb`, `IdArt`, `IdK`) VALUES
(1, 'God Save Our Young Blood', '[Verse 1: BØRNS & Both]\r\nDamn, look at the sunrise\r\nGlowing finish line, made it in record time\r\nHey, baby, we made it\r\nMy head\'s faded, headlights dilated\r\n\r\n[Refrain: BØRNS & Both]\r\nSpinnin\', spinnin\' and I can\'t sit still\r\nSpinnin\', spinnin\' and we can\'t sit still\r\n\r\n[Verse 2: BØRNS & Both]\r\nBaptized in blue skies\r\nRoll the window down, reach out, feel around for new life\r\nDamn, you and those green eyes\r\nWe can never stop movin\', we see nothin\' but the green lights\r\n\r\n[Refrain: BØRNS]\r\nSpinnin\', spinnin\' and we can\'t sit still\r\nSpinnin\', spinnin\' and we can\'t sit still\r\n\r\n[Chorus: BØRNS & Both]\r\nGod save, God save our young blood\r\nGod save, God save our young love\r\nHot pavement, hot pavement, hot wheels in the sun\r\nGod save our young blood\r\nGod save, God save our young blood\r\nGod save, God save our young love\r\nWarm waves, warm waves, on the coast where we love\r\nGod save our young blood\r\n[Verse 2: BØRNS]\r\nClimbed up the tree of life, kicked out of paradise\r\nLiving good, living evil is the toss of the dice\r\nCouple of wild eyes, cup full of high life\r\nShe\'s an angel and a devil of her own device\r\n\r\n[Refrain: BØRNS, Lana Del Rey, Both]\r\nShe\'s got me spinnin\' (Spinnin\')\r\nSpinnin\' and I can\'t sit still (You know I can\'t sit still)\r\nOh, spinnin\', spinnin\' and we can\'t sit still\r\n\r\n[Chorus: BØRNS & Both]\r\nGod save, God save our young blood\r\nGod save, God save our young love\r\nHot pavement, hot pavement, hot wheels in the sun\r\nGod save our young blood\r\nGod save, God save our young blood\r\nGod save, God save our young love\r\nWarm waves, warm waves, on the coast where we love\r\nGod save our young blood\r\n\r\n[Bridge: BØRNS, Lana Del Rey, Both]\r\nGod save the ocean, God save the breeze\r\nSave the words from my lips, save the birds, save the bees\r\nBaby save me one last sip while you strip on the beach\r\nI\'ll save you in the waves if you swim too deep\r\nGod save, God save our young blood\r\nGod save our young love\r\n[Chorus: BØRNS & Both]\r\nGod save, God save our young blood\r\nGod save, God save our young love\r\nHot pavement, hot pavement, hot wheels in the sun\r\nGod save our young blood\r\nGod save, God save our young blood\r\nGod save, God save our young love\r\nWarm waves, warm waves, on the coast where we love\r\nGod save our young blood\r\n\r\n[Outro: Both]\r\nOn the coast where we love\r\nGod save our young blood\r\nOn the coast where we love\r\nGod save our young blood', 1, 1, 2),
(2, 'Faded Heart', '[Verse 1]\r\nGalaxy, galaxy\r\nWon\'t you be my consolation?\r\nI need someone to kiss my hands and my feet\r\nAnd make me feel complete, oh, yeah\r\nMysterious universe\r\nI know you\'re unrehearsed\r\nBut I see the light in your hands\r\nYou\'re the man with the plan, oh, yeah\r\n\r\n[Pre-Chorus]\r\nBut it feels just like I\'m falling all the time\r\n(Falling all the time)\r\n\r\n[Chorus]\r\nHigh as a pretty star\r\nDon\'t you break my faded heart\r\nDon\'t put me out\r\nShow me what it\'s all about\r\nDon\'t you break my faded heart\r\nDon\'t you break it, no\r\nDon\'t you break it, no\r\nDon\'t you break it, faded heart\r\n\r\n[Verse 2]\r\nFantasy, fantasy\r\nYou got me howling like a dog in the heat\r\nI\'m trying not to put up a fight\r\nBut I can\'t lose another night, oh, no\r\nSo call me your Romeo\r\nI\'ll show you the way my Thunderbird sings\r\nYou and the suede backseat is all I\'ll ever need\r\n[Pre-Chorus]\r\nBut it feels like I\'m running out of time\r\n(Running out of time)\r\n\r\n[Chorus]\r\nHigh as a pretty star\r\nDon\'t you break my faded heart\r\nDon\'t put me out\r\nShow me what it\'s all about\r\nDon\'t you break my faded heart\r\nDon\'t you break it, no\r\nDon\'t you break it, no\r\nDon\'t you break it, faded heart\r\n\r\n[Bridge]\r\nI\'m searching for a sign\r\nBeen looking way too high\r\nHeart in the trenches, head in the heavens\r\n\r\n[Chorus]\r\nHigh as a pretty star\r\nDon\'t you break my faded heart\r\nDon\'t put me out\r\nShow me what it\'s all about\r\nDon\'t you break my faded heart\r\nDon\'t you break it, no\r\nDon\'t you break it, no\r\nDon\'t you break it', 1, 1, 2),
(3, 'Sweet Dreams', '[Intro]\r\nHearts in a cage\r\n\r\n[Verse 1]\r\nHearts in a cage, hearts in a cage\r\nYou, you flipped the page and slipped away\r\n\r\n[Pre-Chorus 1]\r\nNever thought that you were\r\nSomeone to say things that you didn\'t mean\r\n\r\n[Chorus 1]\r\nYou didn\'t even call to wish me sweet dreams\r\nReally thought we made a sweet team\r\nBut don\'t cry\r\nConsider this a lullaby\r\nBye and sweet dreams\r\n\r\n[Verse 2]\r\nTicking clocks on the wall waiting for your call\r\nBut that cuckoo bird won\'t sing at all\r\n\r\n[Pre-Chorus 2]\r\nNever thought you would\r\nTake everything we had and loved and leave\r\n[Chorus 2]\r\nYou didn\'t even call to wish me sweet dreams\r\nReally thought we made a sweet team\r\nBut don\'t cry, can\'t you see that you\'re a love of mine?\r\nSweet dreams, always thought you were the sweetest thing\r\nBut don\'t cry, consider this a lullaby - bye\r\nThem sweet dreams, sweet dreams\r\nSweet dreams, oh, sweet dreams', 1, 1, 3),
(4, 'We Don’t Care', '[Verse 1]\r\nI got a case of the haunting\r\nI got a taste of the madman in my mind\r\nWell, I used to sleep at night\r\nMoving like everyones watching\r\nShake off the shadows, freak out the phantoms love\r\nYou’re more than just a dove\r\n\r\n[Pre-Chorus]\r\nShe’s my light\r\nShe’s my daredevil halo tonight\r\nThe world’s on fire\r\n\r\n[Chorus]\r\nBut we don’t care\r\nWe don’t care\r\nTouch me\r\nEveryone’s watching but we don’t care\r\n\r\n[Verse 2]\r\nWe’re face to face without faces\r\nLined up from coastline to coast like static sky\r\nWell maybe it’s just goodbye\r\nWho’s playing the harlequin bass line\r\nDancing the dance like we’re seasick dominos\r\nThere’s only one way to go\r\n[Pre-Chorus]\r\nShe’s my light\r\nShe’s my daredevil halo tonight\r\nThe world’s on fire\r\n\r\n[Chorus]\r\nBut we don’t care\r\nWe don’t care\r\nTouch me\r\nEveryone’s watching but we don’t\r\n\r\n[Outro]\r\nWe don’t care\r\nWe could go for days\r\nWe don’t care\r\nGo our separate ways\r\nWe don’t care\r\nWe don’t care\r\nWe don’t care', 1, 1, 3),
(5, 'Man', 'Hello from the mountain\r\nFrom a god\'s eye view\r\nBut to sleep in the lowlands\r\nWhere I dream best with you\r\nMorning from the ocean\r\nBeneath a summer moon\r\nBut all I want is to dance in the fountains\r\nWhere I move best with you\r\n\r\n[Chorus]\r\nIf the worlds gonna end\r\nI wanna be your friend\r\nWhen the lights go dim\r\nI wanna be your man\r\nTell me what is heaven if our souls are split in two?\r\nI want to be your man\r\nI wanna be your man\r\n\r\n[Verse 2]\r\nRadio radio sing\r\nTill the stars burn out\r\nI get lost in the static\r\nWhen I hear your sounds\r\nOver and over again\r\nI lose my sight\r\nOh but it’s so automatic\r\nWhen I see your light\r\n[Chorus]\r\nIf the worlds gonna end\r\nI wanna be your friend\r\nWhen the lights go dim\r\nI wanna be your man\r\nTell me what is heaven if our souls are split in two?\r\nAnd what is heaven if my spirit’s without you?\r\nI want to be your man\r\nI wanna be your man\r\n\r\n[Instrumental Bridge]\r\n\r\n[Chorus]\r\nIf the worlds gonna end\r\nI wanna be your friend\r\nWhen the lights go dim\r\nI wanna be your man\r\nTell me what is heaven if our souls are split in two?\r\nAnd what is heaven if my spirit’s without you?\r\nI want to be your man\r\nI wanna be your man', 1, 1, 1),
(6, 'Iceberg', '[Verse 1]\r\nWell look who showed up in my head\r\nA vision of you crawling in my bed\r\nI\'ve been meaning to tell you that I\'ve been\r\nDreaming about you rolling a perfect joint\r\nLike you do\r\n\r\n[Pre-Chorus]\r\nYou\'re always perfect\r\nIt makes me nervous\r\nFeels like I don\'t deserve you\r\nI\'m living on the surface\r\n\r\n[Chorus]\r\nIceberg\r\nIceberg\r\n\r\n[Verse 2]\r\nI wanna break the surface tension\r\nTurn the ripples that surround us into waves\r\nThere\'s not a limit to love, there\'s an extension\r\nI\'m hidden above the passion that hides away\r\n\r\n[Pre-Chorus]\r\nYou\'re always perfect\r\nIt makes me nervous\r\nFeels like I don\'t deserve you\r\nI\'m living on the surface\r\n[Chorus]\r\nIceberg (my love is so much deeper than you see)\r\nIceberg (my love is so much deeper than you see)\r\nIceberg (my love is so much deeper than you see)\r\nIceberg (my love is so much deeper than you see)\r\n\r\n[Bridge]\r\nBaby, the hardest part is knowing where to start\r\nIf I could break this ice, then maybe I would melt your heart\r\nIf I could dive down baby and show you the truth\r\nYou wouldn\'t only find me but a deeper side of you\r\n\r\n[Chorus]\r\nIceberg (my love is so much deeper than you see)\r\nIceberg (my love is so much deeper than you see)\r\nIceberg (my love is so much deeper than you see)\r\nIceberg (my love is so much deeper than you see)\r\n\r\n[Outro]\r\nYou\'re always perfect\r\nMy love is so much deeper than you see\r\nYou\'re always perfect\r\nMy love is so much deeper than you see', 1, 1, 3),
(7, 'Second Night of Summer', '[Verse 1]\r\nShe’s headed to west in an airplane\r\nCareless with my heart in a carry-on\r\nI’m trying to forget her\r\nI’m trying to forget her\r\nI bet she’s in a beach chair somewhere\r\nBreaking new hearts by the poolside\r\nI’m trying to forget her\r\nI’m trying, I’m trying\r\n\r\n[Pre-Chorus]\r\nWell it’s the second day of summer\r\nYou already got me sweating about it\r\nOh it’s second night of summer\r\nAnd I’m disintegrating without you\r\n\r\n[Chorus]\r\nThrowing me that shade like I’m not cool enough\r\n\r\n[Verse 1]\r\nShe’s always had a soul like cellophane\r\nWalked right through me like a spring rain\r\nI’m trying to forget her\r\nI’m trying to forget\r\nShe’s always running from her troubles\r\nThe trouble is I love her\r\nWon’t ever love another one cold as her\r\nI’m trying to forget her\r\nI’m trying, I’m trying\r\n[Pre-Chorus]\r\nWell it’s the second day of summer\r\nYou already got me sweating about it\r\nOh it’s second night of summer\r\nAnd I’m disintegrating without you\r\n\r\n[Chorus]\r\nThrowing me that shade like I’m not cool enough\r\nThrowing me that shade like I’m not\r\nOoh, like I\'m not cool enough\r\nThrowing me that shade like I’m not\r\nLike I\'m not, like I\'m not\r\nLike I\'m not cool enough, not cool enough\r\n\r\n[Bridge]\r\nSun up and sun down\r\nSun up and sun down\r\n\r\n[Pre-Chorus]\r\nWell it’s the second day of summer\r\nYou already got me sweating about it\r\nOh it’s second night of summer\r\nAnd I’m disintegrating without you\r\n\r\n[Chorus]\r\nThrowing me that shade like I’m not cool enough\r\nThrowing me that shade like I’m not\r\nOoh, like I\'m not cool enough\r\nThrowing me that shade like I’m not\r\nLike I\'m not, like I\'m not\r\nLike I\'m not cool enough, not cool enough', 1, 1, 3),
(8, 'I Don’t Want U Back', '[Verse 1]\r\nWell, it was last week\r\nAnd you ran out of the house\r\nI heard his sparkomatic\r\nAnd when you came back\r\nI felt you losing touch\r\nI knew you couldn\'t be trusted\r\n\r\n[Pre-Chorus]\r\nI should\'ve known better when you\'re coming to bed at four in the morning\r\nI should\'ve taken your eyes avoiding mine as a warning\r\nEvery time I ask you, \"What\'s up baby?\" you\'re changing your story\r\nJust so you know that when you go I ain’t begging for you back\r\n\r\n[Chorus]\r\nI sleep better than every\r\nNight you were lying next to me\r\nDon’t wanna see your face\r\nYou need to face the facts\r\nI don’t want you back\r\nI don’t want you back\r\n\r\n[Verse 2]\r\nAnother year passed\r\nAnother Friday night\r\nYou showed up at the disco\r\nAnd when we caught eyes\r\nThe room started to spin\r\nAnd my heart nearly busted\r\n[Pre-Chorus]\r\nI should\'ve known better but the liquor got me thinking I miss ya\r\nI should\'ve taken two steps back but I wanted to kiss ya\r\nEvery time you flash those eyes you make me reminisce ya\r\nYou’re looking fine, but I\'d be lying, if I said I wanted you back\r\n\r\n[Chorus]\r\nI sleep better than every\r\nNight you were lying next to me\r\nDon’t wanna see your face\r\nYou need to face the facts\r\nI don’t want you back\r\nI don’t want you back\r\n\r\n[Bridge]\r\nThe bigger the lies the harder they fall\r\nThe hotter the fire, the faster the love is gonna burn up\r\nThe hotter the fire, the smoke and the mirrors\r\nIts clear I\'m better off without ya\r\n\r\n[Chorus]\r\nI sleep better than every\r\nNight you were lying next to me\r\nDon’t wanna see your face\r\nYou need to face the facts\r\nI don’t want you back\r\nI don’t want you back\r\n[Outro]\r\nHeartbeats\r\nAre made of honesty\r\nAnd all this time wasn\'t just you and me\r\nIt\'s sad to say, I’m glad you left\r\nI don\'t want you back\r\nI don\'t want you back\r\nI don\'t want you back', 1, 1, 1),
(9, 'Tension (Interlude)', 'I had a different impression of you\r\nThought I would mention that I thought the tension was mutual\r\nAin\'t no bedrooms in our future though\r\n\'Cause I\'m at the end of my rope\r\nKick me to the curb, yeah, kick me to the side of the road\r\n\r\nI had a different impression of you\r\nThought I would mention that I thought the tension was mutual\r\nAin\'t no bedrooms in our future though\r\n\'Cause I\'m at the end of my rope\r\nKick me to the curb, yeah, kick me to the side of the road\r\n\r\nTension\r\nTension', 1, 1, 1),
(10, 'Supernatural', '[Verse 1]\r\nI\'m falling at the sight of you\r\nYou tripped me, it\'s alright\r\nIs it just me or is it you?\r\nIs it love or am I fooling around trying to find the truth\r\nI\'m trying to find the truth\r\n\r\n[Chorus]\r\nIs it us or is it supernatural?\r\nSometimes we fall so fast it\'s hard to tell\r\n(Stella ella ola clap clap clap)\r\nIs it love or is it simply something else?\r\nSometimes I think I\'m caught under a spell\r\n(Stella ella ola! clap clap clap)\r\n\r\n[Verse 3]\r\nI\'m floating like a satellite\r\nLike the sound of the ocean\r\nJust rolling around in the blue\r\nIt is just me without a clue\r\nI’m trying to find the truth\r\nI\'m tying to find the truth\r\n\r\n[Chorus]\r\nIs it us or is it supernatural?\r\nSometimes we fall so fast it\'s hard to tell\r\n(Stella ella ola clap clap clap)\r\nIs it love or is it simply something else?\r\nSometimes I think I\'m caught under a spell\r\n(Stella ella ola! clap clap clap)\r\nIs it us or is it supernatural?\r\nSometimes we fall so fast it\'s hard to tell\r\n(Stella ella ola clap clap clap)\r\nIs it love or is it simply something else?\r\nSometimes I think I\'m caught under a spell\r\n(Stella ella ola! clap clap clap)', 1, 1, 2),
(11, 'Blue Madonna', '[Verse 1: BØRNS, Lana Del Rey, Both]\r\nAyy, ayy\r\nSomeone must have sent me to heaven (ahh)\r\nBlue madonna down by the pool\r\nJust want to make her feel like a virgin\r\nA version of herself that she once knew\r\nOoh\r\n\r\n[Verse 2: BØRNS]\r\nBut I just wanna watch her\r\nLike a candle in the moonlight\r\nHotter than a blueberry flame\r\nWhats her name?\r\nSmoke rising in the distance\r\nShe glides in a swan dive\r\nCooler than a strawberry shake\r\n\r\n[Verse 3: BØRNS, Lana Del Rey, Both]\r\nAll the rivers run back into the sea (baby, baby)\r\nBut baby don’t you leave (baby, don\'t you leave)\r\nI only want you running back to me\r\n\r\n[Outro: Lana Del Rey]\r\nBlue madonna in my head now\r\nBlue madonna in my bed now\r\nBlue madonna cherry red now\r\nIn this light\r\nBlue madonna in my head now\r\nBlue madonna in my bed now\r\nBlue madonna cherry red now\r\nTonight, tonight', 1, 1, 2),
(12, 'Bye-bye Darling', '[Verse 1]\r\nGoodbye to the paperback age\r\nI\'ll miss your touch\r\nTo flip you, crease you, lay underneath you, fall asleep to\r\nBye-bye, darling, I\'ll miss you so much\r\nGoodbye to the telephone age\r\nI\'ll miss your voice\r\nTo listen to, laugh to, talk in the bath to\r\nBye-bye, darling, we don\'t have a choice\r\n\r\n[Chorus]\r\nWe had a run good run, darling, don\'t you cry\r\nI know in the end it\'s gonna be just fine\r\nBye-bye, darling\r\n\r\n[Verse 2]\r\nGoodbye to the accident age\r\nI\'ll miss the chance\r\nTo meet you on the street, sweep you off your feet, you know\r\nBye-bye darling, goodbye in advance\r\n\r\n[Chorus]\r\nWe had a run good run, darling, now, don\'t you cry\r\nI know in the end it\'s gonna be just fine\r\nIn the end it all feels like a dream\r\nSomeday we\'ll find out what it means\r\nBye-bye, darling\r\n[Bridge]\r\nGoodbye\r\nGoodbye\r\nGoodbye\r\n\r\n[Outro]\r\nAnd every time I think of you, I\'m so glad\r\nWhat we had, they\'ll never know\r\nEvery summer night we stayed up late\r\nBlowing smoke into figure eights', 1, 1, 1),
(13, 'Consideration', '[Verse 1: Rihanna]\r\nI came fluttering in from Neverland\r\nTime can never stop me, no, no, no, no\r\nI know you\'ve tried to\r\nI came riding in on a pale white horse\r\nHanding out highs to less fortunate\r\nI do advise you\r\nRun it back, run it on back\r\nWhen you breaking it down for me\r\nCause I can\'t hear you, two times\r\nRun it on back, will it ever make sense to me?\r\n\r\n[Chorus: Rihanna]\r\nI got to do things my own way darling\r\nWill you ever let me\r\nWill you ever respect me? No\r\nDo things my own way darling\r\nYou should just let me\r\nWhy you ain\'t ever let me grow?\r\n\r\n[Post-Chorus: SZA]\r\nWhen I look outside my window\r\nI can\'t get no piece of mind\r\nWhen I look outside my window\r\nI can\'t get no peace of mind\r\n[Verse 2: Rihanna]\r\nLet me cover your shit in glitter\r\nI could make it gold, gold\r\nHeard you tryna sell your soul, baby\r\nWord on the street, you run it low lately\r\nI needed you to please give my reflection a break\r\nFrom the face it’s seeing now\r\nOoh darling, gahhlee\r\nWould you mind giving my reflection a break\r\nFrom the pain it’s feeling now?\r\n\r\n[Chorus: Rihanna & SZA]\r\nI got to do things my own way darling\r\nYou should just let me\r\nWill you ever respect me? No\r\nDo things my own way darling\r\nYou should just let me\r\nWhy you ain\'t ever let me grow?\r\n\r\n[Post-Chorus: SZA]\r\nWhen I look outside my window\r\nI can\'t get no piece of mind\r\nWhen I look outside my window\r\nI can\'t get no peace of mind\r\n\r\n[Outro: SZA (Rihanna)]\r\nGet no piece\r\nGet no peace\r\nGet, get, getting no peace\r\nCan\'t get no peace\r\n(Get, g-g-get no peace oh)', 2, 3, 3),
(14, 'James Joint', '[Verse 1]\r\nI\'d rather be smoking weed whenever we breathe\r\nEvery time you kiss me\r\nDon\'t say that you miss me\r\nJust come get me\r\n\r\n[Hook]\r\nDon\'t know why, just know I want to\r\nDon\'t know why, just know I want you\r\n\r\n[Verse 2]\r\nI\'d rather be breaking things, cause we can\'t see\r\nWe\'re too busy kissing\r\nJust making scenes, here come the police\r\nThey know about your history\r\nHow you live and love like \"fuck rules\"?\r\nDon\'t care why, just know I love you', 2, 3, 1),
(15, 'Kiss It Better', '[Intro]\r\nKiss it, kiss it better, baby\r\nKiss it, kiss it better, baby\r\n\r\n[Verse 1]\r\nBeen waitin\' on that sunshine, boy\r\nI think I need that back\r\nCan\'t do it like that\r\nNo one else gon\' get it like that\r\nSo why argue? You yell, but cha take me back\r\nWho cares, when it feels like crack?\r\nBoy, ya know that you always do it right\r\n\r\n[Pre-Chorus]\r\nMan, fuck yo pride\r\nJust take it on back, boy, take it on back, boy\r\nTake it back all night\r\nJust take it on back, take it on back\r\nMmm, do what cha gotta do, keep me up all night\r\nHurtin\' vibe, man, it hurts inside when I look you in yo eye\r\n\r\n[Chorus]\r\nWhat are you willing to do?\r\nOh, tell me what you’re willing to do\r\n(Kiss it, kiss it better, baby)\r\nOh, what are you willing to do?\r\nOh, tell me what you’re willing to do\r\n(Kiss it, kiss it better, baby)\r\n[Verse 2]\r\nBeen waitin\' on that sunshine, boy\r\nI think I need that back\r\nCan\'t do it like that\r\nNo one else gon\' get it like that\r\nSo why argue? You here, here to take me back\r\nWho cares, when it feels like crack?\r\nBoy, ya know that you always do it right\r\n\r\n[Pre-Chorus]\r\nMan, fuck yo pride\r\nJust take it on back, boy, take it on back, boy\r\nTake it back all night\r\nJust take it on back, take it on back\r\nMmm, do what cha gotta do, keep me up all night\r\nHurtin\' vibe, man, it hurts inside when I look you in yo eye\r\n\r\n[Chorus]\r\nWhat are you willing to do?\r\nOh, tell me what you’re willing to do\r\n(Kiss it, kiss it better, baby)\r\nOh, what are you willing to do?\r\nOh, tell me what you’re willing to do\r\n(Kiss it, kiss it better, baby)\r\n\r\n[Verse 3]\r\nI’ve been waitin\' up all night\r\nBaby tell me what’s wrong?\r\nYou\'re gonna make it right, make it all night long\r\nI’ve been waiting up all night\r\nBaby, tell me, what’s wrong?\r\nGoing to make it right, make it all night long\r\n[Pre-Chorus]\r\nMan, fuck yo pride\r\nJust take it on back, boy, take it on back, boy\r\nTake it back all night\r\nJust take it on back, take it on back\r\nMmm, do what cha gotta do, keep me up all night\r\nHurtin\' vibe, man, it hurts inside when I look you in yo eye\r\n\r\n[Chorus]\r\nWhat are you willing to do?\r\nOh, tell me what you’re willing to do\r\n(Kiss it, kiss it better, baby)\r\nOh, what are you willing to do?\r\nOh, tell me what you’re willing to do\r\n(Kiss it, kiss it better, baby)\r\nWhat are you willing to do?\r\nOh, tell me what you’re willing to do\r\n(Kiss it, kiss it better, baby)\r\nOh, what are you willing to do?\r\nOh, tell me what you’re willing to do\r\n(Kiss it, kiss it better, baby)\r\n\r\n[Outro]\r\nKiss it, kiss it better, baby\r\nKiss it, kiss it better, baby', 2, 3, 2),
(16, 'Work', '[Chorus: Rihanna]\r\nWork, work, work, work, work, work\r\nHe said me haffi\r\nWork, work, work, work, work, work!\r\nHe see me do mi\r\nDirt, dirt, dirt, dirt, dirt, dirt!\r\nSo me put in\r\nWork, work, work, work, work, work\r\nWhen you ah guh\r\nLearn, learn, learn, learn, learn\r\nMeh nuh cyar if him\r\nHurt, hurt, hurt, hurt, hurting\r\n\r\n[Verse 1: Rihanna]\r\nDry! ...Me a desert him\r\nNuh time to have you lurking\r\nHim ah go act like he nuh like it\r\nYou know I dealt with you the nicest\r\nNuh body touch me you nuh righteous\r\nNuh badda, text me in a crisis\r\nI believed all of your dreams, adoration\r\nYou took my heart and my keys and my patience\r\nYou took my heart on my sleeve for decoration\r\nYou mistaken my love I brought for you for foundation\r\nAll that I wanted from you was to give me\r\nSomething that I never had\r\nSomething that you\'ve never seen\r\nSomething that you\'ve never been!\r\nMmmmm!\r\nBut I wake up and act like nothing\'s wrong\r\nJust get ready fi...\r\n[Chorus: Rihanna]\r\nWork, work, work, work, work, work\r\nHe said me haffi\r\nWork, work, work, work, work, work!\r\nHe see me do mi\r\nDirt, dirt, dirt, dirt, dirt, dirt!\r\nSo me put in\r\nWork, work, work, work, work, work\r\nNer ner ner ner ner ner!\r\nWhen yuh ago learn learn learn learn learn learn!\r\nBefore the tables turn turn turn turn turn turn!\r\n\r\n[Verse 2: Rihanna]\r\nBeg you something, please\r\nBaby don\'t you leave\r\nDon’t leave me stuck here in the streets, uh huh\r\nIf I get another chance to\r\nI will never, no never neglect you\r\nI mean who am I to hold your past against you?\r\nI just hope that it gets to you\r\nI hope that you see this through\r\nI hope that you see this true\r\nWhat can I say?\r\nPlease recognize I\'m tryin\', babe!!!\r\nI have to\r\n[Chorus: Rihanna]\r\nWork, work, work, work, work, work\r\nHe said me haffi\r\nWork, work, work, work, work, work!\r\nHe see me do mi\r\nDirt, dirt, dirt, dirt, dirt, dirt!\r\nSo me put in\r\nWork, work, work, work, work, work\r\nWhen you ah guh\r\nLearn, learn, learn, learn, learn\r\nMeh nuh cyar if him\r\nHurt, hurt, hurt, hurt, hurting\r\n\r\n[Verse 3: Drake with Rihanna]\r\nYeah, okay\r\nYou need to get done, done, done, done at work, come over\r\nWe just need to slow the motion\r\nDon\'t give that away to no one\r\nLong distance, I need you\r\nWhen I see potential I just gotta see it through\r\nIf you had a twin, I would still choose you\r\nI don\'t wanna rush into it, if it\'s too soon\r\nBut I know you need to get done, done, done, done\r\nIf you come over\r\nSorry if I\'m way less friendly\r\nI got niggas tryna end me, oh\r\nI spilled all my emotions tonight, I’m sorry\r\nRollin\', rollin\', rollin\', rollin\', rollin\'\r\nHow many more shots until you\'re rollin\'?\r\nWe just need a face to face\r\nYou could pick the time and the place\r\nYou spent some time away\r\nNow you need to forward and give me all the...\r\n[Chorus: Rihanna & Drake]\r\nWork, work, work, work, work, work\r\nHe said me haffi\r\nWork, work, work, work, work, work\r\nHe se me do mi\r\nDirt, dirt, dirt, dirt, dirt, dirt!\r\nSo me put in\r\nWork, work, work, work, work, work\r\nWhen you ah guh\r\nLearn, learn, learn, learn, learn\r\nMeh nuh cyar if him\r\nHurt, hurt, hurt, hurt, hurting\r\n\r\n[Outro: Rihanna]\r\nMmmmm, mmmmm\r\nMmmmm, mmmmm\r\nWork, work, work, work, work, work\r\nMmmmm, mmmmm', 2, 3, 2),
(17, 'Desperado', '[Verse 1]\r\nDesperado\r\nSittin\' in an old Monte Carlo\r\nA man whose heart is hollow\r\nMhm, take it easy\r\nI\'m not tryna go against yuh\r\nActually, I\'m goin\' witcha\r\n\r\n[Pre-Chorus]\r\nGotta get up out of here\r\nAnd yuh ain\'t leavin\' me behind\r\nI know you won\'t cause we share common interests\r\nYou need me, there ain\'t no leaving me behind\r\nNever, no, no, I just want outta here, yeah\r\nOnce I\'m gone, ain’t no going back\r\n\r\n[Chorus]\r\nIf you want, we can be runaways\r\nRunning from any sight of love\r\nYeah, yeah, there ain’t nothin\'\r\nThere ain\'t nothin\' here for me\r\nThere ain\'t nothin\' here for me anymore\r\nBut I don\'t wanna be alone\r\n\r\n[Verse 2]\r\nDesperado\r\nSitting on your ole\' Monte Carlo\r\nWe\'ve both had our hearts broke\r\nUnh, hunh, take it easy\r\nI\'m not tryna go against yuh\r\nI can be a lone wolf witcha\r\n[Pre-Chorus]\r\nGotta get up out of here\r\nAnd you ain\'t leaving me behind\r\nI know you won\'t cause we share common interests\r\nYou need me, there ain\'t no leaving me behind\r\nNever, no, no, both want outta here, yeah\r\nOnce we\'re gone, ain’t no going back\r\n\r\n[Chorus]\r\nIf you want, we can be runaways\r\nRunning from any sight of love\r\nYeah, yeah, there ain’t nothin\'\r\nThere ain\'t nothin\' here for me\r\nThere ain\'t nothin\' here for me anymore\r\nBut I don\'t wanna be alone\r\n\r\n[Bridge]\r\nDear desperado\r\nYeah, I don\'t wanna be alone\r\nDear desperado\r\nYeah, I don\'t wanna be alone\r\n\r\n[Chorus]\r\nIf you want, we can be runaways\r\nRunning from any sight of love\r\nYeah, yeah, there ain’t nothin\'\r\nThere ain\'t nothin\' here for me\r\nThere ain\'t nothin\' here for me anymore\r\nBut I don\'t wanna be alone\r\n[Outro]\r\nYeah-yeah-ah\r\nYeah-yeah-ah\r\nYeah-yeah-ah\r\nYeah-yeah-ah\r\nYeah-yeah-ah\r\nYeah-yeah-ah', 2, 3, 3),
(18, 'Woo', '[Refrain: Travis Scott]\r\nWoo\r\nWoo, woo, yeah\r\nWoo, woo, yeah\r\nAw yeah, aw yeah, aw yeah\r\n\r\n[Verse 1: Rihanna]\r\nI bet she could never make you cry\r\n‘Cause the scars on your heart are still mine\r\nTell me that she couldn\'t get this deep\r\nShe can almost be the worst of me\r\nToo bad she\'s just eating off your dreams\r\nLet me know when you\'re ready to bleed\r\nBaby you just need to send for me\r\n\r\n[Chorus: Rihanna]\r\nSend for me, send for me\r\nSend for me, send for me\r\n\r\n[Refrain: Travis Scott]\r\nWoo\r\nWoo, woo, yeah\r\nWoo, woo, yeah\r\nAw yeah, aw yeah, aw yeah\r\n\r\n[Verse 2: Rihanna]\r\nI\'ve been thinking \'bout you late at night\r\nI\'ve been thinking only of you\r\nAin\'t nothing else to really talk about\r\nBoy show me what you want to do\r\nThese days you\'ve been feeling lonely\r\nYeah I\'ve been feeling lonely too\r\nI\'ma fuck it up, won\'t you show me some\r\nRun it back like you owe me some\r\n[Refrain: Travis Scott (& Rihanna)]\r\nWoo\r\nWoo, woo, yeah\r\n(Feel me up, feel me up)\r\nWoo, yeah\r\n(Feel me up, feel me up)\r\nAw yeah, aw yeah, aw yeah\r\n(Feeling me, feeling me, feeling me up)\r\n\r\n[Verse 3: Rihanna]\r\nTell me \'bout your picture-perfect love\r\nTell me how you think without the drugs\r\nMaybe you just need to send for me\r\nI don\'t mean to really love ya\r\nI don\'t mean to even care about ya\r\nI don\'t mean to really love ya\r\nI don\'t mean to really care about ya, no more\r\nI don\'t mean to really care about ya, no more\r\n\r\n[Chorus: Rihanna]\r\nSend for me, send for me\r\nSend for me, send for me\r\n\r\n[Outro: Travis Scott (& Rihanna)]\r\nWoo (feel me up, feel me up)\r\nWoo, woo, yeah (feel me up, feel me up)\r\nWoo, woo, yeah\r\n(Send for me, send for me, send for me)\r\nAw yeah, aw yeah, aw yeah\r\nWoo (I don\'t mean to really love ya)\r\nI don\'t mean to even care about ya\r\nWoo (I don\'t mean to really love ya)\r\nI don\'t mean to really care about ya, no more\r\nWoo, woo, yeah\r\n(No more, I don\'t mean to really care about ya, no more\r\nI don\'t mean to really care about ya, no more)\r\nAw yeah, aw yeah, aw yeah', 2, 3, 1),
(19, 'Needed Me', '[Intro: YG]\r\nMustard on the beat, ho!\r\n\r\n[Verse 1]\r\nI was good on my own, that\'s the way it was\r\nThat\'s the way it was\r\nYou was good on the low for a faded fuck\r\nOn some faded love\r\nShit, what the fuck you complaining for?\r\nFeeling jaded, huh?\r\nUsed to trip off that shit I was kickin\' to you\r\nHad some fun on the run though I\'ll give it to you\r\n\r\n[Pre-Chorus]\r\nBut baby, don\'t get it twisted\r\nYou was just another nigga on the hit list\r\nTryna fix your inner issues with a bad bitch\r\nDidn\'t they tell you that I was a savage?\r\nFuck ya white horse and ya carriage\r\nBet you never could imagine\r\nNever told you you could have it\r\n\r\n[Chorus]\r\nYou needed me\r\nOoh, you needed me\r\nTo feel a little more, and give a little less\r\nKnow you hate to confess\r\nBut baby ooh, you needed me\r\n[Verse 2]\r\nYou been rollin\' around, shit I\'m rollin\' up\r\nLight and roll it up\r\nBreak it down, like a pound, shit was never us\r\nShit was never us\r\nThat\'s the real, on the real, are you serious?\r\nHow you feel, how you feel?\r\nUsed to trip off that shit I was kickin\' to ya\r\nHad some fun on the run though, I\'ll give it to ya\r\n\r\n[Pre-Chorus]\r\nBut baby, don\'t get it twisted\r\nYou was just another nigga on the hit list\r\nTryna fix your inner issues with a bad bitch\r\nDidn\'t they tell you that I was a savage?\r\nFuck ya white horse and ya carriage\r\nBet you never could imagine\r\nNever told you you could have it\r\n\r\n[Chorus]\r\nYou needed me\r\nOoh, you needed me\r\nTo feel a little more, and give a little less\r\nKnow you hate to confess\r\nBut baby ooh, you needed me', 2, 3, 1),
(20, 'Yeah, I Said It', '[Intro]\r\nYeah, yeah\r\nYeah, yeah\r\n\r\n[Verse 1]\r\nI ain\'t tryna think about it, no\r\nYeah, I said it, boy, get up inside it\r\nI want you to homicide it\r\nGo in slow, but I want you to pipe it\r\nAnd I think I kinda like ya\r\nUp against the wall, we don\'t need a title\r\n\r\n[Chorus]\r\nYeah, I said it\r\nYeah, I said it, bae\r\nYeah, I said it, man, fuck a title\r\n\r\n[Verse 2]\r\nBoy, I always like to show\r\nGet a little bit, come a little close, now\r\nTake it home on your camera phone\r\nGet a little bad, nigga, watch me blow it down\r\n\r\n[Chorus]\r\nYeah, I said it\r\nYeah, I said it, bae\r\nYeah, I said it\r\nOoh\r\nYeah, I said it\r\nYeah, I said it, bae\r\nYeah, I said it\r\nOoh\r\n[Bridge]\r\nYou can be rough, boy, but you won\'t\r\nGive me some love, boy, give it to me \'til the morn\'\r\n\r\n[Chorus]\r\nYeah, I said it\r\nYeah, I said it, babe\r\nYeah, I said it, uh\r\nYeah, I said it\r\nYeah, I said it, babe\r\nYeah, I said it', 2, 3, 3),
(21, 'Same Ol’ Mistakes', '[Verse 1]\r\nI can just hear them now\r\n\"How could you let us down?\"\r\nBut they don\'t know what I found\r\nOr see it from this way around\r\nFeeling it overtake\r\nAll that I used to hate\r\nWorried \'bout every trait\r\nI tried but it\'s way too late\r\nAll the signs I don\'t read\r\nTwo sides of me can\'t agree\r\nWhen I breathe in too deep\r\nGoing with what I always longed for\r\n\r\n[Chorus 1]\r\nFeel like a brand new person\r\n(But you make the same old mistakes)\r\nWell, I don’t care I’m in love\r\n(Stop before it’s too late)\r\nFeel like a brand new person\r\n(But you make the same old mistakes)\r\nI finally know what it\'s like\r\n(You don’t have what it takes)\r\n(Stop before it’s not too late)\r\n(I know there’s too much at stake)\r\n(Making the same mistakes)\r\nAnd I still don’t know why it’s happening\r\n(Stop while it’s not too late)\r\nAnd I still don’t know\r\n[Verse 2]\r\nFinally taking flight\r\nI know you don\'t think it\'s right\r\nI know that you think it\'s fake\r\nMaybe fake\'s what I like\r\nPoint is I have the right\r\nNot thinking in black and white\r\nI\'m thinking it\'s worth the fight\r\nSoon to be out of sight\r\nKnowing it all this time\r\nGoing with what I always longed for\r\n\r\n[Chorus 1]\r\nFeel like a brand new person\r\n(But you make the same old mistakes)\r\nI don’t care I’m in love\r\n(Stop before it’s too late)\r\nFeel like a brand new person\r\n(But you make the same old mistakes)\r\nSo how do I know that it\'s right?\r\n(You don’t have what it takes)\r\n(Stop before it’s not too late)\r\n\r\n[Bridge]\r\nAnd I know that it\'s hard to digest\r\nBut maybe your story ain’t so different from the rest\r\nAnd I know it seems wrong to accept\r\nBut you\'ve got your demons, and she\'s got her regrets\r\nAnd I know that it\'s hard to digest\r\nA realization is as good as it gets\r\nAnd I know it seems wrong to accept\r\nBut you\'ve got your demons, and she\'s got her regrets\r\nBut you\'ve got your demons, and she\'s got her regrets\r\n[Chorus 2]\r\nFeel like a brand new person\r\nSo, how will I know that it\'s right?\r\nIn a new direction\r\nSo, how will I know I\'ve gone too far?\r\n(Stop thinking you\'re the only option, oh)\r\nFeel like a brand new person\r\n(But you make the same old mistakes)\r\nI finally know what it\'s like\r\n(Stop before it\'s too late)\r\n(Stop thinking you\'re the only option, oh)\r\nIn a new direction\r\n(But you make the same old mistakes)\r\nSo how will I know I\'ve gone too far?\r\n(You don’t have what it takes)\r\n(Stop before it’s too late)\r\n(Stop thinking you\'re the only option, oh)\r\nFeel like a brand new person\r\n(But you make the same old mistakes)\r\nAnd I know it\'s hard to describe\r\n(Stop thinking you\'re the only option, oh)\r\n(But you make the same old mistakes)\r\n(You don’t have what it takes)\r\n(Stop before it’s too late)\r\nI finally know what it\'s like\r\n(Stop before it’s too late)\r\n(Stop thinking you\'re the only option, oh)\r\n(Stop thinking you\'re the only option, oh)', 2, 3, 3),
(22, 'Never Ending', '[Intro]\r\nOoh\r\nOh\r\n\r\n[Verse 1]\r\nGhost in the mirror\r\nI knew your face once, but now it\'s unclear\r\nAnd I can\'t feel my body now\r\nI separate from here and now\r\n\r\n[Break]\r\nOoh\r\nOh\r\n\r\n[Verse 2]\r\nA drug and a dream\r\nA lost connection, oh, come back to me\r\nSo I can feel alive again\r\nAs soul and body try to mend\r\n\r\n[Chorus]\r\nIt\'s pulling me apart, this time\r\nEverything is never-ending\r\nI slipped into a parallel\r\nThey\'ll never understand\r\nThis feeling always gets away\r\nWishing I could hold on longer\r\nWhy does it have to feel so strange\r\nTo be in love again, be in love again, be in love again?\r\n[Verse 3]\r\nGhost in the mirror\r\nI knew your face once, but now it\'s unclear\r\nAnd I can\'t feel my body now\r\nI separate from here and now\r\n\r\n[Break]\r\nOoh\r\nOoh\r\nOoh\r\nOoh\r\n\r\n[Chorus]\r\nIt\'s pulling me apart, this time\r\nEverything is never-ending\r\nI slipped into a parallel\r\nThey\'ll never understand\r\nThis feeling always gets away\r\nWishing I could hold on longer\r\nWhy does it have to feel so strange\r\nTo be in love again, be in love again, be in love again?', 2, 3, 2),
(23, 'Love on the Brain', '[Verse 1]\r\nAnd you got me like, \"Oh, what you want from me?\"\r\n(What you want from me?)\r\nAnd I tried to buy your pretty heart, but the price too high\r\nBaby, you got me like \"Oh\"\r\nYou love when I fall apart (fall apart)\r\nSo you can put me together and throw me against the wall\r\n\r\n[Pre-Chorus]\r\nBaby you got me like i-i-i-i-i-i-i-i-i-hiii, woo i-i-i-i-i-i-i-i-i-hiii\r\nDon\'t you stop loving me (loving me)\r\nDon\'t quit loving me (loving me)\r\nJust start loving me (loving me)\r\nOwwwwww\r\n\r\n[Chorus]\r\nAnd babe I’m fist-fighting with fire\r\nJust to get close to you\r\nCan we burn something babe\r\nAnd I run for miles just to get a taste\r\nMust be love on the brain\r\nThat’s got me feeling this way\r\nIt beats me black and blue but it fucks me so good\r\nAnd I can’t get enough\r\nMust be love on the brain yeah\r\nAnd it keeps cursing my name\r\nNo matter what I do\r\nI’m no good without you\r\nAnd I can’t get enough\r\nMust be love on the..... brain\r\n[Verse 2]\r\nBaby keep loving me\r\nJust love me\r\nYeah, just love me\r\nAll you need to do is love me, yeah\r\nGot me like, ah-ha-ha-owww\r\nI’m tired of being played like a violin\r\nWhat do I gotta do to get in your motherfuckin’ heart?\r\nBaby like i-i-i-i-i-i-i-i-i-hiii, woo i-i-i-i-i-i-i-i-i-hiii\r\n\r\n[Pre-Chorus]\r\nBaby you got me like i-i-i-i-i-i-i-i-i-hiii, woo i-i-i-i-i-i-i-i-i-hiii\r\nDon\'t you stop loving me (loving me)\r\nDon\'t quit loving me (loving me)\r\nJust start loving me (loving me)\r\nOoooooohhh\r\n\r\n[Chorus]\r\nAnd babe I’m fist-fighting with fire\r\nJust to get close to you\r\nCan we burn something babe\r\nAnd I run for miles just to get a taste\r\nMust be love on the brain\r\nThat’s got me feeling this way\r\nIt beats me black and blue but it fucks me so good\r\nAnd I can’t get enough\r\nMust be love on the brain yeah\r\nAnd it keeps cursing my name\r\nNo matter what I do\r\nI’m no good without you\r\nAnd I can’t get enough\r\nMust be love on the.... brain', 2, 3, 3),
(24, 'Higher', '[Verse]\r\nThis whiskey got me feelin\' pretty\r\nSo pardon if I\'m impolite\r\nI just really need your ass with me\r\nI\'m sorry \'bout the other night\r\nAnd I know I could be more creative\r\nAnd come up with poetic lines\r\nBut I\'m turnt up upstairs and I love you\r\nIs the only thing that\'s in my mind\r\n\r\n[Chorus]\r\nYou take me higher, higher than I\'ve ever been, babe\r\nJust come over, let\'s pour a drink, babe\r\nI hope I ain\'t calling you too late, too late\r\nYou light my fire\r\nLet\'s stay up late and smoke a J\r\nI wanna go back to the old way\r\nBut I\'m drunk instead, with a full ashtray\r\nWith a little bit too much to say', 2, 3, 1),
(25, 'Close to You', '[Verse 1]\r\nNothing but a tear, that\'s all for breakfast\r\nWatching you pretend you\'re unaffected\r\nYou\'re pulling our connections, expecting me to let you go\r\nBut I won\'t\r\n\r\n[Pre-Chorus]\r\nI know you don\'t need my protection\r\nBut I\'m in love, can\'t blame me for checking\r\nI love in your direction, hoping that the message goes\r\n\r\n[Chorus]\r\nSomewhere close to you\r\nClose to you\r\nLike so close if they hurt you, you wouldn\'t find out\r\nJust say now, I\'m coming right now to be close to you\r\n\r\n[Verse 2]\r\nSaid you let it go, you kept it\r\nWorking hard to perfect it\r\nBut now your fear is reckless, and it\'s out of your control\r\nWell just let it go\r\n\r\n[Pre-Chorus]\r\nI know you don\'t need my protection\r\nBut I\'m in love, can\'t blame me for checking\r\nI love in your direction, hoping that the message goes\r\n[Chorus]\r\nSomewhere close to you\r\nClose to you\r\nLike so close, if they hurt you, you wouldn\'t find out\r\nIf you let me, I\'d be there by now\r\nClose to you', 2, 3, 1),
(26, 'fggfhg', 'nmmm', 2, 3, 2),
(27, 'Test Song', 'kjgkfjgkfdj\r\ndfkgjdfkgjdfkg\r\nkfdgjkdfjgkdf\r\ndkgfjkdfjgkfd\r\ndkjdfkgjdfkj', 3, 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `wykonania`
--

CREATE TABLE `wykonania` (
  `IdWyk` int(11) NOT NULL,
  `IdU` int(11) NOT NULL,
  `IdArt` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wykonania`
--

INSERT INTO `wykonania` (`IdWyk`, `IdU`, `IdArt`) VALUES
(1, 11, 1),
(2, 12, 1),
(3, 2, 1),
(4, 1, 1),
(5, 6, 1),
(6, 8, 1),
(7, 5, 1),
(8, 7, 1),
(9, 10, 1),
(10, 3, 1),
(11, 9, 1),
(12, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wystapienia`
--

CREATE TABLE `wystapienia` (
  `IdWyst` int(11) NOT NULL,
  `IdU` int(11) NOT NULL,
  `IdAlb` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wystapienia`
--

INSERT INTO `wystapienia` (`IdWyst`, `IdU`, `IdAlb`) VALUES
(1, 11, 1),
(2, 12, 1),
(3, 2, 1),
(4, 1, 1),
(5, 6, 1),
(6, 8, 1),
(7, 5, 1),
(8, 7, 1),
(9, 10, 1),
(10, 3, 1),
(11, 9, 1),
(12, 4, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albumy`
--
ALTER TABLE `albumy`
  ADD PRIMARY KEY (`IdAlb`);

--
-- Indexes for table `artysci`
--
ALTER TABLE `artysci`
  ADD PRIMARY KEY (`IdArt`);

--
-- Indexes for table `edytorzy`
--
ALTER TABLE `edytorzy`
  ADD PRIMARY KEY (`idE`);

--
-- Indexes for table `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`IdK`);

--
-- Indexes for table `komentarze`
--
ALTER TABLE `komentarze`
  ADD PRIMARY KEY (`IdKom`);

--
-- Indexes for table `utworym`
--
ALTER TABLE `utworym`
  ADD PRIMARY KEY (`IdU`);

--
-- Indexes for table `wykonania`
--
ALTER TABLE `wykonania`
  ADD PRIMARY KEY (`IdWyk`);

--
-- Indexes for table `wystapienia`
--
ALTER TABLE `wystapienia`
  ADD PRIMARY KEY (`IdWyst`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albumy`
--
ALTER TABLE `albumy`
  MODIFY `IdAlb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `artysci`
--
ALTER TABLE `artysci`
  MODIFY `IdArt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `edytorzy`
--
ALTER TABLE `edytorzy`
  MODIFY `idE` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `klienci`
--
ALTER TABLE `klienci`
  MODIFY `IdK` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `komentarze`
--
ALTER TABLE `komentarze`
  MODIFY `IdKom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `utworym`
--
ALTER TABLE `utworym`
  MODIFY `IdU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `wykonania`
--
ALTER TABLE `wykonania`
  MODIFY `IdWyk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wystapienia`
--
ALTER TABLE `wystapienia`
  MODIFY `IdWyst` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
