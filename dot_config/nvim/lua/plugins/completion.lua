return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "none", -- Clear default mappins so Enter key does not select suggestion

      -- ESCAPE: Closes the menu if open. If closed, exits to Normal Mode.
      ["<Esc>"] = {
        function(cmp)
          if cmp.is_visible() then
            cmp.hide()
            return true -- Tells Nvim keypress was handled, and do not switch modes.
          end
        end,
        "fallback",
      },

      -- TAB: Accepts completion if suggestions open. Jumps to next snippet slot if a snippet is active.
      ["<Tab>"] = {
        function(cmp)
          if cmp.is_visible() then
            return cmp.accept()
          elseif cmp.snippet_active() then
            return cmp.snippet_forward()
          end
        end,
        "fallback",
      },

      -- SHIFT + TAB: Jumps backward through snippet slots.
      ["<S-Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.snippet_backward()
          end
        end,
        "fallback",
      },

      -- RIGHT ARROW: Accepts completion if open. Moves cursor right if closed.
      ["<Right>"] = {
        function(cmp)
          if cmp.is_visible() then
            return cmp.accept()
          end
        end,
        "fallback",
      },

      -- ENTER: Strictly creates a new line, never accepts autocomplete.
      ["<CR>"] = {},

      -- UP/DOWN ARROWS: Navigate the completion list.
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },

      -- CTRL + SPACE: Manually trigger the completion menu.
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    },
  },
}
