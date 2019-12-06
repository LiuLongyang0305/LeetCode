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