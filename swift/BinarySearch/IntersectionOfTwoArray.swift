class Q349_Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let set1 : Set<Int> = Set<Int>(nums1)
        let set2 = Set<Int>(nums2)
        let intersection = set1.intersection(set2)
        return Array<Int>(intersection)
    }
}

class Q350_Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result = [Int]()
        var numsCount = Dictionary<Int,Int>()
        let targetNums = nums1.count < nums2.count ? nums1 : nums2
        let patternNums = nums1.count < nums2.count ? nums2 : nums1
        for num in targetNums {
            if nil != numsCount[num] {
                numsCount[num] = numsCount[num]! + 1
            } else {
                numsCount[num] = 1
            }
        }
        
        for num in patternNums  {
            if let count = numsCount[num] {
                if count > 0 {
                    result.append(num)
                }
                if count == 1 {
                    numsCount.removeValue(forKey: num)
                } else {
                    numsCount[num] = count - 1
                }
            }
        }
        return result
    }
}