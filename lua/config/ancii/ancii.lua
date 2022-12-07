local M = {}

function M.get_random_ancii_art()
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls "'..debug.getinfo(1).source:match("@?(.*/)")..'"')
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()

    math.randomseed(os.time())
    local art_path = "config.ancii."..tostring(t[ math.random( 2,#t  ) ])

    return require(art_path:sub(1, -5)).ancii()
end

return M
