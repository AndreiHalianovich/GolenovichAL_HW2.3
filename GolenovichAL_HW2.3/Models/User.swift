//
//  User.swift
//  GolenovichAL_HW2.3
//
//  Created by Andrei Halianovich on 7.02.21.
//

struct User {
    let userName: String
    let password: String
    let person: Person
}

struct Person {
    let photoName: String
    let firstName: String
    let secondName: String
    let age: Int
    let height: Int
    let weight: Int
    let countryLiving: String
    let profession: String
    let favoriteColor: Colors
    let favoriteFood: String
    let hobby: String
    let interestingFact: String
    
    var fullName: String {
        "\(firstName) \(secondName)"
    }
}

enum Colors: String {
    case red = "Красный"
    case orange = "Оранжевый"
    case yellow = "Желтый"
    case green = "Зеленый"
    case blue = "Синий"
    case purple = "Фиолетовый"
    case white = "Белый"
    case black = "Черный"
    case brown = "Коричнеый"
    case grey = "Серый"
}

extension User {
    static func getUser() -> User {
        return User(userName: "User",
                    password: "Password",
                    person: Person(photoName: "myPhoto",
                                   firstName: "Андрей",
                                   secondName: "Голенович",
                                   age: 30,
                                   height: 180,
                                   weight: 76,
                                   countryLiving: "Беларусь",
                                   profession: "Менеджер ",
                                   favoriteColor: .white,
                                   favoriteFood: "паста",
                                   hobby: "Бег, музыка",
                                   interestingFact: "В дестсве очень любил  точные науки и ездил на все возможные олимпиады, хотел стать проффесором математики. Но жизнь внесла свои коррективы. После первого семестра высшей математики в университете любовь прошла 😂"))
    }
}

