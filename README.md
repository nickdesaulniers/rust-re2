#Rust RE2

Bindings for re2 for Rust

#Installing dependencies
Requires re2 and cre2.

```
cd deps && ./install_re2.sh && ./install_cre2.sh && cd ..
```

#Compiling
```
cd lib && make && cd ..
```

#Linking
```
rustc -L ../path/to/rust-re2/lib my_program.rs
```

It might be helpful to move the compiled lib to `/usr/local/lib` and link from
there.  I should add a `make install` target.

#Usage

```rust
let text = ~"hello world 42!";
let pattern = ~"(world), ([0-9]+)";
let mut matches: ~[~str] = re2::Matches::new(2u32);

re2::easy_match(pattern, text, matches);

matches[0]; // ~"world 42"
matches[1]; // ~"world"
matches[2]; // ~"42"
```

The `u32` passed to `re2::Matches::new` represents the number of groupings plus
one. Matches is always one more than the
number of groupings, as matches[0] is always the "full match".  The function
also returns `0i32` in the case of no match, `1i32` in the case of a match,
and `2i32` if the pattern is invalid.

This binding is incomplete, but has the basics working.  For more functions,
see test/test.rs.

"THE BEER-WARE LICENSE" (Revision 42):
<nick@mozilla.com> wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer in return. Nick Desaulniers

