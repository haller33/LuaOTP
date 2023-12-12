package.path = package.path .. ';' .. '../src/?.lua'

local OTP = require ('otp')
local TOTP = require ('totp')
local INIP = require ('ini')

local INTERVAL      = 30;
local DIGITS        = 6;
local DIGEST        = "SHA1";

-- Data loading
local data = INIP.load('data_digest.ini');

for k, v in pairs( data ) do

  local BASE32_SECRET = data[k].digest; -- "4S62BZNFXXSZLCRO";

  -- Create OTPData struct, which decides the environment
  OTP.type = "totp"
  local tdata = OTP.new(BASE32_SECRET, DIGITS, DIGEST, 30)

  -- totp.now
  local totp_data_or_err_1 = TOTP.now(tdata)
  print("name   :: " .. v.name )
  print("digest :: " .. v.digest )
  print("TOTP Generated: `" .. totp_data_or_err_1 .. "`")

  print("")
end

