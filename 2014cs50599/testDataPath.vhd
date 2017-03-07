--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:08:59 03/11/2016
-- Design Name:   
-- Module Name:   C:/Users/quantumcoder/Desktop/iitd/Sem4/col216/assignments/assignment3/CompArch/Assign3/testDataPath.vhd
-- Project Name:  Assign3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DataPath
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
 
ENTITY testDataPath IS
END testDataPath;
 
ARCHITECTURE behavior OF testDataPath IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataPath
    PORT(
         clk : IN  std_logic;
         pcIn : IN  std_logic_vector(31 downto 0);
         toWrite : IN  std_logic;
         wad : IN  std_logic_vector(3 downto 0);
         wd : IN  std_logic_vector(31 downto 0);
         Cin : IN  std_logic;
         isExecute : IN  std_logic;
         alu_result : OUT  std_logic_vector(31 downto 0);
         N_out : OUT  std_logic;
         Z_out : OUT  std_logic;
         C_out : OUT  std_logic;
         V_out : OUT  std_logic;
         toLoad : IN  std_logic_vector(0 downto 0);
         data_wea : IN  std_logic_vector(0 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal pcIn : std_logic_vector(31 downto 0) := (others => '0');
   signal toWrite : std_logic := '0';
   signal wad : std_logic_vector(3 downto 0) := (others => '0');
   signal wd : std_logic_vector(31 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
   signal isExecute : std_logic := '0';
   signal toLoad : std_logic_vector(0 downto 0) := (others => '0');
   signal data_wea : std_logic_vector(0 downto 0) := (others => '0');

 	--Outputs
   signal alu_result : std_logic_vector(31 downto 0);
   signal N_out : std_logic;
   signal Z_out : std_logic;
   signal C_out : std_logic;
   signal V_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataPath PORT MAP (
          clk => clk,
          pcIn => pcIn,
          toWrite => toWrite,
          wad => wad,
          wd => wd,
          Cin => Cin,
          isExecute => isExecute,
          alu_result => alu_result,
          N_out => N_out,
          Z_out => Z_out,
          C_out => C_out,
          V_out => V_out,
          toLoad => toLoad,
          data_wea => data_wea
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
      wait;
   end process;

END;
