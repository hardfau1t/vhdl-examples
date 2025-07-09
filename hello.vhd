use std.textio.all;

entity hello_world is
    end hello_world;
    
architecture sim of hello_world is
begin
process begin
    write (output, "Hello world" & LF);
    wait;
end process;
end sim;
