//
//  FixturesStatisticsResponse.swift
//  
//
//  Created by Nicolá Domingues on 26/09/2022.
//

import Foundation

public struct FixturesStatisticsResponse: Codable {
  public let response: [FixtureStatisticsResponse]
  
  public init(
    response: [FixtureStatisticsResponse]
  ) {
    self.response = response
  }
}

public struct FixtureStatisticsResponse: Codable {
  public let team: Team?
  public let statistics: [FixtureStatistic]
  
  public init(
    team: Team?,
    statistics: [FixtureStatistic]
  ) {
    self.team = team
    self.statistics = statistics
  }
}

public struct FixtureStatistic: Codable {
  public var type: FixtureStatisticType?
  public var value: String?
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self) // The compiler creates coding keys for each property, so as long as the keys are the same as the property names, we don't need to define our own enum.
    do {
      self.value = try container.decode(String.self, forKey: .value)
      self.type = try container.decode(FixtureStatisticType.self, forKey: .type)
    } catch {
      // The check for a String and then cast it, this will throw if decoding fails
      if let valueInt = try? container.decode(Int.self, forKey: .value),
         let type = try? container.decode(FixtureStatisticType.self, forKey: .type) {
        self.value = String(valueInt)
        self.type = type
      } else {
        self.type = try! container.decode(FixtureStatisticType.self, forKey: .type)

        // You may want to throw here if you don't want to default the value(in the case that it you can't have an optional).
        self.value = "0"
      }
    }
  }
}

public enum FixtureStatisticType: String, Codable, CaseIterable, Equatable {
  case shotOnGoal = "Shots on Goal"
  case shotOffGoal = "Shots off Goal"
  case shotsInsideBox = "Shots insidebox"
  case shotsOutsideBox = "Shots outsidebox"
  case totalShots = "Total Shots"
  case blockedShots = "Blocked Shots"
  case fouls = "Fouls"
  case cornerKicks = "Corner Kicks"
  case offsides = "Offsides"
  case ballPossession = "Ball Possession"
  case yellowCards = "Yellow Cards"
  case redCards = "Red Cards"
  case goalkeeperSaves = "Goalkeeper Saves"
  case totalPasses = "Total passes"
  case passesAccurate = "Passes accurate"
  case passesPercentage = "Passes %"
  
//  enum CodingKeys: String, CodingKey {
//    case shotOnGoal = "Shots on Goal"
//    case shotOffGoal = "Shots off Goal"
//    case shotsInsideBox = "Shots insidebox"
//    case shotsOutsideBox = "Shots outsidebox"
//    case totalShots = "Total Shots"
//    case blockedShots = "Blocked Shots"
//    case fouls = "Fouls"
//    case cornerKicks = "Corner Kicks"
//    case offsides = "Offsides"
//    case ballPossession = "Ball Possession"
//    case yellowCards = "Yellow Cards"
//    case redCards = "Red Cards"
//    case goalkeeperSaves = "Goalkeeper Saves"
//    case totalPasses = "Total passes"
//    case passesAccurate = "Passes accurate"
//    case passesPercentage = "Passes %"
//  }
}

public struct FixtureStatisticsRequest: Decodable, Equatable {
  public var fixture: Int = 215662
  public var team: Int = 463
  
  public init(
    fixture: Int = 215662,
    team: Int = 463
  ) {
    self.fixture = fixture
    self.team = team
  }
}
