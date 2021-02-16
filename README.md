bookmarks - Export browser bookmarks as plain text.
===================================================

SYNOPSIS
--------

    $ bookmarks [-hVda] [-f format] [file ...]

    -h, --help      help
    -V, --version   version
    -d              debug
    -a              all files : process arguments and default locations
    -f format       any combination of letters t,u,d as title/url/description (default : tud)
    -s              find schemeless URLs in text files (default : no)


DESCRIPTION
-----------

`bookmarks` is a tool to export bookmarks from files supplied as arguments, or
from browsers default locations (when called without arguments). The following
sources are supported :

- Safari (Mac)
- Firefox (Mac/Linux/Windows)
- Chrome (Mac/Linux/Windows)
- Internet Explorer (Windows)
- Edge (Windows)
- Plain text (.txt)
- Markdown (.md)

Files named _*.plist_, _*.sqlite_ and _*Bookmarks_ are processed as Safari, Firefox
and Chrome bookmarks, respectively. Directories named _*Favorites_ are processed
as Internet Explorer favorites.

The fields `<title>`, `<url>` and `<description>` are retrieved (when existing) and
are available for exporting (in the desired format), by default :
`<title> <url> <description>`

The same format is used for plain text and markdown files :
```
plain text example http://example.txt #tag1 #tag2
[markdown example](http://example.md) #tag1 #tag2
```

The `<description>` field is filled with Safari's Description, Firefox's Tags or
empty for Chrome and Internet Explorer.


SEARCH BOOKMARKS INTERACTIVELY FROM CLI
---------------------------------------

This tool can be used to search and open bookmarks interactively from the CLI. The
following instructions are for macOS, but it should be similar on any regular OS.

![](tty.png)

Install the wonderful [fzf](https://github.com/junegunn/fzf) (available in
[Homebrew](https://brew.sh)), [URI::Find](https://github.com/schwern/URI-Find) (CPAN),
[App::uricolor](https://github.com/kal247/App-uricolor) (CPAN),
and add these aliases to your shell :

**Open link(s) with default application :**
```
alias lk="bookmarks | uricolor | fzf --ansi --exact --multi | urifind | xargs open"
```

**Copy link(s) to clipboard :**
```
alias lkc="bookmarks | uricolor | fzf --ansi --exact --multi | urifind | pbcopy"
```

- `uricolor` colorizes URIs to distinguish them from title and description.
- `fzf` is a fuzzy finder (with many options) : use TAB for multiple selection, press ENTER to confirm, or ESC to cancel.
- `urifind` extracts all URIs. Try `uricolor -s` and `urifind --schemeless` to find schemeless URLs.
- Selected URIs will open with your default browser or application.
- Since `open` uses macOS _Launch Services_ to determine which program to run, most common schemes such as `ftp://` or `ssh://` are automatically recognized.


CHECK LINKS STATUS
------------------

These examples use the tool _http_status_ provided by [HTTP::SimpleLinkChecker](https://metacpan.org/pod/HTTP::SimpleLinkChecker) (CPAN).

**Check links and show status :**
```
bookmarks -f u | xargs http_status
```

**Show only broken links (parallel) :**
```
bookmarks -f u | xargs -n10 -P16 http_status 2>/dev/null | perl -ne 'print if not /200$/'
```


INSTALLATION
------------

To install this module automatically from CPAN :

    cpan App::bookmarks

To install this module automatically from Git repository :

    cpanm https://github.com/kal247/App-bookmarks.git

To install this module manually, run the following commands :

    perl Makefile.PL
    make     
    make test
    make install


PREREQUISITES
-------------

All are optional.

- Safari : macOS
- Firefox : DBI
- Chrome : File::Slurper, JSON
- Internet Explorer : Config::Any, Config::Tiny, Win32
- Plain text : URI::Find
- Markdown : none


SUPPORT AND DOCUMENTATION
-------------------------

After installing, you can find documentation for this module with the
perldoc command :

    perldoc bookmarks

You can also look for information at :

- CPAN

    [https://metacpan.org/release/App-bookmarks](https://metacpan.org/release/App-bookmarks)

- GITHUB

    [https://github.com/kal247/App-bookmarks](https://github.com/kal247/App-bookmarks)


LICENSE AND COPYRIGHT
---------------------

This software is Copyright (c) 2019 by jul.

This is free software, licensed under:

    The Artistic License 2.0 (GPL Compatible)