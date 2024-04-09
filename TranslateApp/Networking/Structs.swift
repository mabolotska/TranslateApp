//
//  Structs.swift
//  TranslateApp
//
//  Created by Maryna Bolotska on 08/04/24.
//

import Foundation
struct Trans: Codable {
   let sourceLanguage, sourceText, destinationLanguage, destinationText: String?
    let pronunciation: Pronunciation?
//    let translations: Translations?
//    let definitions, seeAlso: JSONNull?

    enum CodingKeys: String, CodingKey {
        case sourceLanguage = "source-language"
        case sourceText = "source-text"
        case destinationLanguage = "destination-language"
        case destinationText = "destination-text"
        case pronunciation
        //, translations, definitions
//        case seeAlso = "see-also"
    }
   
}

// MARK: - Pronunciation
struct Pronunciation: Codable {
  //  let sourceTextPhonetic: JSONNull?
    let sourceTextAudio, destinationTextAudio: String?

    enum CodingKeys: String, CodingKey {
  //      case sourceTextPhonetic = "source-text-phonetic"
        case sourceTextAudio = "source-text-audio"
        case destinationTextAudio = "destination-text-audio"
    }
}
//
//// MARK: - Translations
//struct Translations: Codable {
//    let allTranslations: JSONNull?
//    let possibleTranslations: [String]?
//    let possibleMistakes: JSONNull?
//
//    enum CodingKeys: String, CodingKey {
//        case allTranslations = "all-translations"
//        case possibleTranslations = "possible-translations"
//        case possibleMistakes = "possible-mistakes"
//    }
//}

//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}


//enum Language: String, Codable, CaseIterable {
//    case af = "afrikaans"
//    case sq = "albanian"
//    case am = "amharic"
//    case ar = "arabic"
//    case hy = "armenian"
//    case az = "azerbaijani"
//    case eu = "basque"
//    case be = "belarusian"
//    case bn = "bengali"
//    case bs = "bosnian"
//    case bg = "bulgarian"
//    case ca = "catalan"
//    case ceb = "cebuano"
//    case ny = "chichewa"
//    case zh_cn = "chinese (simplified)"
//    case zh_tw = "chinese (traditional)"
//    case co = "corsican"
//    case hr = "croatian"
//    case cs = "czech"
//    case da = "danish"
//    case nl = "dutch"
//    case en = "english"
//    case eo = "esperanto"
//    case et = "estonian"
//    case tl = "filipino"
//    case fi = "finnish"
//    case fr = "french"
//    case fy = "frisian"
//    case gl = "galician"
//    case ka = "georgian"
//    case de = "german"
//    case el = "greek"
//    case gu = "gujarati"
//    case ht = "haitian creole"
//    case ha = "hausa"
//    case haw = "hawaiian"
//    case iw = "hebrew"
// //   case he = "hebrew"
//    case hi = "hindi"
//    case hmn = "hmong"
//    case hu = "hungarian"
////    case is = "icelandic"
//    case ig = "igbo"
//    case id = "indonesian"
//    case ga = "irish"
//    case it = "italian"
//    case ja = "japanese"
//    case jw = "javanese"
//    case kn = "kannada"
//    case kk = "kazakh"
//    case km = "khmer"
//    case ko = "korean"
//    case ku = "kurdish (kurmanji)"
//    case ky = "kyrgyz"
//    case lo = "lao"
//    case la = "latin"
//    case lv = "latvian"
//    case lt = "lithuanian"
//    case lb = "luxembourgish"
//    case mk = "macedonian"
//    case mg = "malagasy"
//    case ms = "malay"
//    case ml = "malayalam"
//    case mt = "maltese"
//    case mi = "maori"
//    case mr = "marathi"
//    case mn = "mongolian"
//    case my = "myanmar (burmese)"
//    case ne = "nepali"
//    case no = "norwegian"
//    case or = "odia"
//    case ps = "pashto"
//    case fa = "persian"
//    case pl = "polish"
//    case pt = "portuguese"
//    case pa = "punjabi"
//    case ro = "romanian"
//    case ru = "russian"
//    case sm = "samoan"
//    case gd = "scots gaelic"
//    case sr = "serbian"
//    case st = "sesotho"
//    case sn = "shona"
//    case sd = "sindhi"
//    case si = "sinhala"
//    case sk = "slovak"
//    case sl = "slovenian"
//    case so = "somali"
//    case es = "spanish"
//    case su = "sundanese"
//    case sw = "swahili"
//    case sv = "swedish"
//    case tg = "tajik"
//    case ta = "tamil"
//    case te = "telugu"
//    case th = "thai"
//    case tr = "turkish"
//    case uk = "ukrainian"
//    case ur = "urdu"
//    case ug = "uyghur"
//    case uz = "uzbek"
//    case vi = "vietnamese"
//    case cy = "welsh"
//    case xh = "xhosa"
//    case yi = "yiddish"
//    case yo = "yoruba"
//    case zu = "zulu"
//
//}


