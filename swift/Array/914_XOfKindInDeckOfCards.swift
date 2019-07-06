//https://leetcode.com/problems/x-of-a-kind-in-a-deck-of-cards/submissions/
class Solution {
    func hasGroupsSizeX(_ deck: [Int]) -> Bool {
        guard deck.count > 2 else {
            if deck.count == 1 {
                return false
            }
            return deck[0] == deck[1]
        }
        var countData = Array<Int>(repeating: 0, count: 10000)
        for ele in deck {
            countData[ele] += 1
        }
        countData = countData.filter({ (val) -> Bool in
            val != 0
        })
        let minCount = countData.min()!
        if minCount == 1 {
            return false
        }
        let factors = [ 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101,
                        103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197,
                        199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313]
        
        var potentialFactors = [Int]()
        for i in 0..<factors.count {
            if factors[i] <= minCount && minCount % factors[i] == 0 {
                potentialFactors.append(factors[i])
            }
        }
        
        while !potentialFactors.isEmpty {
            let currentFactor = potentialFactors.removeLast()
            var i = 0
            while i < countData.count && countData[i] % currentFactor == 0 {
                i += 1
            }
            if i == countData.count {
                return true
            }
        }
        return false
    }
}