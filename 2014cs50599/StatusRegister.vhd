----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:55:40 03/11/2016 
-- Design Name: 
-- Module Name:    StatusRegister - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity StatusRegister is
	port(
	clk : in std_logic;
	S   : in std_logic; 
	N_in : in std_logic;
	Z_in : in std_logic;
	C_in : in std_logic;
	V_in : in std_logic;
	N_out : out std_logic;
	Z_out : out std_logic;
	C_out : out std_logic;
	V_out : out std_logic
	);
	
end StatusRegister;

architecture Behavioral of StatusRegister is

begin
	process(clk,S) begin
		if(rising_edge(clk) and S='1') then 
			N_out <= N_in;
			Z_out <= Z_in;
			C_out <= C_in;
			V_out <= V_in;			
		end if;
	end process;
end Behavioral;

