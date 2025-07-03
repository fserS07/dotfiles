local jdtls = require("jdtls")

local home = os.getenv("HOME")
local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local config = {
  cmd = {
    "/usr/lib/jvm/java-21-openjdk/bin/java"
    "-Declipse.application=org.eclipse.jdt.ls.core.id1"
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-noverify",
    "-Xms1g",
    "-Xmx2G",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-jar", vim.fn.glob("~/.local/share/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration", vim.fn.expand("~/.local/share/jdtls/config_linux"),
    "-data", workspace_dir, 
  },

  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" }),

  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-1.8",
            path = "/usr/lib/jvm/java-8-openjdk-amd64", -- this is your project JDK
          },
          {
            name = "JavaSE-21",
            path = "/usr/lib/jvm/java-21-openjdk",
          },
        },
      },
    },
  },
  on_attach = function(client, bufnr)
    -- Add your keymaps
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
  end,
}

function config.start()
  jdtls.start_or_attach(config)
end

return config

