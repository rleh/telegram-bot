local knownUsers = nil
local lastDate = nil

function run(msg, matches)
  local date = os.date("*t")
  if date.hour >= 12 and date.hour <= 17 then
    if lastDate == nil then
      lastDate = date
      knownUsers = {}
    elseif lastDate.day ~= date.day or lastDate.month ~= date.month or lastDate.year ~= date.year then
      lastDate = date
      knownUsers = {}
    end
    if knownUsers[msg.from.id] == nil then
      knownUsers[msg.from.id] = 1
      local username = msg.from.first_name or ""
      return "Guten Mittag"
    end
  end
end

return {
    description = "replies to messages in the afternoon", 
    usage = "send a message between 12 and 18 o'clock am",
    patterns = {"(.*)"}, 
    run = run 
}

