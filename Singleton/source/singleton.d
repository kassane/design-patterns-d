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
    private static Singleton instance;
    private string value;

    // private module access (isn't C++ private class members)
    private this()
    {
        value = "FOO";
    }
    // public is default
    static Singleton getInstance()
    {
        if (instance is null)
        {
            instance = new Singleton();
        }
        return instance;
    }

    string getValue()
    {
        return value;
    }
}
