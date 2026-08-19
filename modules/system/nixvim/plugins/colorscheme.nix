{ ... }:
let
  matugenFile = "~/.config/nvim/matugen-colors.lua";
  wallustFile = "~/.config/nvim/wallust-colors.lua";
  coloriceFile = "~/.config/nvim/colors.lua";
in
{
  programs.nixvim = {
    colorschemes.base16 = {
      enable = true;
      autoLoad = true;
      # Static fallback so there's never a flash of default colors before
      # the VimEnter autocmd below picks the real, currently-active source.
      colorscheme = "tokyo-night-dark";
      setUpBar = false;
      # lualine theme handled by statusline.nix's "auto" instead --
      # colorice doesn't go through base16 at all, so a fixed
      # "base16" lualine theme wouldn't track it.
    };

    extraConfigLua = ''
      -- Two supported file shapes, both loaded the same way:
      --   1. `return { base00 = "...", ... }` -- a plain base16 table
      --      (matugen, wallust) -> applied via base16-colorscheme.setup().
      --   2. A self-contained script that calls vim.api.nvim_set_hl itself
      --      and returns nothing (colorice, exactly as you already wrote it)
      --      -> just runs, nothing further to do.
      -- dofile() works on any absolute path regardless of 'runtimepath', so
      -- none of this cares whether ~/.config/nvim is Nix-managed.
      local function apply(name, path)
        local expanded = vim.fn.expand(path)
        if vim.fn.filereadable(expanded) == 0 then
          vim.notify("No theme data yet from " .. name .. " (" .. path .. ")", vim.log.levels.WARN)
          return false
        end
        local ok, result = pcall(dofile, expanded)
        if not ok then
          vim.notify("Failed loading " .. name .. " theme: " .. tostring(result), vim.log.levels.ERROR)
          return false
        end
        if type(result) == "table" then
          require("base16-colorscheme").setup(result)
        end
        vim.notify("Colorscheme source: " .. name, vim.log.levels.INFO)
        return true
      end

      _G.theme_use_matugen = function() apply("matugen", "${matugenFile}") end
      _G.theme_use_wallust = function() apply("wallust", "${wallustFile}") end
      _G.theme_use_colorice = function() apply("colorice", "${coloriceFile}") end

      -- Loads whichever source produced its file most recently.
      _G.theme_use_auto = function()
        local candidates = {
          { name = "matugen", path = vim.fn.expand("${matugenFile}") },
          { name = "wallust", path = vim.fn.expand("${wallustFile}") },
          { name = "colorice", path = vim.fn.expand("${coloriceFile}") },
        }
        local newest, newest_mtime = nil, -1
        for _, c in ipairs(candidates) do
          local stat = vim.uv.fs_stat(c.path)
          if stat and stat.mtime.sec > newest_mtime then
            newest, newest_mtime = c, stat.mtime.sec
          end
        end
        if newest then
          apply(newest.name, newest.path)
        else
          vim.notify("No colorscheme source file found yet", vim.log.levels.WARN)
        end
      end

      -- Pick up whichever source is newest on startup, replacing the static fallback.
      vim.api.nvim_create_autocmd("VimEnter", {
        once = true,
        callback = function() theme_use_auto() end,
      })

      -- Optional: if a generator's post_hook sends SIGUSR1 on regenerate
      -- (matugen and wallust both support a post_hook / post-run command),
      -- re-check mtimes and reload whichever source is now newest.
      local signal = vim.uv.new_signal()
      signal:start("sigusr1", vim.schedule_wrap(function()
        theme_use_auto()
      end))
    '';

    plugins.which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>T";
        group = "Theme";
      }
    ];

    keymaps = [
      {
        mode = "n";
        key = "<leader>Tm";
        action = "<cmd>lua theme_use_matugen()<cr>";
        options.desc = "Use matugen colors";
      }
      {
        mode = "n";
        key = "<leader>Tw";
        action = "<cmd>lua theme_use_wallust()<cr>";
        options.desc = "Use wallust colors";
      }
      {
        mode = "n";
        key = "<leader>Tc";
        action = "<cmd>lua theme_use_colorice()<cr>";
        options.desc = "Use colorice colors";
      }
      {
        mode = "n";
        key = "<leader>Ta";
        action = "<cmd>lua theme_use_auto()<cr>";
        options.desc = "Use most recently generated colors";
      }
    ];
  };
}
