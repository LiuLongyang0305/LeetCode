// https://leetcode.com/problems/decode-xored-permutation/
class Solution {
    func decode(_ encoded: [Int]) -> [Int] {     
    
    var result = [Int](repeating: 0, count: encoded.count+1)
    var LastElement = 0
    
    
    
    for index in 0...encoded.count {
        if index % 2 == 0 && index < encoded.count{
            LastElement ^= encoded[index]
        }
        LastElement ^= (index + 1)
    }
    
    result[encoded.count] = LastElement
    
    for index in 1...encoded.count {
        result[encoded.count-index] = result[encoded.count-index+1] ^ encoded[encoded.count-index]
    }
    return result
    }
}


