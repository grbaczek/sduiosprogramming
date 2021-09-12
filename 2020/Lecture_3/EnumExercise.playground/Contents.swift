struct PlayingCard: CustomStringConvertible
{
    var description: String {
        return "\(rank) of \(suit)"
    }
    
    var storedDescription = "(rank) of (suit)"
    
    var suit: Suit
    var rank: Rank
    

}

enum Suit: String, CustomStringConvertible {
    case spades = "♠️"
    case hearts = "❤️"
    case clubs = "♣️"
    case diamonds = "♦️"
    
    static var all = [Suit.spades, .hearts, .diamonds, .clubs]
    
    var description: String { return rawValue }
}

enum Rank: CustomStringConvertible {
    case ace
    case face(String) // either J Q or K.
    case numeric(Int)
    
    var order: Int {
        switch self {
        case .ace: return 1
        case .numeric(let pips): return pips
        case .face(let kind) where kind == "J": return 11
        case .face(let kind) where kind == "Q": return 12
        case .face(let kind) where kind == "K": return 13
        default: return 0 //should probably be nil instead.
        }
    }
    
    static var all: [Rank] {
        var allRanks: [Rank] = [.ace]
        for pips in 2...10 {
            allRanks.append(Rank.numeric(pips))
        }
        allRanks += [Rank.face("J"),Rank.face("Q"),Rank.face("K")]
        return allRanks
    }
    
    var description: String {
        switch self {
        case .ace: return "A"
        case .numeric(let pips): return String (pips)
        case .face(let kind): return kind
        }
    }
    
}




var kingOfDiamonds = PlayingCard(suit: .diamonds, rank: .face("K"))
//Notice that we can shorthand Suit.diamonds and Rank.face("") to .diamonds and face("") respectively.
var kingSuit = kingOfDiamonds.suit
var kingRank = kingOfDiamonds.rank
var kingDescription = kingOfDiamonds.description
var kingOrder = kingOfDiamonds.rank.order



var rankArray = Rank.all
print(rankArray)


