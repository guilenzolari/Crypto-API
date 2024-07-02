//
//  City.swift
//  CryptoAPI
//
//  Created by Guilherme Ferreira Lenzolari on 02/07/24.
//

import Foundation

struct City: Codable {
    let de: String?
    let en: String
    let es, fr, ja, ptBR: String?
    let ru, zhCN: String?

    enum CodingKeys: String, CodingKey {
        case de, en, es, fr, ja
        case ptBR = "pt-BR"
        case ru
        case zhCN = "zh-CN"
    }
}
