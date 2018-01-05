//: Playground - noun: a place where people can play

import UIKit

class Note: NSObject, NSCoding {
    let title: String
    let text : String
    let timestamp: Date
    
    init(title: String, text: String, timestamp: Date) {
        self.title = title
        self.text = text
        self.timestamp = timestamp
    }
    
    override var description: String {
        return "Note(title: \"\(title)\", text: \"\(text)\", timestamp: \(timestamp))"
    }

    // MARK: - Coding
    
    struct PropertyKey {
        static let title = "title"
        static let text = "text"
        static let timestamp = "timestamp"
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObject(forKey: PropertyKey.title) as?
            String,
            let text = aDecoder.decodeObject(forKey: PropertyKey.text) as?
            String,
            let timestamp = aDecoder.decodeObject(forKey:
                PropertyKey.timestamp) as? Date else { return nil }
        
        self.init(title: title, text: text, timestamp: timestamp)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: PropertyKey.title)
        aCoder.encode(text, forKey: PropertyKey.text)
        aCoder.encode(timestamp, forKey: PropertyKey.timestamp)
    }

}

let note = Note(title: "A New Hope", text: "We have the plans", timestamp: Date())

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

let archiveURL = documentsDirectory.appendingPathComponent("notes")

let archivedNote = NSKeyedArchiver.archiveRootObject(note, toFile: archiveURL.path)

let unarchivedNote = NSKeyedUnarchiver.unarchiveObject(withFile: archiveURL.path) as? Note




