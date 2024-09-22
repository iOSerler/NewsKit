//
//  Language.swift
//  NewsKit
//
//  Created by Nursultan Askarbekuly on 01.03.2023.
//


import Foundation

enum Language: Int {
    case english = 0
    case russian = 1
}


var globalLanguage: Language {
    
    /// check if language is already set
    if let langIndex = UserDefaults(suiteName: "group.com.nurios.namazapp")?.object(forKey: "language") as? Int {
        return Language(rawValue: langIndex) ?? .english
    }
    
    /// check if language is already set
    if let langIndex = UserDefaults.standard.object(forKey: "language") as? Int {
        return Language(rawValue: langIndex) ?? .english
    }
    
    /// if not set the app language according to the device language
    if let preferredLang = Locale.preferredLanguages.first,
       preferredLang.hasPrefix("ru") {
        return .russian
    }
    
    return .english
}

var isRussian: Bool {
    globalLanguage == .russian
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed: CharacterSet = .urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}


extension String {
    func localized() -> String {
        
        if isRussian {
            return getRussian()
        } else {
            return getEnglish()
        }
    }
    
    public func getEnglish() -> String {
        let en = [
            "ContactDeveloper": "Ask\na question",
            "contact_link": "https://api.whatsapp.com/send?phone=+77765206766&text=As-salaamu%20%27alaikum!%20I%27m%20using%20NamazApp.%20I%20have%20the%20following%20question%20or%20suggestion:",
            "AboutUs": "About us",
            "about_us_link": "https://www.namaz.live/about-us/",
            "SupportNamazApp": "Support NamazApp",
            "Personalization": "Tell us about yourself",
            "ShareApp": "Share NamazApp",
            "RateApp": "Rate NamazApp",
            "News": "News",
            "Messages": "Messages",
            "NothingInThisList": "Nothing in this list at the momemnt",
            "KeepPrayer": "Keep your prayer up!\n\nIf you have any questions, please get in touch with us.",
            "Read":"Read",
            "Unread":"Unread",
            "Active":"Active",
            "Archived":"Archived",
            "Archive":"Archive",
            "Unarchive":"Unarchive",
            "audio": "Open the audio",
            "settings": "Go to Settings",
            "celebrate": "Alhamdulillah!",
            "article": "Read the article",
            "dynamic": "See the content",
            "action": "Try it out",
            "phrase": "Hear the phrase"
        ]
        
        return en[self] ?? self
    }
    
    public func getRussian() -> String {
        
        let ru = [
            "ContactDeveloper": "Задать\nвопрос",
            "contact_link": "https://api.whatsapp.com/send?phone=+77765206766&text=%D0%90%D1%81%D1%81%D0%B0%D0%BB%D1%8F%D0%BC%D1%83+%D0%B0%D0%BB%D1%8F%D0%B9%D0%BA%D1%83%D0%BC%21+%D0%AF+%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D1%83%D1%8E+%D0%9D%D0%B0%D0%BC%D0%B0%D0%B7%D0%90%D0%BF%D0%BF.",
            "AboutUs": "Узнать о разработчике",
            "about_us_link": "https://sites.google.com/view/mslmdevsru/",
            "SupportNamazApp": "Поддержать НамазАпп",
            "Personalization": "Рассказать о себе",
            "ShareApp": "Поделиться НамазАпп",
            "RateApp": "Оценить NamazApp",
            "News": "Новости",
            "Messages": "Сообщения",
            "NothingInThisList": "В этом списке пока ничего",
            "KeepPrayer": "Держитесь намаза, воистину намаз - защита верующего.\n\nЕсли у вас есть вопросы, пишите нам.",
            "Read":"Прочитано",
            "Unread":"Непрочитано",
            "Active":"Активные",
            "Archived":"Архив",
            "Archive":"В архив",
            "Unarchive":"В активные",
            "audio": "Послушать аудио",
            "settings": "Открыть вкладку Настройки",
            "celebrate": "Альхамдулилляh!",
            "article": "Прочитать статью",
            "dynamic": "Посмотреть",
            "action": "Посмотреть",
            "phrase": "Услышать фразу"
        ]
        
        return ru[self] ?? self
    }
}
