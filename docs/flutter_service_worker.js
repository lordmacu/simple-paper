'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "5b6458b255de8d434a47b20173019d2c",
"version.json": "dcf58c4797fb8e930859ba7c980b7f94",
"index.html": "7a7a090bbdd32d0aa8eac9f1efc2120e",
"/": "7a7a090bbdd32d0aa8eac9f1efc2120e",
"main.dart.js": "59316f7232555f761e50ca8c875699d6",
"sqlite3.wasm": "fa7637a49a0e434f2a98f9981856d118",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"favicon.png": "1b7ad6acc80332aed5b0719e94a3ca3e",
"sqflite_sw.js": "31d56f9d0a4e21949c974394594bb029",
"icons/Icon-192.png": "0601e6a40b861f08cdb4b74d94fe24e9",
"icons/Icon-maskable-192.png": "0601e6a40b861f08cdb4b74d94fe24e9",
"icons/Icon-maskable-512.png": "5db6463084af3b9b8fff231e59baf217",
"icons/Icon-512.png": "5db6463084af3b9b8fff231e59baf217",
"manifest.json": "fa43502cbe40dbe7290075e043384e4e",
"assets/NOTICES": "a74388ba35013db51c41099044dc2b57",
"assets/FontManifest.json": "aed2b02323ee1c15e32a18f07088b8e3",
"assets/AssetManifest.bin.json": "5968f194d8dce3c91730c8fe6dae91e6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/iconsax_flutter/fonts/FlutterIconsax.ttf": "0ec32dc803487f267d85482d9d8d7783",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "d654b5330a036ea49cd17755ff356f15",
"assets/fonts/MaterialIcons-Regular.otf": "ee7efa06182a379c83225ed0ae8b50f5",
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
"assets/assets/avatars/oscar_02.png": "4b9241c468629545695c5699c7a6aa13",
"assets/assets/avatars/mia_04.png": "dcf8e11a2d9dcfb2a026f946a31d8865",
"assets/assets/avatars/dan_03.png": "1edf0f07a234e2ec0c86f74d708c7553",
"assets/assets/avatars/dan_02.png": "6d4c0ebcf55f14acea43dcc0ec6b34d2",
"assets/assets/avatars/mia_05.png": "7dec4159964d1734f33a854c9358be85",
"assets/assets/avatars/oscar_03.png": "af0debead401f0b5defcb933d8407e6d",
"assets/assets/avatars/oscar_01.png": "e980dacc75669a6a3e5a1789dc2fa8f4",
"assets/assets/avatars/ray_04.png": "5d6044eb1f5828994bf94140a60c9dbf",
"assets/assets/avatars/sam_05.png": "df61d18c2c907a43a56a4db9d2d7bddf",
"assets/assets/avatars/sam_04.png": "f5e96d50db439add0f6c406108824057",
"assets/assets/avatars/dan_01.png": "11cebd9fb051b3f63f53d2137374af8e",
"assets/assets/avatars/ray_05.png": "2a43e546a169cfbf96619660c19be176",
"assets/assets/avatars/oscar_04.png": "1fdecd43fa338ce9cad0bcc675755954",
"assets/assets/avatars/mia_02.png": "902a50ce078f9c0bcadf1819efe892df",
"assets/assets/avatars/ray_01.png": "2c4497e3a5b68eb0737327b711d8b000",
"assets/assets/avatars/dan_05.png": "3ab83202b82fb8607dc7c5ccbff65dd7",
"assets/assets/avatars/sam_01.png": "c6a3d4d76d31c4aa2df76266a9f1f5dc",
"assets/assets/avatars/dan_04.png": "ecaa57e85541c3e3de4abbc231de13a0",
"assets/assets/avatars/mia_03.png": "f0b502248a2cca4f6238645f757809fa",
"assets/assets/avatars/oscar_05.png": "178a550a808ecdb5feec28a60d053eb6",
"assets/assets/avatars/mia_01.png": "4daebc6d47a8243f5e27fa08ca5f19a2",
"assets/assets/avatars/ray_02.png": "a92b03358c97473c943a9974ffaee747",
"assets/assets/avatars/sam_03.png": "132b23738fa28baafb7c5f68339ac453",
"assets/assets/avatars/sam_02.png": "233f4a298322ecb2098ea92b3cc0d717",
"assets/assets/avatars/ray_03.png": "f6006dff08c2d5059070af6c3d60d362",
"assets/assets/avatars/ana_03.png": "43e7f0d35b68bcb460cb8d3a32edc1e5",
"assets/assets/avatars/ana_02.png": "e872ea62a0a9afad2e5edd15d9062117",
"assets/assets/avatars/leo_05.png": "c58cd026b8234cf910eea39aa05fc80a",
"assets/assets/avatars/ana_01.png": "446b3386037abe2c1bcbbf8144f0baeb",
"assets/assets/avatars/leo_04.png": "1a85e56475207c7a5b130d6d19ea2721",
"assets/assets/avatars/ana_05.png": "3ffc7a9835aa0c307781fed533be2f5b",
"assets/assets/avatars/ana_04.png": "ce22637cc4fc70baa5f0ebabe5377b7a",
"assets/assets/avatars/leo_01.png": "08c79dffc1d1244b65e42ef71cc12dcf",
"assets/assets/avatars/leo_03.png": "7edf3c89b3e7c9987a453e8dd5d0d88a",
"assets/assets/avatars/leo_02.png": "a9f24d5f0a4987fd6fba77fda97e7ce3",
"assets/assets/avatars/max_01.png": "3e4ac29f3152a83e8c1cf57d00717aeb",
"assets/assets/avatars/ben_04.png": "139c55f661aee6a01575ec490745fb9f",
"assets/assets/avatars/ben_05.png": "40157de5562d51980443f503c910075d",
"assets/assets/avatars/max_02.png": "94fd6811470e09b7ad37e1db38c9ec42",
"assets/assets/avatars/andy_05.png": "8102524b63ca4a951881b2fbb5b0431a",
"assets/assets/avatars/andy_04.png": "b99a34349f0afbbfb7731ce55b8e9163",
"assets/assets/avatars/max_03.png": "70142578cbaf0124bb29a0258e15f9b2",
"assets/assets/avatars/ben_02.png": "94dfa2ba1529a5c809568f71e1ee0bad",
"assets/assets/avatars/andy_01.png": "999ef5389436aa003cb227b90d387613",
"assets/assets/avatars/ben_03.png": "cc734ce3a74ad73ce7d31774ae606b0d",
"assets/assets/avatars/max_04.png": "390680b834ef81f87d7055aead50c5f0",
"assets/assets/avatars/ben_01.png": "1905373c1692044163f520ed20c3159a",
"assets/assets/avatars/andy_03.png": "a6f6d0376a8e12d68f51d16849e73115",
"assets/assets/avatars/andy_02.png": "2129018351162c28ac11f79e76b8387a",
"assets/assets/avatars/max_05.png": "5f86dc1b3ea7055ba96b1060802b2f32",
"assets/assets/characters/episode_a1_01_michael_interview.json": "692b367532ca49a3aef10bb67bca4033",
"assets/assets/characters/episode_a1_01_player_interview.json": "e2db163b11ca65e76cde2f2ca2e80247",
"assets/assets/characters/episode_a1_10_stanley_interview.json": "f7ef05958664a2aba8a8b712370f735f",
"assets/assets/characters/episode_a1_01_pam_interview.json": "f630e165e31fbba084808600b2f7f5ab",
"assets/assets/characters/episode_a1_07_kevin_interview.json": "59421b8844a408d4af791345f51ec44d",
"assets/assets/characters/episode_a1_01_jim_interview.json": "b12605bd133e9b4372f8fbfbca84fb5f",
"assets/assets/characters/episode_a1_01_dwight_interview.json": "52b7e792df0d9af98a3e57a4590036c6",
"assets/assets/characters/episode_a1_07_angela_interview.json": "89ceb4fceb44d035c93bd2afb6050710",
"assets/assets/saludos.png": "bc0aa9f980f5778162585f00badb13d1",
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
