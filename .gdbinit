#this is comment

set confirm off
set prompt (GDB) 

#i local
define il
i local
end

define g
#set $k=0
#record
b main
r <input.tst
#display /d j
end

