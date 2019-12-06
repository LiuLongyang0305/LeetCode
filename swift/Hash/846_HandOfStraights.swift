// https://leetcode.com/problems/hand-of-straights/
class Solution {
    typealias Counter = [Int:Int]
    func isNStraightHand(_ hand: [Int], _ W: Int) -> Bool {
        guard W != 1 else {
            return true
        }
        guard hand.count % W == 0 else {
            return false
        }
        var counter: Counter =  [:]
        for num in hand {
            if let c = counter[num]  {
                counter.updateValue(c + 1, forKey: num)
            } else {
                counter.updateValue(1, forKey: num)
            }
        }
        let sortedKeys = counter.keys.sorted()
        for key in sortedKeys {
            if let c = counter[key] {
                for i in key...(W + key  - 1) {
                    guard let c2 = counter[i], c2 >= c else {
                        return false
                    }
                    if c2 == c {
                        counter.removeValue(forKey: i)
                    } else {
                        counter.updateValue(c2 - c, forKey: i)
                    }
                }
            }
        }
        return true
    }
 }