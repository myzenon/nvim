local status, copilot = pcall(require, 'copilot')
if (not status) then return end

copilot.setup({
    suggestion = {
        auto_trigger = true,
        keymap = {
            accept = "<C-a>",
            accept_word = false,
            accept_line = false,
            next = "<C-]>",
            prev = "<C-[>",
            dismiss = "<C-s>",
        }
    }
})
