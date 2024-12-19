#!/usr/bin/env python

"""
Pandoc filter to convert all headers to IAST for searchability
"""

from pandocfilters import toJSONFilter, Emph, Para, Header

def behead(key, value, format, meta):
  if key == 'Header' and value[0] >= 2:
    # return "abcd"
    # return (value[2])
    # print(value[2])
    return Header(value[0], value[1], value[2])
    #return Para([Emph(value[2])])

if __name__ == "__main__":
  toJSONFilter(behead)