struct Language: Codable {
    let code: String
    let name: String
    
    static var dictionary: [String: String] = [
        "af": "afrikaans",
        "sq": "albanian",
        "am": "amharic",
        "ar": "arabic",
        "hy": "armenian",
        "az": "azerbaijani",
        "eu": "basque",
        "be": "belarusian",
        "bn": "bengali",
        "bs": "bosnian",
        "bg": "bulgarian",
        "ca": "catalan",
        "ceb": "cebuano",
        "ny": "chichewa",
        "zh_cn": "chinese (simplified)",
        "zh_tw": "chinese (traditional)",
        "co": "corsican",
        "hr": "croatian",
        "cs": "czech",
        "da": "danish",
        "nl": "dutch",
        "en": "english",
        "eo": "esperanto",
        "et": "estonian",
        "tl": "filipino",
        "fi": "finnish",
        "fr": "french",
        "fy": "frisian",
        "gl": "galician",
        "ka": "georgian",
        "de": "german",
        "el": "greek",
        "gu": "gujarati",
        "ht": "haitian creole",
        "ha": "hausa",
        "haw": "hawaiian",
        "iw": "hebrew",
        "hi": "hindi",
        "hmn": "hmong",
        "hu": "hungarian",
        "ig": "igbo",
        "id": "indonesian",
        "ga": "irish",
        "it": "italian",
        "ja": "japanese",
        "jw": "javanese",
        "kn": "kannada",
        "kk": "kazakh",
        "km": "khmer",
        "ko": "korean",
        "ku": "kurdish (kurmanji)",
        "ky": "kyrgyz",
        "lo": "lao",
        "la": "latin",
        "lv": "latvian",
        "lt": "lithuanian",
        "lb": "luxembourgish",
        "mk": "macedonian",
        "mg": "malagasy",
        "ms": "malay",
        "ml": "malayalam",
        "mt": "maltese",
        "mi": "maori",
        "mr": "marathi",
        "mn": "mongolian",
        "my": "myanmar (burmese)",
        "ne": "nepali",
        "no": "norwegian",
        "or": "odia",
        "ps": "pashto",
        "fa": "persian",
        "pl": "polish",
        "pt": "portuguese",
        "pa": "punjabi",
        "ro": "romanian",
        "ru": "russian",
        "sm": "samoan",
        "gd": "scots gaelic",
        "sr": "serbian",
        "st": "sesotho",
        "sn": "shona",
        "sd": "sindhi",
        "si": "sinhala",
        "sk": "slovak",
        "sl": "slovenian",
        "so": "somali",
        "es": "spanish",
        "su": "sundanese",
        "sw": "swahili",
        "sv": "swedish",
        "tg": "tajik",
        "ta": "tamil",
        "te": "telugu",
        "th": "thai",
        "tr": "turkish",
        "uk": "ukrainian",
        "ur": "urdu",
        "ug": "uyghur",
        "uz": "uzbek",
        "vi": "vietnamese",
        "cy": "welsh",
        "xh": "xhosa",
        "yi": "yiddish",
        "yo": "yoruba",
        "zu": "zulu"
    ]
}
