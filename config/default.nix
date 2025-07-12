{ pkgs, ... }:
{
  luaLoader.enable = true;
  colorscheme = "miasma";
  clipboard.register = "unnamedplus";

  opts = {
    showmode = false;
    number = true;
    relativenumber = false;
    cursorline = true;
    swapfile = false;
    signcolumn = "yes";
  };

  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  extraPlugins = with pkgs.vimPlugins; [
    miasma-nvim
    gruvbox-nvim
    oxocarbon-nvim
    # quick-scope
    cheatsheet-nvim
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>uf";
      action = ":FormatToggle<CR>";
      options = {
        desc = "Toggle Format Globally";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>uF";
      action = ":FormatToggle!<CR>";
      options = {
        desc = "Toggle Format Locally";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>lf";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format Buffer";
      };
    }

    {
      mode = "v";
      key = "<leader>lF";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format Lines";
      };
    }
    {
      mode = "n";
      key = "<leader>y";
      action = "<cmd>Yazi<cr>";
      options = {
        desc = "Open Yazi";
      };
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<cr>";
      options = {
        desc = "Files";
      };
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<cr>";
      options = {
        desc = "Buffers";
      };
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<cr>";
      options = {
        desc = "Grep";
      };
    }
  ];

  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        nixd = {
          enable = true;
          settings = {
            nixpkgs.expr = "import (builtins.getFlake \"github:Rsr45/nixos-config\").inputs.nixpkgs { }";
            options = {
              nixos.expr = "(builtins.getFlake \"github:Rsr45/nixos-config\").nixosConfigurations.apocrypha.options";
              home-manager.expr = "(builtins.getFlake \"github:Rsr45/nixos-config\").nixosConfigurations.apocrypha.options.home-manager.users.type.getSubOptions []";
            };
          };
        };
      };
    };

    blink-cmp = {
      enable = true;
      settings.keymap = {
        preset = "default";
      };
    };

    telescope = {
      enable = true;
    };

    treesitter = {
      enable = true;
    };

    yazi.enable = true;

    conform-nvim = {
      enable = true;
      settings = {
        notify_on_error = true;
        # default_format_opts = {
        #   lsp_format = "fallback";
        # };
        # format_after_save = {
        #   lsp_format = "fallback";
        # };
        format_on_save = ''
          function(bufnr)
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end
            return { timeout_ms = 500, lsp_format = 'fallback' }
          end
        '';
        formatters_by_ft = {
          html = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          css = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          javascript = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          javascriptreact = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          typescript = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          typescriptreact = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          java = [ "google-java-format" ];
          python = [ "black" ];
          lua = [ "stylua" ];
          nix = [ "nixfmt" ];
          markdown = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          rust = [ "rustfmt" ];
        };
      };
    };

    trouble.enable = true;
    gitsigns.enable = true;
    mini = {
      enable = true;
      mockDevIcons = true;
      modules = {
        icons = {
          style = "ascii";
        };
        comment = { };
        pairs = { };
        statusline = { };
      };
    };
    lualine = {
      enable = false;
      settings = {
        options = {
          component_seperators = {
            left = " ";
            right = " ";
          };
          section_seperators = {
            left = " ";
            right = " ";
          };
        };
        sections = {
          lualine_a = [
            "mode"
          ];
          lualine_b = [
            "branch"
            "diff"
            "diagnostics"
          ];
          lualine_c = [ "filename" ];
          lualine_x = [ "" ];
          lualine_y = [ "location" ];
          lualine_z = [ "filetype" ];
        };
      };
    };
    harpoon.enable = true;
    intellitab.enable = true;
    sleuth.enable = true;
    which-key = {
      enable = true;
      settings = {
        delay = 200;
        preset = "helix";
        win = {
          border = "single";
        };
      };
    };
    leap.enable = true;
    flit = {
      enable = true;
      settings = {
        keys = {
          F = "F";
          T = "T";
          f = "f";
          t = "t";
        };
        labeled_modes = "nv";
        multiline = false;
      };
    };
  };
}
