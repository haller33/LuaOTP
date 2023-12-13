# LuaOTP

This module is part of a chain of OTP libraries all written in different languages. See https://github.com/OTPLibraries

A simple One Time Password (OTP) library in lua

Compatible with Authy and Google Authenticator. Full support for QR code url is provided.

Copyright (c) 2021 Cody Tilkins MIT
Copyright (c) 2023 Haller33

## Usage

A simple 2FA checker for instance

``` lua
local OTP  = require("otp")
local TOTP = require("totp")

-- test to confir works on https://github.com/xlzd/gotp#working-example
local BASE32_SECRET = "4S62BZNFXXSZLCRO"; 
local INTERVAL      = 30;
local DIGITS        = 6;
local DIGEST        = "SHA1";

-- Create OTPData struct, which decides the environment
OTP.type = "totp"
local tdata = OTP.new(BASE32_SECRET, DIGITS, DIGEST, 30)

-- totp.now
local totp_err_1 = TOTP.now(tdata)
print("TOTP Generated: `" .. totp_err_1 .. "`")
```

also can validate tokens from (the BASE32_SECRET)

https://2fas.com/check-token/

## Libraries Needed but now is all Offline

In order to utilize this library, you will need the following libraries:
* bit32 (already there in Lua 5.3, no config required, but we add anyway to support Lua 5.1)
* basexx
* sha1

I am sure you can get them through LuaRocks stuff, but...
Here you can obtain them:
>[bit32](http://www.snpedia.com/extensions/Scribunto/engines/LuaCommon/lualib/bit32.lua) brokelink [new link for replacement](https://www.dahuawiki.com/extensions/Scribunto/engines/LuaCommon/lualib/bit32.lua) also on [waybackmachine](https://web.archive.org/web/20231212153754/https://www.dahuawiki.com/extensions/Scribunto/engines/LuaCommon/lualib/bit32.lua)

>[basexx](https://github.com/aiq/basexx/blob/master/lib/basexx.lua)

>[sha1](https://github.com/kikito/sha1.lua)


## Configuration

You will need to configure the paths of the requires of this library. I am guessing you don't compile everything into one directory, but whatever. It is simple and quick. Everything is already preconfigured to be manipulated there, just replace the path.

When it comes down to it, this library will convert your integer numbers to string and do a comparison byte by byte. There is no need for expensive testing - nobody knows what is going on except the key holders and the key can't be reversed because we only send a small part of the hmac. That being said, there is no support for digits > 9 yet - as this is half an int's limit.


_____________

## License

This library is licensed under MIT License

bit32 is licensed by Lua under MIT, see the full license [here](https://www.lua.org/license.html)

basexx is licensed by aiq under MIT, see the full license [here](https://github.com/aiq/basexx/blob/master/LICENSE)

sha1 is licensed by 'Enrique García Cota + Eike Decker + Jeffrey Friedl' under a custom license, see the full license [here](https://github.com/kikito/sha1.lua/blob/master/MIT-LICENSE.txt)


## Usage

To use this library, pick either TOTP or HOTP then use the provided files - giving the functions what they need. The only thing you really need to pay attention is settings. Check out the test file, as it will tell you what the default requirements is for Google Authenticator, but you should always be using Authy (it is the most lenient).


## TODO

* NEW API to easy add a list of digests to show the HOTP and TOTP
* Add comments - there are lacking comments, should match up to COTP's style
* Remove the dependancy on basexx - I have an implementation found in COTP and JOTP that can be ported.
* bit32 isn't actually an external dependancy, but depending on the version you prefer, it is

