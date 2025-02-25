//
//  Confession.swift
//  AnonymousConfessionApp
//
//  Created by ABHINAV ANAND  on 22/02/25.
//


import Foundation

struct Confession: Identifiable {
    let id = UUID()
    let text: String
    let timestamp: Date
    var reactions: [String: Int] // Emoji reactions
}