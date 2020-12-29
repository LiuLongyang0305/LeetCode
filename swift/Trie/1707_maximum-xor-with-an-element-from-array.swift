// https://leetcode.com/problems/maximum-xor-with-an-element-from-array/
// TLE
class Solution {
    private class TrieNode {
        var left: TrieNode? = nil
        var right: TrieNode? = nil
    }
    private let root: TrieNode = TrieNode()
    private var sortedNumbers = [Int]()
    private var maxNumberBitLength = -1
    private var currentSortedNumberIndex = 0
    private var numbersCount = -1
    func maximizeXor(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
        
        self.sortedNumbers = nums.sorted()
        var maxNumber = sortedNumbers.last!
        for q in queries {
            if q[0] > maxNumber {
                maxNumber = q[0]
            }
        }
        self.maxNumberBitLength = 64 - maxNumber.leadingZeroBitCount
        self.numbersCount = sortedNumbers.count
        
        let N = queries.count
        var ans = Array<Int>(repeating: -1, count: N)
        let sortedQueries = (0..<N).sorted { (idx1, idx2) -> Bool in
            if queries[idx1][1] == queries[idx2][1] {
                return queries[idx1][0] <= queries[idx2][0]
            }
            return queries[idx1][1] < queries[idx2][1]
        }
        var map = [Int:Int]()
        for idx in sortedQueries {
            insertNumbers(lessThan: queries[idx][1])
            let s = queries[idx][0] << 32  | currentSortedNumberIndex
            if let v = map[s] {
                ans[idx] = v
            } else {
                if queries[idx][0] == 0 {
                    ans[idx] = sortedNumbers[currentSortedNumberIndex - 1]
                } else {
                    ans[idx] = queryXORResult(queries[idx][0])
                }
                map[s] = ans[idx]
            }
        }
        return ans
    }
    
    private func insertNumbers(lessThan limit: Int) {
        guard self.currentSortedNumberIndex < self.numbersCount else {
            return
        }
        while  self.currentSortedNumberIndex < self.numbersCount && sortedNumbers[currentSortedNumberIndex] <= limit  {
            
            let num = sortedNumbers[currentSortedNumberIndex]
            guard currentSortedNumberIndex == 0 || sortedNumbers[currentSortedNumberIndex - 1] != num else {
                currentSortedNumberIndex += 1
                continue
            }
            var currentRoot = root
            for curBit in stride(from: self.maxNumberBitLength - 1, through: 0, by: -1) {
                if num & (1 << curBit) == 0 {
                    if nil == currentRoot.left {
                        currentRoot.left = TrieNode()
                    }
                    currentRoot = currentRoot.left!
                } else {
                    if nil == currentRoot.right {
                        currentRoot.right = TrieNode()
                    }
                    currentRoot = currentRoot.right!
                }
            }
            currentSortedNumberIndex += 1
        }
    }
    
    private func queryXORResult(_ num: Int) -> Int {
        guard nil != root.left || nil != root.right else {
            return -1
        }
        var currentMaxXorValue = 0
        var currentXorNode = root
        for curBit in stride(from: self.maxNumberBitLength - 1, through: 0, by: -1) {
            if num & (1 << curBit) == 0 {
                if let r = currentXorNode.right {
                    currentMaxXorValue |= (1 << curBit)
                    currentXorNode = r
                } else {
                    currentXorNode = currentXorNode.left!
                }
            } else {
                if let l = currentXorNode.left {
                    currentMaxXorValue |= (1 << curBit)
                    currentXorNode = l
                } else {
                    currentXorNode = currentXorNode.right!
                }
            }
        }
        return currentMaxXorValue
    }
}

