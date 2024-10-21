/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module singleton;

@safe:

class Singleton
{
    // private module access, isn't C++ class private members
    private
    {
        static Singleton instance_;
        string value_;

        this(string value)
        {
            value_ = value;
        }
    }

    static Singleton getInstance(string value)
    {

        if (instance_ is null)
        {

            instance_ = new Singleton(value);
        }
        return instance_;
    }

    string value() const @property
    {
        return value_;
    }
}
