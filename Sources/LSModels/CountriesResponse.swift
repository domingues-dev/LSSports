//
//  File.swift
//  
//
//  Created by Nicolá Domingues on 25/09/2022.
//

import Foundation

public struct CountriesResponse: Codable {
  public let countries: [Country]
  public init(
    countries: [Country]
  ) {
    self.countries = countries
  }
  
  enum CodingKeys: String, CodingKey {
      case countries = "response"
  }
}

public struct Country: Codable {
  public let name: String?
  public let code: String?
  public let flag: String?
  public init(
    name: String?,
    code: String?,
    flag: String?
  ) {
    self.name = name
    self.code = code
    self.flag = flag
  }
}
