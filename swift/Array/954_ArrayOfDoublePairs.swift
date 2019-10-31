//https://leetcode.com/problems/array-of-doubled-pairs/submissions/
class Solution {
    func canReorderDoubled(_ A: [Int]) -> Bool {
        var counter: [Int:Int] = [:]
        for num in A {
            let temp = num < 0 ? -num : num
            if let c = counter[temp] {
                counter[temp] = c + 1
            } else {
                counter[temp] = 1
            }
        }
        let sortedKeys = counter.keys.sorted()
        for key in sortedKeys {
            if let  c1 = counter[key] {
                if let  c2 = counter[key << 1] {
                    if c1 == c2 {
                        counter.removeValue(forKey: key)
                        counter.removeValue(forKey: key << 1)
                    } else if c1 > c2 {
                        return false
                    }  else {
                        counter.removeValue(forKey: key)
                        counter[key << 1] = c2 - c1
                    }
                } else {
                    return false
                }
            }
        }
        return true
    }
}