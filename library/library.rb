def is_firewall_enabled(profile)

  result = x%(netsh advfirewall show #{profile.downcase})
  state = result.scan(/State\s*((?:ON)|(?:OFF))/)
  return state == 'ON'
end
