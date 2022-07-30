//
//  Place.swift
//  droplane
//
//  Created by Vladimir Gusev on 10.07.2022.
//

import Foundation

struct Place: Decodable {
    let name: String
    let id: String
    let address: String
    let formattedRating: String
    let company: String
    let price: String
    let imageName: String
}
