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
b 10
r <input.tst
#display /d j
display /d i
display /d n
display /d a[i]
display /d f[i]
display /d a[n-1]
end

