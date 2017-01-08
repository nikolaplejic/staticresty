local cjson = require 'cjson'

ngx.log(ngx.ERR, ngx.arg[1])

local listing = cjson.decode(ngx.arg[1])

local response = '<ul>'

for _, item in ipairs(listing) do
  local link = ''

  if item.type == 'file' and item.name:sub(-3) == '.md' then
    link = '<li><a href="%s">%s</a></li>'
  elseif item.type == 'directory' then
    link = '<li><a href="%s/">%s</a></li>'
  end

  response = response .. link:format(item.name, item.name)
end

response = response .. '</ul>'

ngx.arg[1] = response
