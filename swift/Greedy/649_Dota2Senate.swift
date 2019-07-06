//https://leetcode.com/problems/dota2-senate/
enum Vitor: String {
    case radiant = "Radiant"
    case dire = "Dire"
}
class Solution {
    func predictPartyVictory(_ senate: String) -> String {
        
        var count = Array<Int>(repeating: 0, count: 2)
        var map: Dictionary<Character,Int> = ["R":0,"D":1]
        for ch in senate {
            count[map[ch]!] += 1
        }

        var charArray = Array<Character>(senate)
        let senateNumber = senate.count
        var isBanded = Array<Bool>(repeating: false, count: senateNumber)
        
        var i = 0
        var j = 0
        
        func banOponent(_ belongTo: Character ) {
            var j = i + 1 >=  senateNumber ? 0 : i + 1
            
            while count[0] > 0 && count[1] > 0 {
                if charArray[j] == belongTo && !isBanded[j] {
                    isBanded[j] = true
                    count[map[belongTo]!] -= 1
                    break
                }
                j += 1
                if j >= senateNumber {
                    j = 0
                }
            }
        }
        
        while count[0] > 0 && count[1] > 0 {
            if !isBanded[i] {
                let belongTo: Character = charArray[i] == "D" ? "R" : "D"
                banOponent(belongTo)
            }
            i += 1
            if i >=  senateNumber {
                i = 0
            }
        }
        
        return count[0] == 0 ? Vitor.dire.rawValue : Vitor.radiant.rawValue
    }
}

class Solution2 {
    func predictPartyVictory(_ senate: String) -> String {
        var queue = Array<Int>()
        var people = Array<Int>(repeating: 0, count: 2)
        var bans = Array<Int>(repeating: 0, count: 2)
        
        for ch in senate {
            let x =  ch == "R" ? 1 : 0
            people[x] += 1
            queue.append(x)
        }
        
        while people[0] > 0 && people[1] > 0 {
            let x = queue.removeFirst()
            if bans[x] > 0 {
                bans[x] -= 1
                people[x] -= 1
            } else {
                bans[x ^ 1] += 1
                queue.append(x)
            }
        }
        return people[0] == 0 ? "Radiant" : "Dire"
    }
}
