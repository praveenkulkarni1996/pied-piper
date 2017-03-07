--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:03:27 03/11/2016
-- Design Name:   
-- Module Name:   C:/Users/quantumcoder/Desktop/iitd/Sem4/col216/assignments/assignment3/CompArch/Assign3/testStatusRegister.vhd
-- Project Name:  Assign3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: StatusRegister
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
 
ENTITY testStatusRegister IS
END testStatusRegister;
 
ARCHITECTURE behavior OF testStatusRegister IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT StatusRegister
    PORT(
         clk : IN  std_logic;
         S : IN  std_logic;
         N_in : IN  std_logic;
         Z_in : IN  std_logic;
         C_in : IN  std_logic;
         V_in : IN  std_logic;
         N_out : OUT  std_logic;
         Z_out : OUT  std_logic;
         C_out : OUT  std_logic;
         V_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal S : std_logic := '0';
   signal N_in : std_logic := '0';
   signal Z_in : std_logic := '0';
   signal C_in : std_logic := '0';
   signal V_in : std_logic := '0';

 	--Outputs
   signal N_out : std_logic;
   signal Z_out : std_logic;
   signal C_out : std_logic;
   signal V_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: StatusRegister PORT MAP (
          clk => clk,
          S => S,
          N_in => N_in,
          Z_in => Z_in,
          C_in => C_in,
          V_in => V_in,
          N_out => N_out,
          Z_out => Z_out,
          C_out => C_out,
          V_out => V_out
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
