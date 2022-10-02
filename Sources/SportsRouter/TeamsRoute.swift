//
//  TeamsRoute.swift
//  
//
//  Created by Nicolá Domingues on 26/09/2022.
//

import Foundation
import SwiftUI
import URLRouting
import LSModels

public enum TeamsRoute: Equatable {
  case fetch
  case statistics
  case seasons
}

let teamsRouter = OneOf {
  Route(.case(TeamsRoute.fetch))
  Route(.case(TeamsRoute.statistics)) {
    Path { "statistics" }
  }
  Route(.case(TeamsRoute.seasons)) {
    Path { "seasons" }
  }
}

