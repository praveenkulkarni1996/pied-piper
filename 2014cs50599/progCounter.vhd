
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity progCounter is
	PORT(
		clk : in std_logic;
		pcIn : in std_logic_vector(31 downto 0);
		pcOut : out std_logic_vector(31 downto 0);
		pcEn : in std_logic
	);
end progCounter;

architecture Behavioral of progCounter is
begin
	process(clk,pcEn) begin
		if(rising_edge(clk) and pcEn='1') then 
			pcOut <= pcIn;
		end if;
	end process;
end Behavioral;