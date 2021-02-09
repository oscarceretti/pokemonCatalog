//
//  PokemonList.swift
//  PokemonCatalog
//
//  Created by Oscar Ceretti on 09/02/2021.
//

import Foundation
import Foundation

// MARK: - PokemonList
struct PokemonList: Codable {
    let count: Int
    let next, previous: String?
    let results: [Pokemon]
}

// MARK: - Pokemon
struct Pokemon: Codable {
    let name: String
    let url: String
}

struct Employees: Decodable {
    let status: String
    let data: [EmployeeData]
}

// MARK: - EmployeeData
struct EmployeeData: Decodable {
    let id, employeeName, employeeSalary, employeeAge: String
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
