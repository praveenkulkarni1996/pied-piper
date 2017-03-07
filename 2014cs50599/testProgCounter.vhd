--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:36:36 03/11/2016
-- Design Name:   
-- Module Name:   C:/Users/DELL/Desktop/CompArch/Assign3/testProgCounter.vhd
-- Project Name:  Assign3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: progCounter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testProgCounter IS
END testProgCounter;
 
ARCHITECTURE behavior OF testProgCounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT progCounter
    PORT(
         clk : IN  std_logic;
         pcIn : IN  std_logic_vector(31 downto 0);
         pcOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal pcIn : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal pcOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: progCounter PORT MAP (
          clk => clk,
          pcIn => pcIn,
          pcOut => pcOut
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
