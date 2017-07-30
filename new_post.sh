#!/bin/bash

NAME=_drafts/$(date -I)-$1.markdown
touch $NAME

p(){
    echo $@ >> $NAME
}

p ---
p title: $1
p date: $(date -Is | awk 'gsub("T", " ")' | awk 'gsub("+", " +")') 
p categories: 
p ---
p some text
p
p "{% highlight python %}"
p 'if __name__ == "__main__":'
p '  print "Hello World!"'
p "{% endhighlight %}"

echo $NAME
