'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "3df30a3e3854009f7d39726de5e35d58",
"version.json": "dcf58c4797fb8e930859ba7c980b7f94",
"index.html": "3e1c49442460c302c1c8030f321740d6",
"/": "3e1c49442460c302c1c8030f321740d6",
"main.dart.js": "6bc0ab201ae0b2be29ecb380ec399199",
"sqlite3.wasm": "fa7637a49a0e434f2a98f9981856d118",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"favicon.png": "ce7134546e819dddf1876f10ff4f345b",
"sqflite_sw.js": "31d56f9d0a4e21949c974394594bb029",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "fa43502cbe40dbe7290075e043384e4e",
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
