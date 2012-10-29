original from http://getsymphony.com/download/xslt-utilities/view/20573/


```
	Name: HTML To Markdown Text;
	Version: 1.1.1;
	Date: 2009-05-05;
	Author: Michael Eichelsdoerfer;
	Description: Converts XHTML source code to Markdown text (http://daringfireball.net/projects/markdown/) or plain text;
	Credits: Inspired by Stephen Bau;
	Usage: <xsl:apply-templates select="path/to/your/node" mode="markdown"/>
	URL: http://symphony21.com/downloads/xslt/file/20573/
	Further reading: http://symphony21.com/forum/discussions/750/

	Parameters :
	
	(All parameters are global. Missing values will trigger default behaviour.):

	- h-style (headline-style)
		- (default): atx style headlines for h1 and h2 elements;
		- 'setex'; setex style headlines for h1 and h2 elements;
	- a-style (link-style)
		- (default): keep HTML syntax if non-convertible attributes are found;
		- 'markdown': convert **any** link to Markdown (loosing non-convertible attributes);
	- img-style (image-style)
		- (default): keep HTML syntax if non-convertible attributes are found;
		- 'markdown': convert **any** image tag to Markdown (loosing non-convertible attributes);
	- table-style
		- (default): keep HTML syntax;
		- 'break': break tables into one text paragraph for each cell (useful for email text);
	- escape-npss (escape number-period-space-sequence; see http://daringfireball.net/projects/markdown/syntax#list)
		- (default): perform escapes;
		- 'no': don't do it (useful for email text);
	- escape-out (escape output)
		- (default): disable-output-escaping is not used for blockquotes and code blocks;
		- 'no': 'disable-otput-escaping="yes"' for blockquotes and code blocks (useful for email text);
	- unparseables (unparseable HTML elements)
		- (default): keep HTML syntax;
		- 'strip': nomen est omen (useful for email text);
```

Copyright
---------

(the MIT License)

Copyright 2009 Michael Eichelsdoerfer

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
