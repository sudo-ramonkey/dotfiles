return {
  {
    "AstroNvim/astrocommunity",
  },
  {
    "kawre/leetcode.nvim",
    opts = {
      lang = "python3",
      sql = "mssql",
      console = {
        open_on_runcode = true,
      },
      image_support = false,
      injector = { ---@type table<lc.lang, lc.inject>
        ["python3"] = {
            before = true
        },
        ["cpp"] = {
            before = { "#include <bits/stdc++.h>", "using namespace std;" },
            after = "int main() {}",
        },
        ["java"] = {
            before = "import java.util.*;",
        },
      }
    },
  },
}
