library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity registerFile is

	PORT (
		clk : in std_logic;
		toWrite : in std_logic;
		rad1, rad2 : in std_logic_vector(3 downto 0);
		wad : in std_logic_vector(3 downto 0);
		wd : in std_logic_vector(31 downto 0);
		rd1, rd2 : out std_logic_vector(31 downto 0)
	);
end registerFile;


architecture Behavioral of registerFile is
	type ar is array (15 downto 0) of std_logic_vector(31 downto 0);
	signal reg : ar:=(others=>"00000000000000000000000000000000");
begin
	process(clk) begin 
		if(falling_edge(clk)) then
			if(toWrite = '1') then
				if(wad = "0000")	then reg(0) <= wd; 
				elsif(wad = "0001")	then reg(1) <= wd; 
				elsif(wad = "0010")	then reg(2) <= wd; 
				elsif(wad = "0011")	then reg(3) <= wd; 
				elsif(wad = "0100")	then reg(4) <= wd; 
				elsif(wad = "0101")	then reg(5) <= wd; 
				elsif(wad = "0110")	then reg(6) <= wd; 
				elsif(wad = "0111")	then reg(7) <= wd; 
				elsif(wad = "1000")	then reg(8) <= wd; 
				elsif(wad = "1001")	then reg(9) <= wd; 
				elsif(wad = "1010")	then reg(10) <= wd; 
				elsif(wad = "1011")	then reg(11) <= wd; 
				elsif(wad = "1100")	then reg(12) <= wd; 
				elsif(wad = "1101")	then reg(13) <= wd; 
				elsif(wad = "1110")	then reg(14) <= wd;
				elsif(wad = "1111")	then reg(15) <= wd; 	
				end if;				
			end if;
		end if;
	end process;
	
	rd1 <= reg(0) when (rad1="0000") else
				 reg(1) when (rad1="0001") else
				 reg(2) when (rad1="0010") else
				 reg(3) when (rad1="0011") else
				 reg(4) when (rad1="0100") else
				 reg(5) when (rad1="0101") else
				 reg(6) when (rad1="0110") else
				 reg(7) when (rad1="0111") else
				 reg(8) when (rad1="1000") else
				 reg(9) when (rad1="1001") else
				 reg(10) when (rad1="1010") else
				 reg(11) when (rad1="1011") else
				 reg(12) when (rad1="1100") else
				 reg(13) when (rad1="1101") else
				 reg(14) when (rad1="1110") else
				 reg(15) when (rad1="1111");

		rd2 <= reg(0) when (rad2="0000") else
				 reg(1) when (rad2="0001") else
				 reg(2) when (rad2="0010") else
				 reg(3) when (rad2="0011") else
				 reg(4) when (rad2="0100") else
				 reg(5) when (rad2="0101") else
				 reg(6) when (rad2="0110") else
				 reg(7) when (rad2="0111") else
				 reg(8) when (rad2="1000") else
				 reg(9) when (rad2="1001") else
				 reg(10) when (rad2="1010") else
				 reg(11) when (rad2="1011") else
				 reg(12) when (rad2="1100") else
				 reg(13) when (rad2="1101") else
				 reg(14) when (rad2="1110") else
				 reg(15) when (rad2="1111");
end Behavioral;


