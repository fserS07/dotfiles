local jdtls = require("jdtls")

local home = os.getenv("HOME")
local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
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
      configuration = {
        runtimes = {
          {
            name = "JavaSE-17",
            path = "/usr/lib/jvm/java-17-openjdk", -- adjust this path to your system!
          },
        },
      },
    },
  },
}

function config.start()
  jdtls.start_or_attach(config)
end

return config

