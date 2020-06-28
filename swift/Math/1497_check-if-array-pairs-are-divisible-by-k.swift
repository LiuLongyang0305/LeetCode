// https://leetcode.com/problems/check-if-array-pairs-are-divisible-by-k/
class Solution1 {
    func canArrange(_ arr: [Int], _ k: Int) -> Bool {
        
        guard k != 1 else {
            return true
        }
        var counter = [Int:Int]()
        arr.forEach { (val) in
            let remainder = (val % k + k) % k
            if let c = counter[k - remainder] {
                if c == 1 {
                    counter.removeValue(forKey: k - remainder)
                } else {
                    counter[k - remainder ] = c - 1
                }
            } else {
                counter[remainder, default: 0 ] += 1
            }
        }
        if let c = counter[0], c % 2 == 0 {
            counter.removeValue(forKey: 0)
        }
        return counter.isEmpty
    }
}
class Solution {
    func canArrange(_ arr: [Int], _ k: Int) -> Bool {
        
        guard k != 1 else {
            return true
        }
        var counter = [Int:Int]()
        for num in arr {
            let temp = (num % k + k) % k
            counter[temp,default: 0 ] += 1
        }
        for i in 0..<k {
            guard !counter.isEmpty else {
                return true
            }
            if let c = counter[i] {
                if i == 0 {
                    guard c % 2 == 0 else {
                        return false
                    }
                    counter.removeValue(forKey: 0)
                } else {
                    guard let c1 = counter[k - i] else {
                        return false
                    }
                    guard c1 == c else {
                        return false
                    }
                    counter.removeValue(forKey: i)
                    counter.removeValue(forKey: k - i)
                }
            }
        }
        return false
    }
}