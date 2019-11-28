//https://leetcode.com/problems/contains-duplicate-iii/
class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        guard k > 0 else {
            return false
        }
        guard t >= 0 else {
            return false
        }
        guard nums.count > 1 else {
            return false
        }
        
        var map  = [Int:[Int]]()
        for index in 0..<nums.count {
            if nil == map[nums[index]] {
                map[nums[index]] = []
            }
            map[nums[index]]?.append(index)
        }
        
        guard t != 0 else {
            for (_,indices) in map {
                if indices.count > 1 {
                    for i in 0..<(indices.count - 1) {
                        if indices[i + 1] - indices[i] <= k {
                            return true
                        }
                    }
                }
            }
            return false
        }
        
        let sortedNumbers = Set<Int>(nums).sorted()
        guard var index = sortedNumbers.firstIndex(where: {$0 > sortedNumbers[0] + t}) else  {
            return true
        }
        
        var indicesSorted = [Int]()
        func insertAndCheck(_ indices: [Int]) -> Bool {
            for tempIndex in indices {
                if let firstIndex = indicesSorted.firstIndex(where: { $0 > tempIndex}) {
                    indicesSorted.insert(tempIndex, at: firstIndex)
                    if firstIndex > 0 && tempIndex - indicesSorted[firstIndex - 1] <= k {
                        return true
                    }
                    if indicesSorted[firstIndex + 1] - tempIndex <= k {
                        return true
                    }
                } else {
                    if !indicesSorted.isEmpty {
                        if tempIndex - indicesSorted.last! <= k {
                            return  true
                        }
                    }
                    indicesSorted.append(tempIndex)
                }
            }
            return false
        }
        
        func removeIndices(_ indices: [Int]) {
            for tempIndex in indices {
                indicesSorted.removeAll {$0 == tempIndex}
            }
        }
        
        for i in 0..<index {
            if let indices = map[sortedNumbers[i]] {
                if insertAndCheck(indices)  {
                    return true
                }
            }
        }
        
        var left = 0
        while index < sortedNumbers.count {
            while left < index && sortedNumbers[index] - sortedNumbers[left] > t  {
                if let indices = map[sortedNumbers[left]] {
                    removeIndices(indices)
                }
                left += 1
            }
            if let indices = map[sortedNumbers[index]] {
                if insertAndCheck(indices) {
                    return true
                }
            }
            index += 1
        }
        return false
    }
 }