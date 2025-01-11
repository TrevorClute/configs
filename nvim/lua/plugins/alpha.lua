return {
	"goolord/alpha-nvim",
	dependencies = {
		"Shatur/neovim-session-manager",
	},
	lazy = false,
	config = function()
		-- require 'alpha'.setup(require 'alpha.themes.theta'.config)
		local lazy = require("lazy")
		local max_sessions = 6
		local session_shortcuts = "asdfghjkl"

		local function last_sessions()
			local utils = require("session_manager.utils")
			local sessions = utils.get_sessions()
			local temp_max_sessions = #sessions <= max_sessions and #sessions or max_sessions

			local max_line_len = 0

			for i = 1, temp_max_sessions do
				local len = string.len(sessions[i].dir:__tostring())
				if len > max_line_len then
					max_line_len = len
				end
			end

			local lines_specs = {}
			for i = 1, temp_max_sessions do
				local session = sessions[i]
				local dirname_start, dirname_end = string.find(session.dir:__tostring(), "[^/]+$")
				local start_this_session = function()
					utils.load_session(session.filename, false)
				end

				table.insert(lines_specs, {
					type = "button",
					val = session.dir:__tostring(),
					on_press = start_this_session,
					opts = {
						keymap = { "n", session_shortcuts:sub(i, i), start_this_session },
						shortcut = string.format("[%s]  ", session_shortcuts:sub(i, i)),
						align_shortcut = "left",
						position = "center",
						hl = {
							{ "DashboardFooter", 0, dirname_start - 1 },
							{ "DashboardCenter", dirname_start - 1, dirname_end },
						},
						hl_shortcut = "DashboardKey",
						cursor = 1,
						width = max_line_len + 5,
						shrink_margin = true,
					},
				})
			end
			table.insert(lines_specs, 1, {
				type = "text",
				-- +4 compared to upper text for indent
				val = string.format("%-" .. (max_line_len + 9) .. "s", "  Recent Sessions"),
				opts = { hl = { { "DashboardEmphasized", 0, 20 } }, position = "center" },
			})
			return lines_specs
		end

		require("alpha").setup({
			opts = {
				noautocmd = true,
			},
			layout = {
				{
					-- current header takes up 38 lines max
					-- dynamic padding based on that
					-- i hope i will always have at least 4 sessions saved lol
					type = "text",
					val = function()
						local pad = {}
						for _ = 1, ((vim.o.lines - 38) / 2) do
							table.insert(pad, "")
						end
						return pad
					end,
				},
				{
					type = "text",
					opts = {
						position = "center",
						hl = "DashboardHeader",
					},
					val = {
						[[       ,                              ]],
						[[       \`-._           __             ]],
						[[        \\  \-..____,.'  `.           ]],
						[[         :  )       :      :\         ]],
						[[          ;'        '   ;  | :        ]],
						[[          )..      .. .:.`.; :        ]],
						[[         /::...  .:::...   ` ;        ]],
						[[         `:o>   /\o_>        : `.     ]],
						[[        `-`.__ ;   __..--- /:.   \    ]],
						[[        === \_/   ;=====_.':.     ;   ]],
						[[         ,/'`--'...`--....        ;   ]],
						[[              ;                    ;  ]],
						[[          . '                       ; ]],
						[[        .'     ..     ,      .       ;]],
						[[       :       ::..  /      ;::.     |]],
						[[      /      `.;::.  |       ;:..    ;]],
						[[     :         |:.   :       ;:.    ; ]],
						[[     :         ::     ;:..   |.    ;  ]],
						[[      :       :;      :::....|     |  ]],
						[[      /\     ,/ \      ;:::::;     ;  ]],
						[[    .:. \:..|    :     ; '.--|     ;  ]],
						[[   ::.  :''  `-.,,;     ;'   ;     ;  ]],
						[[.-'. _.'\      / `;      \,__:      \ ]],
						[[`---'    `----'   ;      /    \,.,,,/ ]],
						[[                   `----`             ]],
						[[                                      ]],
					},
				},
				{
					type = "group",
					val = last_sessions,
					opts = { spacing = 1 },
				},
				{
					type = "text",
					val = string.format("Loaded %i plugins", lazy.stats().count),
					opts = {
						position = "center",
						hl = "DashboardFooter",
					},
				},
			},
		})
	end,
}
