core.register_service("hello_world", "tcp", function(applet)
   applet:send("hello world\n")
end)
