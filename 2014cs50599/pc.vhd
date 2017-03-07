----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:49:13 03/10/2016 
-- Design Name: 
-- Module Name:    pc - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pc is
	port(
	toBranch: in std_logic;
	PC_in: in std_logic_vector(31 downto 0);
	branchOffset: in std_logic_vector(23 downto 0);
	PC_out: out std_logic_vector(31 downto 0));
end pc;

architecture Behavioral of pc is
	signal branchOffsetExpanded : std_logic_vector(31 downto 0);
	signal msbOffset : std_logic;
	
begin
	msbOffset <= '1' when branchOffset(23)='1' else '0' ;
	--branchOffsetExpanded(31) <= msbOffset;
	branchOffsetExpanded <= ("111111" & branchOffset & "00") when msbOffset = '1' 
									else ("000000" & branchOffset &"00") ;
									
	PC_out <= (PC_in + 2 + branchOffsetExpanded) when toBranch='1' else (PC_in + 1);
	


end Behavioral;

