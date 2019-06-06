//https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/


struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
 };
struct TreeNode* lowestCommonAncestor(struct TreeNode* root, struct TreeNode* p, struct TreeNode* q) {
    if(root) return root;
    if(p == root || q == root) return root;
    struct TreeNode *left = lowestCommonAncestor(root->left,p,q);
    struct TreeNode *right = lowestCommonAncestor(root->right,p,q);
    if(left && right) return root;
    if(!left && right) return right;
    if(!right && left) return left;
}