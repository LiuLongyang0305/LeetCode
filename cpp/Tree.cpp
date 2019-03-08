#include <cstdio>
#include <queue>
#include <list>
#include <vector>
#include <set>
#include <iostream>
//Definition for a binary tree node.
using namespace std;
struct TreeNode
{
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};
class Node
{
  public:
    int val;
    Node *left;
    Node *right;
    Node *next;

    Node() {}

    Node(int _val, Node *_left, Node *_right, Node *_next)
    {
        val = _val;
        left = _left;
        right = _right;
        next = _next;
    }
};

class Solution
{
  public:
    TreeNode *lowestCommonAncestor(TreeNode *root, TreeNode *p, TreeNode *q)
    {
        if (NULL == root || (NULL == root->left && NULL == root->right))
        {
            return (TreeNode *)NULL;
        }
        else if (root == p || root == q)
        {
            return root;
        }
        else
        {
            int min = p->val < q->val ? p->val : q->val;
            int max = p->val < q->val ? q->val : p->val;
            if (min > root->val)
            {
                return lowestCommonAncestor(root->right, p, q);
            }
            else if (max < root->val)
            {
                return lowestCommonAncestor(root->left, p, q);
            }
            else
            {
                return root;
            }
        }
    }

    Node *connect(Node *root)
    {
        if (NULL != root)
        {
            list<Node *> nodes = list<Node *>();
            nodes.push_back(root);
            while (!nodes.empty())
            {
                int length = nodes.size();
                for (int i = 0; i < length; i++)
                {
                    Node *temp = nodes.front();
                    nodes.pop_front();
                    if (length - 1 == i)
                    {
                        temp->next = NULL;
                    }
                    else
                    {
                        temp->next = nodes.front();
                    }
                    if (NULL != temp->left)
                    {
                        nodes.push_back(temp->left);
                    }
                    if (NULL != temp->right)
                    {
                        nodes.push_back(temp->right);
                    }
                }
            }
        }
        return root;
    }

    Node *connect2(Node *root)
    {
        if (NULL == root || (NULL == root->right && NULL == root->left))
        {
            return root;
        }
        list<pair<Node *, bool>> nodes;
        nodes.push_back(pair<Node *, bool>(root, false));
        while (!nodes.empty())
        {
            int length = nodes.size();
            list<pair<Node *, bool>>::iterator end = nodes.end();

            for (list<pair<Node *, bool>>::iterator it = nodes.begin(); it != end; it++)
            {
                Node *temp = (*it).first;
                nodes.pop_front();
                list<pair<Node *, bool>>::iterator it2 = nodes.begin();
                while (it2 != end)
                {
                    if ((*it2).second)
                    {
                        temp->next = (*it2).first;
                    }
                    it2++;
                }
                if (NULL != temp->left)
                {
                    nodes.push_back(pair<Node *, bool>(temp->left, false));
                }
                if (NULL != temp->right)
                {
                    nodes.push_back(pair<Node *, bool>(temp->right, false));
                }
            }
        }
        return root;
    }
};

int main()
{
    return 0;
}
