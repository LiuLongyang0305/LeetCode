 // https://leetcode.com/problems/find-all-possible-recipes-from-given-supplies/
class Solution {
   func findAllRecipes(_ recipes: [String], _ ingredients: [[String]], _ supplies: [String]) -> [String] {
       let N = recipes.count
       var ans = Set<Int>()
       var suppliesSet = Set<String>(supplies)
       var lastCount = -1
       while  lastCount != ans.count {
           lastCount = ans.count

           for i in 0..<N {
               guard !ans.contains(i) else {
                   continue
               }
               var  flag = true
               for need in ingredients[i] {
                   guard suppliesSet.contains(need) else {
                       flag = false
                       break
                   }
               }
               if flag {
                   ans.insert(i)
                   suppliesSet.insert(recipes[i])
               }

           }
       }
       return ans.map { recipes[$0]}
   }
}