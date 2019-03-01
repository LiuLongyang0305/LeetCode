class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [Int]()
        var dic = Dictionary<Int,Int>()
        for i in 0..<nums.count {
            if let lastIndex = dic[target - nums[i]] {
                result.append(contentsOf: [lastIndex,i])
                return result
            } else {
                dic[nums[i]] = i
            }
        }
        return result
    }
    func singleNumber(_ nums: [Int]) -> Int {
        var result : Int = nums[0]
        for num in nums[1...] {
            result ^= num
        }
        return result
    }
    
    func isHappy(_ n: Int) -> Bool {
        var visited = Set<Int>()
        var num = n
        while 1 != num && !visited.contains(num) {
            visited.insert(num)
            var sum : Int = 0
            while num > 0 {
                let temp : Int = num % 10
                sum += temp * temp
                num = num / 10
            }
            num = sum
        }
        return num == 1 ? true : false
    }
    
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        typealias ExistedPlaces = (rows: Set<Int>,cols:Set<Int>,blocks:Set<Int>)
        var dic = Dictionary<Character,ExistedPlaces>()
        for i in 0...8{
            for j in 0...8 {
                if board[i][j] != "." {
                    let currentBlock = i / 3 * 3 + j / 3
                    if var existPlace = dic[board[i][j]] {
                        if existPlace.cols.contains(j) {
                            return false
                        } else {
                            dic[board[i][j]]!.cols.insert(j)
                        }
                        if existPlace.rows.contains(i){
                            return false
                        } else {
                            existPlace.rows.insert(i)
                        }
                        if existPlace.blocks.contains(currentBlock) {
                            return false
                        } else {
                            existPlace.blocks.insert(currentBlock)
                        }
                    }  else {
                        var existPlaces : ExistedPlaces = (Set<Int>(),Set<Int>(),Set<Int>())
                        existPlaces.cols.insert(j)
                        existPlaces.rows.insert(i)
                        existPlaces.blocks.insert(currentBlock)
                        dic[board[i][j]] = existPlaces
                    }
                }
            }
        }
        return true
    }
    
    func repeatedNTimes(_ A: [Int]) -> Int {
        var countDic = Dictionary<Int,Int>()
        let halfLength = A.count / 2
        for num in A {
            if nil != countDic[num] {
                countDic[num] = countDic[num]! + 1
                if countDic[num]! == halfLength {
                    return num
                }
            } else {
                countDic[num] = 1
            }
        }
        return 0
    }
    
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var dic : Dictionary<Character,Set<Character>> = Dictionary<Character,Set<Character>>()
        for index in order.indices {
            dic[order[index]] = Set<Character>(order[index..<order.endIndex])
        }
        for i in 0..<(words.count - 1) {
            
            var index1 = words[i].startIndex
            var index2 = words[i + 1].startIndex
            let endIndex1 = words[i].endIndex
            let endIndex2 = words[i + 1].endIndex
            
            while index1 != endIndex1 && index2 != endIndex2 && words[i][index1] == words[i + 1][index2] {
                index1 = words[i].index(after: index1)
                index2 = words[i + 1].index(after: index2)
            }
            if index1 == endIndex1 {
                continue
            } else {
                if index1 != endIndex1 && index2 == endIndex2 {
                    return false
                } else {
                    if !(dic[words[i][index1]]?.contains(words[i + 1][index2]))! {
                        return false
                    }
                }
            }
        }
        return true
    }
    
    func uncommonFromSentences(_ A: String, _ B: String) -> [String] {
        let str = A + " " + B
        var dic = Dictionary<String,Int>()
        var result = [String]()
        let subStr = str.split(separator: " ")
        let subs = subStr.map { String($0)}
        for sub in subs {
            if nil == dic[sub] {
                dic[sub] = 1
            } else {
                dic[sub] = dic[sub]! + 1
            }
        }
        for (key,value) in dic {
            if value == 1 {
                result.append(key)
            }
        }
        return result
    }
    
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        var sourceStructure = Dictionary<Character,Set<Int>>()
        var targetStructure = Dictionary<Character,Set<Int>>()
        let length : Int = s.count
        var i : Int = 0
        var index1 = s.startIndex
        var index2 = t.startIndex
        while i < length {
            let currentSourceChar = s[index1]
            let currentTargetChar = t[index2]
            if nil == sourceStructure[currentSourceChar] {
                sourceStructure[currentSourceChar] = Set<Int>()
            }
            sourceStructure[currentSourceChar]?.insert(i)
            if nil == targetStructure[currentTargetChar] {
                targetStructure[currentTargetChar]  = Set<Int>()
            }
            targetStructure[currentTargetChar]?.insert(i)
            
            if !(sourceStructure[currentSourceChar]! == targetStructure[currentTargetChar]!){
                return false
            }
            i += 1
            index1 = s.index(after: index1)
            index2 = t.index(after: index2)
        }
        return true
    }
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set = Set<Int>()
        for num in nums {
            if set.contains(num) {
                return true
            } else {
                set.insert(num)
            }
        }
        return false
    }
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dic = Dictionary<Int,Set<Int>>()
        for i in 0..<nums.count {
            if nil == dic[nums[i]] {
                dic[nums[i]] = Set<Int>()
            } else {
                for j in dic[nums[i]]! {
                    if i - j <= k {
                        return true
                    }
                }
            }
            dic[nums[i]]?.insert(i)
        }
        return false
    }
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        typealias Count = (inSource:Int,inTarget: Int)
        var charCount = Dictionary<Character,Count>()
        var index = s.startIndex
        while index != s.endIndex {
            if nil == charCount[s[index]] {
                charCount[s[index]] = (1,0)
            } else {
                charCount[s[index]]!.inSource = (charCount[s[index]]?.inSource)! + 1
            }
            index = s.index(after: index)
        }
        index = t.startIndex
        while index < t.endIndex {
            if nil == charCount[t[index]]{
                return false
            } else {
                charCount[t[index]]!.inTarget = (charCount[t[index]]?.inTarget)! + 1
            }
            index = t.index(after: index)
        }
        //        for (_ ,value) in charCount {
        //            if value.inSource != value.inTarget {
        //                return false
        //            }
        //        }
        let result = charCount.filter { (arg0) -> Bool in
            let (_, value) = arg0
            return value.inSource != value.inTarget
        }
        return result.count > 0
    }
}

