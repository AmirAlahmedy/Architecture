LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY WriteDataMuxInDecode IS
	PORT(
		
                ImmValue:in std_logic_vector(15 downto 0);
		lower2bytes:in std_logic_vector(15 downto 0); --Rsrc
                higher2bytes:in std_logic_vector(15 downto 0); --Rsrc
WriteDataOut: out std_logic_vector(15 downto 0);
LDMsignal:in std_logic;
MULTsignal:in std_logic;
MULT2signal:in std_logic);

END ENTITY WriteDataMuxInDecode;

ARCHITECTURE AA OF WriteDataMuxInDecode IS
BEGIN
process(LDMsignal,MULTsignal,MULT2signal)
begin
if (LDMsignal='1')THEN
WriteDataOut<=ImmValue;
elsif (MULTsignal ='1')THEN
WriteDataOut<=lower2bytes;
elsif (MULT2signal ='1')THEN
WriteDataOut<=higher2bytes;
else
WriteDataOut<="0000000000000000";
	END if;	
END PROCESS;
END AA;