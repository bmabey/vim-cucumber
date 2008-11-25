if version < 600
	syntax clear
elseif exists("b:current_syntax")
  finish
endif

" make things case sensitive
syn case match

"setlocal iskeyword+=:
syn keyword xStatement Cenário Escenario Scenarie Scenario Scenariu Scenariusz Skenario Stsenaarium Szenario Сценарий سيناريو シナリオ 场景 Arwedd Característica Egenskab Egenskap Feature Fitur Fonction Functionalitate Functionaliteit Funcționalitate Funktionalität Funzionalità Omadus Właściwość Функционал خاصية フィーチャ 功能 A Aber Ale Allora Alors Als And And y'all Anrhegedig scenario Atunci But But y'all Cand Contoh Tambahan Cuando Când Daca Dacă Dado DadoElEscenario DadoOCenário Dan Dane Dann DanyScenariusz Dar Dato DatoLoScenario Dengan DenganSkenario E Eeldades EeldadesStsenaariumit En Entonces Então Et Flere eksempler Gegeben sei Gegebenes Szenario Gegeven GegevenScenario Gitt GittScenario Given Given y'all GivenScenario Givet GivetScenarie GivetScenario Hychwaneg enghreifftiau Ja Jeżeli Ketika Kui Kuid Lorsque Ma Maar Mai multe exemple Mais Maka Mas Meer voorbeelden Mehr Beispiele Men More Examples Más ejemplos När Når Och Og Ond Oraz Pero Più esempi Plus d'exemples Pryd Quando ScenariuDat Si Siis Soit SoitScenario Så Tapi Then Then y'all Und Wenn When When y'all WięcejPrzykładów Wtedy Y Yna anrhegedig a Și ДанныйСценарий Если И Но Сначала То اذاً امثلة اكثر بفرض بفرض سيناريو معين لكن متى و かつ しかし ならば もし 他のサンプル 但是 假如 前提 前提シナリオ 引用场景 当 而且 那么 contained

syn match featureContext  /^\s*Arwedd|Característica|Egenskab|Egenskap|Feature|Fitur|Fonction|Functionalitate|Functionaliteit|Funcționalitate|Funktionalität|Funzionalità|Omadus|Właściwość|Функционал|خاصية|フィーチャ|功能.*/   contains=xStatement
syn match scenarioContext /^\s*Cenário|Escenario|Scenarie|Scenario|Scenariu|Scenariusz|Skenario|Stsenaarium|Szenario|Сценарий|سيناريو|シナリオ|场景.*$/ contains=xStatement
syn match stepContext    /^\s*A|Aber|Ale|Allora|Alors|Als|And|And y'all|Anrhegedig scenario|Atunci|But|But y'all|Cand|Contoh Tambahan|Cuando|Când|Daca|Dacă|Dado|DadoElEscenario|DadoOCenário|Dan|Dane|Dann|DanyScenariusz|Dar|Dato|DatoLoScenario|Dengan|DenganSkenario|E|Eeldades|EeldadesStsenaariumit|En|Entonces|Então|Et|Flere eksempler|Gegeben sei|Gegebenes Szenario|Gegeven|GegevenScenario|Gitt|GittScenario|Given|Given y'all|GivenScenario|Givet|GivetScenarie|GivetScenario|Hychwaneg enghreifftiau|Ja|Jeżeli|Ketika|Kui|Kuid|Lorsque|Ma|Maar|Mai multe exemple|Mais|Maka|Mas|Meer voorbeelden|Mehr Beispiele|Men|More Examples|Más ejemplos|När|Når|Och|Og|Ond|Oraz|Pero|Più esempi|Plus d'exemples|Pryd|Quando|ScenariuDat|Si|Siis|Soit|SoitScenario|Så|Tapi|Then|Then y'all|Und|Wenn|When|When y'all|WięcejPrzykładów|Wtedy|Y|Yna|anrhegedig a|Și|ДанныйСценарий|Если|И|Но|Сначала|То|اذاً|امثلة اكثر|بفرض|بفرض سيناريو معين|لكن|متى|و|かつ|しかし|ならば|もし|他のサンプル|但是|假如|前提|前提シナリオ|引用场景|当|而且|那么.*$/    contains=ALL

" FIXME matches apostrophes, too :(
syn region stringToken start=/'/ skip=/\\'/ end=/'/ contained
syn region dblStringToken start=/"/ skip=/\\"/ end=/"/ contained
" FIXME this matches 
"syn match stringToken /'.+'/ contained

hi link xStatement Statement

" english
hi link featureContext  Title
hi link scenarioContext Title
hi link stepContext    Function
hi link stringToken     Question
hi link dblStringToken  Question

let b:current_syntax = "feature"
