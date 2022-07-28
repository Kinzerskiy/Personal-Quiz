//
//  Question.swift
//  Personal Quiz
//
//  Created by Anton on 28.07.2022.
//

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
        Question(text: "Какую пищу вы предпочитаете?",
                 type: .single,
                 answers: [
                 Answer(text: "Стейк", type: .dog),
                 Answer(text: "Рыба", type: .cat),
                 Answer(text: "Морковь", type: .rabbit),
                 Answer(text: "Кукуруза", type: .turtule)
                 ]
                ),
        Question(text: "Что вам нравитьтся больше?",
                 type: .multiple,
                 answers: [
                 Answer(text: "Плавать", type: .dog),
                 Answer(text: "Спать", type: .cat),
                 Answer(text: "Обниматься", type: .rabbit),
                 Answer(text: "Есть", type: .turtule)
        ]
                 ),
        Question(text: "Любите ли вы поездки на машине?",
                 type: .ranged,
                 answers: [
                 Answer(text: "Обожаю", type: .dog),
                 Answer(text: "Нервничаю", type: .cat),
                 Answer(text: "Не замечаю", type: .rabbit),
                 Answer(text: "Ненавижу", type: .turtule)
                 ]
                )
        ]
    }
}
