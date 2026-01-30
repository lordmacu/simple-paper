'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "0a8c5ec35bbdd7c159616ac8c41e834f",
"version.json": "dcf58c4797fb8e930859ba7c980b7f94",
"index.html": "3e1c49442460c302c1c8030f321740d6",
"/": "3e1c49442460c302c1c8030f321740d6",
"main.dart.js": "c61b371bd3506ee38c2d3145724ff488",
"sqlite3.wasm": "fa7637a49a0e434f2a98f9981856d118",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"favicon.png": "ce7134546e819dddf1876f10ff4f345b",
"sqflite_sw.js": "31d56f9d0a4e21949c974394594bb029",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "fa43502cbe40dbe7290075e043384e4e",
".git/config": "d8999c4ca0c58a65f129e2293946e8a3",
".git/objects/50/3208a8aebad81854c1276171917faebf86e1fd": "11241af60815a06b3ef0fb66bd17f0ea",
".git/objects/68/9cbc8a593db5e6fcc505f48d9a3b6555d26227": "62aff72d567a90619538c71a67fe04bc",
".git/objects/68/43fddc6aef172d5576ecce56160b1c73bc0f85": "2a91c358adf65703ab820ee54e7aff37",
".git/objects/6f/7661bc79baa113f478e9a717e0c4959a3f3d27": "985be3a6935e9d31febd5205a9e04c4e",
".git/objects/03/b46532ebb68b6170ee14018d5132017b35cf24": "8136def244d56a15b3a3631d8294a606",
".git/objects/04/c6cdc18e5212f2979a31b0ecc2e6b1ee7a4303": "bccc82fa193680ad134805bd9da801d2",
".git/objects/6a/dcb443d447623b47e60531c49e319b0314d308": "c96a8a0935c5c7bda29369238329e4a3",
".git/objects/32/cf9dabc1c020e533f916aaf891f77c9bc3fc6a": "77c650a428d4af3cea7001849df53ed3",
".git/objects/32/c75d37566961e0b880ceb6f9eb3da707774411": "99bf10d53a80abe994d04206bd6e6166",
".git/objects/69/b2023ef3b84225f16fdd15ba36b2b5fc3cee43": "6ccef18e05a49674444167a08de6e407",
".git/objects/51/012161f0ce0ebc0f81eef19b63dce6cec6d56a": "83a78652a27ca0dc26d2460f98251499",
".git/objects/51/03e757c71f2abfd2269054a790f775ec61ffa4": "d437b77e41df8fcc0c0e99f143adc093",
".git/objects/67/b60c9bacef2db274d37201345d4c37979836f3": "c4e372fca384ebf230b4aa1af1f0d4e7",
".git/objects/93/b363f37b4951e6c5b9e1932ed169c9928b1e90": "c8d74fb3083c0dc39be8cff78a1d4dd5",
".git/objects/0e/5e1dc0fd517ca9a2540cc1e97e16e8661506e1": "9b21d54bdf5222c62d628ade7824dea1",
".git/objects/5a/e26b14abbaff46cfb3ebab9c08f6335deeaf19": "eee0419fee5581f59bac237b1a22f1d7",
".git/objects/9d/01142a5501dda312f2c7c61bf1c5f9229e1384": "e1f6b9e1b618c57087c92bb897f8defd",
".git/objects/a4/b82c7a98a4f89baf791004f4e5f43fc95b93e9": "be5dbcf9e61802c2439d43c294e91170",
".git/objects/d9/5b1d3499b3b3d3989fa2a461151ba2abd92a07": "a072a09ac2efe43c8d49b7356317e52e",
".git/objects/ac/5a78e090fad5bb2837bda17eceb8b336e43e51": "a5511a487e6db6df60028d72a281ab0a",
".git/objects/ac/1536b43c1c36c4cb40cf5690ad1b1f69d36884": "85e0f14c94df9318d2ae608526964c80",
".git/objects/ac/815e4537e47024eec98340ef335e2f7842498e": "7901e0bb0f51be24e75fd9564b81ccef",
".git/objects/ad/ced61befd6b9d30829511317b07b72e66918a1": "37e7fcca73f0b6930673b256fac467ae",
".git/objects/ad/86e2e102f5f016fe15e162321dd8d7481f61dc": "a05695ad13f8eb077b08f4ad8be43c1e",
".git/objects/bb/bb91fb86096616229277882ed2a1557352dd30": "8d71bfc4c5f2a091bb148c315602cc10",
".git/objects/d7/cc8572d30befc640bc1fbb6de8ea74e1172f83": "c85a37f2adb5e0663137bf4b0acd4dec",
".git/objects/d0/86b13282ec2bd1d6f7c6270a2bab45eeac0490": "0bb1d6310916a199a1308e9cc1b6272c",
".git/objects/d0/7620dca850b093bd394f546617c3e14a94d5ff": "76279a032c2eb96d85103d54a95e52c3",
".git/objects/be/e7459ed2136b22171e881b9ef80e8a7d340ffc": "180bd3564df46d1f6c0a9ba0be07148a",
".git/objects/be/71fe4b2c81a6306153abdff0da1745c73e328f": "ef6671b85ff87f39704bf64d8a30d523",
".git/objects/df/d24a64d1441bc7b928ed36932e0f7c3eab3195": "8ffd9cff55973edd5d1fa8a85711f153",
".git/objects/b4/c68e706583120ec8767af35d1f932472f30ea5": "38225e5070d61b138974ecdda8a08231",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/ae/ff470e2e8ba2b76fa36e2aff3643c70d2439b9": "73eae29df7086b077d81d7e4e9a3d65f",
".git/objects/d8/fe76ae4d3a8e58d972f22892aff70c2a18e1eb": "4a79ce0b036af5830dda044cc0585061",
".git/objects/e2/a24f5730c77c493246463afc9afdfa69a7e9d6": "60db1fa6c1ad93058c14bcb0f5ef5d89",
".git/objects/f3/3e0726c3581f96c51f862cf61120af36599a32": "afcaefd94c5f13d3da610e0defa27e50",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/c9/79c793e0157ee55306cabc2ddfefa40f4b86d0": "0108459e3622b15ea6823536206e7cfd",
".git/objects/c9/30b6de18ff9afd897626e6c1b609bbb8e0d7f4": "fbe9fef699c653edc2d633f77a6fe3a6",
".git/objects/fd/05cfbc927a4fedcbe4d6d4b62e2c1ed8918f26": "5675c69555d005a1a244cc8ba90a402c",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/c8/3af99da428c63c1f82efdcd11c8d5297bddb04": "144ef6d9a8ff9a753d6e3b9573d5242f",
".git/objects/c1/909326fee0a7792906a2f19f9f163dfd3055f1": "ec364a3a066f11392073f8755c2125ce",
".git/objects/c6/a45ccf8b0b2cd8fc39a29894dab2d0b8aa0a61": "7b6eaffbb4d44073496fee6dd9b04da1",
".git/objects/7c/3463b788d022128d17b29072564326f1fd8819": "37fee507a59e935fc85169a822943ba2",
".git/objects/42/fc0af221e2fcde7929bda88bd9d4f0f0604536": "8289425d82036a4c374c6bf23fe7e85e",
".git/objects/89/3ed5e5f7e3604bd4d77ae93c88d85587dd1b17": "3e910e74be241688c4c9aa65be4bb295",
".git/objects/45/4c477d760a65c7d8360a8c84046e9133c4d540": "ac9556632e5f9737180af3f900374c5c",
".git/objects/45/f12501241921e81589763f854d5d466cd02315": "ecb69029dbbdf9bf876cd28bf6a840eb",
".git/objects/1f/bbdcee611341460a95f6412185483fab083aa1": "b710394850ae5c03c1456a42b7b359ed",
".git/objects/73/13b313585127451af0814d6103ae08ddb0ccdf": "8c8b668356d7d9eb5fb8f64ef35bc80d",
".git/objects/74/e362e236925416e56e11eb506797ac4eef3669": "6d087fd3b224488a16a545b11277152a",
".git/objects/1a/a2fbc665565127b5bed1675e4f348d756c6dab": "a96e9add488afcbc0f23555c2110d789",
".git/objects/17/68cce67a9619669f2a8530f428e02eae1a53e3": "befbafd66884dd78903094d455861b0e",
".git/objects/17/192d27d200598b3d291b133014be768823710e": "c0013d73db01a0c82b6186c0da70ce1b",
".git/objects/8a/bfba82762a9b8ef5df54c8771982db630b5bf9": "523d7bfde6c6e4d8918401fe92778745",
".git/objects/7e/52d9a5e51835569c96b2f3c9b9446e9459dcbc": "20c29c617a86134ae3e7a3b5e970f735",
".git/objects/7e/7e04563fb915bd3d1cfb1d3d181cb36f065fbc": "200ea27881db5ce442952b45fa22b3b6",
".git/objects/10/0cf293e8b74bba0fd13fd98d4c3576cd5f504b": "b0b1616c65ed3f0988f6937b450bb370",
".git/objects/19/ba7b098ba0bcae007e94a52ed4936bf8864192": "535bd537a519975f9a067e0f131e68a8",
".git/objects/4c/6582377bca9bb3840aee2f6c911d05705f55cc": "2f040ed1e2827476772742e22ecc9937",
".git/objects/26/96315359c54a301039c7478c9d3e6b394fd072": "1b786c259360d5143d811c9d822f9473",
".git/objects/4d/b015f66ca2ec89ad85b09089198cda5d51af78": "b64b5620c022f1e25f836216e61eea3d",
".git/objects/44/e4bbc9be62a0f42888180c08c6842152b59b8c": "926f6da8e7ced2064bcf0116c23c8979",
".git/objects/2f/b366a055881d4943b09853a136289eb333e5c4": "05908a0bb458b99cc4dc02c81944bc5c",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/6b/23283a20f527b5c6ae3389cc36e589b2544e72": "ba06079262cd3c9bf2672fdb9169f245",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/07/234cfb1a7cdb8a840ce255f8b8198351f13eca": "1bf8eaf9b79caef695213e33c3fa813c",
".git/objects/38/6916d432250b749a50b216030af55f2d1e20a7": "4671a95b78b96f7196befc0f348c37d4",
".git/objects/9a/6c7c132a85584a2426c88ec266b5bb12dd3e6d": "72158fece0c6410e17493675a3c17529",
".git/objects/5d/71ab3072f161b78601ab3c8c1b72b003bcfee4": "598b0b627f21bb1ef4dae8d6a24bfd4a",
".git/objects/96/805b026eff97e807819ecc602b67125405b93a": "814fcfe502611a23d344975700069b0b",
".git/objects/3a/8cda5335b4b2a108123194b84df133bac91b23": "1636ee51263ed072c69e4e3b8d14f339",
".git/objects/98/9e051b777392e9361ff13c345e926668750f41": "01aa2513564a97b44b1fb92066161f7b",
".git/objects/30/8d3fe439e562651e9b86cf28bfde8558f2b344": "110301c447b901804f9738500eef4162",
".git/objects/37/c7c5c7ff71bddd1efecb2a7c23291b9e6258dc": "f26d88358bb05cb78a6b96fbc3dca69c",
".git/objects/08/27c17254fd3959af211aaf91a82d3b9a804c2f": "360dc8df65dabbf4e7f858711c46cc09",
".git/objects/39/d04836c99ac46b8ebc64d73f1109d6310daf56": "7485e95403f4dd10ad13031a809d6b8c",
".git/objects/64/9403df4bd4548c14828557882488a27d8e029b": "f043dc80fde178f389c5dc3f49c86399",
".git/objects/64/3fc0f74e7ab174031e0fd21e2b888d71e5925c": "aa9c8370a1f7ed90cad2f9fb6aef0e2e",
".git/objects/64/3b3e5fd89f7edb1078c9e9a259f12d1400126a": "c3a4da27401fdf14667994f09c530351",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d4/2cb150227473f09586159790d3e9e667be5b26": "00aa7276eb556e2750e2be564ae6c7ca",
".git/objects/d4/801d66885f081289fade8d946c0567cfa848d6": "c26cc74c1c0b0f97dc5bb2b9a7c9f384",
".git/objects/d4/a210e82426ceefac444493c45e51c9bf6a0823": "7aa16f94e5690077da5b3584ae8a9546",
".git/objects/d4/ef3aaa937364458b0e860130218338fbad1ed3": "23d17cef1a4046dde4d687ed56c64636",
".git/objects/a0/2950840bdbe1afda532ad65a1948c1406933c6": "1a6f8898331907eda79f4d695dc3c961",
".git/objects/b8/d3d800f28bce0a4199ff4e88e9284dc64ef708": "d7fe2cffa01f178a79190c10179e4aca",
".git/objects/dd/b6ff23bd050f7e4215a07cb12377c4ceb2825f": "d9abbcc73a18a464b8bb496b61cc7017",
".git/objects/dd/5b1d6c179280bb25aed217d1ba84c3f62eb2f9": "f4fa858efa7c23263d28cdf76339a7c3",
".git/objects/b6/b16096e174229b02cc96c8057755cc0ddf558d": "a1e90f09698e20378591cda11d02c4f9",
".git/objects/aa/73da18f6596e9255a58c2220b2711cde198ae8": "ad5ad7aea438c8920f4824ebc220adb3",
".git/objects/b7/15342d7e6fd3b4441dcb054c642512d10f6aad": "3c6016d3aca129446496f142ff7b5541",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/a8/dbeee07092427ae00aa267497927b17d123ed1": "3b69b2d47915714f8a31562fec8a41da",
".git/objects/a6/fde252723aead2da8662696ff6e7ffef467262": "ee920555b1b266882a4555334741e4c0",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/3e39bd49dfaf9e225bb598cd9644f833badd9a": "666b0d595ebbcc37f0c7b61220c18864",
".git/objects/a1/d81286989fe3cbbae8c51fb2a5968f006b2d52": "1f66285b5a851d73b244c06c180c99c8",
".git/objects/c3/b86c5a30932ea5aeb8de17eeb198f9dbc467c6": "81f7318b91f4e5af43acfcb9dfa674f6",
".git/objects/c4/17b8a137a48876721ce8dcc3856da27c4352ea": "ea1b6c3e91d5ec0e1738a034484ecabf",
".git/objects/c4/b092b968494a8e250ce23a7127ca6d9233235e": "0f39b4fff87cd78bdaea8c87dcbe72e4",
".git/objects/cc/fbaea505fa8a4641a13a89b93726be98372835": "2537e2d856c10c661e1931ce1d41ba28",
".git/objects/e6/eb8f689cbc9febb5a913856382d297dae0d383": "466fce65fb82283da16cdd7c93059ff3",
".git/objects/e8/f6478c4ef3699322777b14b117001d3c0d2f60": "affb539693b075817b9a0432da2b281b",
".git/objects/f6/e6c75d6f1151eeb165a90f04b4d99effa41e83": "95ea83d65d44e4c524c6d51286406ac8",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/e9/27de050f1ad8e60e76a02ddd00b4e99fd4fbc6": "33c80a7ad022a48cde4a0627c37c3421",
".git/objects/ce/58057cdfb654f30452b487e2b9ab01fcebe1f8": "74d223241d2beb884fd01cc7167c1785",
".git/objects/e0/f83233d9c9704173e4b0df6df536080b350a73": "e49297ebf17cd90ffc163c701486aadc",
".git/objects/46/4d3734611be0a36c38dce31ccd01fa6fc9298e": "087b24dad9c2e33bd562e65ca1a0499e",
".git/objects/46/40f5ce4855dd14d76e8b474f038feb89553e78": "a4dd84aca69afe8b39441866b8becfbb",
".git/objects/79/0adef0d775c183df2243e40324d20bc90d0c37": "a377f852365619c78e2a531c6a191b3b",
".git/objects/79/c0bdf0b78f460b76854332535c74337551364a": "9e55d6f1593041c66d3279bc09a43d7c",
".git/objects/8d/9480544ef105dc879456479b5e453b826118e3": "c9d9c4a37145dc307c1e24554c05d20b",
".git/objects/85/63aed2175379d2e75ec05ec0373a302730b6ad": "997f96db42b2dde7c208b10d023a5a8e",
".git/objects/82/4aeacdb6e4da8d2d2d1fbe351f015313b5c0e9": "4163d50820bb00157216548ccc745377",
".git/objects/40/54cf675839eb2b7b2dd01cd0e907a1504dd975": "3b862dadfdf9fd1141ad23339b828729",
".git/objects/2b/1ea5ff251cbf96caac04bfea067ab1d6c88119": "0d6e256b4e620ca544885b48f3fe4d88",
".git/objects/47/b4600a23af9b936776bdc9932a9be2db7185f5": "dd8a62801ff738e18e79f6cf0b195218",
".git/objects/7f/646e808f971c1ea0e29ab87eb48c4f1fe24e34": "3abbcc9f285f3e4f8a5d2d345486f2a5",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "d37b2ee24b705ec9bfc4f2bd51194dc0",
".git/logs/refs/heads/gh-pages": "7263f15c82a6b78fd3845181bd7c3121",
".git/logs/refs/remotes/origin/gh-pages": "8a56aa6d3c18bae5412e1a2b86ccdc8a",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/gh-pages": "bd96baada099197664517d7ecae66561",
".git/refs/remotes/origin/gh-pages": "bd96baada099197664517d7ecae66561",
".git/index": "9e423453fee3c6dd09d0677a08e91eaa",
".git/COMMIT_EDITMSG": "38a0051eba6af6351f50760ce09a3083",
"assets/NOTICES": "a74388ba35013db51c41099044dc2b57",
"assets/FontManifest.json": "aed2b02323ee1c15e32a18f07088b8e3",
"assets/AssetManifest.bin.json": "5968f194d8dce3c91730c8fe6dae91e6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/iconsax_flutter/fonts/FlutterIconsax.ttf": "0ec32dc803487f267d85482d9d8d7783",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "d654b5330a036ea49cd17755ff356f15",
"assets/fonts/MaterialIcons-Regular.otf": "9be05176c26260eaa5eb3bf0a5b94ae1",
"assets/assets/episodes/episode_a1_07.json": "10f48011c2e888eecd12705b0aa69d60",
"assets/assets/episodes/episode_a1_06.json": "87a2f00150febbf08ba671582b4d2b3a",
"assets/assets/episodes/episode_a1_10.json": "ab280e67aef077989ef43633cc8151f6",
"assets/assets/episodes/episode_a1_01.json": "3e49ce7595b50438647df6bf4d4909e3",
"assets/assets/episodes/episode_a1_03.json": "83447f23784ae3cfc17a53c93d511907",
"assets/assets/episodes/episode_a1_02.json": "67eaf67fb4ea3c427e20f6fad1c73d9c",
"assets/assets/episodes/episode_a1_05.json": "fe45dec7c5d663a05523e3548dc8a730",
"assets/assets/episodes/episode_a1_09.json": "cb0a053bed7284c11e62e92cdf6b995f",
"assets/assets/episodes/episode_a1_08.json": "61a152e77ef544c878bdab92e2c825eb",
"assets/assets/episodes/episode_a1_04.json": "85fd91d6211be84fed840d2823aaac5f",
"assets/assets/language/a1_language_lists.json": "4f5062acf8907f7d5243a2649f42c2cb",
"assets/assets/avatars/oscar_02.png": "7d09ad1b749ba2cf9f7d682979ba0c01",
"assets/assets/avatars/mia_04.png": "b1d4ca850138fed13ee6facc2614dfb4",
"assets/assets/avatars/dan_03.png": "a8ec35e60bd28f3d0a5c819268fd2c6a",
"assets/assets/avatars/dan_02.png": "71738fa1342b2f3a43912df54d3a8dbb",
"assets/assets/avatars/mia_05.png": "97fa455f7077d78673e2e6cbbca821ae",
"assets/assets/avatars/oscar_03.png": "f7ee5c7ef2d7c4d532c047abb0aae548",
"assets/assets/avatars/oscar_01.png": "abc2888c9eeb403789b79a62bbb70b7b",
"assets/assets/avatars/ray_04.png": "86de80212336e2c3caa1dde2160d95f2",
"assets/assets/avatars/sam_05.png": "94882651904492daebcfdcab6070b022",
"assets/assets/avatars/sam_04.png": "8d44dff144e9f1e512f8c908dfde80fc",
"assets/assets/avatars/dan_01.png": "97cecd4acac447e6853df1626a71385e",
"assets/assets/avatars/ray_05.png": "75843552cc9cbd86b088b78a96e593d2",
"assets/assets/avatars/oscar_04.png": "160c950e26156637dfce20d2442c27ea",
"assets/assets/avatars/mia_02.png": "9e96026e7fce69191241dc5fa662f434",
"assets/assets/avatars/ray_01.png": "9a85a5996662d0fe8bf027b4e47c8283",
"assets/assets/avatars/dan_05.png": "52b4f0075beddaa47f0f8749ffc09b9c",
"assets/assets/avatars/sam_01.png": "0b74b3402fdedba8115b272113e6f08c",
"assets/assets/avatars/dan_04.png": "ea4331ec8a9a6090676345c3987f2bbe",
"assets/assets/avatars/mia_03.png": "54fb666842ee8bfce08da0cca026d8cb",
"assets/assets/avatars/oscar_05.png": "417a983a68ee8f23c5b3e39d7b3c82b6",
"assets/assets/avatars/mia_01.png": "ce7134546e819dddf1876f10ff4f345b",
"assets/assets/avatars/ray_02.png": "5b232c3c5d9ec11700cf0b09e8fae5ef",
"assets/assets/avatars/sam_03.png": "4e68e5c7e63ed1a6a1c3dcb0241d69db",
"assets/assets/avatars/sam_02.png": "143ce9d3140d4c4899cce6633ed43eaa",
"assets/assets/avatars/ray_03.png": "cecb410153152b3ceb5160a300ea691e",
"assets/assets/avatars/ana_03.png": "6bf426ac4487e9115460f50a5a367605",
"assets/assets/avatars/ana_02.png": "24feeffd2d61e9645c3bedcf08ed54cb",
"assets/assets/avatars/leo_05.png": "ca74e351d90f6fecf05294f50d2bbbfd",
"assets/assets/avatars/ana_01.png": "803034c67916b6b00e95eefe1fa97788",
"assets/assets/avatars/leo_04.png": "355a86cf37d574e96680e23d44f5e1d7",
"assets/assets/avatars/ana_05.png": "ccd4e728b75bcd0d16f3af757bb30c81",
"assets/assets/avatars/ana_04.png": "dcce1a7416399892da78ca24df097088",
"assets/assets/avatars/leo_01.png": "ff517b8d6f7fd610b38903390b15a724",
"assets/assets/avatars/leo_03.png": "b13a88b6d13236e01e39a0c0f2b78ed5",
"assets/assets/avatars/leo_02.png": "55535c86a1341e49098d4ba08750cb47",
"assets/assets/avatars/max_01.png": "d0a8e1d1e2af6e0b3f9ba5c489e8f4a5",
"assets/assets/avatars/ben_04.png": "278ed2f3f78ef96fd1d5cac2d47c0e84",
"assets/assets/avatars/ben_05.png": "74ac1b744f197a9aabff0c8596d983bf",
"assets/assets/avatars/max_02.png": "2cffbfdaed6fe9274c3af644324f6fa0",
"assets/assets/avatars/andy_05.png": "fae292742bc536136b02aa555434566f",
"assets/assets/avatars/andy_04.png": "99afbcea4380dc716ad19e24fb15d42e",
"assets/assets/avatars/max_03.png": "409e90879bf12d5988c1621f3b7295cc",
"assets/assets/avatars/ben_02.png": "de89646c070a6c78a121f9e07cad37fc",
"assets/assets/avatars/andy_01.png": "e3b26a61db08901bfc8b56304ef52e76",
"assets/assets/avatars/ben_03.png": "bedc226c7439cfe21ef183c8cb6312fc",
"assets/assets/avatars/max_04.png": "c16530f1e8a67a358e84875c7f4a3d2c",
"assets/assets/avatars/ben_01.png": "60a4b7c8a53895f642a9933e7cafd31f",
"assets/assets/avatars/andy_03.png": "36d29a552f6b01123e1a103fec8a7ffd",
"assets/assets/avatars/andy_02.png": "6008f4819f1c84d23727fbf51a8e02e9",
"assets/assets/avatars/max_05.png": "ea7095150152efef88e1ea48d9437d36",
"assets/assets/characters/episode_a1_01_michael_interview.json": "692b367532ca49a3aef10bb67bca4033",
"assets/assets/characters/episode_a1_01_player_interview.json": "e2db163b11ca65e76cde2f2ca2e80247",
"assets/assets/characters/episode_a1_10_stanley_interview.json": "f7ef05958664a2aba8a8b712370f735f",
"assets/assets/characters/episode_a1_01_pam_interview.json": "f630e165e31fbba084808600b2f7f5ab",
"assets/assets/characters/episode_a1_07_kevin_interview.json": "59421b8844a408d4af791345f51ec44d",
"assets/assets/characters/episode_a1_01_jim_interview.json": "b12605bd133e9b4372f8fbfbca84fb5f",
"assets/assets/characters/episode_a1_01_dwight_interview.json": "52b7e792df0d9af98a3e57a4590036c6",
"assets/assets/characters/episode_a1_07_angela_interview.json": "89ceb4fceb44d035c93bd2afb6050710",
"assets/assets/saludos.png": "9ac577f5c811af25032961fa219a4173",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
