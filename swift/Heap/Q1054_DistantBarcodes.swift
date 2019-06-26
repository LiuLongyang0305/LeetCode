//https://leetcode.com/problems/distant-barcodes/
class Solution {
    func rearrangeBarcodes(_ barcodes: [Int]) -> [Int] {
        
        var count = Dictionary<Int,Int>()
        for ele in barcodes {
            if nil == count[ele] {
                count[ele] = 1
            } else {
                count[ele] = count[ele]! + 1
            }
        }

        var queue = Array<Int>(count.values)
        var maxCount = queue.max()!
        var result = Array<Int>(repeating: 0, count: barcodes.count)
        var barcodesCopy = Array<Int>()

        if maxCount >= barcodes.count / 2 {
            queue.sort()
            
            while !queue.isEmpty {
                let currentMax = queue.removeLast()
                let tempDic = count.filter { (arg0) -> Bool in
                    
                    let (_, value) = arg0
                    return value == currentMax
                }
                for (key,_) in tempDic {
                    if currentMax == 1 {
                        barcodesCopy.append(key)
                    } else {
                        let tempArr = Array<Int>(repeating: key, count: currentMax)
                        barcodesCopy.append(contentsOf: tempArr)
                    }
                    count.removeValue(forKey: key)
                }
            }
        } else {
            barcodesCopy = barcodes
            barcodesCopy.sort()
        }

        var i = 0
        while i < barcodes.count {
            result[i] = barcodesCopy.removeFirst()
            i += 2
        }
        i = 1
        while i < barcodes.count {
            result[i] = barcodesCopy.removeFirst()
            i += 2
        }
        return result
    }
}