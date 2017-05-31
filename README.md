# Algorithms

/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////


对于n个元素的进栈-出栈一共有多少种可能性呢？
对与任意的n个元素的排列那些是合理的呢？
如何生成所有的出栈序列呢？
如是使用递归算法，可否给出对应的非递归形式的算法呢？

@interface Stack : NSObject

/*
题目1： 输入两个整数序列。其中一个序列表示栈的push顺序，
判断另一个序列有没有可能是对应的pop顺序。
为了简单起见，我们假设push序列的任意两个整数都是不相等的。（这是原题目的限制，下面算法没有这个限制）
比如输入的push序列是1、2、3、4、5，那么4、5、3、2、1就有可能是一个pop系列。
因为可以有如下的push和pop序列：
push 1，push 2，push 3，push 4，pop，push 5，pop，pop，pop，pop，
这样得到的pop序列就是4、5、3、2、1。
但序列4、3、5、1、2就不可能是push序列1、2、3、4、5的pop序列。
*/

BOOL isReasonablePopSequenceForPushSequence(NSArray * pushSequence, NSArray * popSequence);


//2017-05-28 10:49:49.773 Algorithms[21789:1171931] count = 1, possible = 1
//2017-05-28 10:49:49.774 Algorithms[21789:1171931] count = 2, possible = 2
//2017-05-28 10:49:49.774 Algorithms[21789:1171931] count = 3, possible = 5
//2017-05-28 10:49:49.774 Algorithms[21789:1171931] count = 4, possible = 14
//2017-05-28 10:49:49.774 Algorithms[21789:1171931] count = 5, possible = 42
//2017-05-28 10:49:49.774 Algorithms[21789:1171931] count = 6, possible = 132
//2017-05-28 10:49:49.774 Algorithms[21789:1171931] count = 7, possible = 429
//2017-05-28 10:49:49.775 Algorithms[21789:1171931] count = 10, possible = 167

//在非递归情况下，elementNum > 37时， 将产生溢出。
//在递归算法下，elementNum > 31时，将爆栈。

/*
扩展2.1：
对于n个入栈序列，一个push顺序，且当前栈中有0个入栈元素
输出所有可能的n个元素的pop序列数量。
为了简化问题，假设pop序列为1到n+m的整数序列。
*/
// max unpushed + pushed = 36
// max elementNum = 35
unsigned long long allPossiblePopOrderNumber_Recursion_Obsolete3(unsigned int unpushed, unsigned int pushed) StackDeprecated_Num;
unsigned long long allPossiblePopOrderNumber_NonRecursion_Obsolete2(unsigned int elementNum) StackDeprecated_Num;
unsigned long long allPossiblePopOrderNumber_NonRecursion_Obsolete1(unsigned int elementNum)  StackDeprecated_Num;


unsigned long long countOfAllPossiblePopSequencesByCatanat(unsigned int n);  //使用卡特兰 计算公式  max n = 30

/*
扩展2.2：
对于n个入栈序列，一个push顺序，且当前栈中有m个入栈元素
输出所有可能的n+m个元素的pop序列。
为了简化问题，假设pop序列为1到n+m的整数序列。

It's a good distributed algorithm for computing catalan number
*/
unsigned long long countOfAllPossiblePopSequences(unsigned int unpushed, unsigned int pushed);// max unpushed + pushed = 36

// f(n-1,k+1)<f(n,k)<f(n+1,k-1)




/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

/* 微软面试题
30.在从1到n的正数中1出现的次数（数组）
题目：输入一个整数n，求从1到n这n个整数的十进制表示中1出现的次数。
例如输入12，从1到12这些整数中包含1 的数字有1，10，11和12，1一共出现了5次。
分析：这是一道广为流传的google面试题。
*/
@interface CountOfOneInNaturalNumber : NSObject
unsigned long long  countOfOneIn(unsigned long long naturalNumber);
unsigned long long  countOfOneInRange(unsigned long long from, unsigned long long to);
@end


