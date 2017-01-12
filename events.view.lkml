view: events {
  sql_table_name: cassandra.rt_reports.events ;;
  suggestions: no

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
    drill_fields:  [category, action]
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
    drill_fields:  [action, label]
  }

  dimension: hits {
    type: number
    sql: ${TABLE}.hits ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: licensee {
    type: string
    sql: ${TABLE}.licensee ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension_group: ts {
    type: time
    timeframes: [time, hour, minute,second, date, week, month]
    sql: ${TABLE}.ts ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum {
    type: sum
    sql: ${TABLE}.hits ;;
  }

  measure: percent_of_total_hits {
    type: percent_of_total
    sql: ${sum} ;;
  }

  dimension: licensee_filter {
    sql: ${TABLE}.licensee ;;
    suggestions: ["ESL", "GP", "Gala","Rank"]
  }

  dimension: brand_filter {
    sql: ${TABLE}.brand ;;
    suggestions: ["cdpoker" ,"fortunep" ,"pokershow"  ,"carnaval" ,"24ktgold" ,"triplewin"  ,"merlinsmagic" ,"gocasino" ,"dafa888lb"  ,"ya888yalb"  ,"mannycasino"  ,"king" ,"magicbox" ,"joyland"  ,"dirtystackpoker"  ,"otc88"  ,"afppoker" ,"bingo770" ,"asian"  ,"manu" ,"bluesquarepoker"  ,"cityampoker"  ,"universal"  ,"luckydiamondcasino" ,"magno"  ,"freeeuropa" ,"gothiapoker"  ,"bananavegas"  ,"playgate" ,"ukbetting"  ,"bigslickcasino" ,"boylecasino"  ,"casinoplex" ,"12bet"  ,"circus" ,"snaibingo"  ,"pokerpower.real"  ,"betfriendspoker"  ,"betngo" ,"paddypowerpoker"  ,"paddypowergamestab" ,"casino.com" ,"bluff2winpoker" ,"bfpoker.dk" ,"clubgold" ,"rey8poker.net"  ,"trainingdemo" ,"joapoker.real"  ,"betclic"  ,"tranchantpoker" ,"segacasino" ,"winnerpoker"  ,"olympiccasino.net"  ,"realbetcasino"  ,"guavita"  ,"casinocruise" ,"whpokerclub"  ,"netbetpoker"  ,"poker83"  ,"littlewoods"  ,"titanbet.es_old"  ,"unibet.fr"  ,"calientecasino" ,"12win"  ,"cgmpoker.es"  ,"betlotto" ,"oceancasino"  ,"premierpoker" ,"premierbingo" ,"betclicpokerfr" ,"redcoral88" ,"asianportal"  ,"Virtue Bingo 1" ,"Jackpot City Bingo SE"  ,"Fruit Bingo"  ,"River Belle"  ,"Virgin Bingo" ,"bingo.com"  ,"Bingo Chest"  ,"Svenska Bingo"  ,"Gala Bingo" ,"winforfun88"  ,"Bingo Day"  ,"GCasino"  ,"Winner Bingo" ,"bet365casino.it"  ,"Sing Bingo" ,"Mecca Games"  ,"Home of Bingo"  ,"Shipleys Bingo" ,"247casino"  ,"Feliz Bingo"  ,"William Hill ES"  ,"unibet.com" ,"Crown Bingo"  ,"Littlewoods Bingo"  ,"Boylebingo EUR" ,"Bingo.ie" ,"888 Bingo"  ,"Kudo" ,"pokerstars.uk"  ,"caribe88" ,"bingoenchanted" ,"dafagold2"  ,"goldenrose88" ,"kiwibingo"  ,"dafabetgames" ,"boylepokeruw4"  ,"ya888ya"  ,"casino770"  ,"powerspins" ,"queenofhearts88"  ,"grandtreasure88"  ,"jackpotscratch" ,"windowspoker" ,"casinoriva" ,"maxipoker"  ,"skincasinosint" ,"Bingo 770"  ,"clubdice" ,"miamibeach" ,"itplpoker"  ,"europa" ,"rubybingo"  ,"monacogold" ,"monacogold.net" ,"lvgrand"  ,"deauville"  ,"mgc.com"  ,"missbingo"  ,"goldenpalace" ,"topcard"  ,"gp68" ,"casinoclub" ,"megasport2" ,"theskycasino" ,"sisalpoker.real"  ,"whitelabelpoker"  ,"theskypoker"  ,"railpoker"  ,"pokerking"  ,"africanpalace"  ,"acropolis"  ,"ecasinophil"  ,"atlanticpoker"  ,"1917poker"  ,"royallounge"  ,"broadwayuk" ,"wildjungle" ,"silverfox"  ,"beerchurchpoker"  ,"powerpokerrooms"  ,"centrebet.net"  ,"totebingo"  ,"kingsolomon"  ,"chiliplay"  ,"dakotaroom" ,"chilipoker" ,"getmintedpoker" ,"maestropoker" ,"advfnpoker" ,"tap"  ,"majesticcasino" ,"casino.dk"  ,"pokerplex24.dk" ,"reg.casino.dk"  ,"ibc"  ,"plc33"  ,"gentingcasino"  ,"snaipoker.real" ,"giobetbingo"  ,"giobetcasino" ,"eurobetcasino"  ,"rey8" ,"solacepoker"  ,"betspace" ,"200per100poker" ,"supercasino"  ,"atlantidaps"  ,"betsson"  ,"whcasinoclub" ,"whcasino" ,"netbetcasino" ,"mooregames" ,"ladbrokesvegastab"  ,"dragonplay88" ,"eurostar" ,"sportingbet"  ,"wintrillion"  ,"redluck"  ,"William Hill SE"  ,"Ladbrokes"  ,"Bingofriends" ,"Beacon Bingo" ,"Capitol Bingo"  ,"cirsacasino.es" ,"paddypowerpoker.it" ,"betcliccasino"  ,"Ruby Bingo" ,"Trinity Mirror" ,"Virtue Bingo 2" ,"William Hill" ,"Crazy Bingo"  ,"Simply Bingo" ,"City Bingo" ,"PaddyPowerBingo.com"  ,"Bingos" ,"ironbet"  ,"night"  ,"fabulousbingo"  ,"codere.es"  ,"dragonfish88" ,"greenjade88"  ,"marca.es" ,"cruise888"  ,"blackdiamond88" ,"Etipos" ,"poca" ,"elbruscasino" ,"cameo"  ,"sisalcasino.net"  ,"acekingdom" ,"snaibingopiazza"  ,"efortuna" ,"casinoplex.it"  ,"luckyspin88"  ,"aspire.dk"  ,"aspire.uk"  ,"bgo"  ,"betfair.it" ,"blacktiger88" ,"goldgate" ,"bet365" ,"bet365games"  ,"blackpoolclubbingo" ,"goldenpalace.net" ,"islabonita" ,"vendome"  ,"dafapokertw"  ,"ilive"  ,"interlasvegas"  ,"palacevip"  ,"sisalbingo.real"  ,"sisalcasino"  ,"eurogrand"  ,"whitelabelbingo"  ,"elixir" ,"indio"  ,"711casino"  ,"poker770" ,"pokerriva"  ,"whcasinoext"  ,"dafapoker"  ,"betfred"  ,"xxlclub"  ,"greenjokerpoker"  ,"trust"  ,"craps"  ,"rexcasino"  ,"draculapoker" ,"granddicecasino"  ,"theking"  ,"skyland"  ,"bingoday" ,"noblepoker" ,"redskypoker"  ,"zipangpoker"  ,"diamondclub"  ,"totalbet" ,"playunited" ,"pokerducks" ,"chilipoker.net" ,"jetcasino"  ,"uncover"  ,"betboopoker"  ,"omnicasino" ,"snaipoker"  ,"casinosnai2.real" ,"pokerutd" ,"cccppoker"  ,"whcasino.es"  ,"betfaircasino"  ,"betfair.es" ,"europlayclub" ,"joacasino"  ,"xlbetpoker" ,"chocolatepoker" ,"betclickpoker"  ,"davidpoker" ,"winnerbingo"  ,"challengejackpot" ,"4clubpoker" ,"xxxlcasino" ,"whsports" ,"galacasino" ,"goldengalaxy" ,"bogofbingo" ,"goldenhatbingo" ,"betclicpoker" ,"cgmmadridcasino"  ,"netbetpoker.es" ,"premiercasino"  ,"everest"  ,"virtuefusion" ,"benidormbingo.dup"  ,"Big8gaming.com" ,"Player Casino.co.uk"  ,"Bingo Loopy"  ,"Betfred Bingo"  ,"atom" ,"Golden Hat Bingo" ,"CasinoLife" ,"Rehab Bingo"  ,"ladbrokes.be" ,"one2gobingo"  ,"totosi" ,"gentingpoker.com" ,"jackpot247games"  ,"Bonanza Bingo"  ,"BET365" ,"Sky Bingo"  ,"Mobile Casino.co.uk"  ,"Apostouganhou"  ,"sunbingo" ,"betvictor"  ,"whitepearl88" ,"springfield88"  ,"lasvegas" ,"skybet.it"  ,"boylesports"  ,"sia"  ,"europoker.fr" ,"cgmslots" ,"Betdaq" ,"glaming"  ,"Cash Winners Club"  ,"Bucky Bingo"  ,"giantvegas" ,"cityclub" ,"brandy" ,"tropez" ,"bet365poker"  ,"bet365casino.dk"  ,"usapoker" ,"cotedazur"  ,"blackpool"  ,"grandonline"  ,"flamingo" ,"barakabingo"  ,"tamtamcasino" ,"tamtampoker"  ,"tamtampoker.net"  ,"fubo.com" ,"dafa888"  ,"kwin888"  ,"dafapoker.net"  ,"class1" ,"class1poker"  ,"class1pokerlb"  ,"eucasino" ,"merchants"  ,"anycallpoker" ,"lfc888" ,"skykings" ,"casinocasino" ,"uncoverpoker" ,"europa.de"  ,"redqueenpoker"  ,"primecasino"  ,"centrebet.dk" ,"suerte7casino"  ,"expektpoker.net"  ,"powergaming888" ,"cbmpoker" ,"cardozapoker" ,"betterpoker"  ,"bgbet"  ,"eurobetpoker.real"  ,"eurobetbingo" ,"mansion88"  ,"dccmansion" ,"hansapoker" ,"blondepoker"  ,"pkr"  ,"betfaircasino.it" ,"betfairpoker" ,"athinapoker"  ,"joapoker" ,"caradepoker"  ,"mansion88poker" ,"skincasinos"  ,"qcasino"  ,"caribbeancasino"  ,"kaisercasino" ,"whbingo"  ,"whvegas"  ,"whpokerschool"  ,"whgames"  ,"leonpoker"  ,"grandreef"  ,"titanbet.it"  ,"galabingo"  ,"everestpoker" ,"Virtue Bingo 3" ,"Coral Games"  ,"Boylebingo" ,"vwin" ,"betfairbingo" ,"Love Your Bingo"  ,"Take a Break Bingo" ,"Totesport"  ,"Benidorm Bingo" ,"Punt Mobile"  ,"Nordicbet Bingo"  ,"Bingo Universal"  ,"luck.com" ,"Begawin"  ,"Jackpot City Bingo ES"  ,"Mecca Bingo"  ,"Bingo Lola" ,"europaplay" ,"scarletbingo" ,"Mr Green" ,"redluckcasino"  ,"celebpoker" ,"pkrcasino"  ,"888 Games"  ,"bingowithkerry" ,"pokerstars" ,"mistral88"  ,"Prospect Hall Casino" ,"NA" ,"caribbean888" ,"barkingbingo" ,"prime"  ,"cgmcasino.es" ,"boylepoker" ,"rey8poker"  ,"caliente" ,"maxcasino"  ,"Gems Bingo" ,"playtech" ,"citytowercasino"  ,"mapaugr"  ,"swiss"  ,"gocasinotropez" ,"vegasred" ,"bet365poker.net"  ,"bet365.es"  ,"grandriviera" ,"onlinec"  ,"goldenpalacepoker"  ,"megakings"  ,"baraka" ,"maxima" ,"maximalb" ,"arena"  ,"kiwibingouk"  ,"50stars"  ,"bingodayuk" ,"whitelabelcasino" ,"ilivepoker" ,"afppoker.net" ,"asiancasino"  ,"goldenpeaks"  ,"xxlclublb"  ,"xxlclubpoker" ,"clubhollywood"  ,"grosvenor"  ,"vegas21club.net"  ,"121casino"  ,"tropez.de"  ,"titanpoker" ,"zipang" ,"777baby"  ,"tila" ,"foxpokerclub" ,"expektpoker"  ,"parimatchpoker" ,"saintspoker"  ,"bettercasino" ,"redclubpoker" ,"flycasino"  ,"gentingpoker" ,"setantapoker" ,"eurobetcasino.net"  ,"offsidepoker" ,"paddypowerlive" ,"mansion"  ,"uatcasino"  ,"mybetpoker.net" ,"livegame21" ,"favbet" ,"betfoldpoker" ,"livegamebetcasino"  ,"olympiccasino"  ,"netbet" ,"traders"  ,"coderebingo"  ,"turbopoker.fr"  ,"slotsheaven"  ,"duxcasino"  ,"atlantida"  ,"onlinegeneric"  ,"whpoker"  ,"whskill"  ,"turbopoker" ,"betspacecasino" ,"slotwin"  ,"flashinandplay" ,"icon2"  ,"dreamcasino"  ,"turtledragon88" ,"ladbrokes-dk" ,"PCHPrizes"  ,"Ace Of Bingo" ,"Beaky Bingo"  ,"gazzabet.it"  ,"bet365poker.it" ,"gala.se"  ,"GNUF" ,"skycasino"  ,"Costa Bingo"  ,"Virtue Bingo Italy" ,"Kisino" ,"Lucky Lucy Bingo" ,"Krone Bingo"  ,"slotattack" ,"castlebingo"  ,"longsnake88"  ,"grandmandarin88"  ,"bet365casino.bg"  ,"888 Casino" ,"mrgreen"  ,"kiwi" ,"bet365slots.es" ,"morningstar88"  ,"cgmslots.es"  ,"Titan Bingo"  ,"casinosnai.net" ,"SuperCasino"  ,"theritzclublondon.com"  ,"BET365-ES"  ,"mapau"  ,"nutspoker"  ,"fortune"  ,"21magic"  ,"usa"  ,"32vegas"  ,"deauvillepoker" ,"tikibingo"  ,"aspinalls"  ,"sixshooter" ,"staronline" ,"onlinevegas"  ,"onlybingo"  ,"casinoclubpoker"  ,"sage" ,"k8casino" ,"dafa888.net"  ,"fairpoker"  ,"aqualounge" ,"betmostpoker" ,"sisalbingo" ,"casinojamboree" ,"777play"  ,"poker770mt" ,"prestigebingo"  ,"tivoli" ,"ecasinophil.net"  ,"onewaypoker"  ,"gcasino"  ,"odaiba" ,"enter"  ,"grandplaycasino"  ,"broadway" ,"titanbingo" ,"titanbet" ,"jacknbeans" ,"hotelcasinonet" ,"centrebet"  ,"playgatepoker"  ,"clubonpark" ,"tila.net" ,"kralcasino" ,"kralpoker"  ,"kingsolomonspoker"  ,"carlospoker"  ,"hollandpoker" ,"blackbeltpoker" ,"redclubpoker.dk"  ,"pch"  ,"casinosnai.real"  ,"giobetpoker"  ,"paddypowercasino" ,"mansionvb"  ,"hansacasino"  ,"getofftherailpoker" ,"unipokerleague" ,"bambampoker"  ,"athinabingo"  ,"segapoker"  ,"euromaxplay"  ,"olympicpoker" ,"realbetpoker" ,"netbet.it"  ,"ray"  ,"cgmcasino"  ,"cgmpoker" ,"4clubcasino"  ,"netbet.fr"  ,"casino88" ,"club777"  ,"duxintegrated"  ,"digibet"  ,"chilipoker.fr"  ,"winga"  ,"heatmagazine" ,"ladbrokesdk"  ,"coral"  ,"netbetgames.es" ,"joka.it"  ,"everestpokerfr" ,"fourblessings88"  ,"calienteclub" ,"PaddyPowerBingo-EUR.com"  ,"Jackpot City Bingo" ,"321Bingo" ,"casinolifecom.mx" ,"powerplay88"  ,"Vernons Bingo"  ,"DOND Bingo" ,"VirtueFusion" ,"gentingcasino.com"  ,"BET365-SE"  ,"Fancy Bingo"  ,"Unknown"  ,"Vernons"  ,"betfairpoker.it"  ,"Quicksilver"  ,"unibetwl.com" ,"Carlton Bingo"  ,"Betfred Games"  ,"seabingo" ,"news.uk"  ,"premiercasinoslottec" ,"siapoker" ,"Luda" ,"ld1761" ,"lotsofluck88" ,"codereslots.es" ,"bet365games2" ,"premierslots" ,"hollandcasino"  ,"dafagold" ,"silvereagle88"  ,"cgmmadrid"  ,"aspire.malta" ,"Bingolore"  ,"winner.uk"  ,"royaldice"  ,"crowneurope"  ,"bingofantasy" ,"delrio" ,"europalb" ,"tonygpoker" ,"bet365poker.es" ,"newyork"  ,"kiwicasinopoker"  ,"fastwin"  ,"gpbingo"  ,"megasport"  ,"playoncasino" ,"class1lb" ,"carnavalbingo"  ,"bellini"  ,"sisalpoker" ,"18casino" ,"poker770i"  ,"vegas21club"  ,"seventhheaven"  ,"oceanpoker" ,"windows"  ,"bigslick" ,"gutshotpoker" ,"dmhpoker" ,"propagandapoker"  ,"pokerplex"  ,"betboocasino" ,"sunpoker" ,"setanta"  ,"eurobetpoker" ,"pokerhuis"  ,"fullonpoker"  ,"sportingindex"  ,"uaclubpoker"  ,"shufflemasterlive"  ,"winnercasino" ,"propagandacasino" ,"realbetbingo" ,"unibet" ,"puntoquota" ,"oceanpoker.fr"  ,"binionspoker" ,"kayacasino" ,"grandduke"  ,"vernons"  ,"aspers" ,"gamesos"  ,"dealornodealbingo"  ,"everestcasino"  ,"imperialcasino" ,"ladbrokesvegas" ,"gcgcompliance"  ,"paddypowercasino.it"  ,"cgm.es" ,"inandplay"  ,"kwin2"  ,"olybet" ,"luckystar88"  ,"aceofbingo" ,"itbox"  ,"Bauer Media Group Bingo"  ,"BOGOF Bingo"  ,"Blue Square"  ,"Caliente Bingo" ,"Orange Casino.co.uk"  ,"Gala National Bingo"  ,"Bingo Today"  ,"dafabet.uk" ,"Thrills"  ,"happypenguin88" ,"O Bingo - EUR"  ,"Minxy Bingo"  ,"Live Bingo" ,"Ladbrokes SE" ,"Bingo Corona" ,"AtTheBingo.com" ,"Bunny Bingo"  ,"Tea and Bingo"  ,"premiercasinotec" ,"gamesosonline"  ,"win2day"  ,"bet365minigames"  ,"blackpoolclubpoker" ,"bingo777" ,"rubyuk" ,"cherryblossoms88" ,"gamezone" ,"Betmotion"  ,"club3000bingo"  ,"saintsbingo"  ,"takeabreakbingo"  ,"Redbingo" ,"carnival" ,"mapaubingo" ,"hammerscasino"  ,"govegasred" ,"bet365poker.dk" ,"youbingo" ,"gotogoldenpalace.com" ,"mannypoker" ,"ambercoast" ,"blackpoolclubcasino"  ,"galaxy.net" ,"africanpalace.net"  ,"diamondclubpoker" ,"prestigepoker"  ,"hardrock" ,"onlinepoker"  ,"noble"  ,"vulcanpoker"  ,"nightpalace"  ,"totesport"  ,"prestige" ,"tilapoker"  ,"noiqpoker"  ,"shebangpoker" ,"tnpl" ,"flycasino2" ,"pokerpower" ,"mansion88lb"  ,"casino.com2"  ,"mybetpoker" ,"betfair.dk" ,"rey8.net" ,"gamenet"  ,"flypoker" ,"cashiskingpoker"  ,"winnersports" ,"7regalcasino" ,"challengejackpot2"  ,"coderebingo.real" ,"palpitos" ,"virginpoker"  ,"intralotpoker"  ,"lesambassadeurs"  ,"mistralcasino"  ,"whcasinoclub.de"  ,"titan.fr" ,"whcasino.it"  ,"whpoker.it" ,"winga.net"  ,"titanbet.es"  ,"goldentime" ,"ladbrokesgameon"  ,"beaconbingo"  ,"benidormbingo"  ,"buckybingo" ,"loveyourbingo"  ,"rehabbingo" ,"winnerclub" ,"games770.es"  ,"poker770.es"  ,"winga.es" ,"betlotto.cur" ,"lottomatica"  ,"goldenphoenix88"  ,"luckydragon88"  ,"betathome"  ,"mariabingo.com" ,"Bauer Media Group"  ,"sportium.es"  ,"greatfortune88" ,"trinitymirror"  ,"jackpot247" ,"Gala Casino"  ,"galase" ,"casino.comit" ,"PlayNow.com"  ,"Cosmo Bingo"  ,"Virtue Bingo" ,"Quicksilver-Euro" ,"titanbet.uk"  ,"Superlenny" ,"imperialpalace88" ,"Apostogano" ,"O Bingo"  ,"Coral Bingo"  ,"ladbrokes-es" ,"ladbrokes-no" ,"BBNetwork"  ,"upforbingo" ,"humingbird88" ,"maxbet" ,"bfpoker.es" ,"skincasinosps"  ,"bet365casino.cz"  ,"whitetiger88" ,"sierrastar" ,"titancasino"  ,"betfaircasino.com"  ,"murciapuestas"  ,"bet365poker.bg" ,"whcasinoew5"  ,"mightypanda88"  ,"drunkenmonkey88"  ,"snaicasinopiazza" ,"snaipokerpiazza"  ,"aztecbingo" ,"Football Pools" ,"BINGOGO"  ,"tradesportspoker" ,"mansionpoker"
    ]
  }

  dimension: product_filter {
    sql: ${TABLE}.product ;;
    suggestions: ["admin" ,"arcade" ,"binaryoptions"  ,"bingo"  ,"bjtournament" ,"casino" ,"crossproduct" ,"exchange" ,"funpoker" ,"games"  ,"landbasedcasino"  ,"live" ,"lottery"  ,"macau"  ,"poker"  ,"portal" ,"retail" ,"scratch"  ,"slots"  ,"sportsbook" ,"sportsinplay" ,"system" ,"vegas"  ,"virtualracing"]

  }

  dimension: tst {
    sql: brand_to_licensee_ref.licensee ;;
    suggestions: ["select distinct licensee from brand_to_licensee_ref.licensee"]
  }

}
