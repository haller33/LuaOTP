Deprecated Repo
===============

I have stopped development on this library due to lack of interest and time.

Peter Melnichenko has graciously taken over development. His work can be seen on here:

* https://github.com/mpeterv/sha1

I have also transfered my Luarocks rights for `sha1` to him, and he'll be the one publishing them
from now on.

This repo will remain on github for historical purposes.


sha1.lua
========

This pure-Lua module computes SHA-1 and HMAC-SHA1 signature computations in Lua 5.1.

Usage
=====

    local sha1 = require 'sha1'

    local hash_as_hex   = sha1(message)            -- returns a hex string
    local hash_as_data  = sha1.binary(message)     -- returns raw bytes

    local hmac_as_hex   = sha1.hmac(key, message)        -- hex string
    local hmac_as_data  = sha1.hmac_binary(key, message) -- raw bytes

Credits
=======

This is a cleanup of an implementation by Eike Decker - http://cube3d.de/uploads/Main/sha1.txt,

Which in turn was based on an original implementation by Jeffrey Friedl - http://regex.info/blog/lua/sha1

The original algorithm is http://www.itl.nist.gov/fipspubs/fip180-1.htm

License
=======

This version, as well as all the previous ones in which is based, are implemented under the MIT license (See license file for details).

Specs
=====

The specs for this library are implemented with [busted](http://ovinelabs.com/busted/). In order to run them, install busted and then:

    cd path/to/where/the/spec/folder/is
    busted


Current Version
=====
URL    :: https://github.com/kikito/sha1.lua
branch :: master
commit :: 538192c33cd50eb6403c79f4bc1819c07ada06c8

