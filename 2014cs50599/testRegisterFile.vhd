--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:09:04 03/11/2016
-- Design Name:   
-- Module Name:   C:/Users/DELL/Desktop/CompArch/Assign3/testRegisterFile.vhd
-- Project Name:  Assign3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registerFile
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
 
ENTITY testRegisterFile IS
END testRegisterFile;
 
ARCHITECTURE behavior OF testRegisterFile IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registerFile
    PORT(
         clk : IN  std_logic;
         toWrite : IN  std_logic;
         rad1 : IN  std_logic_vector(3 downto 0);
         rad2 : IN  std_logic_vector(3 downto 0);
         wad : IN  std_logic_vector(3 downto 0);
         wd : IN  std_logic_vector(31 downto 0);
         rd1 : OUT  std_logic_vector(31 downto 0);
         rd2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal toWrite : std_logic := '0';
   signal rad1 : std_logic_vector(3 downto 0) := (others => '0');
   signal rad2 : std_logic_vector(3 downto 0) := (others => '0');
   signal wad : std_logic_vector(3 downto 0) := (others => '0');
   signal wd : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal rd1 : std_logic_vector(31 downto 0);
   signal rd2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registerFile PORT MAP (
          clk => clk,
          toWrite => toWrite,
          rad1 => rad1,
          rad2 => rad2,
          wad => wad,
          wd => wd,
          rd1 => rd1,
          rd2 => rd2
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
  end process;

END;
