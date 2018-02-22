def is_firewall_enabled(profile)
  result = `netsh advfirewall show #{profile}`
  state = result.scan(/State\s*((?:ON)|(?:OFF))/)
  state[0][0] == 'ON'
end
