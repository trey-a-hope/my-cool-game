'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "660fe95c2754b79868f224d35744ccb7",
"version.json": "6e1126eaf870afd63b3a264d73014507",
"index.html": "297395e2e1fe7c165e44cd918990b9c5",
"/": "297395e2e1fe7c165e44cd918990b9c5",
"main.dart.js": "cc2e25743e64b2f287b2e4babf460f43",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "cc52cb91f74688170694168791002e54",
"assets/AssetManifest.json": "a51a36f4ced5541ddd2aa70c03d49c50",
"assets/NOTICES": "eef4bf3d3f3e5eb242e1e12eee8b7027",
"assets/FontManifest.json": "de35ea21430cb2e48f9e094e2c3ef6e7",
"assets/AssetManifest.bin.json": "f70502fa79719fdc2089db909c943339",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "d10ac4ee5ebe8c8fff90505150ba2a76",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/iconsax_flutter/fonts/FlutterIconsax.ttf": "83c878235f9c448928034fe5bcba1c8a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "b8914a2c11196f11df3b0acf71c4513d",
"assets/fonts/MaterialIcons-Regular.otf": "8d1f1f0d26a0ac9eb3a8de5d35b32e82",
"assets/assets/images/background/clouds.png": "e28611c48f06851620063cb3452165a7",
"assets/assets/images/background/hills.png": "7f2f0b9328c8207955bcd29bf5128def",
"assets/assets/images/background/sky.png": "2a21a32bc48abe8836f7161f1b2392b4",
"assets/assets/images/background/mountains.png": "14076146d4f8158f9c0462eae8ef659d",
"assets/assets/images/bonfire/4.png": "9c95243716fe3b3d2d13134ad6d884b2",
"assets/assets/images/bonfire/5.png": "3362d524bbab5b91208f8753a202e8ba",
"assets/assets/images/bonfire/2.png": "a9a3266da3af29999caaca206a12c41b",
"assets/assets/images/bonfire/3.png": "7a866e61b2cee851325601b113c29175",
"assets/assets/images/bonfire/1.png": "bd0f2519bd2fed3027dc017f073f721c",
"assets/assets/images/bonfire/0.png": "370a7601108a5d56a7278a2dab900d46",
"assets/assets/images/plant/8.png": "bd28355c5e0a86c2e5caaf2fa59e149b",
"assets/assets/images/plant/9.png": "6cadab557d0d057039cc4bc2e4b63c73",
"assets/assets/images/plant/14.png": "4e459f9e80ed91b2e74c39d251d8de70",
"assets/assets/images/plant/15.png": "b0c8e44b3d93924379e78c64f865a6b2",
"assets/assets/images/plant/17.png": "ef9a547df0c503c2d2ecc656c0c0a50b",
"assets/assets/images/plant/16.png": "b525875f5c4b72ff0c80f6e2f6031bb6",
"assets/assets/images/plant/12.png": "bb963c23346fbaf5c388a4a8ee1992f8",
"assets/assets/images/plant/13.png": "4270ba2f52d66af1b52111550055d75c",
"assets/assets/images/plant/11.png": "ea8f42fdd5107f2efa9ce20c20de3073",
"assets/assets/images/plant/10.png": "1573a17aa7e5a07eec6bf4bfea45b09a",
"assets/assets/images/plant/4.png": "4996eaf35342f7edafe4a7023e793737",
"assets/assets/images/plant/5.png": "4a60f3829013113a76afbfdf137f9d81",
"assets/assets/images/plant/7.png": "e8f0dafc996e60ac2cf5bd851163f47b",
"assets/assets/images/plant/6.png": "074308f8a3385e920ccc7bb6787ad680",
"assets/assets/images/plant/2.png": "35f35d41d6bb8620f1c16287919e094d",
"assets/assets/images/plant/3.png": "ef34fb95c17d3c1b0b22eeacafb06d40",
"assets/assets/images/plant/1.png": "b5152f51bbdc7c696bb2fec544a251a0",
"assets/assets/images/plant/0.png": "bf8bd1d4dcb5c246aaf082c82f79d7a4",
"assets/assets/images/input/y_pressed.png": "38622e82002fd4632325b736d6431bc0",
"assets/assets/images/input/b_unpressed.png": "974a8e36d4324fb083868a9cbc501997",
"assets/assets/images/input/a_unpressed.png": "eeaae9c708c0522bb563119b9db5bc15",
"assets/assets/images/input/left_joystick.png": "85eed59366f87385f3a23e9edef627eb",
"assets/assets/images/input/y_unpressed.png": "9e2b599136638a4d58d6c562bccd7d9d",
"assets/assets/images/input/b_pressed.png": "0a702632b090aea88e6813041a4610b1",
"assets/assets/images/input/x_unpressed.png": "2f8ef4e3ed0d65872b8c4b713be2a8e0",
"assets/assets/images/input/x_pressed.png": "8cbd30172f560ffa8fdd732b3a732842",
"assets/assets/images/input/a_pressed.png": "083f0b8f6d97f7325d2e4d2f9e33cc3c",
"assets/assets/images/headless_horseman/idle/2.png": "6376b5b123df4f6346715c7d9ebfb361",
"assets/assets/images/headless_horseman/idle/3.png": "2abd0028eb510889d3c0be68c0f4d1b5",
"assets/assets/images/headless_horseman/idle/1.png": "2e394fff90204c5ab575ab8f0d337bbc",
"assets/assets/images/headless_horseman/idle/0.png": "144f887d7d35d7f4ea64e9efa1c4d1aa",
"assets/assets/images/headless_horseman/attack/4.png": "89b401688ce8aca42d0d29a3b120b302",
"assets/assets/images/headless_horseman/attack/5.png": "2614de60029c0be16b2bdf5cebda84b5",
"assets/assets/images/headless_horseman/attack/7.png": "e7de870e187984f6b2c1ad0c0245340b",
"assets/assets/images/headless_horseman/attack/6.png": "e0d46d652cdd91a8c0f1cf0ada917411",
"assets/assets/images/headless_horseman/attack/2.png": "9657ec6fd9bfd2fb050309315658197e",
"assets/assets/images/headless_horseman/attack/3.png": "1b00c9294ea830a7b8aa31cfd12ec003",
"assets/assets/images/headless_horseman/attack/1.png": "4dd6669a8ab831c3c393b22b377c7f2c",
"assets/assets/images/headless_horseman/attack/0.png": "f7ba5c27449787b7829f8fe328509e1c",
"assets/assets/images/headless_horseman/death/8.png": "cfe3bc1252dceb7fcf68baf828354000",
"assets/assets/images/headless_horseman/death/9.png": "c6707d5d8026220459dc85d02892840c",
"assets/assets/images/headless_horseman/death/4.png": "f5eebbf7bc3f062fe56ca7bb509898a6",
"assets/assets/images/headless_horseman/death/5.png": "3b89432dc68f9d75706b2aac86f51881",
"assets/assets/images/headless_horseman/death/7.png": "75283dcc0f3f004c6761c3161d230e70",
"assets/assets/images/headless_horseman/death/6.png": "cbad2ed45d5c45c4bd406911a0036280",
"assets/assets/images/headless_horseman/death/2.png": "c2cc173fe83bcd05e1bfb139cfbdfac0",
"assets/assets/images/headless_horseman/death/3.png": "0ffbfb9a9e553c7af1ba19fa6239b4a5",
"assets/assets/images/headless_horseman/death/1.png": "7072d9701a4930c724c351f4815daee7",
"assets/assets/images/headless_horseman/death/0.png": "a4749f7cc1eca31625dc52a5a1494f48",
"assets/assets/images/headless_horseman/hurt/2.png": "37ea3ae5b7348d1dd8d55495701aa6d1",
"assets/assets/images/headless_horseman/hurt/1.png": "f8abeef2ca7422d5a8f02d0c203dac37",
"assets/assets/images/headless_horseman/hurt/0.png": "37ea3ae5b7348d1dd8d55495701aa6d1",
"assets/assets/images/headless_horseman/run/2.png": "b8eebb16f41aaf424e00a09beaf316eb",
"assets/assets/images/headless_horseman/run/3.png": "53292311d022315b2f26c61d2c00f049",
"assets/assets/images/headless_horseman/run/1.png": "3ffb4b9a17260136e00b9bd1a80fa557",
"assets/assets/images/headless_horseman/run/0.png": "ec541a820895e1bb46cd35cf357b8483",
"assets/assets/images/minotaur/idle/4.png": "5a0feeefa496bfbc456d1cb8291b9046",
"assets/assets/images/minotaur/idle/5.png": "f2008e63a5ad0e27b3ef6798c75d99c9",
"assets/assets/images/minotaur/idle/2.png": "828104c5ceaa0d607774d010b2fcbca6",
"assets/assets/images/minotaur/idle/3.png": "3ddc87a002a459b1219a351f24f96ca9",
"assets/assets/images/minotaur/idle/1.png": "651ae168c7bc22f06a3de2f8e9b8816b",
"assets/assets/images/minotaur/idle/0.png": "c0378892a0de69fe6206e38c34dba4ec",
"assets/assets/images/minotaur/walk/4.png": "fe3acf1999e2fb151dbd9913bc6b4f28",
"assets/assets/images/minotaur/walk/5.png": "1de093507c993fa6476e2d670a5a236e",
"assets/assets/images/minotaur/walk/7.png": "3edb544924f46db6a5d9a48cdc47550b",
"assets/assets/images/minotaur/walk/6.png": "0327dc1f7ac747183d8745c41acb1bce",
"assets/assets/images/minotaur/walk/2.png": "0327dc1f7ac747183d8745c41acb1bce",
"assets/assets/images/minotaur/walk/3.png": "1de093507c993fa6476e2d670a5a236e",
"assets/assets/images/minotaur/walk/1.png": "3edb544924f46db6a5d9a48cdc47550b",
"assets/assets/images/minotaur/walk/0.png": "695961db869007a90b28392fde37452d",
"assets/assets/images/minotaur/death/4.png": "a54624eb9d605cd28cdcf8ff52a61e6d",
"assets/assets/images/minotaur/death/5.png": "d0b2a7d27a60e3fbbd72578ee5780c21",
"assets/assets/images/minotaur/death/2.png": "e9030b34785ab78b1e0b83f3867bd9dc",
"assets/assets/images/minotaur/death/3.png": "b43eec7a235410cf19efbea29c6e7546",
"assets/assets/images/minotaur/death/1.png": "b5bb0ffc3ae5765f63f575f82c322b5c",
"assets/assets/images/minotaur/death/0.png": "1c9c6dd84b2331997ef84b4806be2857",
"assets/assets/images/minotaur/hurt/4.png": "912181fe0d138df2ca22dbb981f4798a",
"assets/assets/images/minotaur/hurt/2.png": "b78c707172e330d221a1c416091e359c",
"assets/assets/images/minotaur/hurt/3.png": "f90185d32937426020c05cb422c2d841",
"assets/assets/images/minotaur/hurt/1.png": "2c2de44e06441e7cfcd9e18981efd1ae",
"assets/assets/images/minotaur/hurt/0.png": "912181fe0d138df2ca22dbb981f4798a",
"assets/assets/images/minotaur/attack_two/4.png": "635212ca63e46d9df90ca6480515c72d",
"assets/assets/images/minotaur/attack_two/5.png": "2cf093eda08382fe2f8a93b9525b3323",
"assets/assets/images/minotaur/attack_two/6.png": "32ecf8f465810a05b4462a782140c278",
"assets/assets/images/minotaur/attack_two/2.png": "42357033941c1ef53ddbc474f85301da",
"assets/assets/images/minotaur/attack_two/3.png": "1d19d9c8079d4aa60f2f424190b528a6",
"assets/assets/images/minotaur/attack_two/1.png": "2369e662ce54ad1df4e13c5886ae42db",
"assets/assets/images/minotaur/attack_two/0.png": "ad9c76f6191e0517b80cacd0cb800d33",
"assets/assets/images/minotaur/attack_one/4.png": "487480b7a985a91b2855e179057f031c",
"assets/assets/images/minotaur/attack_one/5.png": "73ab0640b1fcfb1e1fe8777a0e6ad449",
"assets/assets/images/minotaur/attack_one/2.png": "9200a3a087f726aaec2b18a03f6b6371",
"assets/assets/images/minotaur/attack_one/3.png": "dca73bd412b881ac3ae27a0957f676cc",
"assets/assets/images/minotaur/attack_one/1.png": "de9359af5a647a78e2fc50d11338d67e",
"assets/assets/images/minotaur/attack_one/0.png": "32ecf8f465810a05b4462a782140c278",
"assets/assets/images/lizardman/idle/2.png": "4cfc8ec43e684c7a1557e6cbf03704b8",
"assets/assets/images/lizardman/idle/1.png": "2937e70f44494cac813731d0864928bf",
"assets/assets/images/lizardman/idle/0.png": "111b6e3b0122bb759499a0cf3b76c063",
"assets/assets/images/lizardman/attack/4.png": "19ccdc3e71d1bb831927a0116381b11a",
"assets/assets/images/lizardman/attack/5.png": "6dc2b36cc7c2d77ce61d9730205b572f",
"assets/assets/images/lizardman/attack/2.png": "f7336adaa3a60a12e849a9a709ac99c4",
"assets/assets/images/lizardman/attack/3.png": "d8fe1ad1bb40904480c2bffe385bcba4",
"assets/assets/images/lizardman/attack/1.png": "c24ea234ad7c931186f970620044fe69",
"assets/assets/images/lizardman/attack/0.png": "46458c4855014d2e53565b5ad0b48d94",
"assets/assets/images/lizardman/walk/4.png": "db0ee4120a17f568f3332a4386b99df9",
"assets/assets/images/lizardman/walk/5.png": "20d83a2da277d62880bd203ec4517f78",
"assets/assets/images/lizardman/walk/2.png": "1e5acd6c63dac514d9e2fa60783367cf",
"assets/assets/images/lizardman/walk/3.png": "15e2818d07d56ad10389d16c27987251",
"assets/assets/images/lizardman/walk/1.png": "72baa2e863f8f65a2eea168cfcc06c8f",
"assets/assets/images/lizardman/walk/0.png": "079bb997fa63cbc94fef69da4226d4ce",
"assets/assets/images/lizardman/death/4.png": "bb7354db6a2d58cc63ee4fade79efcbb",
"assets/assets/images/lizardman/death/5.png": "6951247c7babd15d7b95309995a88fdb",
"assets/assets/images/lizardman/death/2.png": "87a6be9d7adebae542e4d32cb9f8f6e9",
"assets/assets/images/lizardman/death/3.png": "75160b7584f08b7949c52283e59e5c1b",
"assets/assets/images/lizardman/death/1.png": "6a76c61e467dbf6f1649955556df8d0b",
"assets/assets/images/lizardman/death/0.png": "d446725e08bc8d38632c9fb3479fa633",
"assets/assets/images/lizardman/hurt/2.png": "d446725e08bc8d38632c9fb3479fa633",
"assets/assets/images/lizardman/hurt/1.png": "fbe4b9c3fc773a3a3bad927d8afd82df",
"assets/assets/images/lizardman/hurt/0.png": "d446725e08bc8d38632c9fb3479fa633",
"assets/assets/images/alchemist/4.png": "c41b409f6d327081a9497559d08597e3",
"assets/assets/images/alchemist/5.png": "0d8aaeb9a085776ae72b4aacf7553e79",
"assets/assets/images/alchemist/7.png": "ba32b0830478d69e4f2dd0062d1e9588",
"assets/assets/images/alchemist/6.png": "940e2ce4e72d9c7e14f9c9d1f78d08a5",
"assets/assets/images/alchemist/2.png": "05a6526fd86e1eafef91aad7147d7b3c",
"assets/assets/images/alchemist/3.png": "1759b312c18648515b69a8f9df9d133d",
"assets/assets/images/alchemist/1.png": "66f6a39ca6998703743bcd390a84ce24",
"assets/assets/images/alchemist/0.png": "c4baa874c67835db528d0e7a332e37e3",
"assets/assets/images/coin/2.png": "f9a68e8303de5762db24c75347fc2acd",
"assets/assets/images/coin/3.png": "7acb42d99a2cf42a594d4778ca6f2007",
"assets/assets/images/coin/1.png": "8b41561858a6eddf29cd0f2b94c8bae1",
"assets/assets/images/coin/0.png": "9b6e8add7d8604450642c21b006921f1",
"assets/assets/images/blacksmith/4.png": "96f2fa9d83166a45ed21763e7260fb4a",
"assets/assets/images/blacksmith/5.png": "594ba60b07ada5c8339d09d002183f5e",
"assets/assets/images/blacksmith/6.png": "cf4b48821d23d6d973bf6374fcd1fc0b",
"assets/assets/images/blacksmith/2.png": "b4aad827bfb46d55d6650998824b607a",
"assets/assets/images/blacksmith/3.png": "826ac8dc4dcdf19755c73480b7f1aacb",
"assets/assets/images/blacksmith/1.png": "f5fe52445520ec98f4a7e5df478f7ea7",
"assets/assets/images/blacksmith/0.png": "f9409141a4af67ea41f59872c298cd22",
"assets/assets/images/item/potion.png": "02b9d577dd091a1a34778fb311c821e8",
"assets/assets/images/item/gem.png": "4a4110e3f202be152898b45dae56007d",
"assets/assets/images/item/charcoal.png": "bf10a2f76bbf2947c55e232bda26523c",
"assets/assets/images/item/coin.png": "7a11863313280fdb3f6d421991d4bc1b",
"assets/assets/images/item/elixer.png": "77f93d26644481aa209cf13820af7b70",
"assets/assets/images/chest/8.png": "d29b955b3f7ae5f07999f7387db3eee2",
"assets/assets/images/chest/9.png": "d29b955b3f7ae5f07999f7387db3eee2",
"assets/assets/images/chest/4.png": "23c20c841118a7ee26fadb7e583c33d7",
"assets/assets/images/chest/5.png": "da56009b15a06f66ebcebf9c66fd8b8c",
"assets/assets/images/chest/7.png": "dcf57489368ff9156de2e9143c73c0de",
"assets/assets/images/chest/6.png": "fb0f5945094a236a4d7cd389e2d62b1c",
"assets/assets/images/chest/2.png": "0e8d9671348d74cc15d56ce97b1c5f0d",
"assets/assets/images/chest/3.png": "98225018f78586a0b56d8f9b99a6b4d0",
"assets/assets/images/chest/1.png": "f18468c31883857a17d206286cff3e7b",
"assets/assets/images/chest/0.png": "e639699872dba206c67cd20d6a988c6d",
"assets/assets/images/map.json": "a9d6bca0a5c70fe993c799bc4aef146a",
"assets/assets/images/potion/4.png": "6b78cf3c0c512bc054838cb98deb11b6",
"assets/assets/images/potion/5.png": "6bcd4c0bcf47b975ad80d71d2f418534",
"assets/assets/images/potion/7.png": "e50b1e50ec7b676dfab2fdd87b1780dc",
"assets/assets/images/potion/6.png": "b4b65c3ee6e83eb57a18bcf0de0c33b3",
"assets/assets/images/potion/2.png": "4d90ec93e17f4ff397af712a55e27306",
"assets/assets/images/potion/3.png": "f53a53673bb103db821b26472ea3cdd6",
"assets/assets/images/potion/1.png": "a5932396360158dbcb2fd98e24854ca4",
"assets/assets/images/potion/0.png": "1ba070fcd58b9cdf01a50e80d0758921",
"assets/assets/images/world_object/4.png": "ef250e296517c9fdf919851ceb1d8711",
"assets/assets/images/world_object/5.png": "4732badf12f3fbb6e887f83d92362b5b",
"assets/assets/images/world_object/2.png": "cf8c93e3a7f2b47188c497fce0a7f009",
"assets/assets/images/world_object/3.png": "96b4ff27bffccba879877c8c2a0a425e",
"assets/assets/images/world_object/1.png": "c98b1bd680aef01de73d648c4638f531",
"assets/assets/images/world_object/0.png": "6b420beb8c46d490e88bd970f0d2a4e7",
"assets/assets/images/dwarf_warrior/idle/2.png": "937eaf9df9b788047cb0b7659c49c2d3",
"assets/assets/images/dwarf_warrior/idle/1.png": "b4d1ad2255956dc9197635bf3fbfef8a",
"assets/assets/images/dwarf_warrior/idle/0.png": "9cfe231b3bb7f043c21fc3804191a53d",
"assets/assets/images/dwarf_warrior/attack/4.png": "d6effaf33a7e66dd62a24bb15a23d6aa",
"assets/assets/images/dwarf_warrior/attack/5.png": "b4125492f34491de05d86d77e40c59c0",
"assets/assets/images/dwarf_warrior/attack/2.png": "30be14f0d8080c8992aea19ec9a08938",
"assets/assets/images/dwarf_warrior/attack/3.png": "5c291733770ad46a772d3ebf48017209",
"assets/assets/images/dwarf_warrior/attack/1.png": "7e2b885bfd17d27d42744f761b756b3c",
"assets/assets/images/dwarf_warrior/attack/0.png": "9efe32285de6b86c8425f770abb17925",
"assets/assets/images/dwarf_warrior/walk/4.png": "17395fbb5f13f003bc73db25b4607335",
"assets/assets/images/dwarf_warrior/walk/5.png": "1391d39768df8a4e662f8ac8f93027be",
"assets/assets/images/dwarf_warrior/walk/2.png": "72bbb7215af2944b8eb375d6a13443fd",
"assets/assets/images/dwarf_warrior/walk/3.png": "5cb2846a6128d924fbe9439df879162b",
"assets/assets/images/dwarf_warrior/walk/1.png": "bf9cbc35306d4b26b4c5379fd8d5ff4e",
"assets/assets/images/dwarf_warrior/walk/0.png": "d9c1228c50cef9231be28b3dd9240ea0",
"assets/assets/images/dwarf_warrior/death/4.png": "b6bb3b8e713afbcba847aa71f6a153f3",
"assets/assets/images/dwarf_warrior/death/5.png": "b6bb3b8e713afbcba847aa71f6a153f3",
"assets/assets/images/dwarf_warrior/death/2.png": "91391b89b70aa91309b94a87d8843500",
"assets/assets/images/dwarf_warrior/death/3.png": "b6bb3b8e713afbcba847aa71f6a153f3",
"assets/assets/images/dwarf_warrior/death/1.png": "9a8d7ced238696dbf0eb1ad790c6f354",
"assets/assets/images/dwarf_warrior/death/0.png": "f06d9269128750cfe592fba5dea9138e",
"assets/assets/images/dwarf_warrior/hurt/2.png": "5e86b8d4eb8b268d64fef0c4f61e9f69",
"assets/assets/images/dwarf_warrior/hurt/1.png": "352fe614d5311c901bbefb52a7e20b5f",
"assets/assets/images/dwarf_warrior/hurt/0.png": "5e86b8d4eb8b268d64fef0c4f61e9f69",
"assets/assets/images/spritesheet.png": "b0599f4e614203f22fe11a699f6f62f4",
"assets/assets/images/gem/2.png": "60f258b1fcdd3b6685aa97e477a86883",
"assets/assets/images/gem/3.png": "30cae90ddb8f3c2c3762f6e6f40c4f02",
"assets/assets/images/gem/1.png": "bfa2d09c33c386db5621af9f5bc6216c",
"assets/assets/images/gem/0.png": "c604ed9d05265e7ae230029b983b13c9",
"assets/assets/lotties/game_over.json": "ba3b0ca104621ae8eafa4861972f1b94",
"assets/assets/lotties/game_won.json": "7297b9962631b3ad1a2845c305b2cb52",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
