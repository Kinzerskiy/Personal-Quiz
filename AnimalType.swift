//
//  AnimalType.swift
//  Personal Quiz
//
//  Created by Anton on 28.07.2022.
//

enum AnimalType: String {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtule = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вам нравится побыть с друзьями, вы окружате себя людьми, которые вам нравятся и всегда готовы помочь."
        case .cat:
            return "Вы себе на уме. Любите гулять сами по себе. Вы цените одииночество."
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        case .turtule:
            return "Ваша сила в мудрости. Медленный и вдумчивый, выигрывает на дальних дистанциях."
        }
    }
}
