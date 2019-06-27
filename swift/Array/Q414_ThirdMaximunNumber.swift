//https://leetcode.com/problems/third-maximum-number/
class Solution {
    typealias ThreeMaxNumbers = (min:Int?, second: Int?, max: Int?)
    var heap: [Int] = Array<Int>()
    
    func thirdMax(_ nums: [Int]) -> Int {
        guard nums.count > 2 else {
            return nums.max()!
        }
        for ele in nums {
            insert(ele: ele)
        }
        return heap.count == 3 ? heap[0] : heap.last!
    }
    
    private func insert(ele: Int) {
        if !heap.contains(ele) {
            if heap.count < 3 {
                heap.append(ele)
                heap.sort()
            } else {
                if ele > heap[0] {
                    heap.removeFirst()
                    if ele < heap[0] {
                        heap.insert(ele, at: 0)
                    } else if ele < heap[1] {
                        heap.insert(ele, at: 1)
                    } else {
                        heap.append(ele)
                    }
                }
            }
        }
    }
}
