safari-bookmarks.pl
===================

Export Safari bookmarks (and reading list) as plain text (mac only).

Reads from `~/Library/Safari/Bookmarks.plist` or first arg (if supplied), writes to stdout.


usage
-----

`safari-bookmarks.pl [-a] [file]`


output
------

`title url [description]`

example
-------

To interactively search and open bookmarks from CLI, add these lines to your bash profile :

**Open links(s) in browser :**
```
alias lk="safari-bookmarks.pl | uricolor.pl | fzf --ansi --exact --multi | urifind | xargs open"
```

Since `open` uses _LaunchServices_ to determine which program to run, common URIs are recognized, such as `ftp://` or `ssh://`. 

**Copy links(s) to clipboard :**
```
alias lkc="safari-bookmarks.pl | uricolor.pl | fzf --ansi --exact --multi | urifind | xargs pbcopy"
```

You'll need :
- [fzf](https://github.com/junegunn/fzf)
- [urifind](https://github.com/schwern/URI-Find)
- [uricolor.pl](https://github.com/kal247/uricolor.pl)
