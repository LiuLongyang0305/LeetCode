/ https://leetcode.com/problems/finding-pairs-with-a-certain-sum/
class FindSumPairs {
    private var nums1: [Int]
    private var nums2: [Int]
    private var map1 =  [Int:Int]()
    private var map2 = [Int:Int]()

    init(_ nums1: [Int], _ nums2: [Int]) {
        self.nums1 = nums1
        self.nums2 = nums2
        nums1.forEach {map1[$0, default: 0 ]  += 1}
        nums2.forEach {map2[$0, default: 0 ]  += 1}
        // print(map1)
        // print(map2)
    }
    
    func add(_ index: Int, _ val: Int) {
        map2[nums2[index], default: 0] -= 1
        nums2[index]  += val
        map2[nums2[index], default: 0 ] += 1
        // print("*************")
        // print(map2)
    }
    
    func count(_ tot: Int) -> Int {
        var ans = 0
        for (num,cnt) in map1 {
            if let c =  map2[tot - num] {
                ans += cnt * c
            }
        }
        return  ans
    }
}

/**
 * Your FindSumPairs object will be instantiated and called as such:
 * let obj = FindSumPairs(nums1, nums2)
 * obj.add(index, val)
 * let ret_2: Int = obj.count(tot)
 */