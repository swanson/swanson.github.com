from argparse import ArgumentParser
import re
from datetime import date

p = ArgumentParser(description='Generate a jeykll blog post template')
p.add_argument('title', help='title of the post, generates slug')
p.add_argument('category', help='category (e.g blog, writeup)')
args = p.parse_args()

template = '''---
layout: %s
title: %s
categories:
- %s
---

Go-go-gadget blog post
'''

def slugify(value):
    "slugify non-crazy strings"
    value = unicode(re.sub('[^\w\s-]', '', value).strip().lower())
    return re.sub('[-\s]+', '-', value)

fn = str(date.today()) + '-' + slugify(args.title) + '.md'
layout = "writeup" if args.category == "writeup" else "post"
post = template % (layout, args.title, args.category)

with open('_posts/%s' % fn, 'w') as fp:
    fp.write(post)
print "generated %s" % fn
