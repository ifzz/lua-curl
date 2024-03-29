-- This file was automatically generated for the LuaDist project.

package = "Lua-cURL"
version = "0.3.3-1"

-- LuaDist source
source = {
  url = "git://github.com/LuaDist2/lua-curl.git",
  tag = "0.3.3-1"
}
-- Original source
-- source = {
--   url = "https://github.com/Lua-cURL/Lua-cURLv3/archive/v0.3.3.zip",
--   dir = "Lua-cURLv3-0.3.3",
-- }

description = {
  summary = "Lua binding to libcurl",
  detailed = [[
  ]],
  homepage = "https://github.com/Lua-cURL",
  license  = "MIT/X11"
}

dependencies = {
  "lua >= 5.1, < 5.4"
}

external_dependencies = {
  platforms = {
    windows = {
      CURL = {
        header  = "curl/curl.h",
        library = "libcurl",
      }
    };
    unix = {
      CURL = {
        header  = "curl/curl.h",
        -- library = "curl",
      }
    };
  }
}

build = {
  copy_directories = {'doc', 'examples'},

  type = "builtin",

  platforms = {
    windows = { modules = {
      lcurl = {
        libraries = {"libcurl", "ws2_32"},
      }
    }},
    unix    = { modules = {
      lcurl = {
        libraries = {"curl"},
      }
    }}
  },

  modules = {
    ["cURL"           ] = "src/lua/cURL.lua",
    ["cURL.safe"      ] = "src/lua/cURL/safe.lua",
    ["cURL.utils"     ] = "src/lua/cURL/utils.lua",
    ["cURL.impl.cURL" ] = "src/lua/cURL/impl/cURL.lua",

    lcurl = {
      sources = {
        "src/l52util.c",    "src/lceasy.c", "src/lcerror.c",
        "src/lchttppost.c", "src/lcurl.c",  "src/lcutils.c",
        "src/lcmulti.c",    "src/lcshare.c",
      },
      incdirs   = { "$(CURL_INCDIR)" },
      libdirs   = { "$(CURL_LIBDIR)" }
    },
  }
}

