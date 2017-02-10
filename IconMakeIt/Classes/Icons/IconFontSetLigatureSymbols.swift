/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

class IconFontSetLigatureSymbols: IconFontSet {
    
    var name: String { return "LigatureSymbols" }
    
    var linkURL: String { return "http://kudakurage.com/ligature_symbols/" }
    
    var licenceURL: String { return "http://kudakurage.com/ligature_symbols/" }
    
    func font(_ size: CGFloat) -> UIFont { return UIFont(name: "LigatureSymbols", size: size)! }
    
    var items: [IconFontItem] { return [
        IconFontItem(text: "\u{E127}", name: "table"),
        IconFontItem(text: "\u{E038}", name: "copy"),
        IconFontItem(text: "\u{E03b}", name: "cut"),
        IconFontItem(text: "\u{E010}", name: "backspace"),
        IconFontItem(text: "\u{E005}", name: "alignleft"),
        IconFontItem(text: "\u{E004}", name: "aligncenter"),
        IconFontItem(text: "\u{E006}", name: "alignright"),
        IconFontItem(text: "\u{E003}", name: "alignadjust"),
        IconFontItem(text: "\u{E079}", name: "italic"),
        IconFontItem(text: "\u{E01f}", name: "bold"),
        IconFontItem(text: "\u{E132}", name: "underline"),
        IconFontItem(text: "\u{E159}", name: "strike"),
        IconFontItem(text: "\u{E152}", name: "emphasis"),
        IconFontItem(text: "\u{E032}", name: "code"),
        IconFontItem(text: "\u{E082}", name: "link"),
        IconFontItem(text: "\u{E10b}", name: "quote"),
        IconFontItem(text: "\u{E05b}", name: "graph"),
        IconFontItem(text: "\u{E089}", name: "magic"),
        IconFontItem(text: "\u{E022}", name: "brush"),
        IconFontItem(text: "\u{E033}", name: "color"),
        IconFontItem(text: "\u{E001}", name: "contrast"),
        IconFontItem(text: "\u{E14a}", name: "ink"),
        IconFontItem(text: "\u{E149}", name: "gradation"),
        IconFontItem(text: "\u{E14e}", name: "sepia"),
        IconFontItem(text: "\u{E14b}", name: "invert"),
        IconFontItem(text: "\u{E09b}", name: "paint"),
        IconFontItem(text: "\u{E09c}", name: "paramater"),
        IconFontItem(text: "\u{E039}", name: "crop"),
        IconFontItem(text: "\u{E029}", name: "check"),
        IconFontItem(text: "\u{E02a}", name: "checkbox"),
        IconFontItem(text: "\u{E02b}", name: "checkboxempty"),
        IconFontItem(text: "\u{E09e}", name: "pc"),
        IconFontItem(text: "\u{E07d}", name: "keyboard"),
        IconFontItem(text: "\u{E078}", name: "mobile"),
        IconFontItem(text: "\u{E071}", name: "horizontal"),
        IconFontItem(text: "\u{E138}", name: "vertical"),
        IconFontItem(text: "\u{E13f}", name: "web"),
        IconFontItem(text: "\u{E08a}", name: "mail"),
        IconFontItem(text: "\u{E119}", name: "shopping"),
        IconFontItem(text: "\u{E03c}", name: "dashboard"),
        IconFontItem(text: "\u{E07c}", name: "key"),
        IconFontItem(text: "\u{E11f}", name: "sns"),
        IconFontItem(text: "\u{E15e}", name: "calendar"),
        IconFontItem(text: "\u{E025}", name: "dailycalendar"),
        IconFontItem(text: "\u{E012}", name: "ban"),
        IconFontItem(text: "\u{E10f}", name: "remove"),
        IconFontItem(text: "\u{E09f}", name: "pen"),
        IconFontItem(text: "\u{E148}", name: "eraser"),
        IconFontItem(text: "\u{E041}", name: "edit"),
        IconFontItem(text: "\u{E095}", name: "tabs"),
        IconFontItem(text: "\u{E128}", name: "tag"),
        IconFontItem(text: "\u{E117}", name: "setup"),
        IconFontItem(text: "\u{E055}", name: "setting"),
        IconFontItem(text: "\u{E043}", name: "etc"),
        IconFontItem(text: "\u{E030}", name: "clip"),
        IconFontItem(text: "\u{E021}", name: "bookmark"),
        IconFontItem(text: "\u{E020}", name: "book"),
        IconFontItem(text: "\u{E002}", name: "album"),
        IconFontItem(text: "\u{E137}", name: "user"),
        IconFontItem(text: "\u{E051}", name: "friend"),
        IconFontItem(text: "\u{E05c}", name: "group"),
        IconFontItem(text: "\u{E052}", name: "frustrate"),
        IconFontItem(text: "\u{E07f}", name: "laugh"),
        IconFontItem(text: "\u{E081}", name: "wink"),
        IconFontItem(text: "\u{E11e}", name: "smile"),
        IconFontItem(text: "\u{E124}", name: "surprise"),
        IconFontItem(text: "\u{E12d}", name: "trouble"),
        IconFontItem(text: "\u{E176}", name: "male"),
        IconFontItem(text: "\u{E175}", name: "female"),
        IconFontItem(text: "\u{E054}", name: "game"),
        IconFontItem(text: "\u{E058}", name: "globe"),
        IconFontItem(text: "\u{E072}", name: "home"),
        IconFontItem(text: "\u{E023}", name: "building"),
        IconFontItem(text: "\u{E113}", name: "rss"),
        IconFontItem(text: "\u{E16c}", name: "server"),
        IconFontItem(text: "\u{E16d}", name: "sitemap"),
        IconFontItem(text: "\u{E009}", name: "app"),
        IconFontItem(text: "\u{E08d}", name: "memo"),
        IconFontItem(text: "\u{E08c}", name: "meal"),
        IconFontItem(text: "\u{E146}", name: "coffee"),
        IconFontItem(text: "\u{E177}", name: "spa"),
        IconFontItem(text: "\u{E174}", name: "college"),
        IconFontItem(text: "\u{E173}", name: "bag"),
        IconFontItem(text: "\u{E109}", name: "present"),
        IconFontItem(text: "\u{E178}", name: "umbrella"),
        IconFontItem(text: "\u{E073}", name: "twinkle"),
        IconFontItem(text: "\u{E03a}", name: "crown"),
        IconFontItem(text: "\u{E028}", name: "category"),
        IconFontItem(text: "\u{E02e}", name: "circle"),
        IconFontItem(text: "\u{E075}", name: "info"),
        IconFontItem(text: "\u{E070}", name: "help"),
        IconFontItem(text: "\u{E14d}", name: "refreshbutton"),
        IconFontItem(text: "\u{E16e}", name: "terminal"),
        IconFontItem(text: "\u{E048}", name: "file"),
        IconFontItem(text: "\u{E10a}", name: "print"),
        IconFontItem(text: "\u{E12c}", name: "delete"),
        IconFontItem(text: "\u{E02f}", name: "clear"),
        IconFontItem(text: "\u{E115}", name: "save"),
        IconFontItem(text: "\u{E136}", name: "upload"),
        IconFontItem(text: "\u{E031}", name: "cloud"),
        IconFontItem(text: "\u{E04c}", name: "folder"),
        IconFontItem(text: "\u{E026}", name: "camera"),
        IconFontItem(text: "\u{E101}", name: "photo"),
        IconFontItem(text: "\u{E074}", name: "image"),
        IconFontItem(text: "\u{E013}", name: "barcode"),
        IconFontItem(text: "\u{E100}", name: "phone"),
        IconFontItem(text: "\u{E094}", name: "music"),
        IconFontItem(text: "\u{E139}", name: "video"),
        IconFontItem(text: "\u{E107}", name: "playmedia"),
        IconFontItem(text: "\u{E10d}", name: "record"),
        IconFontItem(text: "\u{E106}", name: "play"),
        IconFontItem(text: "\u{E09d}", name: "pause"),
        IconFontItem(text: "\u{E123}", name: "stop"),
        IconFontItem(text: "\u{E042}", name: "eject"),
        IconFontItem(text: "\u{E014}", name: "bell"),
        IconFontItem(text: "\u{E13d}", name: "volumeup"),
        IconFontItem(text: "\u{E13c}", name: "volumedown"),
        IconFontItem(text: "\u{E13b}", name: "volume"),
        IconFontItem(text: "\u{E098}", name: "off"),
        IconFontItem(text: "\u{E14c}", name: "light"),
        IconFontItem(text: "\u{E147}", name: "dark"),
        IconFontItem(text: "\u{E086}", name: "lock"),
        IconFontItem(text: "\u{E134}", name: "unlock"),
        IconFontItem(text: "\u{E04a}", name: "flag"),
        IconFontItem(text: "\u{E140}", name: "wifi"),
        IconFontItem(text: "\u{E12b}", name: "time"),
        IconFontItem(text: "\u{E08b}", name: "map"),
        IconFontItem(text: "\u{E056}", name: "geo"),
        IconFontItem(text: "\u{E085}", name: "location"),
        IconFontItem(text: "\u{E103}", name: "pin"),
        IconFontItem(text: "\u{E13e}", name: "walking"),
        IconFontItem(text: "\u{E015}", name: "bicycle"),
        IconFontItem(text: "\u{E027}", name: "car"),
        IconFontItem(text: "\u{E024}", name: "bus"),
        IconFontItem(text: "\u{E105}", name: "plane"),
        IconFontItem(text: "\u{E036}", name: "compass"),
        IconFontItem(text: "\u{E166}", name: "cursor"),
        IconFontItem(text: "\u{E16b}", name: "pointer"),
        IconFontItem(text: "\u{E169}", name: "grab"),
        IconFontItem(text: "\u{E00e}", name: "arrowup"),
        IconFontItem(text: "\u{E00d}", name: "arrowright"),
        IconFontItem(text: "\u{E00b}", name: "arrowdown"),
        IconFontItem(text: "\u{E00c}", name: "arrowleft"),
        IconFontItem(text: "\u{E135}", name: "up"),
        IconFontItem(text: "\u{E112}", name: "right"),
        IconFontItem(text: "\u{E03e}", name: "down"),
        IconFontItem(text: "\u{E080}", name: "left"),
        IconFontItem(text: "\u{E00f}", name: "back"),
        IconFontItem(text: "\u{E096}", name: "next"),
        IconFontItem(text: "\u{E040}", name: "dropdown"),
        IconFontItem(text: "\u{E120}", name: "sort"),
        IconFontItem(text: "\u{E059}", name: "good"),
        IconFontItem(text: "\u{E011}", name: "bad"),
        IconFontItem(text: "\u{E053}", name: "full"),
        IconFontItem(text: "\u{E11d}", name: "small"),
        IconFontItem(text: "\u{E093}", name: "move"),
        IconFontItem(text: "\u{E133}", name: "undo"),
        IconFontItem(text: "\u{E04e}", name: "forward"),
        IconFontItem(text: "\u{E111}", name: "reply"),
        IconFontItem(text: "\u{E118}", name: "share"),
        IconFontItem(text: "\u{E087}", name: "login"),
        IconFontItem(text: "\u{E088}", name: "logout"),
        IconFontItem(text: "\u{E045}", name: "exchange"),
        IconFontItem(text: "\u{E11a}", name: "shuffle"),
        IconFontItem(text: "\u{E110}", name: "repeat"),
        IconFontItem(text: "\u{E10e}", name: "refresh"),
        IconFontItem(text: "\u{E125}", name: "sync"),
        IconFontItem(text: "\u{E046}", name: "external"),
        IconFontItem(text: "\u{E000}", name: "addstar"),
        IconFontItem(text: "\u{E121}", name: "star"),
        IconFontItem(text: "\u{E122}", name: "starempty"),
        IconFontItem(text: "\u{E06e}", name: "heart"),
        IconFontItem(text: "\u{E06f}", name: "heartempty"),
        IconFontItem(text: "\u{E13a}", name: "view"),
        IconFontItem(text: "\u{E034}", name: "comment"),
        IconFontItem(text: "\u{E035}", name: "comments"),
        IconFontItem(text: "\u{E108}", name: "plus"),
        IconFontItem(text: "\u{E08f}", name: "minus"),
        IconFontItem(text: "\u{E142}", name: "zoomin"),
        IconFontItem(text: "\u{E143}", name: "zoomout"),
        IconFontItem(text: "\u{E116}", name: "search"),
        IconFontItem(text: "\u{E08e}", name: "menu"),
        IconFontItem(text: "\u{E12a}", name: "tilemenu"),
        IconFontItem(text: "\u{E084}", name: "list"),
        IconFontItem(text: "\u{E129}", name: "tile"),
        IconFontItem(text: "\u{E097}", name: "notify"),
        IconFontItem(text: "\u{E00a}", name: "apple"),
        IconFontItem(text: "\u{E008}", name: "android"),
        IconFontItem(text: "\u{E151}", name: "windows"),
        IconFontItem(text: "\u{E17b}", name: "ubuntu"),
        IconFontItem(text: "\u{E007}", name: "amazon"),
        IconFontItem(text: "\u{E047}", name: "facebook"),
        IconFontItem(text: "\u{E12f}", name: "twitter"),
        IconFontItem(text: "\u{E17c}", name: "vk"),
        IconFontItem(text: "\u{E05a}", name: "google"),
        IconFontItem(text: "\u{E172}", name: "yahoo"),
        IconFontItem(text: "\u{E164}", name: "bing"),
        IconFontItem(text: "\u{E05d}", name: "hatena"),
        IconFontItem(text: "\u{E161}", name: "hatenabookmark"),
        IconFontItem(text: "\u{E167}", name: "digg"),
        IconFontItem(text: "\u{E083}", name: "linkedin"),
        IconFontItem(text: "\u{E16a}", name: "myspace"),
        IconFontItem(text: "\u{E162}", name: "paperboy"),
        IconFontItem(text: "\u{E090}", name: "mixi"),
        IconFontItem(text: "\u{E157}", name: "line"),
        IconFontItem(text: "\u{E158}", name: "mobage"),
        IconFontItem(text: "\u{E153}", name: "gree"),
        IconFontItem(text: "\u{E11b}", name: "skype"),
        IconFontItem(text: "\u{E163}", name: "aim"),
        IconFontItem(text: "\u{E17d}", name: "yelp"),
        IconFontItem(text: "\u{E04d}", name: "foursquare"),
        IconFontItem(text: "\u{E104}", name: "pinterest"),
        IconFontItem(text: "\u{E04b}", name: "flickr"),
        IconFontItem(text: "\u{E12e}", name: "tumblr"),
        IconFontItem(text: "\u{E171}", name: "wordpress"),
        IconFontItem(text: "\u{E165}", name: "blogger"),
        IconFontItem(text: "\u{E044}", name: "evernote"),
        IconFontItem(text: "\u{E168}", name: "dropbox"),
        IconFontItem(text: "\u{E179}", name: "slideshare"),
        IconFontItem(text: "\u{E057}", name: "github"),
        IconFontItem(text: "\u{E15c}", name: "yapcasialogomark"),
        IconFontItem(text: "\u{E03f}", name: "dribbble"),
        IconFontItem(text: "\u{E037}", name: "cookpad"),
        IconFontItem(text: "\u{E076}", name: "instapaper"),
        IconFontItem(text: "\u{E10c}", name: "readability"),
        IconFontItem(text: "\u{E154}", name: "gumroad"),
        IconFontItem(text: "\u{E102}", name: "picasa"),
        IconFontItem(text: "\u{E155}", name: "instagram"),
        IconFontItem(text: "\u{E03d}", name: "delicious"),
        IconFontItem(text: "\u{E141}", name: "youtube"),
        IconFontItem(text: "\u{E170}", name: "vimeo"),
        IconFontItem(text: "\u{E16f}", name: "ustream"),
        IconFontItem(text: "\u{E17a}", name: "soundcloud"),
        IconFontItem(text: "\u{E02c}", name: "chrome"),
        IconFontItem(text: "\u{E114}", name: "safari"),
        IconFontItem(text: "\u{E11c}", name: "sleipnir"),
        IconFontItem(text: "\u{E049}", name: "firefox"),
        IconFontItem(text: "\u{E099}", name: "opera"),
        IconFontItem(text: "\u{E077}", name: "internetexplorer"),
        ]}
}
