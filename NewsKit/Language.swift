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
    let langIndex: Int = Locale.current.languageCode == "ru" ? 1 : 0
    return Language(rawValue: langIndex) ?? .english
    
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
            "SupportNamazApp": "Support NamazApp",
            "Personalization": "Tell us about yourself",
            "News": "News",
            "Messages": "Messages",
            "NothingInThisList": "Nothing in this list yet",
            "KeepPrayer": "Keep your prayer up!\n\nIf you have any questions, please get in touch with us.",
            "Read":"Read",
            "Unread":"Unread",
            "Active":"Active",
            "Archived":"Archived",
            "Archive":"Archive",
            "Unarchive":"Unarchive",
        ]
        
        return en[self] ?? self
    }
    
    public func getRussian() -> String {
        
        let ru = [
            "ContactDeveloper": "Задайте\nвопрос",
            "contact_link": "https://api.whatsapp.com/send?phone=+77765206766&text=%D0%90%D1%81%D1%81%D0%B0%D0%BB%D1%8F%D0%BC%D1%83+%D0%B0%D0%BB%D1%8F%D0%B9%D0%BA%D1%83%D0%BC%21+%D0%AF+%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D1%83%D1%8E+%D0%9D%D0%B0%D0%BC%D0%B0%D0%B7%D0%90%D0%BF%D0%BF.",
            "SupportNamazApp": "Поддержите НамазАпп",
            "Personalization": "Расскажите о себе",
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
        ]
        
        return ru[self] ?? self
    }
}
