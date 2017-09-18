file.open("test.txt","r") 
f = (file.readline())
c = (file.readline())
s = (file.readline())
p = (file.readline())
file.close()
f = string.gsub(f, "\n", "")
print("flag"..f)
switch_pin = 3      -- 3= gpio0

gpio.mode(switch_pin, gpio.INPUT,gpio.PULLUP)    
tmr.alarm(1, 2000, 1, function()
	switch_status = gpio.read(switch_pin)
        print ("sw="..switch_status)
        print ("f="..f)
	if (switch_status == 0) then
		f="1"
    end    
    if (f == "1" or f == nil) then  
	    tmr.stop(1)
        print ("Entering Configuration Mode ..")
        dofile('initap.lua')
	elseif (f == "0") then
	    tmr.stop(1)
		print ("Using Previous settings ..")
		dofile('initsta.lua')
    end
end)

