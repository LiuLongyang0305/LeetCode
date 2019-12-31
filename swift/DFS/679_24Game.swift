 //https://leetcode.com/problems/24-game/
 class Solution {
    private var oneDigit = [Int:Set<Double>]()
    private var twoDigit = [Int:Set<Double>]()
    private var threeDigit = [Int:Set<Double>]()
    
    private let minTarget  = 24.0 - 1.0E-6
    private let maxTarget  = 24.0 + 1.0E-6
    
    init() {
        calculate()
    }
    func judgePoint24(_ nums: [Int]) -> Bool {
        let sortedNums = nums.sorted()
        
        func valid(num: Double) -> Bool {
            return num >= minTarget && num <= maxTarget
        }
        func judge(nums1: Set<Double>, nums2: Set<Double>) -> Bool {
            print(nums1)
            print(nums2)
            for first in nums1 {
                for second in nums2 {
                    if valid(num: first + second) || valid(num: first - second) || valid(num: second -  first) || valid(num: first *  second) || valid(num: first / second) || valid(num: second / first) {
                        return true
                    }
                }
            }
            return false
        }
        func isOKForThreePlusOne() -> Bool {
            var keysPair = Set<[Int]>()
            keysPair.insert([sortedNums[0],sortedNums[1] << 16 | sortedNums[2] << 8 | sortedNums[3]])
            keysPair.insert([sortedNums[1],sortedNums[0] << 16 | sortedNums[2] << 8 | sortedNums[3]])
            keysPair.insert([sortedNums[2],sortedNums[0] << 16 | sortedNums[1] << 8 | sortedNums[3]])
            keysPair.insert([sortedNums[3],sortedNums[0] << 16 | sortedNums[1] << 8 | sortedNums[2]])
            for keys in keysPair {
                if let nums1 = oneDigit[keys[0]]  {
                    if let nums2 = threeDigit[keys[1]] {
                        if judge(nums1: nums2, nums2: nums1) {
                            return true
                        }
                    }
                }
            }
            return false
        }
        func isOKForTwoPlusTwo() -> Bool {
            var keysPair = Set<[Int]>()
            keysPair.insert([sortedNums[0] << 8 | sortedNums[1],sortedNums[2] << 8 |  sortedNums[3]])
            keysPair.insert([sortedNums[0] << 8 | sortedNums[2],sortedNums[1] << 8 |  sortedNums[3]])
            keysPair.insert([sortedNums[0] << 8 | sortedNums[3],sortedNums[1] << 8 |  sortedNums[2]])
            
            for keys in keysPair {
                if let nums1 = twoDigit[keys[0]]  {
                    if let nums2 = twoDigit[keys[1]] {
                        if judge(nums1: nums1, nums2: nums2) {
                            return true
                        }
                    }
                }
            }
            return false
        }
        return isOKForTwoPlusTwo() || isOKForThreePlusOne()
    }
    private func calculate()  {
        for i in 1...9 {
            oneDigit[i] = []
            oneDigit[i]?.insert(Double(i))
        }
        for i in 1...9 {
            for j in i...9 {
                let key = i << 8 | j
                if twoDigit[key] == nil {
                    twoDigit[key] = []
                }
                twoDigit[key]?.insert(Double(i + j))
                twoDigit[key]?.insert(Double(i - j))
                twoDigit[key]?.insert(Double(j - i))
                twoDigit[key]?.insert(Double(i * j))
                twoDigit[key]?.insert(Double(i) / Double(j))
                twoDigit[key]?.insert(Double(j) / Double(i))
            }
        }
        for i in 1...9 {
            for j in i...9 {
                for k in j...9 {
                    let key = i << 16 | j << 8 | k
                    if threeDigit[key] == nil {
                        threeDigit[key] = []
                    }
                    
                    var key1 = i << 8 | j
                    var num1 = Double(k)
                    if let nums = twoDigit[key1] {
                        for num in nums {
                            threeDigit[key]?.insert(num1 + num)
                            threeDigit[key]?.insert(num1 - num)
                            threeDigit[key]?.insert(num - num1)
                            threeDigit[key]?.insert(num1 * num)
                            if num != 0 {
                                threeDigit[key]?.insert(num1 / num)
                            }
                            threeDigit[key]?.insert(num / num1)
                        }
                    }
                    key1 = j << 8 | k
                    num1 = Double(i)
                    if let nums = twoDigit[key1] {
                        let num1 =  Double(i)
                        for num in nums {
                            threeDigit[key]?.insert(num1 + num)
                            threeDigit[key]?.insert(num1 - num)
                            threeDigit[key]?.insert(num - num1)
                            threeDigit[key]?.insert(num1 * num)
                            if num != 0 {
                                threeDigit[key]?.insert(num1 / num)
                            }
                            threeDigit[key]?.insert(num / num1)
                        }
                    }
                    key1 = i << 8 | k
                    num1 = Double(j)
                    if let nums = twoDigit[key1] {
                        let num1 =  Double(j)
                        for num in nums {
                            threeDigit[key]?.insert(num1 + num)
                            threeDigit[key]?.insert(num1 - num)
                            threeDigit[key]?.insert(num - num1)
                            threeDigit[key]?.insert(num1 * num)
                            if num != 0 {
                                threeDigit[key]?.insert(num1 / num)
                            }
                            threeDigit[key]?.insert(num / num1)
                        }
                    }
                }
            }
        }
    }
 }