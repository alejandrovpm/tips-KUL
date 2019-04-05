require("context")
require("geometric")
utils_ts = require("utils_ts")

function linspace(s_start,s_end,n)
  table_s ={s_start}
  for i=1,n do
    table_s[i+1] = s_start + i*(s_end)/n
  end

  return table_s
end

-- function trap_velprofile(maxvel,maxacc,s_start,s_end)
--   sa = s_start
--   sb = s_end
--   sc = conditional( constant(0.5)-maxvel*maxvel/(constant(2)*maxacc) , maxvel*maxvel/(constant(2)*maxacc), constant(0.5) )
--   print("s reach max vel: " .. sc:value())
--   s_p_34    = conditional(sb-s , make_constant( sqrt( constant(2)*maxacc*(sb-s) ) ) , constant(0))
--   s_p_234   = conditional( (sb-sc)-s , maxvel , s_p_34)
--   s_p_1234  = conditional((sc+sa)-s , make_constant( sqrt( constant(2)*maxacc*(s-sa) ) ) , s_p_234)
--   s_p_01234 = conditional(sa-s , constant(0) , s_p_1234)
--
--   return s_p_01234
-- end

s = Variable{context = ctx, name ='path_coordinate', vartype = 'feature', initial = 0.0}


sp1  = utils_ts.trap_velprofile( constant(0.1) , constant(0.025) , constant(0.0) , constant(1.0) )
sp2  = utils_ts.trap_velprofile( constant(0.1) , constant(0.025) , constant(1.0) , constant(2.0) )

sp = conditional(s-constant(1.0),sp2,sp1)


table_s = linspace(0.0 , 2.0 , 80)
for i,v in pairs(table_s) do
  sp:setInputValue(1,v)
  print(v , sp:value())
end
