local g = vim.g
g.mkdp_browser = 'firefox'
g.mkdp_markdown_css = '/home/gideon/.config/nvim/static/markdown-preview/customStyle.css'
g.mkdp_highlight_css = '/home/gideon/.cache/wal/colors.css'

g.mkdp_port = '3456'

g.mkdp_preview_options = {
     mkit = {};
     katex = {};
     uml = {server = 'http://localhost:4928'};
     maid = {};
     disable_sync_scroll = 0;
     sync_scroll_type = 'middle';
     hide_yaml_meta = 1;
     sequence_diagrams = {};
     flowchart_diagrams = {};
     disable_filename = 0;
  }
