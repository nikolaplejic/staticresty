local discount = require 'discount'

local function render_markdown(md_filename)
  local md_file = assert(io.open(md_filename, "r"))
  local md = md_file:read("*a")
  md_file:close()

  local response = [[
    <!DOCTYPE html>
    <script type="text/javascript" async src="//cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML"></script>
    <body>
    %s
    </body>]]

  return string.format(response, discount(md))
end

-- form request table
local request = {
  headers = ngx.req.get_headers(),
  method = ngx.req.get_method(),
  uri = ngx.var.uri,
  uri_args = ngx.req.get_uri_args()
}

ngx.header.content_type = 'text/html'

local md_filename = ngx.var.root .. "/" .. request.uri:sub(2)
ngx.say(render_markdown(md_filename))
