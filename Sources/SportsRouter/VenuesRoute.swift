//
//  VenuesRoute.swift
//  
//
//  Created by Nicolá Domingues on 26/09/2022.
//

import Foundation
import SwiftUI
import URLRouting
import LSModels

public enum VenuesRoute: Equatable {
  case fetch
}

let venuesRouter = OneOf {
  Route(.case(VenuesRoute.fetch))
}
