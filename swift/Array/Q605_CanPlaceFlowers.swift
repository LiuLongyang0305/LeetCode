//https://leetcode.com/problems/can-place-flowers/
class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        
        guard n != 0 else {
            return true
        }
        if n == 1 && flowerbed.count == 1 {
            return !(flowerbed[0] == 1)
        }
        
        let temp1 = flowerbed.filter { (val) -> Bool in
            val == 0
        }
        
        guard (temp1.count + 1) / 2 >= n else {
            return false
        }
        
        var flowerbedCopy = flowerbed
        var count = 0
        if flowerbedCopy[0] != 1 {
            if flowerbedCopy[1] == 0 {
                flowerbedCopy[0] = 1
                count += 1
                if count == n {
                    return true
                }
            }
        }
        var i = 1
        while i < flowerbedCopy.count - 1 {
            var increase = 1
            if flowerbedCopy[i] == 0 {
                if flowerbedCopy[ i - 1] == 0 {
                    if i == flowerbedCopy.count - 1 {
                        flowerbedCopy[i] = 1
                        count += 1
                        increase = 2
                    } else {
                        if flowerbedCopy[i + 1] == 0 {
                            flowerbedCopy[i] = 1
                            count += 1
                            increase = 2
                        }
                    }
                }
            }
            i += increase
        }
        return count >= n
    }
}