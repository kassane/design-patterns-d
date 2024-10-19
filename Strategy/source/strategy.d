/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module strategy;
import std.algorithm: swap, sort;

import std.range: array;

@safe:

interface SortStrategy(T)
{
    T[] sort(T[] data);
}

// Concrete strategies
class BubbleSort(T) : SortStrategy!T
{
    T[] sort(T[] data)
    {
        auto result = data.dup;
        for (int i = 0; i < result.length; i++)
        {
            for (int j = 0; j < result.length - 1 - i; j++)
            {
                if (result[j] > result[j + 1])
                {
                    swap(result[j], result[j + 1]);
                }
            }
        }
        return result;
    }
}

class QuickSort(T) : SortStrategy!T
{
    T[] sort(T[] data) @trusted
    {
        return data.dup.sort.array;
    }
}

// Context
class Sorter(T)
{
    private SortStrategy!T strategy;

    this(SortStrategy!T strategy)
    {
        this.strategy = strategy;
    }

    void setStrategy(SortStrategy!T strategy)
    {
        this.strategy = strategy;
    }

    T[] executeSort(T[] data)
    {
        return strategy.sort(data);
    }
}
