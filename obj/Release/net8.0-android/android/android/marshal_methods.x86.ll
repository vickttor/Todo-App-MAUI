; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [111 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [222 x i32] [
	i32 42639949, ; 0: System.Threading.Thread => 0x28aa24d => 103
	i32 53857724, ; 1: ca/Microsoft.Maui.Controls.resources => 0x335cdbc => 1
	i32 72070932, ; 2: Microsoft.Maui.Graphics.dll => 0x44bb714 => 48
	i32 113429830, ; 3: zh-HK/Microsoft.Maui.Controls.resources => 0x6c2cd46 => 31
	i32 117431740, ; 4: System.Runtime.InteropServices => 0x6ffddbc => 98
	i32 165246403, ; 5: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 53
	i32 182336117, ; 6: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 71
	i32 195452805, ; 7: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 8: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 9: System.ComponentModel => 0xc38ff48 => 83
	i32 280992041, ; 10: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 318968648, ; 11: Xamarin.AndroidX.Activity.dll => 0x13031348 => 49
	i32 336156722, ; 12: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 13: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 60
	i32 356389973, ; 14: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 357576608, ; 15: cs/Microsoft.Maui.Controls.resources => 0x15502fa0 => 2
	i32 379916513, ; 16: System.Threading.Thread.dll => 0x16a510e1 => 103
	i32 385762202, ; 17: System.Memory.dll => 0x16fe439a => 90
	i32 395744057, ; 18: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 19: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 20: System.Collections => 0x1a61054f => 80
	i32 450948140, ; 21: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 59
	i32 469710990, ; 22: System.dll => 0x1bff388e => 106
	i32 498788369, ; 23: System.ObjectModel => 0x1dbae811 => 95
	i32 500358224, ; 24: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 25: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 26: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 43
	i32 527168573, ; 27: hi/Microsoft.Maui.Controls.resources => 0x1f6bf43d => 10
	i32 539058512, ; 28: Microsoft.Extensions.Logging => 0x20216150 => 40
	i32 592146354, ; 29: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 627609679, ; 30: Xamarin.AndroidX.CustomView => 0x2568904f => 57
	i32 672442732, ; 31: System.Collections.Concurrent => 0x2814a96c => 78
	i32 688181140, ; 32: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 706645707, ; 33: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 34: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 35: System.Runtime.Loader.dll => 0x2b15ed29 => 99
	i32 759454413, ; 36: System.Net.Requests => 0x2d445acd => 93
	i32 775507847, ; 37: System.IO.Compression => 0x2e394f87 => 87
	i32 789151979, ; 38: Microsoft.Extensions.Options => 0x2f0980eb => 42
	i32 823281589, ; 39: System.Private.Uri.dll => 0x311247b5 => 96
	i32 830298997, ; 40: System.IO.Compression.Brotli => 0x317d5b75 => 86
	i32 870878177, ; 41: ar/Microsoft.Maui.Controls.resources => 0x33e88be1 => 0
	i32 904024072, ; 42: System.ComponentModel.Primitives.dll => 0x35e25008 => 81
	i32 926902833, ; 43: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 967690846, ; 44: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 60
	i32 992768348, ; 45: System.Collections.dll => 0x3b2c715c => 80
	i32 993161700, ; 46: zh-Hans/Microsoft.Maui.Controls.resources => 0x3b3271e4 => 32
	i32 994547685, ; 47: es/Microsoft.Maui.Controls.resources => 0x3b4797e5 => 6
	i32 1012816738, ; 48: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 70
	i32 1028951442, ; 49: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 39
	i32 1029334545, ; 50: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 51: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 50
	i32 1044663988, ; 52: System.Linq.Expressions.dll => 0x3e444eb4 => 88
	i32 1052210849, ; 53: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 62
	i32 1082857460, ; 54: System.ComponentModel.TypeConverter => 0x408b17f4 => 82
	i32 1084122840, ; 55: Xamarin.Kotlin.StdLib => 0x409e66d8 => 75
	i32 1098259244, ; 56: System => 0x41761b2c => 106
	i32 1178241025, ; 57: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 67
	i32 1178797549, ; 58: fi/Microsoft.Maui.Controls.resources => 0x464305ed => 7
	i32 1203215381, ; 59: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1214827643, ; 60: CommunityToolkit.Mvvm => 0x4868cc7b => 35
	i32 1234928153, ; 61: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1293217323, ; 62: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 58
	i32 1324164729, ; 63: System.Linq => 0x4eed2679 => 89
	i32 1376866003, ; 64: Xamarin.AndroidX.SavedState => 0x52114ed3 => 70
	i32 1406073936, ; 65: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 54
	i32 1462112819, ; 66: System.IO.Compression.dll => 0x57261233 => 87
	i32 1469204771, ; 67: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 51
	i32 1470490898, ; 68: Microsoft.Extensions.Primitives => 0x57a5e912 => 43
	i32 1480492111, ; 69: System.IO.Compression.Brotli.dll => 0x583e844f => 86
	i32 1493001747, ; 70: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 71: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 72: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 102
	i32 1551623176, ; 73: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1554499916, ; 74: maui.dll => 0x5ca7c94c => 77
	i32 1554762148, ; 75: fr/Microsoft.Maui.Controls.resources => 0x5cabc9a4 => 8
	i32 1580413037, ; 76: sv/Microsoft.Maui.Controls.resources => 0x5e33306d => 26
	i32 1591080825, ; 77: zh-Hant/Microsoft.Maui.Controls.resources => 0x5ed5f779 => 33
	i32 1622152042, ; 78: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 64
	i32 1624863272, ; 79: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 73
	i32 1636350590, ; 80: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 56
	i32 1639515021, ; 81: System.Net.Http.dll => 0x61b9038d => 91
	i32 1639986890, ; 82: System.Text.RegularExpressions => 0x61c036ca => 102
	i32 1657153582, ; 83: System.Runtime => 0x62c6282e => 100
	i32 1658251792, ; 84: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 74
	i32 1677501392, ; 85: System.Net.Primitives.dll => 0x63fca3d0 => 92
	i32 1679769178, ; 86: System.Security.Cryptography => 0x641f3e5a => 101
	i32 1729485958, ; 87: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 52
	i32 1736233607, ; 88: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1766324549, ; 89: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 71
	i32 1770582343, ; 90: Microsoft.Extensions.Logging.dll => 0x6988f147 => 40
	i32 1780572499, ; 91: Mono.Android.Runtime.dll => 0x6a216153 => 109
	i32 1788241197, ; 92: Xamarin.AndroidX.Fragment => 0x6a96652d => 59
	i32 1808609942, ; 93: Xamarin.AndroidX.Loader => 0x6bcd3296 => 64
	i32 1809966115, ; 94: nb/Microsoft.Maui.Controls.resources => 0x6be1e423 => 18
	i32 1813058853, ; 95: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 75
	i32 1813201214, ; 96: Xamarin.Google.Android.Material => 0x6c13413e => 74
	i32 1818569960, ; 97: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 68
	i32 1821794637, ; 98: hu/Microsoft.Maui.Controls.resources => 0x6c96614d => 12
	i32 1828688058, ; 99: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 41
	i32 1842015223, ; 100: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1858542181, ; 101: System.Linq.Expressions => 0x6ec71a65 => 88
	i32 1910275211, ; 102: System.Collections.NonGeneric.dll => 0x71dc7c8b => 79
	i32 1960264639, ; 103: ja/Microsoft.Maui.Controls.resources => 0x74d743bf => 15
	i32 1968388702, ; 104: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 36
	i32 2014344398, ; 105: hr/Microsoft.Maui.Controls.resources => 0x781074ce => 11
	i32 2019465201, ; 106: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 62
	i32 2025202353, ; 107: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2043674646, ; 108: it/Microsoft.Maui.Controls.resources => 0x79d00016 => 14
	i32 2045470958, ; 109: System.Private.Xml => 0x79eb68ee => 97
	i32 2055257422, ; 110: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 61
	i32 2079903147, ; 111: System.Runtime.dll => 0x7bf8cdab => 100
	i32 2090596640, ; 112: System.Numerics.Vectors => 0x7c9bf920 => 94
	i32 2127167465, ; 113: System.Console => 0x7ec9ffe9 => 84
	i32 2150663486, ; 114: ko/Microsoft.Maui.Controls.resources => 0x8030853e => 16
	i32 2159891885, ; 115: Microsoft.Maui => 0x80bd55ad => 46
	i32 2165051842, ; 116: ro/Microsoft.Maui.Controls.resources => 0x810c11c2 => 23
	i32 2181898931, ; 117: Microsoft.Extensions.Options.dll => 0x820d22b3 => 42
	i32 2192057212, ; 118: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 41
	i32 2193016926, ; 119: System.ObjectModel.dll => 0x82b6c85e => 95
	i32 2201107256, ; 120: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 76
	i32 2201231467, ; 121: System.Net.Http => 0x8334206b => 91
	i32 2266799131, ; 122: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 37
	i32 2270573516, ; 123: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 124: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 69
	i32 2289298199, ; 125: th/Microsoft.Maui.Controls.resources => 0x8873eb17 => 27
	i32 2305521784, ; 126: System.Private.CoreLib.dll => 0x896b7878 => 107
	i32 2353062107, ; 127: System.Net.Primitives => 0x8c40e0db => 92
	i32 2368005991, ; 128: System.Xml.ReaderWriter.dll => 0x8d24e767 => 105
	i32 2369760409, ; 129: tr/Microsoft.Maui.Controls.resources => 0x8d3fac99 => 28
	i32 2371007202, ; 130: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 36
	i32 2421992093, ; 131: nl/Microsoft.Maui.Controls.resources => 0x905caa9d => 19
	i32 2435356389, ; 132: System.Console.dll => 0x912896e5 => 84
	i32 2475788418, ; 133: Java.Interop.dll => 0x93918882 => 108
	i32 2480646305, ; 134: Microsoft.Maui.Controls => 0x93dba8a1 => 44
	i32 2520433370, ; 135: sk/Microsoft.Maui.Controls.resources => 0x963ac2da => 25
	i32 2605712449, ; 136: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 76
	i32 2617129537, ; 137: System.Private.Xml.dll => 0x9bfe3a41 => 97
	i32 2620871830, ; 138: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 56
	i32 2663698177, ; 139: System.Runtime.Loader => 0x9ec4cf01 => 99
	i32 2732626843, ; 140: Xamarin.AndroidX.Activity => 0xa2e0939b => 49
	i32 2737747696, ; 141: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 51
	i32 2758225723, ; 142: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 45
	i32 2764765095, ; 143: Microsoft.Maui.dll => 0xa4caf7a7 => 46
	i32 2778768386, ; 144: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 72
	i32 2801831435, ; 145: Microsoft.Maui.Graphics => 0xa7008e0b => 48
	i32 2802068195, ; 146: uk/Microsoft.Maui.Controls.resources => 0xa7042ae3 => 29
	i32 2806116107, ; 147: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 148: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 54
	i32 2831556043, ; 149: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 150: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 72
	i32 2857259519, ; 151: el/Microsoft.Maui.Controls.resources => 0xaa4e51ff => 5
	i32 2861189240, ; 152: Microsoft.Maui.Essentials => 0xaa8a4878 => 47
	i32 2883495834, ; 153: ru/Microsoft.Maui.Controls.resources => 0xabdea79a => 24
	i32 2909740682, ; 154: System.Private.CoreLib => 0xad6f1e8a => 107
	i32 2916838712, ; 155: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 73
	i32 2919462931, ; 156: System.Numerics.Vectors.dll => 0xae037813 => 94
	i32 2959614098, ; 157: System.ComponentModel.dll => 0xb0682092 => 83
	i32 2978675010, ; 158: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 58
	i32 3038032645, ; 159: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 160: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 65
	i32 3059408633, ; 161: Mono.Android.Runtime => 0xb65adef9 => 109
	i32 3059793426, ; 162: System.ComponentModel.Primitives => 0xb660be12 => 81
	i32 3077302341, ; 163: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3178803400, ; 164: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 66
	i32 3203226944, ; 165: maui => 0xbeed5d40 => 77
	i32 3220365878, ; 166: System.Threading => 0xbff2e236 => 104
	i32 3258312781, ; 167: Xamarin.AndroidX.CardView => 0xc235e84d => 52
	i32 3316684772, ; 168: System.Net.Requests.dll => 0xc5b097e4 => 93
	i32 3317135071, ; 169: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 57
	i32 3346324047, ; 170: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 67
	i32 3362522851, ; 171: Xamarin.AndroidX.Core => 0xc86c06e3 => 55
	i32 3366347497, ; 172: Java.Interop => 0xc8a662e9 => 108
	i32 3374999561, ; 173: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 69
	i32 3428513518, ; 174: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 38
	i32 3463511458, ; 175: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 176: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 82
	i32 3476120550, ; 177: Mono.Android => 0xcf3163e6 => 110
	i32 3479583265, ; 178: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3542658132, ; 179: vi/Microsoft.Maui.Controls.resources => 0xd328ac54 => 30
	i32 3596930546, ; 180: de/Microsoft.Maui.Controls.resources => 0xd664cdf2 => 4
	i32 3608519521, ; 181: System.Linq.dll => 0xd715a361 => 89
	i32 3623444314, ; 182: da/Microsoft.Maui.Controls.resources => 0xd7f95f5a => 3
	i32 3641597786, ; 183: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 61
	i32 3643854240, ; 184: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 66
	i32 3647796983, ; 185: pt-BR/Microsoft.Maui.Controls.resources => 0xd96cf6f7 => 21
	i32 3657292374, ; 186: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 37
	i32 3662115805, ; 187: he/Microsoft.Maui.Controls.resources => 0xda4773dd => 9
	i32 3672681054, ; 188: Mono.Android.dll => 0xdae8aa5e => 110
	i32 3686075795, ; 189: ms/Microsoft.Maui.Controls.resources => 0xdbb50d93 => 17
	i32 3697841164, ; 190: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 191: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 65
	i32 3748608112, ; 192: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 85
	i32 3786282454, ; 193: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 53
	i32 3792276235, ; 194: System.Collections.NonGeneric => 0xe2098b0b => 79
	i32 3823082795, ; 195: System.Security.Cryptography.dll => 0xe3df9d2b => 101
	i32 3841636137, ; 196: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 39
	i32 3849253459, ; 197: System.Runtime.InteropServices.dll => 0xe56ef253 => 98
	i32 3889960447, ; 198: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 199: System.Collections.Concurrent.dll => 0xe839deed => 78
	i32 3896760992, ; 200: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 55
	i32 3928044579, ; 201: System.Xml.ReaderWriter => 0xea213423 => 105
	i32 3931092270, ; 202: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 68
	i32 3955647286, ; 203: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 50
	i32 3980434154, ; 204: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 205: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 206: System.Memory => 0xeff49a63 => 90
	i32 4046471985, ; 207: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 45
	i32 4070331268, ; 208: id/Microsoft.Maui.Controls.resources => 0xf29c5384 => 13
	i32 4073602200, ; 209: System.Threading.dll => 0xf2ce3c98 => 104
	i32 4094352644, ; 210: Microsoft.Maui.Essentials.dll => 0xf40add04 => 47
	i32 4100113165, ; 211: System.Private.Uri => 0xf462c30d => 96
	i32 4102112229, ; 212: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4119206479, ; 213: pl/Microsoft.Maui.Controls.resources => 0xf5861a4f => 20
	i32 4125707920, ; 214: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 215: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 38
	i32 4182413190, ; 216: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 63
	i32 4213026141, ; 217: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 85
	i32 4234116406, ; 218: pt/Microsoft.Maui.Controls.resources => 0xfc5f7d36 => 22
	i32 4271975918, ; 219: Microsoft.Maui.Controls.dll => 0xfea12dee => 44
	i32 4274623895, ; 220: CommunityToolkit.Mvvm.dll => 0xfec99597 => 35
	i32 4292120959 ; 221: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 63
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [222 x i32] [
	i32 103, ; 0
	i32 1, ; 1
	i32 48, ; 2
	i32 31, ; 3
	i32 98, ; 4
	i32 53, ; 5
	i32 71, ; 6
	i32 30, ; 7
	i32 31, ; 8
	i32 83, ; 9
	i32 2, ; 10
	i32 49, ; 11
	i32 15, ; 12
	i32 60, ; 13
	i32 14, ; 14
	i32 2, ; 15
	i32 103, ; 16
	i32 90, ; 17
	i32 34, ; 18
	i32 26, ; 19
	i32 80, ; 20
	i32 59, ; 21
	i32 106, ; 22
	i32 95, ; 23
	i32 13, ; 24
	i32 7, ; 25
	i32 43, ; 26
	i32 10, ; 27
	i32 40, ; 28
	i32 21, ; 29
	i32 57, ; 30
	i32 78, ; 31
	i32 1, ; 32
	i32 16, ; 33
	i32 4, ; 34
	i32 99, ; 35
	i32 93, ; 36
	i32 87, ; 37
	i32 42, ; 38
	i32 96, ; 39
	i32 86, ; 40
	i32 0, ; 41
	i32 81, ; 42
	i32 28, ; 43
	i32 60, ; 44
	i32 80, ; 45
	i32 32, ; 46
	i32 6, ; 47
	i32 70, ; 48
	i32 39, ; 49
	i32 3, ; 50
	i32 50, ; 51
	i32 88, ; 52
	i32 62, ; 53
	i32 82, ; 54
	i32 75, ; 55
	i32 106, ; 56
	i32 67, ; 57
	i32 7, ; 58
	i32 20, ; 59
	i32 35, ; 60
	i32 18, ; 61
	i32 58, ; 62
	i32 89, ; 63
	i32 70, ; 64
	i32 54, ; 65
	i32 87, ; 66
	i32 51, ; 67
	i32 43, ; 68
	i32 86, ; 69
	i32 10, ; 70
	i32 5, ; 71
	i32 102, ; 72
	i32 25, ; 73
	i32 77, ; 74
	i32 8, ; 75
	i32 26, ; 76
	i32 33, ; 77
	i32 64, ; 78
	i32 73, ; 79
	i32 56, ; 80
	i32 91, ; 81
	i32 102, ; 82
	i32 100, ; 83
	i32 74, ; 84
	i32 92, ; 85
	i32 101, ; 86
	i32 52, ; 87
	i32 23, ; 88
	i32 71, ; 89
	i32 40, ; 90
	i32 109, ; 91
	i32 59, ; 92
	i32 64, ; 93
	i32 18, ; 94
	i32 75, ; 95
	i32 74, ; 96
	i32 68, ; 97
	i32 12, ; 98
	i32 41, ; 99
	i32 29, ; 100
	i32 88, ; 101
	i32 79, ; 102
	i32 15, ; 103
	i32 36, ; 104
	i32 11, ; 105
	i32 62, ; 106
	i32 0, ; 107
	i32 14, ; 108
	i32 97, ; 109
	i32 61, ; 110
	i32 100, ; 111
	i32 94, ; 112
	i32 84, ; 113
	i32 16, ; 114
	i32 46, ; 115
	i32 23, ; 116
	i32 42, ; 117
	i32 41, ; 118
	i32 95, ; 119
	i32 76, ; 120
	i32 91, ; 121
	i32 37, ; 122
	i32 8, ; 123
	i32 69, ; 124
	i32 27, ; 125
	i32 107, ; 126
	i32 92, ; 127
	i32 105, ; 128
	i32 28, ; 129
	i32 36, ; 130
	i32 19, ; 131
	i32 84, ; 132
	i32 108, ; 133
	i32 44, ; 134
	i32 25, ; 135
	i32 76, ; 136
	i32 97, ; 137
	i32 56, ; 138
	i32 99, ; 139
	i32 49, ; 140
	i32 51, ; 141
	i32 45, ; 142
	i32 46, ; 143
	i32 72, ; 144
	i32 48, ; 145
	i32 29, ; 146
	i32 6, ; 147
	i32 54, ; 148
	i32 19, ; 149
	i32 72, ; 150
	i32 5, ; 151
	i32 47, ; 152
	i32 24, ; 153
	i32 107, ; 154
	i32 73, ; 155
	i32 94, ; 156
	i32 83, ; 157
	i32 58, ; 158
	i32 34, ; 159
	i32 65, ; 160
	i32 109, ; 161
	i32 81, ; 162
	i32 12, ; 163
	i32 66, ; 164
	i32 77, ; 165
	i32 104, ; 166
	i32 52, ; 167
	i32 93, ; 168
	i32 57, ; 169
	i32 67, ; 170
	i32 55, ; 171
	i32 108, ; 172
	i32 69, ; 173
	i32 38, ; 174
	i32 11, ; 175
	i32 82, ; 176
	i32 110, ; 177
	i32 24, ; 178
	i32 30, ; 179
	i32 4, ; 180
	i32 89, ; 181
	i32 3, ; 182
	i32 61, ; 183
	i32 66, ; 184
	i32 21, ; 185
	i32 37, ; 186
	i32 9, ; 187
	i32 110, ; 188
	i32 17, ; 189
	i32 33, ; 190
	i32 65, ; 191
	i32 85, ; 192
	i32 53, ; 193
	i32 79, ; 194
	i32 101, ; 195
	i32 39, ; 196
	i32 98, ; 197
	i32 32, ; 198
	i32 78, ; 199
	i32 55, ; 200
	i32 105, ; 201
	i32 68, ; 202
	i32 50, ; 203
	i32 27, ; 204
	i32 9, ; 205
	i32 90, ; 206
	i32 45, ; 207
	i32 13, ; 208
	i32 104, ; 209
	i32 47, ; 210
	i32 96, ; 211
	i32 22, ; 212
	i32 20, ; 213
	i32 17, ; 214
	i32 38, ; 215
	i32 63, ; 216
	i32 85, ; 217
	i32 22, ; 218
	i32 44, ; 219
	i32 35, ; 220
	i32 63 ; 221
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 45bb7f365f1587a7786d5bbbf0daec075d5aabea"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
