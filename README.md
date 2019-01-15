safari-bookmarks.pl
===================

Export Safari bookmarks (and reading list) as plain text (mac only).

Reads from `~/Library/Safari/Bookmarks.plist` or first arg (if supplied), writes to stdout.


Usage
-----

`safari-bookmarks.pl [-a] [file]`


Output
------

`title url [description]`


Search Safari bookmarks interactively from CLI
----------------------------------------------

**Open links(s) in browser :**
```
alias lk="safari-bookmarks.pl | uricolor.pl | fzf --ansi --exact --multi | urifind | xargs open"
```

**Copy links(s) to clipboard :**
```
alias lkc="safari-bookmarks.pl | uricolor.pl | fzf --ansi --exact --multi | urifind | xargs pbcopy"
```

- You need : [fzf](https://github.com/junegunn/fzf), [URI-Find](https://github.com/schwern/URI-Find) and [uricolor.pl](https://github.com/kal247/uricolor.pl).
- Since `open` uses _LaunchServices_ to determine which program to run, most common URIs such as `ftp://` or `ssh://`  are recognized! 
- You can use `urifind --schemeless` to find schemeless URIs.

