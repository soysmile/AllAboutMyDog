//
//  DogList.swift
//  MoreAboutYourDog
//
//  Created by George Heints on 18.01.2018.
//  Copyright © 2018 George Heints. All rights reserved.
//

import Foundation

struct info : Decodable {
    let dogs : [testing]
}
struct testing : Decodable{
    let name_ru : String?
    let name_en : String?
    let descr_ru : String?
    let descr_en : String?
}
