//https://leetcode.com/problems/iterator-for-combination/
extension Int {
     var toArr: [Bool] {
         var ans =  [Bool]()
         var temp = self
         while temp > 0 {
             ans.append(temp & 1 != 0)
             temp = temp >> 1
         }
         return ans
     }
  }
  extension Array where Element == Bool {
     var counterDigits: Int {
         var ans = 0
         for choosed in self {
             if choosed {
                 ans  += 1
             }
         }
         return ans
     }
  }
  class CombinationIterator {
 
     private var combinationLength = -1
     private var sortedStrs = [String]()
     private var currentIndex = 0
     init(_ characters: String, _ combinationLength: Int) {
         self.combinationLength = combinationLength
         createStrs(str: characters)
         currentIndex = 0
     }
 
     func next() -> String {
         currentIndex += 1
         return sortedStrs[currentIndex - 1]
     }
 
     func hasNext() -> Bool {
 
         return currentIndex < sortedStrs.count
     }
     private func createStrs(str: String) {
 
         guard combinationLength != 1 else {
             sortedStrs.append(contentsOf:str.map({ String($0)}).sorted())
             return
         }
         guard combinationLength != str.count else {
             sortedStrs.append(str)
             return
         }
         let chars = [Character](str)
         let length = str.count
         let maxNumber: Int = Int(pow(2.0, Double(length))) - 1
         for i in 0...maxNumber {
             let  arr = i.toArr
             if arr.counterDigits  == combinationLength {
                 var temp = ""
                 for j in 0..<arr.count {
                     if arr[j] {
                         temp.append(chars[j])
                     }
                 }
                 sortedStrs.append(temp)
             }
         }
         sortedStrs.sort()
     }
  }

/**
 * Your CombinationIterator object will be instantiated and called as such:
 * let obj = CombinationIterator(characters, combinationLength)
 * let ret_1: String = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */