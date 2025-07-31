local WebhookConfig = {
	[1] = {
		webhook = "",
		botname = "RicX Legendary Hunt: Placed Trap",
		icon_url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/master/useful_info_from_rpfs/textures/pm_awards_mp/images/pm_awards_mp/awards_set_r_007.png",
		color = 15248975,
	},   
    [2] = {
		webhook = "",
		botname = "RicX Legendary Hunt: Picked up Trap",
		icon_url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/master/useful_info_from_rpfs/textures/pm_awards_mp/images/pm_awards_mp/awards_set_r_007.png",
		color = 15248975,
	},   
    [3] = {
		webhook = "",
		botname = "RicX Legendary Hunt: Destroyed Trap",
		icon_url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/master/useful_info_from_rpfs/textures/pm_awards_mp/images/pm_awards_mp/awards_set_r_007.png",
		color = 15248975,
	},   
    [4] = {
		webhook = "",
		botname = "RicX Legendary Hunt: Added bait to Trap",
		icon_url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/master/useful_info_from_rpfs/textures/pm_awards_mp/images/pm_awards_mp/awards_set_r_007.png",
		color = 15248975,
	},  
    [5] = {
		webhook = "",
		botname = "RicX Legendary Hunt: Remove bait from Trap",
		icon_url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/master/useful_info_from_rpfs/textures/pm_awards_mp/images/pm_awards_mp/awards_set_r_007.png",
		color = 15248975,
	},  
    [6] = {
		webhook = "",
		botname = "RicX Legendary Hunt: Used oil on Trap",
		icon_url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/master/useful_info_from_rpfs/textures/pm_awards_mp/images/pm_awards_mp/awards_set_r_007.png",
		color = 15248975,
	},  
    [7] = {
		webhook = "",
		botname = "RicX Legendary Hunt: Start Trap Hunting",
		icon_url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/master/useful_info_from_rpfs/textures/pm_awards_mp/images/pm_awards_mp/awards_set_r_007.png",
		color = 15248975,
	},  
    [8] = {
		webhook = "",
		botname = "RicX Legendary Hunt: Animal Spawn at Hunting",
		icon_url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/master/useful_info_from_rpfs/textures/pm_awards_mp/images/pm_awards_mp/awards_set_r_007.png",
		color = 15248975,
	},  
    [9] = {
		webhook = "",
		botname = "RicX Legendary Hunt: Reset Hunting",
		icon_url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/master/useful_info_from_rpfs/textures/pm_awards_mp/images/pm_awards_mp/awards_set_r_007.png",
		color = 15248975,
	},  
    [10] = {
		webhook = "",
		botname = "RicX Legendary Hunt: Item Purchase",
		icon_url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/master/useful_info_from_rpfs/textures/pm_awards_mp/images/pm_awards_mp/awards_set_r_007.png",
		color = 15248975,
	},  
    [11] = {
		webhook = "",
		botname = "RicX Legendary Hunt: Item Sell",
		icon_url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/master/useful_info_from_rpfs/textures/pm_awards_mp/images/pm_awards_mp/awards_set_r_007.png",
		color = 15248975,
	},  
    [12] = {
		webhook = "",
		botname = "RicX Legendary Hunt: Guide Purchase",
		icon_url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/master/useful_info_from_rpfs/textures/pm_awards_mp/images/pm_awards_mp/awards_set_r_007.png",
		color = 15248975,
	},  
    [13] = {
		webhook = "",
		botname = "RicX Legendary Hunt: Mission Start",
		icon_url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/master/useful_info_from_rpfs/textures/pm_awards_mp/images/pm_awards_mp/awards_set_r_007.png",
		color = 15248975,
	},  
    [14] = {
		webhook = "",
		botname = "RicX Legendary Hunt: Finished Mission",
		icon_url = "https://raw.githubusercontent.com/abdulkadiraktas/rdr3_discoveries/master/useful_info_from_rpfs/textures/pm_awards_mp/images/pm_awards_mp/awards_set_r_007.png",
		color = 15248975,
	},  
}

function ScriptWH(id, wd)
    wd.title = "Information"
    local timestamp = createTimestamp()
	local wh = WebhookConfig[id]
    local embeds = {
        {
            author = {
                name = wh.botname,
                icon_url = wh.icon_url,
            },
            color = wh.color,
            title = wd.title,
            description = wd.description,
            footer = {
                text= wh.botname,
            },
            fields = {
                {
                    name = "Server Date",
                    value = timestamp,
                    inline = true
                }
            }
        },
    }
    PerformHttpRequest(wh.webhook, function(err, text, headers) end, 'POST', json.encode({embeds = embeds, username = wh.botname}), { ['Content-Type'] = 'application/json' })
end