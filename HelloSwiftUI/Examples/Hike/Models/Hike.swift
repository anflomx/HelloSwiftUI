//
//  Hike.swift
//  HelloSwiftUI
//
//  Created by Antonio Flores on 28/01/24.
//

import SwiftUI

struct Hike: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let photo: String
    let miles: Double
}
