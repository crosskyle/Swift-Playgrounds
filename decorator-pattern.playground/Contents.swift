//: Playground - noun: a place where people can play

import UIKit

protocol MacBook {
    
    var cost : Double { get }
    
    var description : String { get }
    
}

class MacBookAir : MacBook {
    
    var cost: Double {
        get {
            return 999
        }
    }
    
    var description: String {
        get {
            return "MacBook Air"
        }
    }
    
}

class MacBookPro: MacBook {
    
    var cost: Double {
        get {
            return 1599
        }
    }
    
    var description: String {
        get {
            return "MacBook Pro"
        }
    }
    
}

class MacBookRegular : MacBook {
    
    var cost: Double {
        get {
            return 1099
        }
    }
    
    var description: String {
        get {
            return "MacBook"
        }
    }
    
}

class MacBookDecorator : MacBook {
    
    var cost: Double {
        get {
            return mbInstance.cost
        }
    }
    
    var description: String {
        get {
            return mbInstance.description
        }
    }
    
    let mbInstance : MacBook
    
    required init(macbook: MacBook) {
        self.mbInstance = macbook
    }
}

final class ProcessorUpgrade : MacBookDecorator {
    
    override var cost: Double {
        get {
            return mbInstance.cost + 499
        }
    }
    
    override var description: String {
        get {
            return mbInstance.description + ", i7 Processor"
        }
    }
    
    required init(macbook: MacBook) {
        super.init(macbook: macbook)
    }
    
}

final class SSDUpgrade : MacBookDecorator {
    
    override var cost: Double {
        get {
            return mbInstance.cost + 299
        }
    }
    
    override var description: String {
        get {
            return mbInstance.description + ", 512gb SSD"
        }
    }
    
    
    required init(macbook: MacBook) {
        super.init(macbook: macbook)
    }
    
}

final class TouchBarUpgrade : MacBookDecorator {
    
    override var cost: Double {
        get {
            return mbInstance.cost + 199
        }
    }
    
    override var description: String {
        get {
            return mbInstance.description + ", w/ TouchBar"
        }
    }
    
    
    required init(macbook: MacBook) {
        super.init(macbook: macbook)
    }
    
}


var macbookRegular: MacBook = MacBookRegular()
print("Cost : £\(macbookRegular.cost), Description: \(macbookRegular.description)")
macbookRegular = ProcessorUpgrade(macbook: macbookRegular)
print("Cost : £\(macbookRegular.cost), Description: \(macbookRegular.description)")
macbookRegular = SSDUpgrade(macbook: macbookRegular)
print("Cost : £\(macbookRegular.cost), Description: \(macbookRegular.description)")
macbookRegular = TouchBarUpgrade(macbook: macbookRegular)
print("Cost : £\(macbookRegular.cost), Description: \(macbookRegular.description)\n")



