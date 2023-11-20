//
//  Model.swift
//  APIData
//
//  Created by Apurva Jalgaonkar on 26/10/23.
//

import Foundation


struct ToDo: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
