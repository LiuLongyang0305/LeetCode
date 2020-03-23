// https://leetcode.com/problems/sort-integers-by-the-power-value/
class Solution {
    
    private typealias Pair = (num: Int, weight: Int)
    var memmo: [Int:Int] = [1:0,2: 1,4:2,8:3,16:4,32:5,64:6,128:7,256:8,512:9,1024:10]
    
    func getKth(_ lo: Int, _ hi: Int, _ k: Int) -> Int {

        
        var arr = Array<Pair>()
        for num in lo...hi {
            arr.append((num,getWeight(num: num)))
        }
        arr.sort { (p1, p2) -> Bool in
            if p1.weight == p2.weight {
                return p1.num < p2.num
            }
            return p1.weight < p2.weight
        }
        return arr[k - 1].num
    }
    private func getWeight( num: Int) -> Int {
        if let w = memmo[num] {
            return w
        }
        var ans = 0
        if num % 2 == 0 {
            ans =  1 + getWeight( num: num >> 1)
        
        } else {
            ans = 1 + getWeight( num: num * 3 + 1)
        }
        memmo[num] = ans
        return ans
    }
}