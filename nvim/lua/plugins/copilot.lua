return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      mappings = {
        submit_prompt = {
          normal = "<CR>",
          insert = "<C-s>",
        },
      },
      window = {
        width = 0.3,
        border = 'solid'
      },
      prompts = {
        Commit = {
          prompt = 'Write a commit message for the change with the following convention.',
          context = {
            'git:staged',
            'git:commit'
          }
        }
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      chat.setup(opts)

      local keymap = vim.keymap

      keymap.set("n", "<leader>ac", chat.toggle, { desc = "Copilot Chat" })
      keymap.set("n", "<leader>ad", "<cmd>CopilotChatFixDiagnostic<CR>", { desc = "Copilot Diagnostic" })
      keymap.set("n", "<leader>af", "<cmd>CopilotChatFix<CR>", { desc = "Copilot Fix" })
      keymap.set("v", "<leader>af", function()
        chat.ask("There's a problem in this snippet, please fix it, don't explain just generate the code")
      end, { desc = "Copilot Fix" })
      keymap.set("n", "<leader>am", "<cmd>CopilotChatCommit<CR>", { desc = "Copilot Commit Message" })
      keymap.set("n", "<leader>al", "<cmd>CopilotChatModels<CR>", { desc = "Copilot Models" })
      keymap.set("v", "<leader>ae", function()
        chat.ask("Explain how this works")
      end, { desc = "Copilot Explain" })
    end,
  },
}
