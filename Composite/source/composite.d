/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module composite;
import std.array: array, join;
import std.algorithm: filter, map;

@safe
{
    interface Component
    {
        void operation();
        string toString();
    }

    class Leaf : Component
    {
        void operation()
        {
        }

        override string toString()
        {
            return "Leaf";
        }
    }

    class Branch : Component
    {
        private Component[] children;

        this(Component[] components...)
        {
            children = components.dup;
        }

        void operation()
        {
            foreach (child; children)
            {
                child.operation();
            }
        }

        void add(Component component)
        {
            children ~= component;
        }

        void remove(Component component)
        {
            children = children.filter!(c => c !is component).array;
        }

        override string toString()
        {
            return "Branch(" ~ children.map!(c => c.toString).join("+") ~ ")";
        }
    }
}
