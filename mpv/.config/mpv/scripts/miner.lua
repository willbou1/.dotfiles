local timer = mp.add_periodic_timer(300, function()
	os.execute('systemctl --user start phoenixminer.service')
end)
timer.oneshot = true

function prop_handler(name, value)
	if (value == true)
	then
		timer:resume()
	else
		timer:kill()
		os.execute('systemctl --user stop phoenixminer.service')
	end
end

mp.observe_property('pause', 'bool', prop_handler)

mp.register_event('shutdown', function(event)
	timer:kill()
	os.execute('systemctl --user start phoenixminer.service')
end)

