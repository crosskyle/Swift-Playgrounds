//: Playground - noun: a place where people can play

import UIKit

struct Track {
    var trackNumber: Int
}

let tracks = [Track(trackNumber: 3), Track(trackNumber: 2), Track(trackNumber: 1), Track(trackNumber: 4)]

let sortedTracks = tracks.sorted(by: { (firstTrack, secondTrack) -> Bool in
    return firstTrack.trackNumber < secondTrack.trackNumber
})

let shortSortedTracks = tracks.sorted { $0.trackNumber < $1.trackNumber }


let names = ["johnny", "nellie", "aaron", "rachel"]
let fullNames = names.map { (name) -> String in
    return name + " smith"
}
let shortFullNames = names.map { $0 + " smith" }

let numbers = [8, 6, 7, 5, 3, 0, 9]
let total = numbers.reduce(0, { $0 + $1})

