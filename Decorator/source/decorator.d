/*
* Copyright (c) 2024, Matheus C. França
* This code and the accompanying materials are made available under the terms
* of BSD-3 license, which accompanies this distribution. The full text of the
* license may be found at https://opensource.org/license/bsd-3-clause
*/
module decorator;
import std.string;

@safe:

interface Text
{
    string getContent();
}

// Concrete component
class PlainText : Text
{
    private string content;

    this(string content)
    {
        this.content = content;
    }

    string getContent()
    {
        return content;
    }
}

// Base decorator
class TextDecorator : Text
{
    protected Text wrappedText;

    this(Text text)
    {
        wrappedText = text;
    }

    string getContent()
    {
        return wrappedText.getContent();
    }
}

// Concrete decorators
class BoldDecorator : TextDecorator
{
    this(Text text)
    {
        super(text);
    }

    override string getContent()
    {
        return "<b>" ~ super.getContent() ~ "</b>";
    }
}

class ItalicDecorator : TextDecorator
{
    this(Text text)
    {
        super(text);
    }

    override string getContent()
    {
        return "<i>" ~ super.getContent() ~ "</i>";
    }
}

// Template mixin for creating decorators
mixin template DecoratorMixin(string tag)
{
    this(Text text)
    {
        super(text);
    }

    override string getContent()
    {
        return "<%s>%s</%s>".format(tag, super.getContent(), tag);
    }
}

// Using mixin to create a new decorator
class UnderlineDecorator : TextDecorator
{
    mixin DecoratorMixin!"u";
}

// UFCS (Uniform Function Call Syntax) extension method
Text bold(Text text)
{
    return new BoldDecorator(text);
}

Text italic(Text text)
{
    return new ItalicDecorator(text);
}

Text underline(Text text)
{
    return new UnderlineDecorator(text);
}
