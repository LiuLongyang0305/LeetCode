//https://leetcode.com/problems/maximum-xor-of-two-numbers-in-an-array/
extension Int  {
    var binarySet: [Bool] {
        var ans = [Bool]()
        var temp  = self
        while temp > 0 {
            ans.append(temp & 1  == 1)
            temp >>= 1
        }
        return ans
    }
 }
 class Solution { 
    private static let mask  = [0,1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4194304, 8388608, 16777216, 33554432, 67108864, 134217728, 268435456, 536870912, 1073741824, 2147483648]
    func findMaximumXOR(_ nums: [Int]) -> Int {
        var bitToNum = [Int:Set<Int>]()
        var numToBinarySetBits = [Int:[Bool]]()
        var minVal = Int.max
        
        for num in nums {
            let arr  = num.binarySet
            numToBinarySetBits.updateValue(arr, forKey: num)
            if nil == bitToNum[arr.count] {
                bitToNum[arr.count] = []
            }
            bitToNum[arr.count]?.insert(num)
            minVal = min(minVal,num)
        }
        
        func getMaxXORValue(_ val: Int) -> Int {
            let arr = numToBinarySetBits[val]!
            var i = arr.count
            while i >= 1 && (arr[i - 1] || (!arr[i - 1] && nil == bitToNum[i])){
                i -= 1
            }
            guard let nextNums = bitToNum[i] else {
                return val ^ minVal
            }
            var ans = 0
            for nextNum in nextNums {
                ans = max(ans, nextNum ^ val)
            }
            return ans
        }
        
        guard bitToNum.count > 1 else {
            let key = bitToNum.keys.first!
            let tempNums = bitToNum[key]!
            if tempNums.count  == 1 {
                return 0
            }
            return findMaximumXOR(nums.map{ $0 ^ Solution.mask[key]})
        }
        
        let highestDigit = bitToNum.keys.max()!
        let potentialNums = bitToNum[highestDigit]!
        var ans = 0
        for num in potentialNums {
            //            print("num = \(num), val = \(getMaxXORValue(num))")
            ans = max(ans, getMaxXORValue(num))
        }
        return ans
    }
 }


class TrieNode {
    var left: TrieNode? = nil
    var right: TrieNode? = nil
}


class Solution {
    private let root = TrieNode()
    func findMaximumXOR(_ nums: [Int]) -> Int {
        let maxNumber = nums.max()!
        let maxNumberBitLength = 64 - maxNumber.leadingZeroBitCount
        var ans = 0
        for num in nums {
            var curNode: TrieNode = root
            var curXORValue = 0
            var xorNode: TrieNode = root
            for bit in stride(from: maxNumberBitLength - 1, through: 0, by:  -1) {
                
                if num & (1 << bit) == 0 {
                    if nil == curNode.left {
                        curNode.left = TrieNode()
                    }
                    curNode = curNode.left!
                    if let r = xorNode.right {
                        curXORValue |= (1 << bit)
                        xorNode = r
                    } else {
                        xorNode = xorNode.left!
                    }
                } else {
                    if nil == curNode.right {
                        curNode.right = TrieNode()
                    }
                    curNode = curNode.right!

                    if let l = xorNode.left {
                        curXORValue |= (1 << bit)
                        xorNode = l
                    } else {
                        xorNode = xorNode.right!
                    }
                }
            }
            ans = max(ans, curXORValue)
        }
        return ans
    }
}




