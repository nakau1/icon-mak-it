/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

class IconFontSetTypicons: IconFontSet {

    var name: String { return "Typicons" }
    
    var linkURL: String { return "http://www.typicons.com/" }
    
    var licenceURL: String { return "http://www.typicons.com/" }
    
    func font(_ size: CGFloat) -> UIFont { return UIFont(name: "Typicons", size: size)! }
    
    var items: [IconFontItem] { return [
        IconFontItem(text: "\u{E000}", name: "adjust_brightness"),
        IconFontItem(text: "\u{E001}", name: "adjust_contrast"),
        IconFontItem(text: "\u{E002}", name: "anchor_outline"),
        IconFontItem(text: "\u{E003}", name: "anchor"),
        IconFontItem(text: "\u{E004}", name: "archive"),
        IconFontItem(text: "\u{E005}", name: "arrow_back_outline"),
        IconFontItem(text: "\u{E006}", name: "arrow_back"),
        IconFontItem(text: "\u{E007}", name: "arrow_down_outline"),
        IconFontItem(text: "\u{E008}", name: "arrow_down_thick"),
        IconFontItem(text: "\u{E009}", name: "arrow_down"),
        IconFontItem(text: "\u{E00a}", name: "arrow_forward_outline"),
        IconFontItem(text: "\u{E00b}", name: "arrow_forward"),
        IconFontItem(text: "\u{E00c}", name: "arrow_left_outline"),
        IconFontItem(text: "\u{E00d}", name: "arrow_left_thick"),
        IconFontItem(text: "\u{E00e}", name: "arrow_left"),
        IconFontItem(text: "\u{E00f}", name: "arrow_loop_outline"),
        IconFontItem(text: "\u{E010}", name: "arrow_loop"),
        IconFontItem(text: "\u{E011}", name: "arrow_maximise_outline"),
        IconFontItem(text: "\u{E012}", name: "arrow_maximise"),
        IconFontItem(text: "\u{E013}", name: "arrow_minimise_outline"),
        IconFontItem(text: "\u{E014}", name: "arrow_minimise"),
        IconFontItem(text: "\u{E015}", name: "arrow_move_outline"),
        IconFontItem(text: "\u{E016}", name: "arrow_move"),
        IconFontItem(text: "\u{E017}", name: "arrow_repeat_outline"),
        IconFontItem(text: "\u{E018}", name: "arrow_repeat"),
        IconFontItem(text: "\u{E019}", name: "arrow_right_outline"),
        IconFontItem(text: "\u{E01a}", name: "arrow_right_thick"),
        IconFontItem(text: "\u{E01b}", name: "arrow_right"),
        IconFontItem(text: "\u{E01c}", name: "arrow_shuffle"),
        IconFontItem(text: "\u{E01d}", name: "arrow_sorted_down"),
        IconFontItem(text: "\u{E01e}", name: "arrow_sorted_up"),
        IconFontItem(text: "\u{E01f}", name: "arrow_sync_outline"),
        IconFontItem(text: "\u{E020}", name: "arrow_sync"),
        IconFontItem(text: "\u{E021}", name: "arrow_unsorted"),
        IconFontItem(text: "\u{E022}", name: "arrow_up_outline"),
        IconFontItem(text: "\u{E023}", name: "arrow_up_thick"),
        IconFontItem(text: "\u{E024}", name: "arrow_up"),
        IconFontItem(text: "\u{E025}", name: "at"),
        IconFontItem(text: "\u{E026}", name: "attachment_outline"),
        IconFontItem(text: "\u{E027}", name: "attachment"),
        IconFontItem(text: "\u{E028}", name: "backspace_outline"),
        IconFontItem(text: "\u{E029}", name: "backspace"),
        IconFontItem(text: "\u{E02a}", name: "battery_charge"),
        IconFontItem(text: "\u{E02b}", name: "battery_full"),
        IconFontItem(text: "\u{E02c}", name: "battery_high"),
        IconFontItem(text: "\u{E02d}", name: "battery_low"),
        IconFontItem(text: "\u{E02e}", name: "battery_mid"),
        IconFontItem(text: "\u{E02f}", name: "beaker"),
        IconFontItem(text: "\u{E030}", name: "beer"),
        IconFontItem(text: "\u{E031}", name: "bell"),
        IconFontItem(text: "\u{E032}", name: "book"),
        IconFontItem(text: "\u{E033}", name: "bookmark"),
        IconFontItem(text: "\u{E034}", name: "briefcase"),
        IconFontItem(text: "\u{E035}", name: "brush"),
        IconFontItem(text: "\u{E036}", name: "business_card"),
        IconFontItem(text: "\u{E037}", name: "calculator"),
        IconFontItem(text: "\u{E038}", name: "calendar_outline"),
        IconFontItem(text: "\u{E039}", name: "calendar"),
        IconFontItem(text: "\u{E03a}", name: "camera_outline"),
        IconFontItem(text: "\u{E03b}", name: "camera"),
        IconFontItem(text: "\u{E03c}", name: "cancel_outline"),
        IconFontItem(text: "\u{E03d}", name: "cancel"),
        IconFontItem(text: "\u{E03e}", name: "chart_area_outline"),
        IconFontItem(text: "\u{E03f}", name: "chart_area"),
        IconFontItem(text: "\u{E040}", name: "chart_bar_outline"),
        IconFontItem(text: "\u{E041}", name: "chart_bar"),
        IconFontItem(text: "\u{E042}", name: "chart_line_outline"),
        IconFontItem(text: "\u{E043}", name: "chart_line"),
        IconFontItem(text: "\u{E044}", name: "chart_pie_outline"),
        IconFontItem(text: "\u{E045}", name: "chart_pie"),
        IconFontItem(text: "\u{E046}", name: "chevron_left_outline"),
        IconFontItem(text: "\u{E047}", name: "chevron_left"),
        IconFontItem(text: "\u{E048}", name: "chevron_right_outline"),
        IconFontItem(text: "\u{E049}", name: "chevron_right"),
        IconFontItem(text: "\u{E04a}", name: "clipboard"),
        IconFontItem(text: "\u{E04b}", name: "cloud_storage"),
        IconFontItem(text: "\u{E054}", name: "cloud_storage_outline"),
        IconFontItem(text: "\u{E04c}", name: "code_outline"),
        IconFontItem(text: "\u{E04d}", name: "code"),
        IconFontItem(text: "\u{E04e}", name: "coffee"),
        IconFontItem(text: "\u{E04f}", name: "cog_outline"),
        IconFontItem(text: "\u{E050}", name: "cog"),
        IconFontItem(text: "\u{E051}", name: "compass"),
        IconFontItem(text: "\u{E052}", name: "contacts"),
        IconFontItem(text: "\u{E053}", name: "credit_card"),
        IconFontItem(text: "\u{E055}", name: "css3"),
        IconFontItem(text: "\u{E056}", name: "database"),
        IconFontItem(text: "\u{E057}", name: "delete_outline"),
        IconFontItem(text: "\u{E058}", name: "delete"),
        IconFontItem(text: "\u{E059}", name: "device_desktop"),
        IconFontItem(text: "\u{E05a}", name: "device_laptop"),
        IconFontItem(text: "\u{E05b}", name: "device_phone"),
        IconFontItem(text: "\u{E05c}", name: "device_tablet"),
        IconFontItem(text: "\u{E05d}", name: "directions"),
        IconFontItem(text: "\u{E05e}", name: "divide_outline"),
        IconFontItem(text: "\u{E05f}", name: "divide"),
        IconFontItem(text: "\u{E060}", name: "document_add"),
        IconFontItem(text: "\u{E061}", name: "document_delete"),
        IconFontItem(text: "\u{E062}", name: "document_text"),
        IconFontItem(text: "\u{E063}", name: "document"),
        IconFontItem(text: "\u{E064}", name: "download_outline"),
        IconFontItem(text: "\u{E065}", name: "download"),
        IconFontItem(text: "\u{E066}", name: "dropbox"),
        IconFontItem(text: "\u{E067}", name: "edit"),
        IconFontItem(text: "\u{E068}", name: "eject_outline"),
        IconFontItem(text: "\u{E069}", name: "eject"),
        IconFontItem(text: "\u{E06a}", name: "equals_outline"),
        IconFontItem(text: "\u{E06b}", name: "equals"),
        IconFontItem(text: "\u{E06c}", name: "export_outline"),
        IconFontItem(text: "\u{E06d}", name: "export"),
        IconFontItem(text: "\u{E06e}", name: "eye_outline"),
        IconFontItem(text: "\u{E06f}", name: "eye"),
        IconFontItem(text: "\u{E070}", name: "feather"),
        IconFontItem(text: "\u{E071}", name: "film"),
        IconFontItem(text: "\u{E072}", name: "filter"),
        IconFontItem(text: "\u{E073}", name: "flag_outline"),
        IconFontItem(text: "\u{E074}", name: "flag"),
        IconFontItem(text: "\u{E075}", name: "flash_outline"),
        IconFontItem(text: "\u{E076}", name: "flash"),
        IconFontItem(text: "\u{E077}", name: "flow_children"),
        IconFontItem(text: "\u{E078}", name: "flow_merge"),
        IconFontItem(text: "\u{E079}", name: "flow_parallel"),
        IconFontItem(text: "\u{E07a}", name: "flow_switch"),
        IconFontItem(text: "\u{E07b}", name: "folder_add"),
        IconFontItem(text: "\u{E07c}", name: "folder_delete"),
        IconFontItem(text: "\u{E07d}", name: "folder_open"),
        IconFontItem(text: "\u{E07e}", name: "folder"),
        IconFontItem(text: "\u{E07f}", name: "gift"),
        IconFontItem(text: "\u{E080}", name: "globe_outline"),
        IconFontItem(text: "\u{E081}", name: "globe"),
        IconFontItem(text: "\u{E082}", name: "group_outline"),
        IconFontItem(text: "\u{E083}", name: "group"),
        IconFontItem(text: "\u{E084}", name: "headphones"),
        IconFontItem(text: "\u{E085}", name: "heart_full_outline"),
        IconFontItem(text: "\u{E086}", name: "heart_half_outline"),
        IconFontItem(text: "\u{E087}", name: "heart_outline"),
        IconFontItem(text: "\u{E088}", name: "heart"),
        IconFontItem(text: "\u{E089}", name: "home_outline"),
        IconFontItem(text: "\u{E08a}", name: "home"),
        IconFontItem(text: "\u{E08b}", name: "html5"),
        IconFontItem(text: "\u{E08c}", name: "image_outline"),
        IconFontItem(text: "\u{E08d}", name: "image"),
        IconFontItem(text: "\u{E08e}", name: "infinity_outline"),
        IconFontItem(text: "\u{E08f}", name: "infinity"),
        IconFontItem(text: "\u{E090}", name: "info_large_outline"),
        IconFontItem(text: "\u{E091}", name: "info_large"),
        IconFontItem(text: "\u{E092}", name: "info_outline"),
        IconFontItem(text: "\u{E093}", name: "info"),
        IconFontItem(text: "\u{E094}", name: "input_checked_outline"),
        IconFontItem(text: "\u{E095}", name: "input_checked"),
        IconFontItem(text: "\u{E096}", name: "key_outline"),
        IconFontItem(text: "\u{E097}", name: "key"),
        IconFontItem(text: "\u{E098}", name: "keyboard"),
        IconFontItem(text: "\u{E099}", name: "leaf"),
        IconFontItem(text: "\u{E09a}", name: "lightbulb"),
        IconFontItem(text: "\u{E09b}", name: "link_outline"),
        IconFontItem(text: "\u{E09c}", name: "link"),
        IconFontItem(text: "\u{E09d}", name: "location_arrow_outline"),
        IconFontItem(text: "\u{E09e}", name: "location_arrow"),
        IconFontItem(text: "\u{E09f}", name: "location_outline"),
        IconFontItem(text: "\u{E0a0}", name: "location"),
        IconFontItem(text: "\u{E0a1}", name: "lock_closed_outline"),
        IconFontItem(text: "\u{E0a2}", name: "lock_closed"),
        IconFontItem(text: "\u{E0a3}", name: "lock_open_outline"),
        IconFontItem(text: "\u{E0a4}", name: "lock_open"),
        IconFontItem(text: "\u{E0a5}", name: "mail"),
        IconFontItem(text: "\u{E0a6}", name: "map"),
        IconFontItem(text: "\u{E0a7}", name: "media_eject_outline"),
        IconFontItem(text: "\u{E0a8}", name: "media_eject"),
        IconFontItem(text: "\u{E0a9}", name: "media_fast_forward_outline"),
        IconFontItem(text: "\u{E0aa}", name: "media_fast_forward"),
        IconFontItem(text: "\u{E0ab}", name: "media_pause_outline"),
        IconFontItem(text: "\u{E0ac}", name: "media_pause"),
        IconFontItem(text: "\u{E0ad}", name: "media_play_outline"),
        IconFontItem(text: "\u{E0ae}", name: "media_play_reverse_outline"),
        IconFontItem(text: "\u{E0af}", name: "media_play_reverse"),
        IconFontItem(text: "\u{E0b0}", name: "media_play"),
        IconFontItem(text: "\u{E0b1}", name: "media_record_outline"),
        IconFontItem(text: "\u{E0b2}", name: "media_record"),
        IconFontItem(text: "\u{E0b3}", name: "media_rewind_outline"),
        IconFontItem(text: "\u{E0b4}", name: "media_rewind"),
        IconFontItem(text: "\u{E0b5}", name: "media_stop_outline"),
        IconFontItem(text: "\u{E0b6}", name: "media_stop"),
        IconFontItem(text: "\u{E0b7}", name: "message_typing"),
        IconFontItem(text: "\u{E0b8}", name: "message"),
        IconFontItem(text: "\u{E0b9}", name: "messages"),
        IconFontItem(text: "\u{E0ba}", name: "microphone_outline"),
        IconFontItem(text: "\u{E0bb}", name: "microphone"),
        IconFontItem(text: "\u{E0bc}", name: "minus_outline"),
        IconFontItem(text: "\u{E0bd}", name: "minus"),
        IconFontItem(text: "\u{E0be}", name: "mortar_board"),
        IconFontItem(text: "\u{E0bf}", name: "news"),
        IconFontItem(text: "\u{E0c0}", name: "notes_outline"),
        IconFontItem(text: "\u{E0c1}", name: "notes"),
        IconFontItem(text: "\u{E0c2}", name: "pen"),
        IconFontItem(text: "\u{E0c3}", name: "pencil"),
        IconFontItem(text: "\u{E0c4}", name: "phone_outline"),
        IconFontItem(text: "\u{E0c5}", name: "phone"),
        IconFontItem(text: "\u{E0c6}", name: "pi_outline"),
        IconFontItem(text: "\u{E0c7}", name: "pi"),
        IconFontItem(text: "\u{E0c8}", name: "pin_outline"),
        IconFontItem(text: "\u{E0c9}", name: "pin"),
        IconFontItem(text: "\u{E0ca}", name: "pipette"),
        IconFontItem(text: "\u{E0cb}", name: "plane_outline"),
        IconFontItem(text: "\u{E0cc}", name: "plane"),
        IconFontItem(text: "\u{E0cd}", name: "plug"),
        IconFontItem(text: "\u{E0ce}", name: "plus_outline"),
        IconFontItem(text: "\u{E0cf}", name: "plus"),
        IconFontItem(text: "\u{E0d0}", name: "point_of_interest_outline"),
        IconFontItem(text: "\u{E0d1}", name: "point_of_interest"),
        IconFontItem(text: "\u{E0d2}", name: "power_outline"),
        IconFontItem(text: "\u{E0d3}", name: "power"),
        IconFontItem(text: "\u{E0d4}", name: "printer"),
        IconFontItem(text: "\u{E0d5}", name: "puzzle_outline"),
        IconFontItem(text: "\u{E0d6}", name: "puzzle"),
        IconFontItem(text: "\u{E0d7}", name: "radar_outline"),
        IconFontItem(text: "\u{E0d8}", name: "radar"),
        IconFontItem(text: "\u{E0d9}", name: "refresh_outline"),
        IconFontItem(text: "\u{E0da}", name: "refresh"),
        IconFontItem(text: "\u{E0db}", name: "rss_outline"),
        IconFontItem(text: "\u{E0dc}", name: "rss"),
        IconFontItem(text: "\u{E0dd}", name: "scissors_outline"),
        IconFontItem(text: "\u{E0de}", name: "scissors"),
        IconFontItem(text: "\u{E0df}", name: "shopping_bag"),
        IconFontItem(text: "\u{E0e0}", name: "shopping_cart"),
        IconFontItem(text: "\u{E0e1}", name: "social_at_circular"),
        IconFontItem(text: "\u{E0e2}", name: "social_dribbble_circular"),
        IconFontItem(text: "\u{E0e3}", name: "social_dribbble"),
        IconFontItem(text: "\u{E0e4}", name: "social_facebook_circular"),
        IconFontItem(text: "\u{E0e5}", name: "social_facebook"),
        IconFontItem(text: "\u{E0e6}", name: "social_flickr_circular"),
        IconFontItem(text: "\u{E0e7}", name: "social_flickr"),
        IconFontItem(text: "\u{E0e8}", name: "social_github_circular"),
        IconFontItem(text: "\u{E0e9}", name: "social_github"),
        IconFontItem(text: "\u{E0ea}", name: "social_google_plus_circular"),
        IconFontItem(text: "\u{E0eb}", name: "social_google_plus"),
        IconFontItem(text: "\u{E0ec}", name: "social_instagram_circular"),
        IconFontItem(text: "\u{E0ed}", name: "social_instagram"),
        IconFontItem(text: "\u{E0ee}", name: "social_last_fm_circular"),
        IconFontItem(text: "\u{E0ef}", name: "social_last_fm"),
        IconFontItem(text: "\u{E0f0}", name: "social_linkedin_circular"),
        IconFontItem(text: "\u{E0f1}", name: "social_linkedin"),
        IconFontItem(text: "\u{E0f2}", name: "social_pinterest_circular"),
        IconFontItem(text: "\u{E0f3}", name: "social_pinterest"),
        IconFontItem(text: "\u{E0f4}", name: "social_skype_outline"),
        IconFontItem(text: "\u{E0f5}", name: "social_skype"),
        IconFontItem(text: "\u{E0f6}", name: "social_tumbler_circular"),
        IconFontItem(text: "\u{E0f7}", name: "social_tumbler"),
        IconFontItem(text: "\u{E0f8}", name: "social_twitter_circular"),
        IconFontItem(text: "\u{E0f9}", name: "social_twitter"),
        IconFontItem(text: "\u{E0fa}", name: "social_vimeo_circular"),
        IconFontItem(text: "\u{E0fb}", name: "social_vimeo"),
        IconFontItem(text: "\u{E0fc}", name: "social_youtube_circular"),
        IconFontItem(text: "\u{E0fd}", name: "social_youtube"),
        IconFontItem(text: "\u{E0fe}", name: "sort_alphabetically_outline"),
        IconFontItem(text: "\u{E0ff}", name: "sort_alphabetically"),
        IconFontItem(text: "\u{E100}", name: "sort_numerically_outline"),
        IconFontItem(text: "\u{E101}", name: "sort_numerically"),
        IconFontItem(text: "\u{E102}", name: "spanner_outline"),
        IconFontItem(text: "\u{E103}", name: "spanner"),
        IconFontItem(text: "\u{E104}", name: "spiral"),
        IconFontItem(text: "\u{E105}", name: "star_full_outline"),
        IconFontItem(text: "\u{E106}", name: "star_half_outline"),
        IconFontItem(text: "\u{E107}", name: "star_half"),
        IconFontItem(text: "\u{E108}", name: "star_outline"),
        IconFontItem(text: "\u{E109}", name: "star"),
        IconFontItem(text: "\u{E10a}", name: "starburst_outline"),
        IconFontItem(text: "\u{E10b}", name: "starburst"),
        IconFontItem(text: "\u{E10c}", name: "stopwatch"),
        IconFontItem(text: "\u{E10d}", name: "support"),
        IconFontItem(text: "\u{E10e}", name: "tabs_outline"),
        IconFontItem(text: "\u{E10f}", name: "tag"),
        IconFontItem(text: "\u{E110}", name: "tags"),
        IconFontItem(text: "\u{E111}", name: "th_large_outline"),
        IconFontItem(text: "\u{E112}", name: "th_large"),
        IconFontItem(text: "\u{E113}", name: "th_list_outline"),
        IconFontItem(text: "\u{E114}", name: "th_list"),
        IconFontItem(text: "\u{E115}", name: "th_menu_outline"),
        IconFontItem(text: "\u{E116}", name: "th_menu"),
        IconFontItem(text: "\u{E117}", name: "th_small_outline"),
        IconFontItem(text: "\u{E118}", name: "th_small"),
        IconFontItem(text: "\u{E119}", name: "thermometer"),
        IconFontItem(text: "\u{E11a}", name: "thumbs_down"),
        IconFontItem(text: "\u{E11b}", name: "thumbs_ok"),
        IconFontItem(text: "\u{E11c}", name: "thumbs_up"),
        IconFontItem(text: "\u{E11d}", name: "tick_outline"),
        IconFontItem(text: "\u{E11e}", name: "tick"),
        IconFontItem(text: "\u{E11f}", name: "ticket"),
        IconFontItem(text: "\u{E120}", name: "time"),
        IconFontItem(text: "\u{E121}", name: "times_outline"),
        IconFontItem(text: "\u{E122}", name: "times"),
        IconFontItem(text: "\u{E123}", name: "trash"),
        IconFontItem(text: "\u{E124}", name: "tree"),
        IconFontItem(text: "\u{E125}", name: "upload_outline"),
        IconFontItem(text: "\u{E126}", name: "upload"),
        IconFontItem(text: "\u{E127}", name: "user_add_outline"),
        IconFontItem(text: "\u{E128}", name: "user_add"),
        IconFontItem(text: "\u{E129}", name: "user_delete_outline"),
        IconFontItem(text: "\u{E12a}", name: "user_delete"),
        IconFontItem(text: "\u{E12b}", name: "user_outline"),
        IconFontItem(text: "\u{E12c}", name: "user"),
        IconFontItem(text: "\u{E12d}", name: "vendor_android"),
        IconFontItem(text: "\u{E12e}", name: "vendor_apple"),
        IconFontItem(text: "\u{E12f}", name: "vendor_microsoft"),
        IconFontItem(text: "\u{E130}", name: "video_outline"),
        IconFontItem(text: "\u{E131}", name: "video"),
        IconFontItem(text: "\u{E132}", name: "volume_down"),
        IconFontItem(text: "\u{E133}", name: "volume_mute"),
        IconFontItem(text: "\u{E134}", name: "volume_up"),
        IconFontItem(text: "\u{E135}", name: "volume"),
        IconFontItem(text: "\u{E136}", name: "warning_outline"),
        IconFontItem(text: "\u{E137}", name: "warning"),
        IconFontItem(text: "\u{E138}", name: "watch"),
        IconFontItem(text: "\u{E139}", name: "waves_outline"),
        IconFontItem(text: "\u{E13a}", name: "waves"),
        IconFontItem(text: "\u{E13b}", name: "weather_cloudy"),
        IconFontItem(text: "\u{E13c}", name: "weather_downpour"),
        IconFontItem(text: "\u{E13d}", name: "weather_night"),
        IconFontItem(text: "\u{E13e}", name: "weather_partly_sunny"),
        IconFontItem(text: "\u{E13f}", name: "weather_shower"),
        IconFontItem(text: "\u{E140}", name: "weather_snow"),
        IconFontItem(text: "\u{E141}", name: "weather_stormy"),
        IconFontItem(text: "\u{E142}", name: "weather_sunny"),
        IconFontItem(text: "\u{E143}", name: "weather_windy_cloudy"),
        IconFontItem(text: "\u{E144}", name: "weather_windy"),
        IconFontItem(text: "\u{E145}", name: "wi_fi_outline"),
        IconFontItem(text: "\u{E146}", name: "wi_fi"),
        IconFontItem(text: "\u{E147}", name: "wine"),
        IconFontItem(text: "\u{E148}", name: "world_outline"),
        IconFontItem(text: "\u{E149}", name: "world"),
        IconFontItem(text: "\u{E14a}", name: "zoom_in_outline"),
        IconFontItem(text: "\u{E14b}", name: "zoom_in"),
        IconFontItem(text: "\u{E14c}", name: "zoom_out_outline"),
        IconFontItem(text: "\u{E14d}", name: "zoom_out"),
        IconFontItem(text: "\u{E14e}", name: "zoom_outline"),
        IconFontItem(text: "\u{E14f}", name: "zoom"),
        ]}
}