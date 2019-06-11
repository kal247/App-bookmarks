safari-bookmarks.pl
===================

Export Safari bookmarks (and reading list) as plain text (mac only).

Reads from `~/Library/Safari/Bookmarks.plist` or first arg (if supplied), writes to stdout.


Usage
-----

```
safari-bookmarks.pl [-a] [file]
    -a    all : export description
```


Output
------

`title url [description]`


Search Safari bookmarks interactively from CLI
----------------------------------------------

![](tty.gif)

- You need : [fzf](https://github.com/junegunn/fzf) (homebrew), [URI-Find](https://github.com/schwern/URI-Find) (perlbrew) and [uricolor.pl](https://github.com/kal247/uricolor.pl).
- `uricolor.pl` colorizes URIs to distinguish them from text.
- `fzf` is a fuzzy finder (many options) : use TAB for multiplie selection, press ENTER to confirm, or ESC to cancel.
- `urifind` extracts all URIs, so any text (file) will work. Try `--schemeless` option to find schemeless URIs.
- Selected URIs will open with your default browser.
- Since `open` uses _LaunchServices_ to determine which program to run, most common URIs such as `ftp://` or `ssh://`  are recognized! 

**Open links(s) in browser :**
```
alias lk="safari-bookmarks.pl | uricolor.pl | fzf --ansi --exact --multi | urifind | xargs open"
```

**Copy links(s) to clipboard :**
```
alias lkc="safari-bookmarks.pl | uricolor.pl | fzf --ansi --exact --multi | urifind | pbcopy"
```


