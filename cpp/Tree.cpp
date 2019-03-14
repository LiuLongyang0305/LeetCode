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
class AnnotatedNode
{
  public:
    Node *node;
    bool isRight;
    int level;
    AnnotatedNode() {}
    AnnotatedNode(Node *_node, bool _isRight, int _level)
    {
        node = _node;
        isRight = _isRight;
        level = _level;
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
        list<AnnotatedNode> nodes;
        int level = 0;
        nodes.push_back(AnnotatedNode(root, false, level));
        while (!nodes.empty())
        {
            level++;
            int length = nodes.size();
            list<AnnotatedNode>::iterator end = nodes.end();
            int i = 0;
            for (; i < length; i++)
            {
                AnnotatedNode annotatedNode = nodes.front();
                nodes.pop_front();

                if (i != length - 1)
                {
                    for (list<AnnotatedNode>::iterator it = nodes.begin(); it != nodes.end(); it++)
                    {
                        AnnotatedNode temp = *it;
                        if(temp.isRight == true &&  temp.level == annotatedNode.level){
                            annotatedNode.node->next = (*it).node;
                            break;
                        }
                    }
                }
                if (annotatedNode.node->left != NULL)
                {
                    nodes.push_back(AnnotatedNode(annotatedNode.node->left, false, level));
                }
                if (annotatedNode.node->right != NULL)
                {
                    nodes.push_back(AnnotatedNode(annotatedNode.node->right, true, level));
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
