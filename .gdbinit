set confirm off
set prompt (GDB) 

define g
#set $k=0
#record
b 11
r <input.tst
# display /d j
end

