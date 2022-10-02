//
//  FixturesEventsResponse.swift
//  
//
//  Created by Nicolá Domingues on 26/09/2022.
//

import Foundation

public struct FixturesEventsResponse: Codable {
  public let response: [FixturesEvent]
  
  public init(
    response: [FixturesEvent]
  ) {
    self.response = response
  }
}

public struct FixturesEvent: Codable {
  public let time: EventTime?
  public let team: Team?
  public let player: Player?
  public let assist: Player?
  public let type: FixturesEventType?
  public let detail: String?
  public let comments: String?
  
  public init(
    time: EventTime?,
    team: Team?,
    player: Player?,
    assist: Player?,
    type: FixturesEventType?,
    detail: String?,
    comments: String?
  ) {
    self.time = time
    self.team = team
    self.player = player
    self.assist = assist
    self.type = type
    self.detail = detail
    self.comments = comments
  }
  
}

public struct EventTime: Codable {
  public let elapsed: Int?
  public let extra: Int?
}

public struct Player: Codable {
  public let id: Int?
  public let name: String?

  public init(
    id: Int?,
    name: String?
  ) {
    self.id = id
    self.name = name
  }
}

public enum FixturesEventType: String, Codable, CaseIterable, Equatable {
  case Goal
  case Card
  case Subst = "subst"
  case Var
}
