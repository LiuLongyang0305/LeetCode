#include<cstdio>

 //Definition for a binary tree node.
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};
 
class Solution {
public:
    TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
        if(NULL == root || (NULL == root->left && NULL == root->right)){
            return (TreeNode*)NULL;
        }else if (root == p || root == q)
        {
            return root;
        }  else
        {
            int min = p->val < q->val ? p->val : q->val;
            int max = p->val < q->val ? q->val : p->val;
            if(min > root->val){
                return lowestCommonAncestor(root->right,p,q);
            } else if (max < root->val)
            {
                return lowestCommonAncestor(root->left,p,q);
            } else
            {
                return root;
            }
        }
    }
};
int main(){
    return 0;
}