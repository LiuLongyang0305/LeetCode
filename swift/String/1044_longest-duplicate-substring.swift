// https://leetcode.com/problems/longest-duplicate-substring/
// https://leetcode.com/problems/longest-duplicate-substring/
class Solution {
    
    private let base = 26
    private let primer = 19260817
    private let asciiValueOfa = 97
    private let maxLength = 30000
    private var nums = [Int]()
    private var chars = [Character]()
    private var ans: String = ""
    private var power: [Int]

    init() {
        power = Array<Int>(repeating: 1, count: maxLength)
        for idx in 1..<maxLength {
            power[idx] = (power[idx - 1] * base) % primer
        }
    }
    func longestDupSubstring(_ s: String) -> String {
        
        guard s.count > 1 else {
            return ""
        }
        
        initiate(s)
        
        var low = 0
        var high = s.count
        
        while low <= high {
            let mid = low + (high - low) >> 1
            let temp = validate(mid)
            if temp.isEmpty {
                high = mid - 1
            } else {
                if temp.count > ans.count {
                    ans = temp
                }
                low = mid + 1
            }
        }
        return ans
    }
    
    private func initiate(_ s: String) {
        nums = s.map({ Int($0.asciiValue!) - asciiValueOfa})
        chars = [Character](s)
        ans = ""
    }
    
    private func validate(_ desire: Int) -> String {
        guard desire > 0 else {
            return ""
        }
        
        var hash = [Int:[Int]]()
        var current = 0
        for i in 0..<desire {
            current = ((current * base) % primer + nums[i]) % primer
        }
        hash[current] = [0]
        
        for i in desire..<nums.count {
            current = ((current - power[desire - 1] * nums[i - desire]) % primer + primer) % primer
            current = (current * base + nums[i]) % primer
            let startIndex = i - desire + 1
            
            if let rel = hash[current] {
                for it in rel {
                    guard !check(it, startIndex,desire) else {
                        return String(chars[startIndex...i])
                    }
                }
                hash[current, default: []].append(startIndex)
            } else {
                hash[current, default: []].append(startIndex)
            }
        }
        return ""
    }
    
    private func check(_ s1: Int, _ s2: Int,_ desire: Int) -> Bool {
        for i in 0..<desire {
            guard chars[s1 + i] == chars[s2 + i] else {
                return false
            }
        }
        return true
    }
}


class Solution {
    
    private let base = 26
    private let modulus = 19260817
    private let asciiValueOfa = 97
    private var power: [Int]
    private let maxLength = 30_000
    
    init() {
        power = Array<Int>(repeating: 1, count: maxLength)
        for idx in 1..<maxLength {
            power[idx] = (power[idx - 1] * base) % modulus
        }
    }
    func longestDupSubstring(_ s: String) -> String {
        
        let nums = s.map({ Int($0.asciiValue!) - asciiValueOfa})
        
        func initialHash(_ length: Int) -> Int {
            var hash = 0
            for i in 0..<length {
                hash = ((hash * base) % modulus + nums[i]) % modulus
            }
            return hash
        }
        
        func  nextHash(_ prevHash: Int, _ dropped: Int, _ added: Int, _ hashMultiplier: Int) -> Int {
            let hash = ((prevHash - hashMultiplier * dropped) % modulus + modulus) % modulus
            return (hash * base + added) % modulus
        }
        
        func check(_ s1: Int, s2: Int, _ length: Int) -> Bool {
            for offset in 0..<length {
                guard nums[s1 + offset] == nums[s2 + offset ] else {
                    return false
                }
            }
            return true
        }
        
        func search(_ length: Int) -> Int {
            guard length > 0 && length < s.count else {
                return -1
            }
            var seen = [Int:[Int]]()
            var hash = initialHash(length)
            seen[hash, default: []].append(0)
            
            for i in 1...(nums.count - length) {
                let endIdx = i + length - 1
                hash = nextHash(hash, nums[i - 1], nums[endIdx], power[length - 1])
                guard let rel = seen[hash] else {
                    seen[hash, default: []].append(i)
                    continue
                }
                for startIdx in rel {
                    guard !check(startIdx, s2: i, length) else {
                        return startIdx
                    }
                }
                seen[hash, default: []].append(i)
            }
            
            return -1
        }
        
        var result:(index:Int,length:Int) = (-1,-1)
        
        var left = 0
        var right = nums.count
        
        while left <= right {
            let length = left + (right - left) >> 1
            let index = search(length)
            if index < 0 {
                right = length - 1
            } else {
                if length > result.length {
                    result = (index,length)
                }
                left = length + 1
            }
        }
        guard result.length > 0 else {
            return ""
        }
        let startIndex = s.index(s.startIndex, offsetBy: result.index)
        let endIndex = s.index(startIndex, offsetBy: result.length)
        return String(s[startIndex..<endIndex])
    }
}



