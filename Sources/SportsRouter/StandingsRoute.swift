//
//  StandingsRoute.swift
//  
//
//  Created by Nicolá Domingues on 26/09/2022.
//

import Foundation
import SwiftUI
import URLRouting
import LSModels

public enum StandingsRoute: Equatable {
  case fetch
}

let standingsRouter = OneOf {
  Route(.case(StandingsRoute.fetch))
}
