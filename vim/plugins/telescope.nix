{ config, user, host, pkgs, ... }:

{
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = 
    {
      "<leader>f" = "find_files";
      "<leader>F" = "live_grep";
    };
    extraOptions = {
      defaults = {
        prompt_prefix = " ";
        selection_caret = " ";
        file_ignore_patterns = [
          ".DS_Store"
          ".git/"
          "/.svelte-kit/"
          "target/"
          "vendor/*"
          "%.lock"
          "__pycache__/*"
          "%.sqlite3"
          "%.ipynb"
          "node_modules/*"
          ".dart_tool/"
          ".github/"
          ".gradle/"
          ".idea/"
          ".settings/"
          ".vscode/"
          "__pycache__/"
          "build/"
          "env/"
          "gradle/"
          "node_modules/"
          "%.pdb"
          "%.dll"
          "%.class"
          "%.exe"
          "%.cache"
          "%.ico"
          "%.pdf"
          "%.dylib"
          "%.jar"
          "%.docx"
          "%.met"
          "smalljre_*/*"
          ".vale/"
          "%.burp"
          "%.mp4"
          "%.mkv"
          "%.rar"
          "%.zip"
          "%.7z"
          "%.tar"
          "%.bz2"
          "%.epub"
          "%.flac"
          "%.tar.gz"
        ];
      };
    };
  };
}
